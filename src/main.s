global x_loc
global y_loc
global head
global distance
global move_example

section .data
    x_loc: dd 1.5
    y_loc: dd -2.5
    head: dd 45.0 ; Heading in degrees
    distance: dd 14.1
    one_eighty: dd 180.0
    ninety: dd 90.0
section .text
    move_example:
        finit
        fld dword [head]
        fldpi ; Convert heading into radians
        fmulp ; multiply by pi
        fld dword [one_eighty]
        fdivp ; and divide by 180.0
        fsincos ; Compute vectors in y and x
        fld dword [distance]
        fmulp ; Multiply by distance to get dy
        fld dword [y_loc]
        faddp
        fstp dword [y_loc]
        fld dword [distance]
        fmulp; ; Multiply by distance to get dx
        fld dword [x_loc]
        faddp
        fstp dword [x_loc]
        fld dword [ninety] ; Add 90.0
        ; degrees to heading for next time.
        fadd dword [head]
        fstp dword [head]
        ret