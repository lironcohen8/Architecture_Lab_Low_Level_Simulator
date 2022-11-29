// Liron Cohen 207481268
// Yuval Mor 209011543

asm_cmd(LD, 2, 0, 1, 1000); // 0: R2 = MEM[1000] = INPUT = NUM
asm_cmd(ADD, 3, 0, 0, 0); // 1: R3 = RES = 0
asm_cmd(ADD, 4, 1, 0, 1); // 2: R4 = 1
asm_cmd(LSF, 4, 4, 1, 30); // 3: R4 = BIT = 1 << 30

// NON-POSITIVE INPUT CASE
asm_cmd(JLE, 0, 2, 0, 19); // 4: IF NUM IS NOT POSITIVE JUMPS TO STORE (RES = 0)

// ONE INPUT CASE
asm_cmd(ADD, 3, 0, 1, 1); // 5: RES = 1
asm_cmd(JEQ, 0, 2, 3, 19); // 6: IF NUM = 1 JUMPS TO STORE (RES = 1)

// SETTING RES BACK TO 0
asm_cmd(ADD, 3, 0, 0, 0); // 7: RES = 0

// FIRST LOOP
asm_cmd(JLE, 0, 4, 2, 11); // 8: IF BIT <= NUM JUMPS TO SECOND LOOP
asm_cmd(RSF, 4, 4, 1, 2); // 9: BIT >> 2
asm_cmd(JEQ, 0, 0, 0, 8); // 10: JUMPS TO FIRST LOOP

// SECOND LOOP
asm_cmd(JEQ, 0, 4, 0, 19); // 11: IF BIT IS 0 JUMPS TO STORE
asm_cmd(ADD, 5, 3, 4, 0); // 12: R5 = RES + BIT
asm_cmd(RSF, 3, 3, 1, 1); // 13: RES = RES >> 1
asm_cmd(JLT, 0, 2, 5, 17); // 14: IF NUM < RES + BIT JUMPS TO SHIFT BIT
asm_cmd(SUB, 2, 2, 5, 0); // 15: NUM = NUM - (RES + BIT)
asm_cmd(ADD, 3, 3, 4, 0); // 16: RES = RES + BIT
asm_cmd(RSF, 4, 4, 1, 2); // 17: BIT >> 2 // SHIFT BIT
asm_cmd(JEQ, 0, 0, 0, 11); // 18: JUMPS TO SECOND LOOP

// STORE RESULT
asm_cmd(ST, 0, 3, 1, 1001); // 19: STORE RESULT IN MEM[1001]
asm_cmd(HLT, 0, 0, 0, 0); // 20: HALT
