.syntax unified



.equ RCC_AHB1ENR, 0x40023830
.equ GPIOGEN, 0x00000040

.equ GPIOG_MODER, 0x40021800
.equ MODER13_OUTPUT, 0x04000000
.equ MODER14_OUTPUT, 0x10000000

.equ GPIOG_ODR, 0x40021814
.equ ODR13, 0x00002000
.equ ODR14, 0x00004000



.word 0x0           @ we don't need no stinkin' stack pointer
.word _start + 1

.global _start

_start:

ldr r0, =RCC_AHB1ENR
ldr r1, [r0]
orr r1, r1, #GPIOGEN
str r1, [r0]

ldr r0, =GPIOG_MODER
ldr r1, =MODER13_OUTPUT | MODER14_OUTPUT
str r1, [r0]

ldr r0, =GPIOG_ODR
ldr r1, =ODR13 | ODR14    @ turn on PG13 (green LED) and PG14 (red LED)
str r1, [r0]

loop:

b loop
