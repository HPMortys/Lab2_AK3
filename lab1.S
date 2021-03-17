.global lab1
.syntax unified
#define A #4
#define B #2
#define C #3
lab1:
    push {lr}
    // calculate (a+b)/2 + c!
    mov r0, A
    mov r1, B
    mov r2, C 
    bl test_var
    pop {pc}
test_var:
    push { r0, r1, r2, lr } 
    ADD r0, r0, r1 // a + b
    ASR r0, #1  //  / 2
    mov r3, #1
    cfact:		// !
	    cmp r2, #1 
	    bEQ res	
	    MUL r3, r2 
	    SUB r2, #1
	    bNE cfact
    res:
    	ADD r0, r3
    pop { r1, r2, r3, pc }

