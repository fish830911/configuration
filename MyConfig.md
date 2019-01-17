# My configuration

## vim-anywhere

The following method allows vim-anywhere to use terminal vim (mine is urxvt) rather than gvim.
vim ~/.vim-anywhere/bin/run
In vim, search for '# Linux', and change the 'gvim' to 'urxvt -e vim'.

## Snap Installation

Following this link: [Install snap](https://docs.snapcraft.io/installing-snap-on-arch-linux/6758?_ga=2.189882978.870462508.1546666088-1207280406.1546666088)

Remember, even use pacaur to install snapd package, you need to type the following to code to install all kinds of package:

`sudo systemctl enable --now snapd.socket`
`sudo ln -s /var/lib/snapd/snap /snap`

## Swap Media keys and Function keys

`echo options hid_apple fnmode=2 | \`
`sudo tee -a /etc/modprobe.d/hid_apple.conf`

## Change Capslock key into both escape and control keys

type these files in `~/.scripts/tools/remap*


`setxkbmap -option caps:ctrl:nocaps`
`xcape -e 'Control_L=Escape'`

and comment out other `setxkbmap` things and `xcape` things.

## Set up ibus when log in

Add the following line to `~/.xprofile`:

`export GTK_IM_MODULE=ibus`
`export XMODIFIERS=@im=ibus`
`export QT_IM_MODULE=ibus`
`ibus-daemon -x -d`

## Let XeLaTeX able to use fonts from TeXlive:
`ln -s /etc/fonts/conf.avail/09-texlive-fonts.conf /etc/fonts/conf.d/09-texlive-fonts.conf`
`fc-cache && mkfontscale && mkfontdir`

and use the font "TeX Gyre Termes" to replace "Times New Roman".


## Automatically change input method in vim when leave insert mode.

Use the "ibusjump.vim" in [Githubgist](https://gist.github.com/mozbugbox/dc76216a859fb0c0395fa8bb59972e0c).

Install it by move `ibusjump.vim` in `~/.vim/plugin`, and add these two lines in `~/.vimrc`:

```
let g:ibus_eng_engine = 'xkb:us::eng'
let g:ibus_reset_insert = 1
```

If the above steps does not work, you may install [xkb-switch](https://github.com/ierton/xkb-switch).



# Linux Note

## Useful code snippet

We will use `command` to represent the sample command

### Use the results from a code

`var=$(command)`: assign the results of command to the variable `var`.

### Find command

`find "$(cd ..; pwd)"` allows find to output absolute path.

Usefule example:

```bash
CURRENT=./
for i in $(find "$(pwd)" -type d); do
  cd $i
  zeropad
  cd $CURRENT
done
```

## Linux file system

/ -> root directory, which is the origin of all directory.

boot -> Don't touch it, it contains all the boot information in your system.

bin -> stands for binary, another way to say software. Executable softwares and commands that can be used by all users.

sbin -> system binaries that the system will use. A standard users cannot access withouth permission.

dev -> contains all script for devices, including disk, mouse driver, keyboard driver, etc.

etc -> systemwide configuration.

lib -> contains lib32 and lib64, stands for library, allowing to perform various functions.

mnt -> stands for mount, all external devices, including external drive and flush dirve, are stored in here. Note that this is the place for manually mounted devices.

media -> directory for automatically mounted external devices.

opt -> stands for optional, softwares and commands that is not installed by default.

proc -> sudo files that contains system processes and resources.

run -> its a tempfs file system, which means runs in ram.

srv -> server directory.

sys -> system folders that creates every time when computer boots up.

tmp -> stands for temporary, files that are going to be changed will put in this directory. Do not store any file that you want to put in long term in this folder.

var -> stands for variables, means data that changed over time. This include user database and the log file (in `/var/log`). `/var/crash` involves informations that software crash.

usr -> there is a bin folder, where the applications that been used by users are installed here. User-installed applications are usually in: `/usr/bin`, `/usr/sbin`, `/usr/local/bin`, `/usr/local/sbin`. And if there are libraries needed, they are usually stored in `usr/lib` or `/usr/local/lib`. Softwares that are installed from source code will end up in `/usr/local/`. Larger softwares will installed in `/usr/share`. Any installed source code that related to kernal sources and header files will go to `/usr/src`.

. -> current directory

.. -> parent (previous) directory

home -> contains directory for different users. There are lots of hidden files, all starting with `.`. In the terminal, you need to type `ls -a` to show these hidden files.

`/home/username/.cache` stored for temporary files

`/home/username/.config` stored for individual application setting. Some applications straightly save their configuration in home directory.

`/home/username/.theme` stored for customed look.

## Absolute vs relative paths

Absolute path: path that starts from root

relative path: path that starts based on your current working directory.

## How to backup your system




# Shell Scripting Tutorial


