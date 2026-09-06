#!/usr/bin/env bash
#
# Dynamic installer for Niteshkamat11/Neovim-config
#
# Supports:
#   - Arch Linux / Manjaro / EndeavourOS
#   - Fedora / RHEL / Rocky / AlmaLinux
#   - Debian / Ubuntu / Linux Mint
#   - openSUSE
#   - Alpine Linux
#
# Automates:
#   - Detect distro and package manager
#   - Install required build tools
#   - Backup existing Neovim config
#   - Clone Neovim config
#   - Bootstrap paq-nvim
#   - Install plugins
#   - Build native extensions
#
#   This is AI generated script

set -euo pipefail

REPO_URL="https://github.com/Niteshkamat11/Neovim-config.git"

NVIM_CONFIG_DIR="$HOME/.config/nvim"
PAQ_DIR="$HOME/.local/share/nvim/site/pack/paqs/start/paq-nvim"
FZF_NATIVE_DIR="$HOME/.local/share/nvim/site/pack/paqs/start/telescope-fzf-native.nvim"


# ============================================================
# Detect distribution
# ============================================================

if [[ ! -f /etc/os-release ]]; then
    echo "ERROR: Cannot detect Linux distribution."
    exit 1
fi

# shellcheck disable=SC1091
source /etc/os-release

DISTRO_ID="${ID:-unknown}"
DISTRO_LIKE="${ID_LIKE:-}"


# ============================================================
# Detect package manager
# ============================================================

PACKAGE_MANAGER=""

if command -v pacman >/dev/null 2>&1; then
    PACKAGE_MANAGER="pacman"

elif command -v dnf >/dev/null 2>&1; then
    PACKAGE_MANAGER="dnf"

elif command -v apt-get >/dev/null 2>&1; then
    PACKAGE_MANAGER="apt"

elif command -v zypper >/dev/null 2>&1; then
    PACKAGE_MANAGER="zypper"

elif command -v apk >/dev/null 2>&1; then
    PACKAGE_MANAGER="apk"

else
    echo "ERROR: Unsupported package manager."
    echo "Supported: pacman, dnf, apt, zypper, apk"
    exit 1
fi


echo "==> Detected distribution: ${PRETTY_NAME:-$DISTRO_ID}"
echo "==> Package manager: $PACKAGE_MANAGER"
echo ""


# ============================================================
# Install packages
# ============================================================

install_packages() {

    case "$PACKAGE_MANAGER" in

        pacman)
            echo "==> Installing required packages with pacman..."

            # base-devel contains gcc, make, and other build tools.
            sudo pacman -S --needed --noconfirm \
                git \
                base-devel
            ;;

        dnf)
            echo "==> Installing required packages with dnf..."

            # Fedora/RHEL development tools.
            sudo dnf group install -y "Development Tools"

            sudo dnf install -y \
                git
            ;;

        apt)
            echo "==> Installing required packages with apt..."

            sudo apt-get update

            sudo apt-get install -y \
                git \
                build-essential
            ;;

        zypper)
            echo "==> Installing required packages with zypper..."

            sudo zypper install -y \
                git \
                gcc \
                gcc-c++ \
                make
            ;;

        apk)
            echo "==> Installing required packages with apk..."

            sudo apk add \
                git \
                build-base
            ;;

        *)
            echo "ERROR: Unsupported package manager: $PACKAGE_MANAGER"
            exit 1
            ;;
    esac
}


# ============================================================
# Check required commands
# ============================================================

echo "==> Checking required tools..."

NEED_INSTALL=false

for command in git gcc make; do
    if ! command -v "$command" >/dev/null 2>&1; then
        echo "    Missing: $command"
        NEED_INSTALL=true
    fi
done

if [[ "$NEED_INSTALL" == true ]]; then
    install_packages
else
    echo "    git, gcc and make are already installed."
fi


# ============================================================
# Check Neovim
# ============================================================

if ! command -v nvim >/dev/null 2>&1; then
    echo ""
    echo "ERROR: Neovim is not installed."
    echo ""
    echo "Install Neovim using your distro's package manager:"
    echo ""

    case "$PACKAGE_MANAGER" in
        pacman)
            echo "    sudo pacman -S neovim"
            ;;
        dnf)
            echo "    sudo dnf install neovim"
            ;;
        apt)
            echo "    sudo apt install neovim"
            ;;
        zypper)
            echo "    sudo zypper install neovim"
            ;;
        apk)
            echo "    sudo apk add neovim"
            ;;
    esac

    exit 1
fi


echo "==> Neovim found: $(nvim --version | head -n 1)"


# ============================================================
# Backup existing Neovim configuration
# ============================================================

echo ""
echo "==> Backing up existing Neovim config (if any)..."

if [[ -d "$NVIM_CONFIG_DIR" ]]; then

    backup_dir="$HOME/.config/nvim.bak.$(date +%Y%m%d-%H%M%S)"

    mv "$NVIM_CONFIG_DIR" "$backup_dir"

    echo "    Existing config moved to:"
    echo "    $backup_dir"

else
    echo "    No existing Neovim config found."
fi


# ============================================================
# Clone configuration
# ============================================================

echo ""
echo "==> Cloning Neovim config..."

git clone "$REPO_URL" "$NVIM_CONFIG_DIR"


# ============================================================
# Bootstrap Paq
# ============================================================

echo ""
echo "==> Cloning paq-nvim plugin manager..."

mkdir -p "$(dirname "$PAQ_DIR")"

if [[ ! -d "$PAQ_DIR" ]]; then

    git clone \
        --depth=1 \
        https://github.com/savq/paq-nvim.git \
        "$PAQ_DIR"

else

    echo "    paq-nvim already present, skipping."

fi


# ============================================================
# Install plugins
# ============================================================

echo ""
echo "==> Installing plugins via PaqInstall..."

# PaqInstall performs plugin installation asynchronously.
# Give Neovim enough time to start the process before quitting.

nvim --headless \
    "+PaqInstall" \
    "+sleep 5" \
    "+qa" || true


# ============================================================
# Build telescope-fzf-native
# ============================================================

echo ""
echo "==> Building native extensions..."

if [[ -d "$FZF_NATIVE_DIR" ]]; then

    (
        cd "$FZF_NATIVE_DIR"
        make
    )

    echo "    Built telescope-fzf-native."

else

    echo "    telescope-fzf-native not found."
    echo "    Skipping build step."

fi


# ============================================================
# Finished
# ============================================================

echo ""
echo "============================================================"
echo " Installation complete!"
echo "============================================================"
echo ""
echo "Launch Neovim with:"
echo ""
echo "    nvim"
echo ""
echo "If plugins are missing, run inside Neovim:"
echo ""
echo "    :PaqInstall"
echo ""
echo "Then restart Neovim."
echo ""
