.word 0x0           @ we don't need no stinkin' stack pointer
.word _start + 1

.global _start

_start:

ldr r0, =0x40023830    @ RCC_AHB1ENR
ldr r1, =0x00100040    @ enable the clock for GPIOG (and preserve that other thing that's already enabled)
str r1, [r0]

ldr r0, =0x40021800    @ GPIOG_MODER
ldr r1, =0x14000000    @ set PG13 and PG14 to output
str r1, [r0]

ldr r0, =0x40021814    @ GPIOG_ODR
ldr r1, =0x6000        @ turn on PG13 (green LED) and PG14 (red LED)
str r1, [r0]

loop:

b loop
