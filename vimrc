set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'thinca/vim-ref'
Plugin 'thinca/vim-quickrun'
Plugin 'mattn/webapi-vim'
Plugin 'tyru/open-browser.vim'
Plugin 'h1mesuke/unite-outline'
Plugin 'scrooloose/nerdtree'
Plugin 'LeafCage/yankround.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'sgur/vim-operator-openbrowser'
Plugin 'kana/vim-operator-user'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'mattreduce/vim-mix'
Plugin 'BjRo/vim-extest'
Plugin 'tpope/vim-rails'

call vundle#end()            " required
filetype plugin indent on    " required

let mapleader=" "
"solarizedの設定
syntax on
set background=dark
colorscheme molokai

"行番号の表示
set number

"新しい行のインデントを現在行と同じにする
set autoindent

"インクリメンタルサーチ設定
set incsearch

"ハイライトサーチ設定
set hlsearch

"閉じ括弧が入力されたとき、対応する括弧を表示する。
set showmatch

"新しい行を作ったときに高度な自動インデントを行う
set smartindent

"タブなど不可視文字を可視化
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<

"インデントの際に自動的に挿入される文字量
set shiftwidth=2

"tabを画面上の見た目で何文字分にするか指定する
set tabstop=2

"キーボードでtabキーを押した時に挿入される空白の量
"0を指定した場合は、tabstopの文字量に従う
set softtabstop=2

"各種設定
augroup vimrc
autocmd! FileType perl       setlocal shiftwidth=4 tabstop=2 softtabstop=2
autocmd! FileType html       setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType eruby      setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType css        setlocal shiftwidth=4 tabstop=2 softtabstop=2
autocmd! FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END

set expandtab

"ステータスバーを常に表示
set laststatus=4

"ステータスバーにファイル名、文字コード、改行コードを表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

"対応する括弧があった場合に自動的にインデントにしない
set whichwrap=b,s,h,l,<,>,[,]

"backspaceやdeleteが効かない場合の処理
set backspace=indent,eol,start

"テンプレートファイルの呼び出し
autocmd BufNewFile * silent! 0r $HOME/.vim/templates/%:e.tpl

"ビープ音すべてを無効にする
set visualbell t_vb=

"エラーメッセージの表示時にビープを鳴らさない
set noerrorbells

"括弧内入力の設定
function! MyInsertBracket(lbrackets, rbracket)
    if index(a:lbrackets, getline('.')[col('.') - 2]) != -1
        return a:rbracket . "\<Left>"
    else
        return a:rbracket
    endif
endfunction
inoremap <expr> ) MyInsertBracket(['('], ')')
inoremap <expr> } MyInsertBracket(['{'], '}')
inoremap <expr> ] MyInsertBracket(['['], ']')
inoremap <expr> > MyInsertBracket(['<'], '>')
inoremap <expr> " MyInsertBracket(['"'], '"')
inoremap <expr> ' MyInsertBracket(['''', '`'], '''')

"yankround設定
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)


"""""""""""""""""""""""""""""""""""""-
"vim-operator-userの設定
nmap <Leader>x <Plug>(operator-openbrowser)
vmap <Leader>x <Plug>(operator-openbrowser)

"""""""""""""""""""""""""""""""""""""-
" neosnippetの設定
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"NerdTree設定
if !argc()
  autocmd vimenter * NERDTree|normal gg3j
endif
nmap <F9> :NERDTreeToggle
