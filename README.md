This is my custom neovim setup and it uses paq as a plugin manager. To use my setup follow these steps below:-

step 1: Backup your exisiting Neovim setup----> run "mv ~/.config/nvim ~/.config/nvim.bak"

step 2: create a neovim directory-----> run "mkdir -p ~/.config/nvim"

step 3: clone my repo-----------> run "git clone https://github.com/Niteshkamat11/Neovim-config.git ~/.config/nvim"

step 4: Clone Paq into Neovim’s package directory----> run "git clone --depth=1 https://github.com/savq/paq-nvim.git \
~/.local/share/nvim/site/pack/paqs/start/paq-nvim"

step 5: start neovim---> run "nvim"

step 6 : inside neovim---> run ":PaqInstall"

congrats for successfully setting up this config for neovim. you can also contribute to this repo or suggest me any idea if you like. Goodluck for new experience with neovim.
