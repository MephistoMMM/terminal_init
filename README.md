## terminal_init
****

terminal_init is a tool written by shell script to init terminal shell enviroment!

You should put your init script in ./init.d, make sure your script name should be *.sh and let them is execuable! (`chmod u+x ./init.d/yourscript.sh`). 

Each init script in init.d is a "mode".

If you want to init a mode, you should call init.sh with  the username and mode's name(without '.sh'), but if you have not specail any mode, this script will use all mode in init.d.

`./tmp` is created for cache tmpfile.

`./src` is created for useful init file like config file(e.g. vimrc).

`./lib` include common function file.

And `INIT_USER=username` , `INIT_HOME=/home/username`.

Whenever run this script, it will update pkg manager resource. But it just install base packages only once. If you want to reinstall base packages, please remove `./tmp/status.sh`.

### Usage: 

      init.sh  username  [mode1, mode2 ...]
      
`username` is the name of user you want to init for.

### Mode:

now, init.d include following modes:

* nvim
* zsh
* font
* docker
* other

## scripts for macOS

This project also contains some scripts for init the terminal environment of macOS, but it is not the major feature, you could find it under the macOS directory.

## License:
[MIT](https://github.com/MephistoMMM/terminal_init/blob/master/LICENSE)

