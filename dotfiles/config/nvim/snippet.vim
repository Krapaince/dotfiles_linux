" {{@@ header() @@}}

"Configure header guard
function HeaderGuard(filename)
    let define = join(split(toupper(expand(a:filename)), '\.'), '_') . "_"
    call append(line('$'),[
                \"#ifndef " . define,
                \"#define " . define,
                \"","","",
                \"#endif"])
    execute "normal! jjjj"
endfunction

"Configure epitech header
function WriteHeader()
    let projectName = input("Project Name : ")
    let fileDescription = input("File description : ")
    let extension = expand('%:e')
    let isHeader = extension == "hpp" || extension == "h"
    if &filetype == "make"
        call append(line(0), ["##", "## EPITECH PROJECT, 2019",
                    \"## " . projectName, "## File description:",
                    \"## " . fileDescription, "##"])
    else
        call append(line(0), ["/*", "** EPITECH PROJECT, 2019",
                    \"** " . projectName, "** File description:",
                    \"** " . fileDescription, "*/"])
    endif
    if isHeader
        call HeaderGuard(expand("%:t"))
    endif
endfunction
"nnoremap <C-s> :call WriteHeader()<CR>
