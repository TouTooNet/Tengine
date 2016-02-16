"=========================================================================
" DesCRiption: 适合自己使用的vimrc文件，for Linux/Windows, GUI/Console
"
" Last Change: 2016年02月06日
"
" Version: 1.0
"
"=========================================================================

runtime! debian.vim

" 语法高亮
if has("syntax")
  syntax on
endif

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" 设置编码
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set encoding=utf-8
            
set number                      " 显示行号
set ruler                       " 显示标尺
set showcmd                     " 输入的命令显示出来，看的清楚些
set cursorline                  " 突出显示当前行
set magic                       " 设置魔术
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容
set laststatus=2                " 启动显示状态行(1),总是显示状态行(2)

set noexpandtab                 " 不要用空格代替制表符
set history=1000                " 历史记录数
set mouse=a                     " 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set selection=exclusive
set selectmode=mouse,key
set report=0                    " 通过使用: commands命令，告诉我们文件的哪一行被改变过
set fillchars=vert:\ ,stl:\ ,stlnc:\ " 在被分割的窗口间显示空白，便于阅读
set showmatch                   " 高亮显示匹配的括号
set matchtime=1                 " 匹配括号高亮的时间（单位是十分之一秒）
set scrolloff=3                 " 光标移动到buffer的顶部和底部时保持3行距离
au BufRead,BufNewFile *  setfiletype txt    " 高亮显示普通txt文件（需要txt.vim脚本）

