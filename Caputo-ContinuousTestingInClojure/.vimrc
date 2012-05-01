" This .vimrc file was created by Vroom-0.23
map <SPACE> :n<CR>:<CR>gg
map <BACKSPACE> :N<CR>:<CR>gg
map R :!vroom -run %<CR>
map RR :!vroom -run %<CR>
map VV :!vroom -vroom<CR>
map QQ :q!<CR>
map OO :!open <cWORD><CR><CR>
map EE :e <cWORD><CR>
map !! G:!open <cWORD><CR><CR>
map ?? :e .help<CR>
set laststatus=2
set statusline=%-20f\ Vroom!

" Overrides from /Users/bcaputo/.vroom/vimrc


" Values from slides.vroom config section. (under 'vimrc')
function! GetNextIdx(indexIncrement)
  let l:absIdx = argidx() + a:indexIncrement
  let l:absIdx = l:absIdx < 0 ? 0 : l:absIdx
  let l:absIdx = l:absIdx >= argc() ? (argc() - 1) : l:absIdx
  return l:absIdx
endfunction

function! ExecuteCommand(cmd)
  exe ':silent !' . a:cmd
endfunction

function! TransitionCommand(idx)
  return 'transition.' . argv(a:idx) . '.sh'
endfunction

function! NotesCommand(idx)
  return 'cp ' . 'notes.' . argv(a:idx) . ' notes.txt'
endfunction

function! RunTransitionHook(increment)
  call ExecuteCommand(TransitionCommand(GetNextIdx(a:increment)))
endfunction

function! WriteNotes(increment)
  call ExecuteCommand(NotesCommand(GetNextIdx(a:increment)))
endfunction


set nonumber
map <PageDown> :call WriteNotes(1)<CR>:call RunTransitionHook(1)<CR>:n<CR>:<CR>gg
map <PageUp> :call WriteNotes(-1)<CR>:call RunTransitionHook(-1)<CR>:N<CR>:<CR>gg

