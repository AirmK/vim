scriptencoding utf-8
set encoding=utf-8
"---------------------------------------------------------------------------
" �T�C�g���[�J���Ȑݒ�($VIM/vimrc_local.vim)������Γǂݍ��ށB�ǂݍ��񂾌��
" �ϐ�g:vimrc_local_finish�ɔ�0�Ȓl���ݒ肳��Ă����ꍇ�ɂ́A����ȏ�̐ݒ�
" �t�@�C���̓Ǎ��𒆎~����B
if 1 && filereadable($VIM . '/vimrc_local.vim')
  unlet! g:vimrc_local_finish
  source $VIM/vimrc_local.vim
  if exists('g:vimrc_local_finish') && g:vimrc_local_finish != 0
    finish
  endif
endif

"---------------------------------------------------------------------------
" ���[�U�D��ݒ�($HOME/.vimrc_first.vim)������Γǂݍ��ށB�ǂݍ��񂾌�ɕϐ�
" g:vimrc_first_finish�ɔ�0�Ȓl���ݒ肳��Ă����ꍇ�ɂ́A����ȏ�̐ݒ�t�@
" �C���̓Ǎ��𒆎~����B
if 1 && exists('$HOME') && filereadable($HOME . '/.vimrc_first.vim')
  unlet! g:vimrc_first_finish
  source $HOME/.vimrc_first.vim
  if exists('g:vimrc_first_finish') && g:vimrc_first_finish != 0
    finish
  endif
endif

" plugins���̃f�B���N�g����runtimepath�֒ǉ�����B
for s:path in split(glob($VIM.'/plugins/*'), '\n')
  if s:path !~# '\~$' && isdirectory(s:path)
    let &runtimepath = &runtimepath.','.s:path
  end
endfor
unlet s:path

"---------------------------------------------------------------------------
" ���{��Ή��̂��߂̐ݒ�:
"
" �t�@�C����Ǎ��ގ��Ƀg���C���镶���G���R�[�h�̏������m�肷��B�����R�[�h��
" �����ʋ@�\�𗘗p����ꍇ�ɂ͕ʓriconv.dll���K�v�Biconv.dll�ɂ��Ă�
" README_w32j.txt���Q�ƁB���[�e�B���e�B�X�N���v�g��ǂݍ��ނ��ƂŐݒ肳���B
source $VIM/plugins/kaoriya/encode_japan.vim
" ���b�Z�[�W����{��ɂ��� (Windows�ł͎����I�ɔ��f�E�ݒ肳��Ă���)
if !(has('win32') || has('mac')) && has('multi_lang')
  if !exists('$LANG') || $LANG.'X' ==# 'X'
    if !exists('$LC_CTYPE') || $LC_CTYPE.'X' ==# 'X'
      language ctype ja_JP.eucJP
    endif
    if !exists('$LC_MESSAGES') || $LC_MESSAGES.'X' ==# 'X'
      language messages ja_JP.eucJP
    endif
  endif
endif
" MacOS X���j���[�̓��{�ꉻ (���j���[�\���O�ɍs�Ȃ��K�v������)
if has('mac')
  set langmenu=japanese
endif
" ���{����͗p��keymap�̐ݒ�� (�R�����g�A�E�g)
if has('keymap')
  " ���[�}��������keymap
  "silent! set keymap=japanese
  "set iminsert=0 imsearch=0
endif
" ��GUI���{��R���\�[�����g���Ă���ꍇ�̐ݒ�
if !has('gui_running') && &encoding != 'cp932' && &term == 'win32'
  set termencoding=cp932
endif

"---------------------------------------------------------------------------
" ���j���[�t�@�C�������݂��Ȃ��ꍇ�͗\��'guioptions'�𒲐����Ă���
if 1 && !filereadable($VIMRUNTIME . '/menu.vim') && has('gui_running')
  set guioptions+=M
endif

"---------------------------------------------------------------------------
" Bram���̒񋟂���ݒ����C���N���[�h (�ʃt�@�C��:vimrc_example.vim)�B����
" �ȑO��g:no_vimrc_example�ɔ�0�Ȓl��ݒ肵�Ă����΃C���N���[�h�͂��Ȃ��B
if 1 && (!exists('g:no_vimrc_example') || g:no_vimrc_example == 0)
  if &guioptions !~# "M"
    " vimrc_example.vim��ǂݍ��ގ���guioptions��M�t���O�����āAsyntax on
    " ��filetype plugin on�������N����menu.vim�̓ǂݍ��݂������B�������Ȃ�
    " ��enc�ɑΉ����郁�j���[�t�@�C�����ǂݍ��܂�Ă��܂��A����̌�œǂݍ�
    " �܂��.vimrc��enc���ݒ肳�ꂽ�ꍇ�ɂ��̐ݒ肪���f���ꂸ���j���[������
    " �����Ă��܂��B
    set guioptions+=M
    source $VIMRUNTIME/vimrc_example.vim
    set guioptions-=M
  else
    source $VIMRUNTIME/vimrc_example.vim
  endif
endif

"---------------------------------------------------------------------------
" �����̋����Ɋւ���ݒ�:
"
" �������ɑ啶���������𖳎� (noignorecase:�������Ȃ�)
set ignorecase
" �啶���������̗������܂܂�Ă���ꍇ�͑啶�������������
set smartcase

"---------------------------------------------------------------------------
" �ҏW�Ɋւ���ݒ�:
"
" �^�u�̉�ʏ�ł̕�
set tabstop=8
" �^�u���X�y�[�X�ɓW�J���Ȃ� (expandtab:�W�J����)
set noexpandtab
" �����I�ɃC���f���g���� (noautoindent:�C���f���g���Ȃ�)
set autoindent
" �o�b�N�X�y�[�X�ŃC���f���g����s���폜�ł���悤�ɂ���
set backspace=indent,eol,start
" �������Ƀt�@�C���̍Ō�܂ōs������ŏ��ɖ߂� (nowrapscan:�߂�Ȃ�)
set wrapscan
" ���ʓ��͎��ɑΉ����銇�ʂ�\�� (noshowmatch:�\�����Ȃ�)
set showmatch
" �R�}���h���C���⊮����Ƃ��ɋ������ꂽ���̂��g��(�Q�� :help wildmenu)
set wildmenu
" �e�L�X�g�}�����̎����܂�Ԃ�����{��ɑΉ�������
set formatoptions+=mM

"---------------------------------------------------------------------------
" GUI�ŗL�ł͂Ȃ���ʕ\���̐ݒ�:
"
" �s�ԍ����\�� (number:�\��)
set number
" ���[���[��\�� (noruler:��\��)
set ruler
" �^�u����s��\�� (list:�\��)
set nolist
" �ǂ̕����Ń^�u����s��\�����邩��ݒ�
"set listchars=tab:>-,extends:<,trail:-,eol:<
" �����s��܂�Ԃ��ĕ\�� (nowrap:�܂�Ԃ��Ȃ�)
set wrap
" ��ɃX�e�[�^�X�s��\�� (�ڍׂ�:he laststatus)
set laststatus=2
" �R�}���h���C���̍��� (Windows�pgvim�g�p����gvimrc��ҏW���邱��)
set cmdheight=2
" �R�}���h���X�e�[�^�X�s�ɕ\��
set showcmd
" �^�C�g����\��
set title

"---------------------------------------------------------------------------
" �t�@�C������Ɋւ���ݒ�:
"
" �o�b�N�A�b�v�t�@�C�����쐬���Ȃ� (���s�̐擪�� " ���폜����ΗL���ɂȂ�)
"set nobackup


"---------------------------------------------------------------------------
" �t�@�C�����ɑ啶���������̋�ʂ��Ȃ��V�X�e���p�̐ݒ�:
"   (��: DOS/Windows/MacOS)
"
if filereadable($VIM . '/vimrc') && filereadable($VIM . '/ViMrC')
  " tags�t�@�C���̏d���h�~
  set tags=./tags,tags
endif

"---------------------------------------------------------------------------
" �R���\�[���ł̃J���[�\���̂��߂̐ݒ�(�b��I��UNIX��p)
if has('unix') && !has('gui_running')
  let s:uname = system('uname')
  if s:uname =~? "linux"
    set term=builtin_linux
  elseif s:uname =~? "freebsd"
    set term=builtin_cons25
  elseif s:uname =~? "Darwin"
    set term=beos-ansi
  else
    set term=builtin_xterm
  endif
  unlet s:uname
endif

"---------------------------------------------------------------------------
" �R���\�[���łŊ��ϐ�$DISPLAY���ݒ肳��Ă���ƋN�����x���Ȃ錏�֑Ή�
if !has('gui_running') && has('xterm_clipboard')
  set clipboard=exclude:cons\\\|linux\\\|cygwin\\\|rxvt\\\|screen
endif

"---------------------------------------------------------------------------
" �v���b�g�z�[���ˑ��̓��ʂȐݒ�

" Win�ł�PATH��$VIM���܂܂�Ă��Ȃ��Ƃ���exe�������o���Ȃ��̂ŏC��
if has('win32') && $PATH !~? '\(^\|;\)' . escape($VIM, '\\') . '\(;\|$\)'
  let $PATH = $VIM . ';' . $PATH
endif

if has('mac')
  " Mac�ł̓f�t�H���g��'iskeyword'��cp932�ɑΉ�������Ă��Ȃ��̂ŏC��
  set iskeyword=@,48-57,_,128-167,224-235
endif

"---------------------------------------------------------------------------
" KaoriYa�Ńo���h�����Ă���v���O�C���̂��߂̐ݒ�

" autofmt: ���{�ꕶ�͂̃t�H�[�}�b�g(�܂�Ԃ�)�v���O�C��.
set formatexpr=autofmt#japanese#formatexpr()

" vimdoc-ja: ���{��w���v�𖳌�������.
if kaoriya#switch#enabled('disable-vimdoc-ja')
  let &rtp = join(filter(split(&rtp, ','), 'v:val !~ "[/\\\\]plugins[/\\\\]vimdoc-ja"'), ',')
endif

" vimproc: ������vimproc�𖳌�������
if kaoriya#switch#enabled('disable-vimproc')
  let &rtp = join(filter(split(&rtp, ','), 'v:val !~ "[/\\\\]plugins[/\\\\]vimproc$"'), ',')
endif

" go-extra: ������ vim-go-extra �𖳌�������
if kaoriya#switch#enabled('disable-go-extra')
  let &rtp = join(filter(split(&rtp, ','), 'v:val !~ "[/\\\\]plugins[/\\\\]golang$"'), ',')
endif

" Copyright (C) 2009-2016 KaoriYa/MURAOKA Taro
"
set columns=120
set lines=55

winpos 10 10

set guifont=MigMix

"windows���C�N�ȃL�[����
":source $VIMRUNTIME/mswin.vim

"# �ȉ���ǋL
set nocompatible
filetype plugin indent off

" *********************************************************************************
" //Neobundle
" *********************************************************************************
if has('vim_starting')
    set runtimepath+=$VIM/.vim/bundle/neobundle.vim
"  set runtimepath+=C:/Program_Files/vim74-kaoriya-win64/.vim/bundle/neobundle.vim
      "call neobundle#rc(expand('$VIM/.vim/bundle'))

      call neobundle#begin(expand('$VIM/.vim/bundle/'))
      NeoBundleFetch 'Shougo/neobundle.vim'
      NeoBundle 'Shougo/unite.vim'
      NeoBundle 'https://github.com/kovisoft/slimv'
      NeoBundle 'https://github.com/davidhalter/jedi-vim'
      NeoBundle 'vim-latex/vim-latex'
      NeoBundle 'https://github.com/b4b4r07/vim-shellutils'
      NeoBundle 'lazywei/vim-matlab'
      NeoBundle 'https://github.com/jcfaria/Vim-R-plugin'
      NeoBundle 'https://github.com/nathanaelkane/vim-indent-guides'
      NeoBundle 'scrooloose/nerdtree'
     call neobundle#end()
    endif
    filetype plugin on
    filetype indent on

    NeoBundleCheck

" *********************************************************************************
" Neobundle//
" *********************************************************************************


"Python�̐ݒ�
"let g:slimv_python = 'C:/Program Files/vim74-kaoriya-win64/python27/python.exe'

"Lisp���ݒ�@Lisp�t�@�C�����J�����Ƃ���<,c>��SWANK�T�[�o�ɃR�l�N�g����B
let g:slimv_swank_cmd = '!start "C:/Program Files/vim74-kaoriya-win64/SBCL/1.3.12/sbcl.exe" --load "C:/Program Files/vim74-kaoriya-win64/.vim/bundle/slimv/slime/start-swank.lisp"'


"<C-p>��python�������s
function! s:Exec()
      exe "!" . &ft . " %"        
      :endfunction         
      command! Exec call <SID>Exec() 
      map <silent> <C-P> :call <SID>Exec()<CR>

 
"������C���X�g�[��������ȉ��̃R�[�h��vimrc�ȂǂɋL�q����΁A
"�m�[�}�����[�h���A����āu���p/�S�p�L�[�v���������Ƃ��Ă������I��IME��OFF�ɂ��Ă���܂��B
"set updatetime=1000
"function! s:winime_off()
"if exists("g:loaded_winime") && (has('win32') || has('win64'))
"  if mode() !=# 'i'
"    call winime#off()
"    call feedkeys(mode() ==# 'i' ? "\<C-g>\<ESC>" : "g\<ESC>", 'n')
"  endif
"endif
"endfunction
"augroup winime_off
"autocmd!
"autocmd CursorHold,CursorHoldI * call s:winime_off()
"augroup END 


" IME setting �m�[�}�����[�h�ł͔��p����
if has('multi_byte_ime') || has('xim') || has('gui_macvim')
  " Insert mode: lmap off, IME ON
  set iminsert=2
  " Serch mode: lmap off, IME ON
  set imsearch=2
  " Normal mode: IME off
  inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif


"" Vim-LaTeX
filetype plugin on
filetype indent on
"set shellslash�@���@jedi���o�O��
set grepprg=grep\ -nH\ $*
let g:Tex_AutoFolding = 0
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
let g:Tex_CompileRule_dvi = 'platex $*.tex'
let g:Tex_ViewRule_pdf = 'AcroRd32'
""let g:Tex_ViewRule_pdf = 'Acrobat'

"�I���j�⊮
set omnifunc=syntaxcomplete#Complete
imap <C-Space> <C-x><C-o>

" """"""""""""""""""""""""""""""
" " �S�p�X�y�[�X�̕\��
" """"""""""""""""""""""""""""""
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
  augroup ZenkakuSpace
  autocmd!
  autocmd ColorScheme * call ZenkakuSpace()
  autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace','�@')
  augroup END
  call ZenkakuSpace()
endif

"vim�𗧂��グ���Ƃ��ɁA�����I��vim-indent-guides���I���ɂ���
let g:indent_guides_enable_on_vim_startup = 1

"NERDTree��map
nnoremap <silent><C-N> :NERDTree <CR>

"cd���f�X�N�g�b�v�Ɉړ�
nnoremap <silent><C-D> :cd $HOME\Desktop<CR>:NERDTree<CR>

".txt�ɑ΂���\���̒�`
au BufRead,BufNewFile *.txt set filetype=txt


