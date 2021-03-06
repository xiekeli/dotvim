" VIM Setup {{{


" END VIM SETUP }}}

" Plugins {{{

" Admin virtualenvs
NeoBundle 'jmcantrell/vim-virtualenv'
" Show indent lines
NeoBundleLazy 'Yggdroot/indentLine', {'autoload': {'filetypes': ['python']}}
" A Python plugin
NeoBundleLazy 'klen/python-mode', {'autoload': {'filetypes': ['python']}}
" Show reports from coverage.py
NeoBundleLazy 'alfredodeza/coveragepy.vim', {'autoload': {'filetypes': ['python']}}

" END Plugins }}}

" Plugin Setup {{{

" Virtualenv {{{

let g:virtualenv_auto_activate = 1
let g:virtualenv_stl_format = '(%n)'

" }}}

" PythonMode {{{ -------------------------------------------------------------

nmap <silent><Leader>n :PyLint<CR>

let g:pymode_breakpoint_key = '<Leader>B'

let g:pymode_lint = 1
let g:pymode_lint_write = 0
let g:pymode_lint_checker = 'pylint,pep8,mccabe,pep257'
let g:pymode_lint_ignore = ''
" let g:pymode_lint_config = $HOME.'/dotfiles/pylint/pylint.rc'
let g:pymode_virtualenv = 0

let g:pymode_rope = 1
let g:pymode_rope_goto_def_newwin = 'new'
let g:pymode_rope_guess_project = 0
let g:pymode_rope_vim_completion = 1
let g:pymode_rope_always_show_complete_menu = 1

" }}}


" vimux {{{

let g:VimuxUseNearestPane = 1

map <Leader>rr :call VimuxRunCommand('clear;cd '.expand("%:p:h") .' ;python2 '.bufname("%"))<CR>
map <Leader>r3 :call VimuxRunCommand('clear;cd '.expand("%:p:h") .' ;python3 '.bufname("%"))<CR>
map <Leader>rt :call VimuxRunCommand('clear;cd '.expand("%:p:h") .' ;time python2 '.bufname("%"))<CR>
map <Leader>rp :call VimuxRunCommand('clear;cd '.expand("%:p:h") .' ;time pypy '.bufname("%"))<CR>

map <Leader>rc :VimuxPromptCommand<CR>
map <Leader>rl :VimuxRunLastCommand<CR>
map <Leader>rs :VimuxInterruptRunner<CR>
map <Leader>ri :VimuxInspectRunner<CR>
map <Leader>rq :VimuxCloseRunner<CR>

" }}}

" indentLine {{{

map <silent> <Leader>L :IndentLinesToggle<CR>
let g:indentLine_enabled = 0
let g:indentLine_char = '┊'
let g:indentLine_color_term = 239

" }}}

" END Plugin Setup }}}

" Unite Menu {{{
let g:unite_source_menu_menus.python = {
    \ 'description' : '         python tools
        \                                          ⌘ [space]p',
    \}
let g:unite_source_menu_menus.python.command_candidates = [
    \['▷ run python code                            (pymode)        ⌘ ,r',
        \'Pyrun'],
    \['▷ show docs for the current word             (pymode)        ⌘ K',
        \'normal K'],
    \['▷ insert a breakpoint                        (pymode)        ⌘ ,B',
        \'normal ,B'],
    \['▷ pylint check                               (pymode)        ⌘ ,n',
        \'PyLint'],
    \['▷ rope autocompletion                        (rope)          ⌘ C-[espacio]',
        \'RopeCodeAssist'],
    \['▷ go to definition                           (rope)          ⌘ C-C g',
        \'RopeGotoDefinition'],
    \['▷ reorganize imports                         (rope)          ⌘ C-C r o',
        \'RopeOrganizeImports'],
    \['▷ refactorize - rename                       (rope)          ⌘ C-C r r',
        \'RopeRename'],
    \['▷ refactorize - extract variable             (rope)          ⌘ C-C r l',
        \'RopeExtractVariable'],
    \['▷ refactorize - extract method               (rope)          ⌘ C-C r m',
        \'RopeExtractMethod'],
    \['▷ refactorize - inline                       (rope)          ⌘ C-C r i',
        \'RopeInline'],
    \['▷ refactorize - move                         (rope)          ⌘ C-C r v',
        \'RopeMove'],
    \['▷ refactorize - restructure                  (rope)          ⌘ C-C r x',
        \'RopeRestructure'],
    \['▷ refactorize - use function                 (rope)          ⌘ C-C r u',
        \'RopeUseFunction'],
    \['▷ refactorize - introduce factory            (rope)          ⌘ C-C r f',
        \'RopeIntroduceFactory'],
    \['▷ refactorize - change signature             (rope)          ⌘ C-C r s',
        \'RopeChangeSignature'],
    \['▷ refactorize - rename current module        (rope)          ⌘ C-C r 1 r',
        \'RopeRenameCurrentModule'],
    \['▷ refactorize - move current module          (rope)          ⌘ C-C r 1 m',
        \'RopeMoveCurrentModule'],
    \['▷ refactorize - module to package            (rope)          ⌘ C-C r 1 p',
        \'RopeModuleToPackage'],
    \['▷ show docs for current word                 (rope)          ⌘ C-C r a d',
        \'RopeShowDoc'],
    \['▷ list virtualenvs                           (virtualenv)',
        \'Unite output:VirtualEnvList'],
    \['▷ activate virtualenv                        (virtualenv)',
        \'VirtualEnvActivate'],
    \['▷ deactivate virtualenv                      (virtualenv)',
        \'VirtualEnvDeactivate'],
    \['▷ run coverage2                              (coveragepy)',
        \'call system("coverage2 run ".bufname("%")) | Coveragepy report'],
    \['▷ run coverage3                              (coveragepy)',
        \'call system("coverage3 run ".bufname("%")) | Coveragepy report'],
    \['▷ toggle coverage report                     (coveragepy)',
        \'Coveragepy session'],
    \['▷ toggle coverage marks                      (coveragepy)',
        \'Coveragepy show'],
    \]
nnoremap <silent>[menu]p :Unite -silent -winheight=42 menu:python<CR>

" END Unite Menu }}}
