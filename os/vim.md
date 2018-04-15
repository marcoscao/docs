
Plugins Management
------------------------------

* Vundle Manager
   :PluginSearch xxxxx           " Search for plugin
                                 " put cursor over desired one and press 'i' to install ( wait to be installed )
                                 " open .vimrc, :e $MYVIMRC, and put the plugin name:  Plugin "xxxx"

   :PluginList                   " List loaded plugins
   :PluginUpdate                 " Updates plugins




General Tips
------------------------------

:e $MYVIMRC          " opens user .vimrc
:scriptnames         " loaded vim files
:ol
:bro ol              " browse old open files

Vim
===

### Some

```vim

" mac osx color 

filetype plugin indent on
syntax on


" sets various

set noxxxxx	" set off xxx command
set number	" show lines numbers


" misc

set laststatus=2	" show status
set showmatch

set shiftwidth=3
set tabstop=3

set incsearch

colorscheme molokai


" more

:set list			-> show carriage, end of line, ...
:set ff				-> show file type 


convert to dos ( unified CRLF end of lines )
:update
:e ++ff=dos
:w

search and replace
:%s/abc/xyz/gc


close rest of splitted windows
:on
Ctrl + w + q	-> close split window

```

### NERDTree Plugin

```vim

 NERDTree
  A
  x
  o
  ?

	Shift + a						: maximize
	Ctrl + w + cursor-keys		: move to panel

	m				: over an item opens a menu ( create, copy, rename, ... ) 

```


