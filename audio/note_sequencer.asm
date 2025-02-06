org 100h
jmp start

;--------- NOTE STARTER
noteon:

mov ax, si ;frequency

out 42h, al ;output low byte
mov al, ah ;output high byte
out 42h, al

mov al, 61h ;turn on note
mov al, 11b ;set bits 1 and 0
out 61h, al ;send new value
ret
;-------------------END

;-------------------NOTE ENDER
noteoff:
mov al, 61h ;turn off note
out 61h, al ;send new value
ret
;-------------------END

start:
mov si, 0h
mov ah, 00h
int 16h
call getfreq
call noteon
mov ah, 86h
mov cx, 5h
mov dx, 5h
int 15h
call noteoff
jmp start

getfreq:
;high
cmp al, 'n'
je _n
cmp al, 'j'
je _j
cmp al, 'k'
je _k
cmp al, 'l'
je _l
cmp al, ';'
je _semi
cmp al, 27h
je _coln
;low
cmp al, 'a'
je _a
cmp al, 's'
je _s
cmp al, 'd'
je _d
cmp al, 'f'
je _f
cmp al, 'g'
je _g
cmp al, 'b'
je _b
cmp al, 1bh
je _exit
jmp start

_exit:
int 20h

_n:
mov si, 4560
ret

_j:
mov si, 4063
ret

_k:
mov si, 3619
ret

_l:
mov si, 3416
ret

_semi:
mov si, 3043
ret

_coln:
mov si, 2711
ret

;low
_a:
mov si, 10000
ret

_s:
mov si, 9121
ret

_d:
mov si, 8126
ret

_f:
mov si, 7239
ret

_g:
mov si, 6087
ret

_b:
mov si, 4831
ret