"
" /etc/vimrc
"

" 先加载 Vim 自带的默认配置，再覆盖自定义配置
source $VIMRUNTIME/defaults.vim
let skip_defaults_vim=1   " 防止再次加载 defaults.vim

" 高亮光标所在的行
" set cursorline

" 使用 Vi 兼容模式会禁用很多 Vim 特性，这里关闭兼容模式
set nocompatible

" 设置退格键的行为:
" 2 表示退格键可以删除缩进、换行符以及插入模式下输入的字符
set backspace=2

" 禁用鼠标操作（防止鼠标选择、右键菜单等干扰终端）
set mouse=

" 启用语法高亮
syntax on

" 如果终端是 xterm 或 putty，则设置暗色背景
if (&term == "xterm") || (&term == "putty")
    set background=dark
endif

" ------------------------------
" 缩进相关设置
" ------------------------------
set ts=4           " 设置一个 Tab 显示为 4 个空格
set softtabstop=4  " 插入模式下按 Tab 键时，缩进 4 个空格
set shiftwidth=4   " 自动缩进时使用 4 个空格
set expandtab      " 将 Tab 转换为空格
set autoindent     " 自动继承上一行的缩进
