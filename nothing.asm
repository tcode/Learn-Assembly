section .data
string          db "Hello World",10 
length          equ $-string
count           dd 0
section .bss
section .text
        global _start
_start:
pop_argument:
        pop ecx
        pop ecx 
        pop ecx
        push ecx
        call print_hello
open_file:
        mov eax, 5 ;;syscall for open(), so I have now got a open file
        mov ecx, 0
        int 80h
close_file:
        mov eax, 6 ;;better close the file for good measure.
        int 80h
error_exit:
        mov ebx, eax
        mov eax, 1
        int 80h
print_hello:
        mov eax, 4
        mov ebx, 1
        mov ecx, string
        mov edx, length ;; writes the value of ecx to the screen
        
        int 80h
        mov eax, [count] ;; now my dd of 0 is in eax
        inc eax          ;; here we increment to eax+1
        mov [count], eax ;; we move eax to count so now count = count+1
        mov eax, 4
        mov ebx, 1
        mov ecx, [count]
        mov edx, 2
        int 80h
        mov eax, 10      ;; the test would be obsolete if this line is now there!
        cmp eax, [count] ;; now we compare whether these are equal so is eax = eax
        jne print_hello  ;; this is very easy it is like eax != count jump to print_hello
        
exit:
        mov eax,1
        mov ebx,0
        int 80h

