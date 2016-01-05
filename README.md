##terminal_init
****

this is a shell script to init terminal enviroment!

You should put your init script in ./init.d,make sure your script name should be *.sh and make them execuable!(chmod u+x ./init.d/yourscript.sh). 

Each init script in init.d is a "mode".

If you want to init a mode, you should call init.sh with  the username and mode's name(without '.sh'), but if you have not specail any mode, this script will use all mode in init.d.

The dir tmp is created for cache tmpfile.

The dir src is created for useful init file like config file(e.g. vimrc).

The dir lib include common function file.

The INIT\_USER=username , INIT\_HOME=/home/username.

####Usage: 

      init.sh  username  [mode1, mode2 ...]

####Mode:

now, init.d include following modes:

* vim.sh
* zsh.sh
* font.sh
* docker.sh
* other.sh

####License:
[MIT](https://github.com/MephistoMMM/terminal_init/blob/master/LICENSE)

