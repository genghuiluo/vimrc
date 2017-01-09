map <F2> :echo 'Current time is ' . strftime('%c')<CR>

autocmd BufNewFile *.c,*.cpp,*.sh,*.rb,*.py,*.php exec ":call SetTitle()" 

"auto insert title comment when new specified extend filenames
func SetTitle()
    if &filetype == 'c' || &filetype == 'cpp' || &filetype == 'php'
        call CStyle()
    elseif &filetype == 'sh' || expand("%:e") == 'rb' || expand("%:e") == 'py'
        call UnixStyle()
    endif
endfunc

func CStyle()
    call setline(1,"/*===============================================================") 
    call append(line("."),   "*   Copyright (C) ".strftime("%Y")." All rights reserved.")
    call append(line(".")+1, "*   ") 
    call append(line(".")+2, "*   Filename：".expand("%:t")) 
    call append(line(".")+3, "*   Creator：Mark Luo")
    call append(line(".")+4, "*   Created Date：".strftime("%m/%d/%Y")) 
    call append(line(".")+5, "*   Description：") 
    call append(line(".")+6, "*")
    call append(line(".")+7, "*   Modified History：") 
    call append(line(".")+8, "*") 
    call append(line(".")+9, "================================================================*/") 
    if &filetype == 'php'
        call append(line(".")-1,"<?php") 
        call append(line(".")+10,"?>") 
    endif
endfunc

func UnixStyle()
    call setline(1,"################################################################") 
    call append(line("."),   "#   Copyright (C) ".strftime("%Y")." All rights reserved.")
    call append(line(".")+1, "#   ") 
    call append(line(".")+2, "#   Filename：".expand("%:t")) 
    call append(line(".")+3, "#   Creator：Mark Luo")
    call append(line(".")+4, "#   Created Date：".strftime("%m/%d/%Y")) 
    call append(line(".")+5, "#   Description：") 
    call append(line(".")+6, "#")
    call append(line(".")+7, "#   Modified History：") 
    call append(line(".")+8, "#") 
    call append(line(".")+9, "################################################################") 
endfunc

