
/home/cjacker/work/opensource-toolchain-bouffalo-lab/triplecore_bl808/helloworld_lp/build/build_out/helloworld_bl808_lp.elf:     file format elf32-littleriscv


Disassembly of section .text:

58020000 <__start>:
    .globl  __start
    .type   __start, %function
__start:
.option push
.option norelax
    la      gp, __global_pointer$
58020000:	ca015197          	auipc	gp,0xca015
58020004:	80018193          	addi	gp,gp,-2048 # 22034800 <__global_pointer$>
.option pop
    csrci   mstatus, 8
58020008:	30047073          	csrci	mstatus,8

    /* mtvec: for all exceptions and non-vector mode IRQs */
    la      a0, default_trap_handler
5802000c:	d2c18513          	addi	a0,gp,-724 # 2203452c <default_trap_handler>
    ori     a0, a0, 3
58020010:	00356513          	ori	a0,a0,3
    csrw    mtvec, a0
58020014:	30551073          	csrw	mtvec,a0

    /* mtvt: for all vector mode IRQs */
    la      a0, __Vectors
58020018:	00000517          	auipc	a0,0x0
5802001c:	06850513          	addi	a0,a0,104 # 58020080 <__Vectors>
    csrw    mtvt, a0
58020020:	30751073          	csrw	mtvt,a0
    
    .weak __StackTop
    la      sp, __StackTop
58020024:	ca014117          	auipc	sp,0xca014
58020028:	fdc10113          	addi	sp,sp,-36 # 22034000 <bl808_device_table>
    csrw    mscratch, sp
5802002c:	34011073          	csrw	mscratch,sp

    /* Load data section removed */

    /* Clear bss section removed */

    jal     SystemInit
58020030:	3ea030ef          	jal	ra,5802341a <SystemInit>

    /* start load code to itcm like. */
    jal     start_load
58020034:	2cc030ef          	jal	ra,58023300 <start_load>

    jal     System_Post_Init
58020038:	428030ef          	jal	ra,58023460 <System_Post_Init>

    jal     main
5802003c:	6a9010ef          	jal	ra,58021ee4 <main>

58020040 <__exit>:

    .size   __start, . - __start

__exit:
    j      __exit
58020040:	a001                	j	58020040 <__exit>
	...

58020080 <__Vectors>:
58020080:	4498 2203 4498 2203 4498 2203 4498 2203     .D.".D.".D.".D."
58020090:	4498 2203 4498 2203 4498 2203 4498 2203     .D.".D.".D.".D."
580200a0:	4498 2203 4498 2203 4498 2203 4498 2203     .D.".D.".D.".D."
580200b0:	4498 2203 4498 2203 4498 2203 4498 2203     .D.".D.".D.".D."
580200c0:	4498 2203 4498 2203 4498 2203 4498 2203     .D.".D.".D.".D."
580200d0:	4498 2203 4498 2203 4498 2203 4498 2203     .D.".D.".D.".D."
580200e0:	4498 2203 4498 2203 4498 2203 4498 2203     .D.".D.".D.".D."
580200f0:	4498 2203 4498 2203 4498 2203 4498 2203     .D.".D.".D.".D."
58020100:	4498 2203 4498 2203 4498 2203 4498 2203     .D.".D.".D.".D."
58020110:	4498 2203 4498 2203 4498 2203 4498 2203     .D.".D.".D.".D."
58020120:	4498 2203 4498 2203 4498 2203 4498 2203     .D.".D.".D.".D."
58020130:	4498 2203 4498 2203 4498 2203 4498 2203     .D.".D.".D.".D."
58020140:	4498 2203 4498 2203 4498 2203 4498 2203     .D.".D.".D.".D."
58020150:	4498 2203 4498 2203 4498 2203 4498 2203     .D.".D.".D.".D."
58020160:	4498 2203 4498 2203 4498 2203 4498 2203     .D.".D.".D.".D."
58020170:	4498 2203 4498 2203 4498 2203 4498 2203     .D.".D.".D.".D."
58020180:	4498 2203 4498 2203 4498 2203 4498 2203     .D.".D.".D.".D."
58020190:	4498 2203 4498 2203 4498 2203 4498 2203     .D.".D.".D.".D."
580201a0:	4498 2203 4498 2203 4498 2203 4498 2203     .D.".D.".D.".D."
580201b0:	4498 2203 4498 2203 4498 2203 4498 2203     .D.".D.".D.".D."

580201c0 <__clzsi2>:
580201c0:	67c1                	lui	a5,0x10
580201c2:	02f57663          	bgeu	a0,a5,580201ee <__clzsi2+0x2e>
580201c6:	0ff00793          	li	a5,255
580201ca:	00a7b7b3          	sltu	a5,a5,a0
580201ce:	078e                	slli	a5,a5,0x3
580201d0:	02000713          	li	a4,32
580201d4:	8f1d                	sub	a4,a4,a5
580201d6:	00f55533          	srl	a0,a0,a5
580201da:	00005797          	auipc	a5,0x5
580201de:	b7678793          	addi	a5,a5,-1162 # 58024d50 <__clz_tab>
580201e2:	953e                	add	a0,a0,a5
580201e4:	00054503          	lbu	a0,0(a0)
580201e8:	40a70533          	sub	a0,a4,a0
580201ec:	8082                	ret
580201ee:	01000737          	lui	a4,0x1000
580201f2:	47c1                	li	a5,16
580201f4:	fce56ee3          	bltu	a0,a4,580201d0 <__clzsi2+0x10>
580201f8:	47e1                	li	a5,24
580201fa:	bfd9                	j	580201d0 <__clzsi2+0x10>

580201fc <__divdi3>:
580201fc:	1151                	addi	sp,sp,-12
580201fe:	c422                	sw	s0,8(sp)
58020200:	c226                	sw	s1,4(sp)
58020202:	872e                	mv	a4,a1
58020204:	4381                	li	t2,0
58020206:	0005da63          	bgez	a1,5802021a <__divdi3+0x1e>
5802020a:	00a037b3          	snez	a5,a0
5802020e:	40b00733          	neg	a4,a1
58020212:	8f1d                	sub	a4,a4,a5
58020214:	40a00533          	neg	a0,a0
58020218:	53fd                	li	t2,-1
5802021a:	0006db63          	bgez	a3,58020230 <__divdi3+0x34>
5802021e:	00c037b3          	snez	a5,a2
58020222:	40d006b3          	neg	a3,a3
58020226:	fff3c393          	not	t2,t2
5802022a:	8e9d                	sub	a3,a3,a5
5802022c:	40c00633          	neg	a2,a2
58020230:	82b2                	mv	t0,a2
58020232:	85b6                	mv	a1,a3
58020234:	842a                	mv	s0,a0
58020236:	833a                	mv	t1,a4
58020238:	22069163          	bnez	a3,5802045a <__divdi3+0x25e>
5802023c:	00005697          	auipc	a3,0x5
58020240:	b1468693          	addi	a3,a3,-1260 # 58024d50 <__clz_tab>
58020244:	0ac77e63          	bgeu	a4,a2,58020300 <__divdi3+0x104>
58020248:	67c1                	lui	a5,0x10
5802024a:	0af67463          	bgeu	a2,a5,580202f2 <__divdi3+0xf6>
5802024e:	0ff00793          	li	a5,255
58020252:	00c7b7b3          	sltu	a5,a5,a2
58020256:	078e                	slli	a5,a5,0x3
58020258:	00f655b3          	srl	a1,a2,a5
5802025c:	96ae                	add	a3,a3,a1
5802025e:	0006c683          	lbu	a3,0(a3)
58020262:	97b6                	add	a5,a5,a3
58020264:	02000693          	li	a3,32
58020268:	40f684b3          	sub	s1,a3,a5
5802026c:	00f68c63          	beq	a3,a5,58020284 <__divdi3+0x88>
58020270:	00971733          	sll	a4,a4,s1
58020274:	00f557b3          	srl	a5,a0,a5
58020278:	009612b3          	sll	t0,a2,s1
5802027c:	00e7e333          	or	t1,a5,a4
58020280:	00951433          	sll	s0,a0,s1
58020284:	0102d593          	srli	a1,t0,0x10
58020288:	02b377b3          	remu	a5,t1,a1
5802028c:	01029613          	slli	a2,t0,0x10
58020290:	8241                	srli	a2,a2,0x10
58020292:	01045713          	srli	a4,s0,0x10
58020296:	02b35333          	divu	t1,t1,a1
5802029a:	07c2                	slli	a5,a5,0x10
5802029c:	8f5d                	or	a4,a4,a5
5802029e:	02660533          	mul	a0,a2,t1
580202a2:	879a                	mv	a5,t1
580202a4:	00a77c63          	bgeu	a4,a0,580202bc <__divdi3+0xc0>
580202a8:	9716                	add	a4,a4,t0
580202aa:	fff30793          	addi	a5,t1,-1
580202ae:	00576763          	bltu	a4,t0,580202bc <__divdi3+0xc0>
580202b2:	00a77563          	bgeu	a4,a0,580202bc <__divdi3+0xc0>
580202b6:	ffe30793          	addi	a5,t1,-2
580202ba:	9716                	add	a4,a4,t0
580202bc:	8f09                	sub	a4,a4,a0
580202be:	02b776b3          	remu	a3,a4,a1
580202c2:	0442                	slli	s0,s0,0x10
580202c4:	8041                	srli	s0,s0,0x10
580202c6:	02b75733          	divu	a4,a4,a1
580202ca:	06c2                	slli	a3,a3,0x10
580202cc:	8c55                	or	s0,s0,a3
580202ce:	02e60633          	mul	a2,a2,a4
580202d2:	853a                	mv	a0,a4
580202d4:	00c47b63          	bgeu	s0,a2,580202ea <__divdi3+0xee>
580202d8:	9416                	add	s0,s0,t0
580202da:	fff70513          	addi	a0,a4,-1 # ffffff <HeapMinSize+0xffefff>
580202de:	00546663          	bltu	s0,t0,580202ea <__divdi3+0xee>
580202e2:	00c47463          	bgeu	s0,a2,580202ea <__divdi3+0xee>
580202e6:	ffe70513          	addi	a0,a4,-2
580202ea:	07c2                	slli	a5,a5,0x10
580202ec:	8fc9                	or	a5,a5,a0
580202ee:	4581                	li	a1,0
580202f0:	a855                	j	580203a4 <__divdi3+0x1a8>
580202f2:	010005b7          	lui	a1,0x1000
580202f6:	47c1                	li	a5,16
580202f8:	f6b660e3          	bltu	a2,a1,58020258 <__divdi3+0x5c>
580202fc:	47e1                	li	a5,24
580202fe:	bfa9                	j	58020258 <__divdi3+0x5c>
58020300:	e601                	bnez	a2,58020308 <__divdi3+0x10c>
58020302:	4285                	li	t0,1
58020304:	02b2d2b3          	divu	t0,t0,a1
58020308:	67c1                	lui	a5,0x10
5802030a:	0af2fb63          	bgeu	t0,a5,580203c0 <__divdi3+0x1c4>
5802030e:	0ff00793          	li	a5,255
58020312:	0057f363          	bgeu	a5,t0,58020318 <__divdi3+0x11c>
58020316:	45a1                	li	a1,8
58020318:	00b2d7b3          	srl	a5,t0,a1
5802031c:	96be                	add	a3,a3,a5
5802031e:	0006c783          	lbu	a5,0(a3)
58020322:	02000693          	li	a3,32
58020326:	97ae                	add	a5,a5,a1
58020328:	40f68633          	sub	a2,a3,a5
5802032c:	0af69163          	bne	a3,a5,580203ce <__divdi3+0x1d2>
58020330:	40570733          	sub	a4,a4,t0
58020334:	4585                	li	a1,1
58020336:	0102d513          	srli	a0,t0,0x10
5802033a:	01029613          	slli	a2,t0,0x10
5802033e:	8241                	srli	a2,a2,0x10
58020340:	02a776b3          	remu	a3,a4,a0
58020344:	02a75733          	divu	a4,a4,a0
58020348:	01069793          	slli	a5,a3,0x10
5802034c:	01045693          	srli	a3,s0,0x10
58020350:	8edd                	or	a3,a3,a5
58020352:	02e60333          	mul	t1,a2,a4
58020356:	87ba                	mv	a5,a4
58020358:	0066fc63          	bgeu	a3,t1,58020370 <__divdi3+0x174>
5802035c:	9696                	add	a3,a3,t0
5802035e:	fff70793          	addi	a5,a4,-1
58020362:	0056e763          	bltu	a3,t0,58020370 <__divdi3+0x174>
58020366:	0066f563          	bgeu	a3,t1,58020370 <__divdi3+0x174>
5802036a:	ffe70793          	addi	a5,a4,-2
5802036e:	9696                	add	a3,a3,t0
58020370:	406686b3          	sub	a3,a3,t1
58020374:	02a6f733          	remu	a4,a3,a0
58020378:	0442                	slli	s0,s0,0x10
5802037a:	8041                	srli	s0,s0,0x10
5802037c:	02a6d6b3          	divu	a3,a3,a0
58020380:	0742                	slli	a4,a4,0x10
58020382:	8c59                	or	s0,s0,a4
58020384:	02d60633          	mul	a2,a2,a3
58020388:	8536                	mv	a0,a3
5802038a:	00c47b63          	bgeu	s0,a2,580203a0 <__divdi3+0x1a4>
5802038e:	9416                	add	s0,s0,t0
58020390:	fff68513          	addi	a0,a3,-1
58020394:	00546663          	bltu	s0,t0,580203a0 <__divdi3+0x1a4>
58020398:	00c47463          	bgeu	s0,a2,580203a0 <__divdi3+0x1a4>
5802039c:	ffe68513          	addi	a0,a3,-2
580203a0:	07c2                	slli	a5,a5,0x10
580203a2:	8fc9                	or	a5,a5,a0
580203a4:	853e                	mv	a0,a5
580203a6:	00038963          	beqz	t2,580203b8 <__divdi3+0x1bc>
580203aa:	00f037b3          	snez	a5,a5
580203ae:	40b005b3          	neg	a1,a1
580203b2:	8d9d                	sub	a1,a1,a5
580203b4:	40a00533          	neg	a0,a0
580203b8:	4422                	lw	s0,8(sp)
580203ba:	4492                	lw	s1,4(sp)
580203bc:	0131                	addi	sp,sp,12
580203be:	8082                	ret
580203c0:	010007b7          	lui	a5,0x1000
580203c4:	45c1                	li	a1,16
580203c6:	f4f2e9e3          	bltu	t0,a5,58020318 <__divdi3+0x11c>
580203ca:	45e1                	li	a1,24
580203cc:	b7b1                	j	58020318 <__divdi3+0x11c>
580203ce:	00c292b3          	sll	t0,t0,a2
580203d2:	00f75333          	srl	t1,a4,a5
580203d6:	00c51433          	sll	s0,a0,a2
580203da:	00c71733          	sll	a4,a4,a2
580203de:	00f557b3          	srl	a5,a0,a5
580203e2:	0102d513          	srli	a0,t0,0x10
580203e6:	00e7e6b3          	or	a3,a5,a4
580203ea:	02a377b3          	remu	a5,t1,a0
580203ee:	01029713          	slli	a4,t0,0x10
580203f2:	8341                	srli	a4,a4,0x10
580203f4:	0106d593          	srli	a1,a3,0x10
580203f8:	02a35333          	divu	t1,t1,a0
580203fc:	07c2                	slli	a5,a5,0x10
580203fe:	8fcd                	or	a5,a5,a1
58020400:	02670633          	mul	a2,a4,t1
58020404:	859a                	mv	a1,t1
58020406:	00c7fc63          	bgeu	a5,a2,5802041e <__divdi3+0x222>
5802040a:	9796                	add	a5,a5,t0
5802040c:	fff30593          	addi	a1,t1,-1
58020410:	0057e763          	bltu	a5,t0,5802041e <__divdi3+0x222>
58020414:	00c7f563          	bgeu	a5,a2,5802041e <__divdi3+0x222>
58020418:	ffe30593          	addi	a1,t1,-2
5802041c:	9796                	add	a5,a5,t0
5802041e:	40c78633          	sub	a2,a5,a2
58020422:	02a677b3          	remu	a5,a2,a0
58020426:	02a65633          	divu	a2,a2,a0
5802042a:	07c2                	slli	a5,a5,0x10
5802042c:	02c70533          	mul	a0,a4,a2
58020430:	01069713          	slli	a4,a3,0x10
58020434:	8341                	srli	a4,a4,0x10
58020436:	8f5d                	or	a4,a4,a5
58020438:	87b2                	mv	a5,a2
5802043a:	00a77c63          	bgeu	a4,a0,58020452 <__divdi3+0x256>
5802043e:	9716                	add	a4,a4,t0
58020440:	fff60793          	addi	a5,a2,-1
58020444:	00576763          	bltu	a4,t0,58020452 <__divdi3+0x256>
58020448:	00a77563          	bgeu	a4,a0,58020452 <__divdi3+0x256>
5802044c:	ffe60793          	addi	a5,a2,-2
58020450:	9716                	add	a4,a4,t0
58020452:	05c2                	slli	a1,a1,0x10
58020454:	8f09                	sub	a4,a4,a0
58020456:	8ddd                	or	a1,a1,a5
58020458:	bdf9                	j	58020336 <__divdi3+0x13a>
5802045a:	14d76063          	bltu	a4,a3,5802059a <__divdi3+0x39e>
5802045e:	67c1                	lui	a5,0x10
58020460:	02f6ff63          	bgeu	a3,a5,5802049e <__divdi3+0x2a2>
58020464:	0ff00793          	li	a5,255
58020468:	00d7b7b3          	sltu	a5,a5,a3
5802046c:	078e                	slli	a5,a5,0x3
5802046e:	00f6d333          	srl	t1,a3,a5
58020472:	00005597          	auipc	a1,0x5
58020476:	8de58593          	addi	a1,a1,-1826 # 58024d50 <__clz_tab>
5802047a:	959a                	add	a1,a1,t1
5802047c:	0005c583          	lbu	a1,0(a1)
58020480:	02000313          	li	t1,32
58020484:	97ae                	add	a5,a5,a1
58020486:	40f305b3          	sub	a1,t1,a5
5802048a:	02f31163          	bne	t1,a5,580204ac <__divdi3+0x2b0>
5802048e:	4785                	li	a5,1
58020490:	f0e6eae3          	bltu	a3,a4,580203a4 <__divdi3+0x1a8>
58020494:	00c53533          	sltu	a0,a0,a2
58020498:	00154793          	xori	a5,a0,1
5802049c:	b721                	j	580203a4 <__divdi3+0x1a8>
5802049e:	010005b7          	lui	a1,0x1000
580204a2:	47c1                	li	a5,16
580204a4:	fcb6e5e3          	bltu	a3,a1,5802046e <__divdi3+0x272>
580204a8:	47e1                	li	a5,24
580204aa:	b7d1                	j	5802046e <__divdi3+0x272>
580204ac:	00f65333          	srl	t1,a2,a5
580204b0:	00b696b3          	sll	a3,a3,a1
580204b4:	00d36333          	or	t1,t1,a3
580204b8:	00b616b3          	sll	a3,a2,a1
580204bc:	00f752b3          	srl	t0,a4,a5
580204c0:	01035413          	srli	s0,t1,0x10
580204c4:	00b71733          	sll	a4,a4,a1
580204c8:	c036                	sw	a3,0(sp)
580204ca:	00f556b3          	srl	a3,a0,a5
580204ce:	8ed9                	or	a3,a3,a4
580204d0:	0282f733          	remu	a4,t0,s0
580204d4:	01031613          	slli	a2,t1,0x10
580204d8:	8241                	srli	a2,a2,0x10
580204da:	0282d2b3          	divu	t0,t0,s0
580204de:	01071793          	slli	a5,a4,0x10
580204e2:	0106d713          	srli	a4,a3,0x10
580204e6:	8f5d                	or	a4,a4,a5
580204e8:	025604b3          	mul	s1,a2,t0
580204ec:	8796                	mv	a5,t0
580204ee:	00977c63          	bgeu	a4,s1,58020506 <__divdi3+0x30a>
580204f2:	971a                	add	a4,a4,t1
580204f4:	fff28793          	addi	a5,t0,-1
580204f8:	00676763          	bltu	a4,t1,58020506 <__divdi3+0x30a>
580204fc:	00977563          	bgeu	a4,s1,58020506 <__divdi3+0x30a>
58020500:	ffe28793          	addi	a5,t0,-2
58020504:	971a                	add	a4,a4,t1
58020506:	8f05                	sub	a4,a4,s1
58020508:	028772b3          	remu	t0,a4,s0
5802050c:	06c2                	slli	a3,a3,0x10
5802050e:	82c1                	srli	a3,a3,0x10
58020510:	02875433          	divu	s0,a4,s0
58020514:	02c2                	slli	t0,t0,0x10
58020516:	00d2e6b3          	or	a3,t0,a3
5802051a:	02860633          	mul	a2,a2,s0
5802051e:	8722                	mv	a4,s0
58020520:	00c6fc63          	bgeu	a3,a2,58020538 <__divdi3+0x33c>
58020524:	969a                	add	a3,a3,t1
58020526:	fff40713          	addi	a4,s0,-1
5802052a:	0066e763          	bltu	a3,t1,58020538 <__divdi3+0x33c>
5802052e:	00c6f563          	bgeu	a3,a2,58020538 <__divdi3+0x33c>
58020532:	ffe40713          	addi	a4,s0,-2
58020536:	969a                	add	a3,a3,t1
58020538:	8e91                	sub	a3,a3,a2
5802053a:	4602                	lw	a2,0(sp)
5802053c:	07c2                	slli	a5,a5,0x10
5802053e:	64c1                	lui	s1,0x10
58020540:	8fd9                	or	a5,a5,a4
58020542:	fff48713          	addi	a4,s1,-1 # ffff <HeapMinSize+0xefff>
58020546:	00e7f2b3          	and	t0,a5,a4
5802054a:	0107d313          	srli	t1,a5,0x10
5802054e:	8f71                	and	a4,a4,a2
58020550:	8241                	srli	a2,a2,0x10
58020552:	02e28433          	mul	s0,t0,a4
58020556:	02e30733          	mul	a4,t1,a4
5802055a:	02c30333          	mul	t1,t1,a2
5802055e:	02c28633          	mul	a2,t0,a2
58020562:	00e602b3          	add	t0,a2,a4
58020566:	01045613          	srli	a2,s0,0x10
5802056a:	9616                	add	a2,a2,t0
5802056c:	00e67363          	bgeu	a2,a4,58020572 <__divdi3+0x376>
58020570:	9326                	add	t1,t1,s1
58020572:	01065713          	srli	a4,a2,0x10
58020576:	933a                	add	t1,t1,a4
58020578:	0066ef63          	bltu	a3,t1,58020596 <__divdi3+0x39a>
5802057c:	d66699e3          	bne	a3,t1,580202ee <__divdi3+0xf2>
58020580:	6741                	lui	a4,0x10
58020582:	177d                	addi	a4,a4,-1
58020584:	8e79                	and	a2,a2,a4
58020586:	0642                	slli	a2,a2,0x10
58020588:	8c79                	and	s0,s0,a4
5802058a:	00b51533          	sll	a0,a0,a1
5802058e:	9432                	add	s0,s0,a2
58020590:	4581                	li	a1,0
58020592:	e08579e3          	bgeu	a0,s0,580203a4 <__divdi3+0x1a8>
58020596:	17fd                	addi	a5,a5,-1
58020598:	bb99                	j	580202ee <__divdi3+0xf2>
5802059a:	4581                	li	a1,0
5802059c:	4781                	li	a5,0
5802059e:	b519                	j	580203a4 <__divdi3+0x1a8>

580205a0 <__moddi3>:
580205a0:	1141                	addi	sp,sp,-16
580205a2:	c622                	sw	s0,12(sp)
580205a4:	c426                	sw	s1,8(sp)
580205a6:	c202                	sw	zero,4(sp)
580205a8:	0005db63          	bgez	a1,580205be <__moddi3+0x1e>
580205ac:	00a037b3          	snez	a5,a0
580205b0:	40b005b3          	neg	a1,a1
580205b4:	8d9d                	sub	a1,a1,a5
580205b6:	57fd                	li	a5,-1
580205b8:	40a00533          	neg	a0,a0
580205bc:	c23e                	sw	a5,4(sp)
580205be:	0006d963          	bgez	a3,580205d0 <__moddi3+0x30>
580205c2:	00c037b3          	snez	a5,a2
580205c6:	40d006b3          	neg	a3,a3
580205ca:	8e9d                	sub	a3,a3,a5
580205cc:	40c00633          	neg	a2,a2
580205d0:	8432                	mv	s0,a2
580205d2:	8336                	mv	t1,a3
580205d4:	87aa                	mv	a5,a0
580205d6:	872e                	mv	a4,a1
580205d8:	1e069263          	bnez	a3,580207bc <__moddi3+0x21c>
580205dc:	00004697          	auipc	a3,0x4
580205e0:	77468693          	addi	a3,a3,1908 # 58024d50 <__clz_tab>
580205e4:	0cc5f463          	bgeu	a1,a2,580206ac <__moddi3+0x10c>
580205e8:	62c1                	lui	t0,0x10
580205ea:	0a567a63          	bgeu	a2,t0,5802069e <__moddi3+0xfe>
580205ee:	0ff00293          	li	t0,255
580205f2:	00c2f363          	bgeu	t0,a2,580205f8 <__moddi3+0x58>
580205f6:	4321                	li	t1,8
580205f8:	006652b3          	srl	t0,a2,t1
580205fc:	9696                	add	a3,a3,t0
580205fe:	0006c683          	lbu	a3,0(a3)
58020602:	9336                	add	t1,t1,a3
58020604:	02000693          	li	a3,32
58020608:	406682b3          	sub	t0,a3,t1
5802060c:	00668c63          	beq	a3,t1,58020624 <__moddi3+0x84>
58020610:	005595b3          	sll	a1,a1,t0
58020614:	00655333          	srl	t1,a0,t1
58020618:	00561433          	sll	s0,a2,t0
5802061c:	00b36733          	or	a4,t1,a1
58020620:	005517b3          	sll	a5,a0,t0
58020624:	01045393          	srli	t2,s0,0x10
58020628:	027755b3          	divu	a1,a4,t2
5802062c:	01041513          	slli	a0,s0,0x10
58020630:	8141                	srli	a0,a0,0x10
58020632:	0107d693          	srli	a3,a5,0x10
58020636:	02777633          	remu	a2,a4,t2
5802063a:	02b505b3          	mul	a1,a0,a1
5802063e:	0642                	slli	a2,a2,0x10
58020640:	8ed1                	or	a3,a3,a2
58020642:	00b6f863          	bgeu	a3,a1,58020652 <__moddi3+0xb2>
58020646:	96a2                	add	a3,a3,s0
58020648:	0086e563          	bltu	a3,s0,58020652 <__moddi3+0xb2>
5802064c:	00b6f363          	bgeu	a3,a1,58020652 <__moddi3+0xb2>
58020650:	96a2                	add	a3,a3,s0
58020652:	8e8d                	sub	a3,a3,a1
58020654:	0276f733          	remu	a4,a3,t2
58020658:	07c2                	slli	a5,a5,0x10
5802065a:	83c1                	srli	a5,a5,0x10
5802065c:	0276d6b3          	divu	a3,a3,t2
58020660:	02d506b3          	mul	a3,a0,a3
58020664:	01071513          	slli	a0,a4,0x10
58020668:	8fc9                	or	a5,a5,a0
5802066a:	00d7f863          	bgeu	a5,a3,5802067a <__moddi3+0xda>
5802066e:	97a2                	add	a5,a5,s0
58020670:	0087e563          	bltu	a5,s0,5802067a <__moddi3+0xda>
58020674:	00d7f363          	bgeu	a5,a3,5802067a <__moddi3+0xda>
58020678:	97a2                	add	a5,a5,s0
5802067a:	8f95                	sub	a5,a5,a3
5802067c:	0057d533          	srl	a0,a5,t0
58020680:	4581                	li	a1,0
58020682:	4792                	lw	a5,4(sp)
58020684:	cb89                	beqz	a5,58020696 <__moddi3+0xf6>
58020686:	00a033b3          	snez	t2,a0
5802068a:	40b005b3          	neg	a1,a1
5802068e:	407585b3          	sub	a1,a1,t2
58020692:	40a00533          	neg	a0,a0
58020696:	4432                	lw	s0,12(sp)
58020698:	44a2                	lw	s1,8(sp)
5802069a:	0141                	addi	sp,sp,16
5802069c:	8082                	ret
5802069e:	010002b7          	lui	t0,0x1000
580206a2:	4341                	li	t1,16
580206a4:	f4566ae3          	bltu	a2,t0,580205f8 <__moddi3+0x58>
580206a8:	4361                	li	t1,24
580206aa:	b7b9                	j	580205f8 <__moddi3+0x58>
580206ac:	e601                	bnez	a2,580206b4 <__moddi3+0x114>
580206ae:	4405                	li	s0,1
580206b0:	02645433          	divu	s0,s0,t1
580206b4:	6741                	lui	a4,0x10
580206b6:	08e47163          	bgeu	s0,a4,58020738 <__moddi3+0x198>
580206ba:	0ff00713          	li	a4,255
580206be:	00877363          	bgeu	a4,s0,580206c4 <__moddi3+0x124>
580206c2:	4321                	li	t1,8
580206c4:	00645733          	srl	a4,s0,t1
580206c8:	96ba                	add	a3,a3,a4
580206ca:	0006c603          	lbu	a2,0(a3)
580206ce:	02000713          	li	a4,32
580206d2:	9332                	add	t1,t1,a2
580206d4:	406702b3          	sub	t0,a4,t1
580206d8:	06671763          	bne	a4,t1,58020746 <__moddi3+0x1a6>
580206dc:	8d81                	sub	a1,a1,s0
580206de:	01045693          	srli	a3,s0,0x10
580206e2:	01041513          	slli	a0,s0,0x10
580206e6:	8141                	srli	a0,a0,0x10
580206e8:	0107d613          	srli	a2,a5,0x10
580206ec:	02d5f733          	remu	a4,a1,a3
580206f0:	02d5d5b3          	divu	a1,a1,a3
580206f4:	0742                	slli	a4,a4,0x10
580206f6:	8f51                	or	a4,a4,a2
580206f8:	02b505b3          	mul	a1,a0,a1
580206fc:	00b77863          	bgeu	a4,a1,5802070c <__moddi3+0x16c>
58020700:	9722                	add	a4,a4,s0
58020702:	00876563          	bltu	a4,s0,5802070c <__moddi3+0x16c>
58020706:	00b77363          	bgeu	a4,a1,5802070c <__moddi3+0x16c>
5802070a:	9722                	add	a4,a4,s0
5802070c:	40b705b3          	sub	a1,a4,a1
58020710:	02d5f733          	remu	a4,a1,a3
58020714:	07c2                	slli	a5,a5,0x10
58020716:	83c1                	srli	a5,a5,0x10
58020718:	02d5d5b3          	divu	a1,a1,a3
5802071c:	0742                	slli	a4,a4,0x10
5802071e:	8fd9                	or	a5,a5,a4
58020720:	02b50533          	mul	a0,a0,a1
58020724:	00a7f863          	bgeu	a5,a0,58020734 <__moddi3+0x194>
58020728:	97a2                	add	a5,a5,s0
5802072a:	0087e563          	bltu	a5,s0,58020734 <__moddi3+0x194>
5802072e:	00a7f363          	bgeu	a5,a0,58020734 <__moddi3+0x194>
58020732:	97a2                	add	a5,a5,s0
58020734:	8f89                	sub	a5,a5,a0
58020736:	b799                	j	5802067c <__moddi3+0xdc>
58020738:	01000737          	lui	a4,0x1000
5802073c:	4341                	li	t1,16
5802073e:	f8e463e3          	bltu	s0,a4,580206c4 <__moddi3+0x124>
58020742:	4361                	li	t1,24
58020744:	b741                	j	580206c4 <__moddi3+0x124>
58020746:	00541433          	sll	s0,s0,t0
5802074a:	0065d6b3          	srl	a3,a1,t1
5802074e:	005517b3          	sll	a5,a0,t0
58020752:	00655333          	srl	t1,a0,t1
58020756:	01045513          	srli	a0,s0,0x10
5802075a:	02a6f733          	remu	a4,a3,a0
5802075e:	005595b3          	sll	a1,a1,t0
58020762:	00b36633          	or	a2,t1,a1
58020766:	01041593          	slli	a1,s0,0x10
5802076a:	81c1                	srli	a1,a1,0x10
5802076c:	01065313          	srli	t1,a2,0x10
58020770:	02a6d6b3          	divu	a3,a3,a0
58020774:	0742                	slli	a4,a4,0x10
58020776:	00676733          	or	a4,a4,t1
5802077a:	02d586b3          	mul	a3,a1,a3
5802077e:	00d77863          	bgeu	a4,a3,5802078e <__moddi3+0x1ee>
58020782:	9722                	add	a4,a4,s0
58020784:	00876563          	bltu	a4,s0,5802078e <__moddi3+0x1ee>
58020788:	00d77363          	bgeu	a4,a3,5802078e <__moddi3+0x1ee>
5802078c:	9722                	add	a4,a4,s0
5802078e:	40d706b3          	sub	a3,a4,a3
58020792:	02a6f733          	remu	a4,a3,a0
58020796:	02a6d6b3          	divu	a3,a3,a0
5802079a:	0742                	slli	a4,a4,0x10
5802079c:	02d586b3          	mul	a3,a1,a3
580207a0:	01061593          	slli	a1,a2,0x10
580207a4:	81c1                	srli	a1,a1,0x10
580207a6:	8dd9                	or	a1,a1,a4
580207a8:	00d5f863          	bgeu	a1,a3,580207b8 <__moddi3+0x218>
580207ac:	95a2                	add	a1,a1,s0
580207ae:	0085e563          	bltu	a1,s0,580207b8 <__moddi3+0x218>
580207b2:	00d5f363          	bgeu	a1,a3,580207b8 <__moddi3+0x218>
580207b6:	95a2                	add	a1,a1,s0
580207b8:	8d95                	sub	a1,a1,a3
580207ba:	b715                	j	580206de <__moddi3+0x13e>
580207bc:	ecd5e3e3          	bltu	a1,a3,58020682 <__moddi3+0xe2>
580207c0:	6341                	lui	t1,0x10
580207c2:	0466f563          	bgeu	a3,t1,5802080c <__moddi3+0x26c>
580207c6:	0ff00293          	li	t0,255
580207ca:	00d2b333          	sltu	t1,t0,a3
580207ce:	030e                	slli	t1,t1,0x3
580207d0:	0066d3b3          	srl	t2,a3,t1
580207d4:	00004297          	auipc	t0,0x4
580207d8:	57c28293          	addi	t0,t0,1404 # 58024d50 <__clz_tab>
580207dc:	929e                	add	t0,t0,t2
580207de:	0002c283          	lbu	t0,0(t0)
580207e2:	929a                	add	t0,t0,t1
580207e4:	02000313          	li	t1,32
580207e8:	405303b3          	sub	t2,t1,t0
580207ec:	02531763          	bne	t1,t0,5802081a <__moddi3+0x27a>
580207f0:	00b6e463          	bltu	a3,a1,580207f8 <__moddi3+0x258>
580207f4:	00c56963          	bltu	a0,a2,58020806 <__moddi3+0x266>
580207f8:	40c507b3          	sub	a5,a0,a2
580207fc:	8d95                	sub	a1,a1,a3
580207fe:	00f53533          	sltu	a0,a0,a5
58020802:	40a58733          	sub	a4,a1,a0
58020806:	853e                	mv	a0,a5
58020808:	85ba                	mv	a1,a4
5802080a:	bda5                	j	58020682 <__moddi3+0xe2>
5802080c:	010002b7          	lui	t0,0x1000
58020810:	4341                	li	t1,16
58020812:	fa56efe3          	bltu	a3,t0,580207d0 <__moddi3+0x230>
58020816:	4361                	li	t1,24
58020818:	bf65                	j	580207d0 <__moddi3+0x230>
5802081a:	007696b3          	sll	a3,a3,t2
5802081e:	00565333          	srl	t1,a2,t0
58020822:	00d36333          	or	t1,t1,a3
58020826:	01035413          	srli	s0,t1,0x10
5802082a:	0055d6b3          	srl	a3,a1,t0
5802082e:	00555733          	srl	a4,a0,t0
58020832:	007517b3          	sll	a5,a0,t2
58020836:	0286d533          	divu	a0,a3,s0
5802083a:	c03e                	sw	a5,0(sp)
5802083c:	007595b3          	sll	a1,a1,t2
58020840:	8dd9                	or	a1,a1,a4
58020842:	01031713          	slli	a4,t1,0x10
58020846:	8341                	srli	a4,a4,0x10
58020848:	00761633          	sll	a2,a2,t2
5802084c:	0286f7b3          	remu	a5,a3,s0
58020850:	02a704b3          	mul	s1,a4,a0
58020854:	01079693          	slli	a3,a5,0x10
58020858:	0105d793          	srli	a5,a1,0x10
5802085c:	8fd5                	or	a5,a5,a3
5802085e:	86aa                	mv	a3,a0
58020860:	0097fc63          	bgeu	a5,s1,58020878 <__moddi3+0x2d8>
58020864:	979a                	add	a5,a5,t1
58020866:	fff50693          	addi	a3,a0,-1
5802086a:	0067e763          	bltu	a5,t1,58020878 <__moddi3+0x2d8>
5802086e:	0097f563          	bgeu	a5,s1,58020878 <__moddi3+0x2d8>
58020872:	ffe50693          	addi	a3,a0,-2
58020876:	979a                	add	a5,a5,t1
58020878:	8f85                	sub	a5,a5,s1
5802087a:	0287f533          	remu	a0,a5,s0
5802087e:	05c2                	slli	a1,a1,0x10
58020880:	81c1                	srli	a1,a1,0x10
58020882:	0287d7b3          	divu	a5,a5,s0
58020886:	0542                	slli	a0,a0,0x10
58020888:	8dc9                	or	a1,a1,a0
5802088a:	02f70733          	mul	a4,a4,a5
5802088e:	843e                	mv	s0,a5
58020890:	00e5fc63          	bgeu	a1,a4,580208a8 <__moddi3+0x308>
58020894:	959a                	add	a1,a1,t1
58020896:	fff78413          	addi	s0,a5,-1 # ffff <HeapMinSize+0xefff>
5802089a:	0065e763          	bltu	a1,t1,580208a8 <__moddi3+0x308>
5802089e:	00e5f563          	bgeu	a1,a4,580208a8 <__moddi3+0x308>
580208a2:	ffe78413          	addi	s0,a5,-2
580208a6:	959a                	add	a1,a1,t1
580208a8:	06c2                	slli	a3,a3,0x10
580208aa:	8ec1                	or	a3,a3,s0
580208ac:	6441                	lui	s0,0x10
580208ae:	40e58733          	sub	a4,a1,a4
580208b2:	fff40593          	addi	a1,s0,-1 # ffff <HeapMinSize+0xefff>
580208b6:	00b6f7b3          	and	a5,a3,a1
580208ba:	01065493          	srli	s1,a2,0x10
580208be:	82c1                	srli	a3,a3,0x10
580208c0:	8df1                	and	a1,a1,a2
580208c2:	02b78533          	mul	a0,a5,a1
580208c6:	02b685b3          	mul	a1,a3,a1
580208ca:	029686b3          	mul	a3,a3,s1
580208ce:	029784b3          	mul	s1,a5,s1
580208d2:	01055793          	srli	a5,a0,0x10
580208d6:	94ae                	add	s1,s1,a1
580208d8:	97a6                	add	a5,a5,s1
580208da:	00b7f363          	bgeu	a5,a1,580208e0 <__moddi3+0x340>
580208de:	96a2                	add	a3,a3,s0
580208e0:	0107d593          	srli	a1,a5,0x10
580208e4:	96ae                	add	a3,a3,a1
580208e6:	65c1                	lui	a1,0x10
580208e8:	15fd                	addi	a1,a1,-1
580208ea:	8fed                	and	a5,a5,a1
580208ec:	07c2                	slli	a5,a5,0x10
580208ee:	8d6d                	and	a0,a0,a1
580208f0:	953e                	add	a0,a0,a5
580208f2:	00d76763          	bltu	a4,a3,58020900 <__moddi3+0x360>
580208f6:	00d71d63          	bne	a4,a3,58020910 <__moddi3+0x370>
580208fa:	4782                	lw	a5,0(sp)
580208fc:	00a7fa63          	bgeu	a5,a0,58020910 <__moddi3+0x370>
58020900:	40c50633          	sub	a2,a0,a2
58020904:	00c53533          	sltu	a0,a0,a2
58020908:	932a                	add	t1,t1,a0
5802090a:	406686b3          	sub	a3,a3,t1
5802090e:	8532                	mv	a0,a2
58020910:	4782                	lw	a5,0(sp)
58020912:	40d706b3          	sub	a3,a4,a3
58020916:	40a78533          	sub	a0,a5,a0
5802091a:	00a7b5b3          	sltu	a1,a5,a0
5802091e:	40b685b3          	sub	a1,a3,a1
58020922:	005597b3          	sll	a5,a1,t0
58020926:	00755533          	srl	a0,a0,t2
5802092a:	8d5d                	or	a0,a0,a5
5802092c:	0075d5b3          	srl	a1,a1,t2
58020930:	bb89                	j	58020682 <__moddi3+0xe2>

58020932 <__udivdi3>:
58020932:	1161                	addi	sp,sp,-8
58020934:	c222                	sw	s0,4(sp)
58020936:	c026                	sw	s1,0(sp)
58020938:	82aa                	mv	t0,a0
5802093a:	87ae                	mv	a5,a1
5802093c:	20069e63          	bnez	a3,58020b58 <__udivdi3+0x226>
58020940:	85b6                	mv	a1,a3
58020942:	8332                	mv	t1,a2
58020944:	83aa                	mv	t2,a0
58020946:	00004697          	auipc	a3,0x4
5802094a:	40a68693          	addi	a3,a3,1034 # 58024d50 <__clz_tab>
5802094e:	0cc7f263          	bgeu	a5,a2,58020a12 <__udivdi3+0xe0>
58020952:	6741                	lui	a4,0x10
58020954:	853e                	mv	a0,a5
58020956:	0ae67763          	bgeu	a2,a4,58020a04 <__udivdi3+0xd2>
5802095a:	0ff00713          	li	a4,255
5802095e:	00c73733          	sltu	a4,a4,a2
58020962:	070e                	slli	a4,a4,0x3
58020964:	00e655b3          	srl	a1,a2,a4
58020968:	96ae                	add	a3,a3,a1
5802096a:	0006c683          	lbu	a3,0(a3)
5802096e:	9736                	add	a4,a4,a3
58020970:	02000693          	li	a3,32
58020974:	40e68433          	sub	s0,a3,a4
58020978:	00e68c63          	beq	a3,a4,58020990 <__udivdi3+0x5e>
5802097c:	008796b3          	sll	a3,a5,s0
58020980:	00e2d733          	srl	a4,t0,a4
58020984:	00861333          	sll	t1,a2,s0
58020988:	00d76533          	or	a0,a4,a3
5802098c:	008293b3          	sll	t2,t0,s0
58020990:	01035593          	srli	a1,t1,0x10
58020994:	02b556b3          	divu	a3,a0,a1
58020998:	01031613          	slli	a2,t1,0x10
5802099c:	8241                	srli	a2,a2,0x10
5802099e:	0103d793          	srli	a5,t2,0x10
580209a2:	02b57733          	remu	a4,a0,a1
580209a6:	8536                	mv	a0,a3
580209a8:	02d602b3          	mul	t0,a2,a3
580209ac:	0742                	slli	a4,a4,0x10
580209ae:	8fd9                	or	a5,a5,a4
580209b0:	0057fc63          	bgeu	a5,t0,580209c8 <__udivdi3+0x96>
580209b4:	979a                	add	a5,a5,t1
580209b6:	fff68513          	addi	a0,a3,-1
580209ba:	0067e763          	bltu	a5,t1,580209c8 <__udivdi3+0x96>
580209be:	0057f563          	bgeu	a5,t0,580209c8 <__udivdi3+0x96>
580209c2:	ffe68513          	addi	a0,a3,-2
580209c6:	979a                	add	a5,a5,t1
580209c8:	405787b3          	sub	a5,a5,t0
580209cc:	02b7f733          	remu	a4,a5,a1
580209d0:	03c2                	slli	t2,t2,0x10
580209d2:	0103d393          	srli	t2,t2,0x10
580209d6:	02b7d7b3          	divu	a5,a5,a1
580209da:	0742                	slli	a4,a4,0x10
580209dc:	007763b3          	or	t2,a4,t2
580209e0:	02f60633          	mul	a2,a2,a5
580209e4:	873e                	mv	a4,a5
580209e6:	00c3fb63          	bgeu	t2,a2,580209fc <__udivdi3+0xca>
580209ea:	939a                	add	t2,t2,t1
580209ec:	fff78713          	addi	a4,a5,-1
580209f0:	0063e663          	bltu	t2,t1,580209fc <__udivdi3+0xca>
580209f4:	00c3f463          	bgeu	t2,a2,580209fc <__udivdi3+0xca>
580209f8:	ffe78713          	addi	a4,a5,-2
580209fc:	0542                	slli	a0,a0,0x10
580209fe:	8d59                	or	a0,a0,a4
58020a00:	4581                	li	a1,0
58020a02:	a855                	j	58020ab6 <__udivdi3+0x184>
58020a04:	010005b7          	lui	a1,0x1000
58020a08:	4741                	li	a4,16
58020a0a:	f4b66de3          	bltu	a2,a1,58020964 <__udivdi3+0x32>
58020a0e:	4761                	li	a4,24
58020a10:	bf91                	j	58020964 <__udivdi3+0x32>
58020a12:	e601                	bnez	a2,58020a1a <__udivdi3+0xe8>
58020a14:	4705                	li	a4,1
58020a16:	02c75333          	divu	t1,a4,a2
58020a1a:	6741                	lui	a4,0x10
58020a1c:	0ae37163          	bgeu	t1,a4,58020abe <__udivdi3+0x18c>
58020a20:	0ff00713          	li	a4,255
58020a24:	00677363          	bgeu	a4,t1,58020a2a <__udivdi3+0xf8>
58020a28:	45a1                	li	a1,8
58020a2a:	00b35733          	srl	a4,t1,a1
58020a2e:	96ba                	add	a3,a3,a4
58020a30:	0006c703          	lbu	a4,0(a3)
58020a34:	02000693          	li	a3,32
58020a38:	972e                	add	a4,a4,a1
58020a3a:	40e68533          	sub	a0,a3,a4
58020a3e:	08e69763          	bne	a3,a4,58020acc <__udivdi3+0x19a>
58020a42:	406787b3          	sub	a5,a5,t1
58020a46:	4585                	li	a1,1
58020a48:	01035293          	srli	t0,t1,0x10
58020a4c:	01031613          	slli	a2,t1,0x10
58020a50:	8241                	srli	a2,a2,0x10
58020a52:	0103d713          	srli	a4,t2,0x10
58020a56:	0257f6b3          	remu	a3,a5,t0
58020a5a:	0257d7b3          	divu	a5,a5,t0
58020a5e:	06c2                	slli	a3,a3,0x10
58020a60:	8f55                	or	a4,a4,a3
58020a62:	02f60433          	mul	s0,a2,a5
58020a66:	853e                	mv	a0,a5
58020a68:	00877c63          	bgeu	a4,s0,58020a80 <__udivdi3+0x14e>
58020a6c:	971a                	add	a4,a4,t1
58020a6e:	fff78513          	addi	a0,a5,-1
58020a72:	00676763          	bltu	a4,t1,58020a80 <__udivdi3+0x14e>
58020a76:	00877563          	bgeu	a4,s0,58020a80 <__udivdi3+0x14e>
58020a7a:	ffe78513          	addi	a0,a5,-2
58020a7e:	971a                	add	a4,a4,t1
58020a80:	8f01                	sub	a4,a4,s0
58020a82:	025777b3          	remu	a5,a4,t0
58020a86:	03c2                	slli	t2,t2,0x10
58020a88:	0103d393          	srli	t2,t2,0x10
58020a8c:	02575733          	divu	a4,a4,t0
58020a90:	07c2                	slli	a5,a5,0x10
58020a92:	0077e3b3          	or	t2,a5,t2
58020a96:	02e60633          	mul	a2,a2,a4
58020a9a:	87ba                	mv	a5,a4
58020a9c:	00c3fb63          	bgeu	t2,a2,58020ab2 <__udivdi3+0x180>
58020aa0:	939a                	add	t2,t2,t1
58020aa2:	fff70793          	addi	a5,a4,-1 # ffff <HeapMinSize+0xefff>
58020aa6:	0063e663          	bltu	t2,t1,58020ab2 <__udivdi3+0x180>
58020aaa:	00c3f463          	bgeu	t2,a2,58020ab2 <__udivdi3+0x180>
58020aae:	ffe70793          	addi	a5,a4,-2
58020ab2:	0542                	slli	a0,a0,0x10
58020ab4:	8d5d                	or	a0,a0,a5
58020ab6:	4412                	lw	s0,4(sp)
58020ab8:	4482                	lw	s1,0(sp)
58020aba:	0121                	addi	sp,sp,8
58020abc:	8082                	ret
58020abe:	01000737          	lui	a4,0x1000
58020ac2:	45c1                	li	a1,16
58020ac4:	f6e363e3          	bltu	t1,a4,58020a2a <__udivdi3+0xf8>
58020ac8:	45e1                	li	a1,24
58020aca:	b785                	j	58020a2a <__udivdi3+0xf8>
58020acc:	00a31333          	sll	t1,t1,a0
58020ad0:	00e7d6b3          	srl	a3,a5,a4
58020ad4:	00a293b3          	sll	t2,t0,a0
58020ad8:	00a797b3          	sll	a5,a5,a0
58020adc:	01035513          	srli	a0,t1,0x10
58020ae0:	00e2d733          	srl	a4,t0,a4
58020ae4:	02a6d2b3          	divu	t0,a3,a0
58020ae8:	00f76633          	or	a2,a4,a5
58020aec:	01031793          	slli	a5,t1,0x10
58020af0:	83c1                	srli	a5,a5,0x10
58020af2:	01065593          	srli	a1,a2,0x10
58020af6:	02a6f733          	remu	a4,a3,a0
58020afa:	025786b3          	mul	a3,a5,t0
58020afe:	0742                	slli	a4,a4,0x10
58020b00:	8f4d                	or	a4,a4,a1
58020b02:	8596                	mv	a1,t0
58020b04:	00d77c63          	bgeu	a4,a3,58020b1c <__udivdi3+0x1ea>
58020b08:	971a                	add	a4,a4,t1
58020b0a:	fff28593          	addi	a1,t0,-1 # ffffff <HeapMinSize+0xffefff>
58020b0e:	00676763          	bltu	a4,t1,58020b1c <__udivdi3+0x1ea>
58020b12:	00d77563          	bgeu	a4,a3,58020b1c <__udivdi3+0x1ea>
58020b16:	ffe28593          	addi	a1,t0,-2
58020b1a:	971a                	add	a4,a4,t1
58020b1c:	40d706b3          	sub	a3,a4,a3
58020b20:	02a6f733          	remu	a4,a3,a0
58020b24:	02a6d6b3          	divu	a3,a3,a0
58020b28:	0742                	slli	a4,a4,0x10
58020b2a:	02d78533          	mul	a0,a5,a3
58020b2e:	01061793          	slli	a5,a2,0x10
58020b32:	83c1                	srli	a5,a5,0x10
58020b34:	8fd9                	or	a5,a5,a4
58020b36:	8736                	mv	a4,a3
58020b38:	00a7fc63          	bgeu	a5,a0,58020b50 <__udivdi3+0x21e>
58020b3c:	979a                	add	a5,a5,t1
58020b3e:	fff68713          	addi	a4,a3,-1
58020b42:	0067e763          	bltu	a5,t1,58020b50 <__udivdi3+0x21e>
58020b46:	00a7f563          	bgeu	a5,a0,58020b50 <__udivdi3+0x21e>
58020b4a:	ffe68713          	addi	a4,a3,-2
58020b4e:	979a                	add	a5,a5,t1
58020b50:	05c2                	slli	a1,a1,0x10
58020b52:	8f89                	sub	a5,a5,a0
58020b54:	8dd9                	or	a1,a1,a4
58020b56:	bdcd                	j	58020a48 <__udivdi3+0x116>
58020b58:	12d5ef63          	bltu	a1,a3,58020c96 <__udivdi3+0x364>
58020b5c:	6741                	lui	a4,0x10
58020b5e:	02e6ff63          	bgeu	a3,a4,58020b9c <__udivdi3+0x26a>
58020b62:	0ff00713          	li	a4,255
58020b66:	00d73733          	sltu	a4,a4,a3
58020b6a:	070e                	slli	a4,a4,0x3
58020b6c:	00e6d533          	srl	a0,a3,a4
58020b70:	00004597          	auipc	a1,0x4
58020b74:	1e058593          	addi	a1,a1,480 # 58024d50 <__clz_tab>
58020b78:	95aa                	add	a1,a1,a0
58020b7a:	0005c583          	lbu	a1,0(a1)
58020b7e:	02000513          	li	a0,32
58020b82:	972e                	add	a4,a4,a1
58020b84:	40e505b3          	sub	a1,a0,a4
58020b88:	02e51163          	bne	a0,a4,58020baa <__udivdi3+0x278>
58020b8c:	4505                	li	a0,1
58020b8e:	f2f6e4e3          	bltu	a3,a5,58020ab6 <__udivdi3+0x184>
58020b92:	00c2b633          	sltu	a2,t0,a2
58020b96:	00164513          	xori	a0,a2,1
58020b9a:	bf31                	j	58020ab6 <__udivdi3+0x184>
58020b9c:	010005b7          	lui	a1,0x1000
58020ba0:	4741                	li	a4,16
58020ba2:	fcb6e5e3          	bltu	a3,a1,58020b6c <__udivdi3+0x23a>
58020ba6:	4761                	li	a4,24
58020ba8:	b7d1                	j	58020b6c <__udivdi3+0x23a>
58020baa:	00e65333          	srl	t1,a2,a4
58020bae:	00b696b3          	sll	a3,a3,a1
58020bb2:	00d36333          	or	t1,t1,a3
58020bb6:	00e7d3b3          	srl	t2,a5,a4
58020bba:	01035413          	srli	s0,t1,0x10
58020bbe:	0283f6b3          	remu	a3,t2,s0
58020bc2:	01031513          	slli	a0,t1,0x10
58020bc6:	8141                	srli	a0,a0,0x10
58020bc8:	00e2d733          	srl	a4,t0,a4
58020bcc:	00b797b3          	sll	a5,a5,a1
58020bd0:	8fd9                	or	a5,a5,a4
58020bd2:	0107d713          	srli	a4,a5,0x10
58020bd6:	00b61633          	sll	a2,a2,a1
58020bda:	0283d3b3          	divu	t2,t2,s0
58020bde:	06c2                	slli	a3,a3,0x10
58020be0:	8ed9                	or	a3,a3,a4
58020be2:	027504b3          	mul	s1,a0,t2
58020be6:	871e                	mv	a4,t2
58020be8:	0096fc63          	bgeu	a3,s1,58020c00 <__udivdi3+0x2ce>
58020bec:	969a                	add	a3,a3,t1
58020bee:	fff38713          	addi	a4,t2,-1
58020bf2:	0066e763          	bltu	a3,t1,58020c00 <__udivdi3+0x2ce>
58020bf6:	0096f563          	bgeu	a3,s1,58020c00 <__udivdi3+0x2ce>
58020bfa:	ffe38713          	addi	a4,t2,-2
58020bfe:	969a                	add	a3,a3,t1
58020c00:	8e85                	sub	a3,a3,s1
58020c02:	0286f3b3          	remu	t2,a3,s0
58020c06:	07c2                	slli	a5,a5,0x10
58020c08:	83c1                	srli	a5,a5,0x10
58020c0a:	0286d6b3          	divu	a3,a3,s0
58020c0e:	03c2                	slli	t2,t2,0x10
58020c10:	00f3e7b3          	or	a5,t2,a5
58020c14:	02d50533          	mul	a0,a0,a3
58020c18:	83b6                	mv	t2,a3
58020c1a:	00a7fc63          	bgeu	a5,a0,58020c32 <__udivdi3+0x300>
58020c1e:	979a                	add	a5,a5,t1
58020c20:	fff68393          	addi	t2,a3,-1
58020c24:	0067e763          	bltu	a5,t1,58020c32 <__udivdi3+0x300>
58020c28:	00a7f563          	bgeu	a5,a0,58020c32 <__udivdi3+0x300>
58020c2c:	ffe68393          	addi	t2,a3,-2
58020c30:	979a                	add	a5,a5,t1
58020c32:	8f89                	sub	a5,a5,a0
58020c34:	6441                	lui	s0,0x10
58020c36:	01071513          	slli	a0,a4,0x10
58020c3a:	00756533          	or	a0,a0,t2
58020c3e:	fff40713          	addi	a4,s0,-1 # ffff <HeapMinSize+0xefff>
58020c42:	00e573b3          	and	t2,a0,a4
58020c46:	01055693          	srli	a3,a0,0x10
58020c4a:	8f71                	and	a4,a4,a2
58020c4c:	8241                	srli	a2,a2,0x10
58020c4e:	02e38333          	mul	t1,t2,a4
58020c52:	02e68733          	mul	a4,a3,a4
58020c56:	02c383b3          	mul	t2,t2,a2
58020c5a:	02c686b3          	mul	a3,a3,a2
58020c5e:	93ba                	add	t2,t2,a4
58020c60:	01035613          	srli	a2,t1,0x10
58020c64:	961e                	add	a2,a2,t2
58020c66:	00e67363          	bgeu	a2,a4,58020c6c <__udivdi3+0x33a>
58020c6a:	96a2                	add	a3,a3,s0
58020c6c:	01065713          	srli	a4,a2,0x10
58020c70:	96ba                	add	a3,a3,a4
58020c72:	02d7e063          	bltu	a5,a3,58020c92 <__udivdi3+0x360>
58020c76:	d8d795e3          	bne	a5,a3,58020a00 <__udivdi3+0xce>
58020c7a:	67c1                	lui	a5,0x10
58020c7c:	17fd                	addi	a5,a5,-1
58020c7e:	8e7d                	and	a2,a2,a5
58020c80:	0642                	slli	a2,a2,0x10
58020c82:	00f37333          	and	t1,t1,a5
58020c86:	00b292b3          	sll	t0,t0,a1
58020c8a:	961a                	add	a2,a2,t1
58020c8c:	4581                	li	a1,0
58020c8e:	e2c2f4e3          	bgeu	t0,a2,58020ab6 <__udivdi3+0x184>
58020c92:	157d                	addi	a0,a0,-1
58020c94:	b3b5                	j	58020a00 <__udivdi3+0xce>
58020c96:	4581                	li	a1,0
58020c98:	4501                	li	a0,0
58020c9a:	bd31                	j	58020ab6 <__udivdi3+0x184>

58020c9c <__umoddi3>:
58020c9c:	1151                	addi	sp,sp,-12
58020c9e:	c422                	sw	s0,8(sp)
58020ca0:	c226                	sw	s1,4(sp)
58020ca2:	87aa                	mv	a5,a0
58020ca4:	872e                	mv	a4,a1
58020ca6:	1c069a63          	bnez	a3,58020e7a <__umoddi3+0x1de>
58020caa:	8336                	mv	t1,a3
58020cac:	8432                	mv	s0,a2
58020cae:	00004697          	auipc	a3,0x4
58020cb2:	0a268693          	addi	a3,a3,162 # 58024d50 <__clz_tab>
58020cb6:	0ac5fa63          	bgeu	a1,a2,58020d6a <__umoddi3+0xce>
58020cba:	62c1                	lui	t0,0x10
58020cbc:	0a567063          	bgeu	a2,t0,58020d5c <__umoddi3+0xc0>
58020cc0:	0ff00293          	li	t0,255
58020cc4:	00c2f363          	bgeu	t0,a2,58020cca <__umoddi3+0x2e>
58020cc8:	4321                	li	t1,8
58020cca:	006652b3          	srl	t0,a2,t1
58020cce:	9696                	add	a3,a3,t0
58020cd0:	0006c683          	lbu	a3,0(a3)
58020cd4:	9336                	add	t1,t1,a3
58020cd6:	02000693          	li	a3,32
58020cda:	406682b3          	sub	t0,a3,t1
58020cde:	00668c63          	beq	a3,t1,58020cf6 <__umoddi3+0x5a>
58020ce2:	005595b3          	sll	a1,a1,t0
58020ce6:	00655333          	srl	t1,a0,t1
58020cea:	00561433          	sll	s0,a2,t0
58020cee:	00b36733          	or	a4,t1,a1
58020cf2:	005517b3          	sll	a5,a0,t0
58020cf6:	01045393          	srli	t2,s0,0x10
58020cfa:	02777633          	remu	a2,a4,t2
58020cfe:	01041513          	slli	a0,s0,0x10
58020d02:	8141                	srli	a0,a0,0x10
58020d04:	0107d693          	srli	a3,a5,0x10
58020d08:	02775733          	divu	a4,a4,t2
58020d0c:	0642                	slli	a2,a2,0x10
58020d0e:	8ed1                	or	a3,a3,a2
58020d10:	02e50733          	mul	a4,a0,a4
58020d14:	00e6f863          	bgeu	a3,a4,58020d24 <__umoddi3+0x88>
58020d18:	96a2                	add	a3,a3,s0
58020d1a:	0086e563          	bltu	a3,s0,58020d24 <__umoddi3+0x88>
58020d1e:	00e6f363          	bgeu	a3,a4,58020d24 <__umoddi3+0x88>
58020d22:	96a2                	add	a3,a3,s0
58020d24:	8e99                	sub	a3,a3,a4
58020d26:	0276f733          	remu	a4,a3,t2
58020d2a:	07c2                	slli	a5,a5,0x10
58020d2c:	83c1                	srli	a5,a5,0x10
58020d2e:	0276d6b3          	divu	a3,a3,t2
58020d32:	02d506b3          	mul	a3,a0,a3
58020d36:	01071513          	slli	a0,a4,0x10
58020d3a:	8fc9                	or	a5,a5,a0
58020d3c:	00d7f863          	bgeu	a5,a3,58020d4c <__umoddi3+0xb0>
58020d40:	97a2                	add	a5,a5,s0
58020d42:	0087e563          	bltu	a5,s0,58020d4c <__umoddi3+0xb0>
58020d46:	00d7f363          	bgeu	a5,a3,58020d4c <__umoddi3+0xb0>
58020d4a:	97a2                	add	a5,a5,s0
58020d4c:	8f95                	sub	a5,a5,a3
58020d4e:	0057d533          	srl	a0,a5,t0
58020d52:	4581                	li	a1,0
58020d54:	4422                	lw	s0,8(sp)
58020d56:	4492                	lw	s1,4(sp)
58020d58:	0131                	addi	sp,sp,12
58020d5a:	8082                	ret
58020d5c:	010002b7          	lui	t0,0x1000
58020d60:	4341                	li	t1,16
58020d62:	f65664e3          	bltu	a2,t0,58020cca <__umoddi3+0x2e>
58020d66:	4361                	li	t1,24
58020d68:	b78d                	j	58020cca <__umoddi3+0x2e>
58020d6a:	e601                	bnez	a2,58020d72 <__umoddi3+0xd6>
58020d6c:	4705                	li	a4,1
58020d6e:	02c75433          	divu	s0,a4,a2
58020d72:	6741                	lui	a4,0x10
58020d74:	08e47163          	bgeu	s0,a4,58020df6 <__umoddi3+0x15a>
58020d78:	0ff00713          	li	a4,255
58020d7c:	00877363          	bgeu	a4,s0,58020d82 <__umoddi3+0xe6>
58020d80:	4321                	li	t1,8
58020d82:	00645733          	srl	a4,s0,t1
58020d86:	96ba                	add	a3,a3,a4
58020d88:	0006c603          	lbu	a2,0(a3)
58020d8c:	02000713          	li	a4,32
58020d90:	9332                	add	t1,t1,a2
58020d92:	406702b3          	sub	t0,a4,t1
58020d96:	06671763          	bne	a4,t1,58020e04 <__umoddi3+0x168>
58020d9a:	8d81                	sub	a1,a1,s0
58020d9c:	01045693          	srli	a3,s0,0x10
58020da0:	01041513          	slli	a0,s0,0x10
58020da4:	8141                	srli	a0,a0,0x10
58020da6:	0107d613          	srli	a2,a5,0x10
58020daa:	02d5f733          	remu	a4,a1,a3
58020dae:	02d5d5b3          	divu	a1,a1,a3
58020db2:	0742                	slli	a4,a4,0x10
58020db4:	8f51                	or	a4,a4,a2
58020db6:	02b505b3          	mul	a1,a0,a1
58020dba:	00b77863          	bgeu	a4,a1,58020dca <__umoddi3+0x12e>
58020dbe:	9722                	add	a4,a4,s0
58020dc0:	00876563          	bltu	a4,s0,58020dca <__umoddi3+0x12e>
58020dc4:	00b77363          	bgeu	a4,a1,58020dca <__umoddi3+0x12e>
58020dc8:	9722                	add	a4,a4,s0
58020dca:	40b705b3          	sub	a1,a4,a1
58020dce:	02d5f733          	remu	a4,a1,a3
58020dd2:	07c2                	slli	a5,a5,0x10
58020dd4:	83c1                	srli	a5,a5,0x10
58020dd6:	02d5d5b3          	divu	a1,a1,a3
58020dda:	0742                	slli	a4,a4,0x10
58020ddc:	8fd9                	or	a5,a5,a4
58020dde:	02b50533          	mul	a0,a0,a1
58020de2:	00a7f863          	bgeu	a5,a0,58020df2 <__umoddi3+0x156>
58020de6:	97a2                	add	a5,a5,s0
58020de8:	0087e563          	bltu	a5,s0,58020df2 <__umoddi3+0x156>
58020dec:	00a7f363          	bgeu	a5,a0,58020df2 <__umoddi3+0x156>
58020df0:	97a2                	add	a5,a5,s0
58020df2:	8f89                	sub	a5,a5,a0
58020df4:	bfa9                	j	58020d4e <__umoddi3+0xb2>
58020df6:	01000737          	lui	a4,0x1000
58020dfa:	4341                	li	t1,16
58020dfc:	f8e463e3          	bltu	s0,a4,58020d82 <__umoddi3+0xe6>
58020e00:	4361                	li	t1,24
58020e02:	b741                	j	58020d82 <__umoddi3+0xe6>
58020e04:	00541433          	sll	s0,s0,t0
58020e08:	0065d6b3          	srl	a3,a1,t1
58020e0c:	005517b3          	sll	a5,a0,t0
58020e10:	00655333          	srl	t1,a0,t1
58020e14:	01045513          	srli	a0,s0,0x10
58020e18:	02a6f733          	remu	a4,a3,a0
58020e1c:	005595b3          	sll	a1,a1,t0
58020e20:	00b36633          	or	a2,t1,a1
58020e24:	01041593          	slli	a1,s0,0x10
58020e28:	81c1                	srli	a1,a1,0x10
58020e2a:	01065313          	srli	t1,a2,0x10
58020e2e:	02a6d6b3          	divu	a3,a3,a0
58020e32:	0742                	slli	a4,a4,0x10
58020e34:	00676733          	or	a4,a4,t1
58020e38:	02d586b3          	mul	a3,a1,a3
58020e3c:	00d77863          	bgeu	a4,a3,58020e4c <__umoddi3+0x1b0>
58020e40:	9722                	add	a4,a4,s0
58020e42:	00876563          	bltu	a4,s0,58020e4c <__umoddi3+0x1b0>
58020e46:	00d77363          	bgeu	a4,a3,58020e4c <__umoddi3+0x1b0>
58020e4a:	9722                	add	a4,a4,s0
58020e4c:	40d706b3          	sub	a3,a4,a3
58020e50:	02a6f733          	remu	a4,a3,a0
58020e54:	02a6d6b3          	divu	a3,a3,a0
58020e58:	0742                	slli	a4,a4,0x10
58020e5a:	02d586b3          	mul	a3,a1,a3
58020e5e:	01061593          	slli	a1,a2,0x10
58020e62:	81c1                	srli	a1,a1,0x10
58020e64:	8dd9                	or	a1,a1,a4
58020e66:	00d5f863          	bgeu	a1,a3,58020e76 <__umoddi3+0x1da>
58020e6a:	95a2                	add	a1,a1,s0
58020e6c:	0085e563          	bltu	a1,s0,58020e76 <__umoddi3+0x1da>
58020e70:	00d5f363          	bgeu	a1,a3,58020e76 <__umoddi3+0x1da>
58020e74:	95a2                	add	a1,a1,s0
58020e76:	8d95                	sub	a1,a1,a3
58020e78:	b715                	j	58020d9c <__umoddi3+0x100>
58020e7a:	ecd5ede3          	bltu	a1,a3,58020d54 <__umoddi3+0xb8>
58020e7e:	6341                	lui	t1,0x10
58020e80:	0466f563          	bgeu	a3,t1,58020eca <__umoddi3+0x22e>
58020e84:	0ff00293          	li	t0,255
58020e88:	00d2b333          	sltu	t1,t0,a3
58020e8c:	030e                	slli	t1,t1,0x3
58020e8e:	0066d3b3          	srl	t2,a3,t1
58020e92:	00004297          	auipc	t0,0x4
58020e96:	ebe28293          	addi	t0,t0,-322 # 58024d50 <__clz_tab>
58020e9a:	929e                	add	t0,t0,t2
58020e9c:	0002c283          	lbu	t0,0(t0)
58020ea0:	929a                	add	t0,t0,t1
58020ea2:	02000313          	li	t1,32
58020ea6:	405303b3          	sub	t2,t1,t0
58020eaa:	02531763          	bne	t1,t0,58020ed8 <__umoddi3+0x23c>
58020eae:	00b6e463          	bltu	a3,a1,58020eb6 <__umoddi3+0x21a>
58020eb2:	00c56963          	bltu	a0,a2,58020ec4 <__umoddi3+0x228>
58020eb6:	40c507b3          	sub	a5,a0,a2
58020eba:	8d95                	sub	a1,a1,a3
58020ebc:	00f53533          	sltu	a0,a0,a5
58020ec0:	40a58733          	sub	a4,a1,a0
58020ec4:	853e                	mv	a0,a5
58020ec6:	85ba                	mv	a1,a4
58020ec8:	b571                	j	58020d54 <__umoddi3+0xb8>
58020eca:	010002b7          	lui	t0,0x1000
58020ece:	4341                	li	t1,16
58020ed0:	fa56efe3          	bltu	a3,t0,58020e8e <__umoddi3+0x1f2>
58020ed4:	4361                	li	t1,24
58020ed6:	bf65                	j	58020e8e <__umoddi3+0x1f2>
58020ed8:	007696b3          	sll	a3,a3,t2
58020edc:	00565333          	srl	t1,a2,t0
58020ee0:	00d36333          	or	t1,t1,a3
58020ee4:	0055d4b3          	srl	s1,a1,t0
58020ee8:	01035413          	srli	s0,t1,0x10
58020eec:	00555733          	srl	a4,a0,t0
58020ef0:	007517b3          	sll	a5,a0,t2
58020ef4:	0284d533          	divu	a0,s1,s0
58020ef8:	c03e                	sw	a5,0(sp)
58020efa:	007595b3          	sll	a1,a1,t2
58020efe:	8dd9                	or	a1,a1,a4
58020f00:	01031713          	slli	a4,t1,0x10
58020f04:	8341                	srli	a4,a4,0x10
58020f06:	00761633          	sll	a2,a2,t2
58020f0a:	0284f7b3          	remu	a5,s1,s0
58020f0e:	02a704b3          	mul	s1,a4,a0
58020f12:	01079693          	slli	a3,a5,0x10
58020f16:	0105d793          	srli	a5,a1,0x10
58020f1a:	8fd5                	or	a5,a5,a3
58020f1c:	86aa                	mv	a3,a0
58020f1e:	0097fc63          	bgeu	a5,s1,58020f36 <__umoddi3+0x29a>
58020f22:	979a                	add	a5,a5,t1
58020f24:	fff50693          	addi	a3,a0,-1
58020f28:	0067e763          	bltu	a5,t1,58020f36 <__umoddi3+0x29a>
58020f2c:	0097f563          	bgeu	a5,s1,58020f36 <__umoddi3+0x29a>
58020f30:	ffe50693          	addi	a3,a0,-2
58020f34:	979a                	add	a5,a5,t1
58020f36:	8f85                	sub	a5,a5,s1
58020f38:	0287f533          	remu	a0,a5,s0
58020f3c:	05c2                	slli	a1,a1,0x10
58020f3e:	81c1                	srli	a1,a1,0x10
58020f40:	0287d433          	divu	s0,a5,s0
58020f44:	0542                	slli	a0,a0,0x10
58020f46:	8dc9                	or	a1,a1,a0
58020f48:	02870733          	mul	a4,a4,s0
58020f4c:	87a2                	mv	a5,s0
58020f4e:	00e5fc63          	bgeu	a1,a4,58020f66 <__umoddi3+0x2ca>
58020f52:	959a                	add	a1,a1,t1
58020f54:	fff40793          	addi	a5,s0,-1
58020f58:	0065e763          	bltu	a1,t1,58020f66 <__umoddi3+0x2ca>
58020f5c:	00e5f563          	bgeu	a1,a4,58020f66 <__umoddi3+0x2ca>
58020f60:	ffe40793          	addi	a5,s0,-2
58020f64:	959a                	add	a1,a1,t1
58020f66:	06c2                	slli	a3,a3,0x10
58020f68:	6441                	lui	s0,0x10
58020f6a:	8edd                	or	a3,a3,a5
58020f6c:	40e58733          	sub	a4,a1,a4
58020f70:	fff40593          	addi	a1,s0,-1 # ffff <HeapMinSize+0xefff>
58020f74:	00b6f7b3          	and	a5,a3,a1
58020f78:	01065493          	srli	s1,a2,0x10
58020f7c:	82c1                	srli	a3,a3,0x10
58020f7e:	8df1                	and	a1,a1,a2
58020f80:	02b78533          	mul	a0,a5,a1
58020f84:	02b685b3          	mul	a1,a3,a1
58020f88:	029787b3          	mul	a5,a5,s1
58020f8c:	029686b3          	mul	a3,a3,s1
58020f90:	97ae                	add	a5,a5,a1
58020f92:	01055493          	srli	s1,a0,0x10
58020f96:	97a6                	add	a5,a5,s1
58020f98:	00b7f363          	bgeu	a5,a1,58020f9e <__umoddi3+0x302>
58020f9c:	96a2                	add	a3,a3,s0
58020f9e:	0107d593          	srli	a1,a5,0x10
58020fa2:	96ae                	add	a3,a3,a1
58020fa4:	65c1                	lui	a1,0x10
58020fa6:	15fd                	addi	a1,a1,-1
58020fa8:	8fed                	and	a5,a5,a1
58020faa:	07c2                	slli	a5,a5,0x10
58020fac:	8d6d                	and	a0,a0,a1
58020fae:	953e                	add	a0,a0,a5
58020fb0:	00d76763          	bltu	a4,a3,58020fbe <__umoddi3+0x322>
58020fb4:	00d71d63          	bne	a4,a3,58020fce <__umoddi3+0x332>
58020fb8:	4782                	lw	a5,0(sp)
58020fba:	00a7fa63          	bgeu	a5,a0,58020fce <__umoddi3+0x332>
58020fbe:	40c50633          	sub	a2,a0,a2
58020fc2:	00c53533          	sltu	a0,a0,a2
58020fc6:	932a                	add	t1,t1,a0
58020fc8:	406686b3          	sub	a3,a3,t1
58020fcc:	8532                	mv	a0,a2
58020fce:	4782                	lw	a5,0(sp)
58020fd0:	40d706b3          	sub	a3,a4,a3
58020fd4:	40a78533          	sub	a0,a5,a0
58020fd8:	00a7b5b3          	sltu	a1,a5,a0
58020fdc:	40b685b3          	sub	a1,a3,a1
58020fe0:	005597b3          	sll	a5,a1,t0
58020fe4:	00755533          	srl	a0,a0,t2
58020fe8:	8d5d                	or	a0,a0,a5
58020fea:	0075d5b3          	srl	a1,a1,t2
58020fee:	b39d                	j	58020d54 <__umoddi3+0xb8>

58020ff0 <__eqdf2>:
58020ff0:	001007b7          	lui	a5,0x100
58020ff4:	17fd                	addi	a5,a5,-1
58020ff6:	1151                	addi	sp,sp,-12
58020ff8:	00b7f2b3          	and	t0,a5,a1
58020ffc:	0145d713          	srli	a4,a1,0x14
58021000:	81fd                	srli	a1,a1,0x1f
58021002:	c422                	sw	s0,8(sp)
58021004:	c226                	sw	s1,4(sp)
58021006:	832a                	mv	t1,a0
58021008:	842a                	mv	s0,a0
5802100a:	c02e                	sw	a1,0(sp)
5802100c:	7ff77713          	andi	a4,a4,2047
58021010:	0146d593          	srli	a1,a3,0x14
58021014:	7ff00513          	li	a0,2047
58021018:	8ff5                	and	a5,a5,a3
5802101a:	84b2                	mv	s1,a2
5802101c:	7ff5f593          	andi	a1,a1,2047
58021020:	82fd                	srli	a3,a3,0x1f
58021022:	00a71a63          	bne	a4,a0,58021036 <__eqdf2+0x46>
58021026:	0062e3b3          	or	t2,t0,t1
5802102a:	4505                	li	a0,1
5802102c:	02039a63          	bnez	t2,58021060 <__eqdf2+0x70>
58021030:	02e59863          	bne	a1,a4,58021060 <__eqdf2+0x70>
58021034:	a019                	j	5802103a <__eqdf2+0x4a>
58021036:	00a59563          	bne	a1,a0,58021040 <__eqdf2+0x50>
5802103a:	8e5d                	or	a2,a2,a5
5802103c:	4505                	li	a0,1
5802103e:	e20d                	bnez	a2,58021060 <__eqdf2+0x70>
58021040:	4505                	li	a0,1
58021042:	00b71f63          	bne	a4,a1,58021060 <__eqdf2+0x70>
58021046:	00f29d63          	bne	t0,a5,58021060 <__eqdf2+0x70>
5802104a:	00941b63          	bne	s0,s1,58021060 <__eqdf2+0x70>
5802104e:	4782                	lw	a5,0(sp)
58021050:	00d78c63          	beq	a5,a3,58021068 <__eqdf2+0x78>
58021054:	00071663          	bnez	a4,58021060 <__eqdf2+0x70>
58021058:	0062e533          	or	a0,t0,t1
5802105c:	00a03533          	snez	a0,a0
58021060:	4422                	lw	s0,8(sp)
58021062:	4492                	lw	s1,4(sp)
58021064:	0131                	addi	sp,sp,12
58021066:	8082                	ret
58021068:	4501                	li	a0,0
5802106a:	bfdd                	j	58021060 <__eqdf2+0x70>

5802106c <__gedf2>:
5802106c:	00100737          	lui	a4,0x100
58021070:	1161                	addi	sp,sp,-8
58021072:	177d                	addi	a4,a4,-1
58021074:	0145d313          	srli	t1,a1,0x14
58021078:	00b772b3          	and	t0,a4,a1
5802107c:	c222                	sw	s0,4(sp)
5802107e:	c026                	sw	s1,0(sp)
58021080:	87aa                	mv	a5,a0
58021082:	83aa                	mv	t2,a0
58021084:	7ff37313          	andi	t1,t1,2047
58021088:	01f5d513          	srli	a0,a1,0x1f
5802108c:	7ff00493          	li	s1,2047
58021090:	0146d593          	srli	a1,a3,0x14
58021094:	8f75                	and	a4,a4,a3
58021096:	8432                	mv	s0,a2
58021098:	7ff5f593          	andi	a1,a1,2047
5802109c:	82fd                	srli	a3,a3,0x1f
5802109e:	00931763          	bne	t1,s1,580210ac <__gedf2+0x40>
580210a2:	00f2e4b3          	or	s1,t0,a5
580210a6:	c8a5                	beqz	s1,58021116 <__gedf2+0xaa>
580210a8:	5579                	li	a0,-2
580210aa:	a825                	j	580210e2 <__gedf2+0x76>
580210ac:	00959563          	bne	a1,s1,580210b6 <__gedf2+0x4a>
580210b0:	00c764b3          	or	s1,a4,a2
580210b4:	f8f5                	bnez	s1,580210a8 <__gedf2+0x3c>
580210b6:	06031263          	bnez	t1,5802111a <__gedf2+0xae>
580210ba:	00f2e7b3          	or	a5,t0,a5
580210be:	0017b793          	seqz	a5,a5
580210c2:	e199                	bnez	a1,580210c8 <__gedf2+0x5c>
580210c4:	8e59                	or	a2,a2,a4
580210c6:	c239                	beqz	a2,5802110c <__gedf2+0xa0>
580210c8:	00079a63          	bnez	a5,580210dc <__gedf2+0x70>
580210cc:	00d51463          	bne	a0,a3,580210d4 <__gedf2+0x68>
580210d0:	0065dd63          	bge	a1,t1,580210ea <__gedf2+0x7e>
580210d4:	02050a63          	beqz	a0,58021108 <__gedf2+0x9c>
580210d8:	557d                	li	a0,-1
580210da:	a021                	j	580210e2 <__gedf2+0x76>
580210dc:	557d                	li	a0,-1
580210de:	c291                	beqz	a3,580210e2 <__gedf2+0x76>
580210e0:	8536                	mv	a0,a3
580210e2:	4412                	lw	s0,4(sp)
580210e4:	4482                	lw	s1,0(sp)
580210e6:	0121                	addi	sp,sp,8
580210e8:	8082                	ret
580210ea:	00b35563          	bge	t1,a1,580210f4 <__gedf2+0x88>
580210ee:	fe051ae3          	bnez	a0,580210e2 <__gedf2+0x76>
580210f2:	b7dd                	j	580210d8 <__gedf2+0x6c>
580210f4:	fe5760e3          	bltu	a4,t0,580210d4 <__gedf2+0x68>
580210f8:	00e29c63          	bne	t0,a4,58021110 <__gedf2+0xa4>
580210fc:	fc746ce3          	bltu	s0,t2,580210d4 <__gedf2+0x68>
58021100:	fe83e7e3          	bltu	t2,s0,580210ee <__gedf2+0x82>
58021104:	4501                	li	a0,0
58021106:	bff1                	j	580210e2 <__gedf2+0x76>
58021108:	4505                	li	a0,1
5802110a:	bfe1                	j	580210e2 <__gedf2+0x76>
5802110c:	ffe5                	bnez	a5,58021104 <__gedf2+0x98>
5802110e:	b7d9                	j	580210d4 <__gedf2+0x68>
58021110:	fce2efe3          	bltu	t0,a4,580210ee <__gedf2+0x82>
58021114:	bfc5                	j	58021104 <__gedf2+0x98>
58021116:	f8658de3          	beq	a1,t1,580210b0 <__gedf2+0x44>
5802111a:	fa0599e3          	bnez	a1,580210cc <__gedf2+0x60>
5802111e:	4781                	li	a5,0
58021120:	b755                	j	580210c4 <__gedf2+0x58>

58021122 <__ledf2>:
58021122:	00100737          	lui	a4,0x100
58021126:	1161                	addi	sp,sp,-8
58021128:	177d                	addi	a4,a4,-1
5802112a:	0145d313          	srli	t1,a1,0x14
5802112e:	00b772b3          	and	t0,a4,a1
58021132:	c222                	sw	s0,4(sp)
58021134:	c026                	sw	s1,0(sp)
58021136:	87aa                	mv	a5,a0
58021138:	83aa                	mv	t2,a0
5802113a:	7ff37313          	andi	t1,t1,2047
5802113e:	01f5d513          	srli	a0,a1,0x1f
58021142:	7ff00493          	li	s1,2047
58021146:	0146d593          	srli	a1,a3,0x14
5802114a:	8f75                	and	a4,a4,a3
5802114c:	8432                	mv	s0,a2
5802114e:	7ff5f593          	andi	a1,a1,2047
58021152:	82fd                	srli	a3,a3,0x1f
58021154:	00931763          	bne	t1,s1,58021162 <__ledf2+0x40>
58021158:	00f2e4b3          	or	s1,t0,a5
5802115c:	c8a5                	beqz	s1,580211cc <__ledf2+0xaa>
5802115e:	4509                	li	a0,2
58021160:	a825                	j	58021198 <__ledf2+0x76>
58021162:	00959563          	bne	a1,s1,5802116c <__ledf2+0x4a>
58021166:	00c764b3          	or	s1,a4,a2
5802116a:	f8f5                	bnez	s1,5802115e <__ledf2+0x3c>
5802116c:	06031263          	bnez	t1,580211d0 <__ledf2+0xae>
58021170:	00f2e7b3          	or	a5,t0,a5
58021174:	0017b793          	seqz	a5,a5
58021178:	e199                	bnez	a1,5802117e <__ledf2+0x5c>
5802117a:	8e59                	or	a2,a2,a4
5802117c:	c239                	beqz	a2,580211c2 <__ledf2+0xa0>
5802117e:	00079a63          	bnez	a5,58021192 <__ledf2+0x70>
58021182:	00d51463          	bne	a0,a3,5802118a <__ledf2+0x68>
58021186:	0065dd63          	bge	a1,t1,580211a0 <__ledf2+0x7e>
5802118a:	02050a63          	beqz	a0,580211be <__ledf2+0x9c>
5802118e:	557d                	li	a0,-1
58021190:	a021                	j	58021198 <__ledf2+0x76>
58021192:	557d                	li	a0,-1
58021194:	c291                	beqz	a3,58021198 <__ledf2+0x76>
58021196:	8536                	mv	a0,a3
58021198:	4412                	lw	s0,4(sp)
5802119a:	4482                	lw	s1,0(sp)
5802119c:	0121                	addi	sp,sp,8
5802119e:	8082                	ret
580211a0:	00b35563          	bge	t1,a1,580211aa <__ledf2+0x88>
580211a4:	fe051ae3          	bnez	a0,58021198 <__ledf2+0x76>
580211a8:	b7dd                	j	5802118e <__ledf2+0x6c>
580211aa:	fe5760e3          	bltu	a4,t0,5802118a <__ledf2+0x68>
580211ae:	00e29c63          	bne	t0,a4,580211c6 <__ledf2+0xa4>
580211b2:	fc746ce3          	bltu	s0,t2,5802118a <__ledf2+0x68>
580211b6:	fe83e7e3          	bltu	t2,s0,580211a4 <__ledf2+0x82>
580211ba:	4501                	li	a0,0
580211bc:	bff1                	j	58021198 <__ledf2+0x76>
580211be:	4505                	li	a0,1
580211c0:	bfe1                	j	58021198 <__ledf2+0x76>
580211c2:	ffe5                	bnez	a5,580211ba <__ledf2+0x98>
580211c4:	b7d9                	j	5802118a <__ledf2+0x68>
580211c6:	fce2efe3          	bltu	t0,a4,580211a4 <__ledf2+0x82>
580211ca:	bfc5                	j	580211ba <__ledf2+0x98>
580211cc:	f8658de3          	beq	a1,t1,58021166 <__ledf2+0x44>
580211d0:	fa0599e3          	bnez	a1,58021182 <__ledf2+0x60>
580211d4:	4781                	li	a5,0
580211d6:	b755                	j	5802117a <__ledf2+0x58>

580211d8 <__muldf3>:
580211d8:	fd810113          	addi	sp,sp,-40
580211dc:	0145d293          	srli	t0,a1,0x14
580211e0:	01f5d793          	srli	a5,a1,0x1f
580211e4:	d022                	sw	s0,32(sp)
580211e6:	00c59313          	slli	t1,a1,0xc
580211ea:	d206                	sw	ra,36(sp)
580211ec:	ce26                	sw	s1,28(sp)
580211ee:	7ff2f293          	andi	t0,t0,2047
580211f2:	c43e                	sw	a5,8(sp)
580211f4:	842a                	mv	s0,a0
580211f6:	00c35313          	srli	t1,t1,0xc
580211fa:	08028863          	beqz	t0,5802128a <__muldf3+0xb2>
580211fe:	7ff00793          	li	a5,2047
58021202:	0ef28763          	beq	t0,a5,580212f0 <__muldf3+0x118>
58021206:	01d55793          	srli	a5,a0,0x1d
5802120a:	030e                	slli	t1,t1,0x3
5802120c:	0067e333          	or	t1,a5,t1
58021210:	008007b7          	lui	a5,0x800
58021214:	00f36333          	or	t1,t1,a5
58021218:	00351593          	slli	a1,a0,0x3
5802121c:	c0128293          	addi	t0,t0,-1023 # fffc01 <HeapMinSize+0xffec01>
58021220:	4481                	li	s1,0
58021222:	0146d513          	srli	a0,a3,0x14
58021226:	01f6d793          	srli	a5,a3,0x1f
5802122a:	00c69413          	slli	s0,a3,0xc
5802122e:	7ff57513          	andi	a0,a0,2047
58021232:	c63e                	sw	a5,12(sp)
58021234:	8031                	srli	s0,s0,0xc
58021236:	cd71                	beqz	a0,58021312 <__muldf3+0x13a>
58021238:	7ff00793          	li	a5,2047
5802123c:	14f50463          	beq	a0,a5,58021384 <__muldf3+0x1ac>
58021240:	01d65793          	srli	a5,a2,0x1d
58021244:	040e                	slli	s0,s0,0x3
58021246:	8c5d                	or	s0,s0,a5
58021248:	008007b7          	lui	a5,0x800
5802124c:	8c5d                	or	s0,s0,a5
5802124e:	00361713          	slli	a4,a2,0x3
58021252:	c0150513          	addi	a0,a0,-1023
58021256:	4781                	li	a5,0
58021258:	4632                	lw	a2,12(sp)
5802125a:	46a2                	lw	a3,8(sp)
5802125c:	8eb1                	xor	a3,a3,a2
5802125e:	c036                	sw	a3,0(sp)
58021260:	00a286b3          	add	a3,t0,a0
58021264:	c836                	sw	a3,16(sp)
58021266:	0685                	addi	a3,a3,1
58021268:	c236                	sw	a3,4(sp)
5802126a:	00249693          	slli	a3,s1,0x2
5802126e:	8edd                	or	a3,a3,a5
58021270:	16fd                	addi	a3,a3,-1
58021272:	4639                	li	a2,14
58021274:	12d66963          	bltu	a2,a3,580213a6 <__muldf3+0x1ce>
58021278:	00004617          	auipc	a2,0x4
5802127c:	bd860613          	addi	a2,a2,-1064 # 58024e50 <__clz_tab+0x100>
58021280:	068a                	slli	a3,a3,0x2
58021282:	96b2                	add	a3,a3,a2
58021284:	4294                	lw	a3,0(a3)
58021286:	96b2                	add	a3,a3,a2
58021288:	8682                	jr	a3
5802128a:	00a365b3          	or	a1,t1,a0
5802128e:	c9ad                	beqz	a1,58021300 <__muldf3+0x128>
58021290:	c636                	sw	a3,12(sp)
58021292:	c232                	sw	a2,4(sp)
58021294:	02030f63          	beqz	t1,580212d2 <__muldf3+0xfa>
58021298:	851a                	mv	a0,t1
5802129a:	c01a                	sw	t1,0(sp)
5802129c:	f25fe0ef          	jal	ra,580201c0 <__clzsi2>
580212a0:	4302                	lw	t1,0(sp)
580212a2:	4612                	lw	a2,4(sp)
580212a4:	46b2                	lw	a3,12(sp)
580212a6:	ff550713          	addi	a4,a0,-11
580212aa:	47f1                	li	a5,28
580212ac:	02e7cc63          	blt	a5,a4,580212e4 <__muldf3+0x10c>
580212b0:	47f5                	li	a5,29
580212b2:	ff850593          	addi	a1,a0,-8
580212b6:	8f99                	sub	a5,a5,a4
580212b8:	00b31333          	sll	t1,t1,a1
580212bc:	00f457b3          	srl	a5,s0,a5
580212c0:	0067e333          	or	t1,a5,t1
580212c4:	00b415b3          	sll	a1,s0,a1
580212c8:	c0d00293          	li	t0,-1011
580212cc:	40a282b3          	sub	t0,t0,a0
580212d0:	bf81                	j	58021220 <__muldf3+0x48>
580212d2:	c01a                	sw	t1,0(sp)
580212d4:	eedfe0ef          	jal	ra,580201c0 <__clzsi2>
580212d8:	46b2                	lw	a3,12(sp)
580212da:	4612                	lw	a2,4(sp)
580212dc:	4302                	lw	t1,0(sp)
580212de:	02050513          	addi	a0,a0,32
580212e2:	b7d1                	j	580212a6 <__muldf3+0xce>
580212e4:	fd850313          	addi	t1,a0,-40
580212e8:	00641333          	sll	t1,s0,t1
580212ec:	4581                	li	a1,0
580212ee:	bfe9                	j	580212c8 <__muldf3+0xf0>
580212f0:	00a365b3          	or	a1,t1,a0
580212f4:	c991                	beqz	a1,58021308 <__muldf3+0x130>
580212f6:	85aa                	mv	a1,a0
580212f8:	7ff00293          	li	t0,2047
580212fc:	448d                	li	s1,3
580212fe:	b715                	j	58021222 <__muldf3+0x4a>
58021300:	4301                	li	t1,0
58021302:	4281                	li	t0,0
58021304:	4485                	li	s1,1
58021306:	bf31                	j	58021222 <__muldf3+0x4a>
58021308:	4301                	li	t1,0
5802130a:	7ff00293          	li	t0,2047
5802130e:	4489                	li	s1,2
58021310:	bf09                	j	58021222 <__muldf3+0x4a>
58021312:	00c46733          	or	a4,s0,a2
58021316:	cf3d                	beqz	a4,58021394 <__muldf3+0x1bc>
58021318:	04040263          	beqz	s0,5802135c <__muldf3+0x184>
5802131c:	8522                	mv	a0,s0
5802131e:	ca32                	sw	a2,20(sp)
58021320:	c81a                	sw	t1,16(sp)
58021322:	c22e                	sw	a1,4(sp)
58021324:	c016                	sw	t0,0(sp)
58021326:	e9bfe0ef          	jal	ra,580201c0 <__clzsi2>
5802132a:	4282                	lw	t0,0(sp)
5802132c:	4592                	lw	a1,4(sp)
5802132e:	4342                	lw	t1,16(sp)
58021330:	4652                	lw	a2,20(sp)
58021332:	ff550693          	addi	a3,a0,-11
58021336:	47f1                	li	a5,28
58021338:	04d7c063          	blt	a5,a3,58021378 <__muldf3+0x1a0>
5802133c:	47f5                	li	a5,29
5802133e:	ff850713          	addi	a4,a0,-8
58021342:	8f95                	sub	a5,a5,a3
58021344:	00e41433          	sll	s0,s0,a4
58021348:	00f657b3          	srl	a5,a2,a5
5802134c:	8c5d                	or	s0,s0,a5
5802134e:	00e61733          	sll	a4,a2,a4
58021352:	c0d00793          	li	a5,-1011
58021356:	40a78533          	sub	a0,a5,a0
5802135a:	bdf5                	j	58021256 <__muldf3+0x7e>
5802135c:	8532                	mv	a0,a2
5802135e:	ca1a                	sw	t1,20(sp)
58021360:	c82e                	sw	a1,16(sp)
58021362:	c216                	sw	t0,4(sp)
58021364:	c032                	sw	a2,0(sp)
58021366:	e5bfe0ef          	jal	ra,580201c0 <__clzsi2>
5802136a:	4352                	lw	t1,20(sp)
5802136c:	45c2                	lw	a1,16(sp)
5802136e:	4292                	lw	t0,4(sp)
58021370:	4602                	lw	a2,0(sp)
58021372:	02050513          	addi	a0,a0,32
58021376:	bf75                	j	58021332 <__muldf3+0x15a>
58021378:	fd850413          	addi	s0,a0,-40
5802137c:	00861433          	sll	s0,a2,s0
58021380:	4701                	li	a4,0
58021382:	bfc1                	j	58021352 <__muldf3+0x17a>
58021384:	00c46733          	or	a4,s0,a2
58021388:	cb11                	beqz	a4,5802139c <__muldf3+0x1c4>
5802138a:	8732                	mv	a4,a2
5802138c:	7ff00513          	li	a0,2047
58021390:	478d                	li	a5,3
58021392:	b5d9                	j	58021258 <__muldf3+0x80>
58021394:	4401                	li	s0,0
58021396:	4501                	li	a0,0
58021398:	4785                	li	a5,1
5802139a:	bd7d                	j	58021258 <__muldf3+0x80>
5802139c:	4401                	li	s0,0
5802139e:	7ff00513          	li	a0,2047
580213a2:	4789                	li	a5,2
580213a4:	bd55                	j	58021258 <__muldf3+0x80>
580213a6:	0105d613          	srli	a2,a1,0x10
580213aa:	01075493          	srli	s1,a4,0x10
580213ae:	029606b3          	mul	a3,a2,s1
580213b2:	67c1                	lui	a5,0x10
580213b4:	17fd                	addi	a5,a5,-1
580213b6:	8dfd                	and	a1,a1,a5
580213b8:	8f7d                	and	a4,a4,a5
580213ba:	02e603b3          	mul	t2,a2,a4
580213be:	c436                	sw	a3,8(sp)
580213c0:	02b486b3          	mul	a3,s1,a1
580213c4:	02e58533          	mul	a0,a1,a4
580213c8:	969e                	add	a3,a3,t2
580213ca:	82b6                	mv	t0,a3
580213cc:	01055693          	srli	a3,a0,0x10
580213d0:	9696                	add	a3,a3,t0
580213d2:	0076f763          	bgeu	a3,t2,580213e0 <__muldf3+0x208>
580213d6:	029603b3          	mul	t2,a2,s1
580213da:	62c1                	lui	t0,0x10
580213dc:	929e                	add	t0,t0,t2
580213de:	c416                	sw	t0,8(sp)
580213e0:	0106d293          	srli	t0,a3,0x10
580213e4:	8efd                	and	a3,a3,a5
580213e6:	8d7d                	and	a0,a0,a5
580213e8:	06c2                	slli	a3,a3,0x10
580213ea:	96aa                	add	a3,a3,a0
580213ec:	8fe1                	and	a5,a5,s0
580213ee:	01045513          	srli	a0,s0,0x10
580213f2:	02f603b3          	mul	t2,a2,a5
580213f6:	ca36                	sw	a3,20(sp)
580213f8:	02f586b3          	mul	a3,a1,a5
580213fc:	02b505b3          	mul	a1,a0,a1
58021400:	0106d413          	srli	s0,a3,0x10
58021404:	959e                	add	a1,a1,t2
58021406:	95a2                	add	a1,a1,s0
58021408:	02a60633          	mul	a2,a2,a0
5802140c:	0075f463          	bgeu	a1,t2,58021414 <__muldf3+0x23c>
58021410:	63c1                	lui	t2,0x10
58021412:	961e                	add	a2,a2,t2
58021414:	0105d393          	srli	t2,a1,0x10
58021418:	961e                	add	a2,a2,t2
5802141a:	c632                	sw	a2,12(sp)
5802141c:	6641                	lui	a2,0x10
5802141e:	fff60393          	addi	t2,a2,-1 # ffff <HeapMinSize+0xefff>
58021422:	0075f5b3          	and	a1,a1,t2
58021426:	0076f6b3          	and	a3,a3,t2
5802142a:	05c2                	slli	a1,a1,0x10
5802142c:	95b6                	add	a1,a1,a3
5802142e:	00b286b3          	add	a3,t0,a1
58021432:	01035293          	srli	t0,t1,0x10
58021436:	00737333          	and	t1,t1,t2
5802143a:	026703b3          	mul	t2,a4,t1
5802143e:	cc36                	sw	a3,24(sp)
58021440:	02e28733          	mul	a4,t0,a4
58021444:	026486b3          	mul	a3,s1,t1
58021448:	02548433          	mul	s0,s1,t0
5802144c:	96ba                	add	a3,a3,a4
5802144e:	0103d493          	srli	s1,t2,0x10
58021452:	96a6                	add	a3,a3,s1
58021454:	00e6f363          	bgeu	a3,a4,5802145a <__muldf3+0x282>
58021458:	9432                	add	s0,s0,a2
5802145a:	0106d613          	srli	a2,a3,0x10
5802145e:	6741                	lui	a4,0x10
58021460:	9622                	add	a2,a2,s0
58021462:	fff70413          	addi	s0,a4,-1 # ffff <HeapMinSize+0xefff>
58021466:	026784b3          	mul	s1,a5,t1
5802146a:	8ee1                	and	a3,a3,s0
5802146c:	06c2                	slli	a3,a3,0x10
5802146e:	0083f3b3          	and	t2,t2,s0
58021472:	969e                	add	a3,a3,t2
58021474:	02f287b3          	mul	a5,t0,a5
58021478:	02650333          	mul	t1,a0,t1
5802147c:	025502b3          	mul	t0,a0,t0
58021480:	933e                	add	t1,t1,a5
58021482:	0104d513          	srli	a0,s1,0x10
58021486:	932a                	add	t1,t1,a0
58021488:	00f37363          	bgeu	t1,a5,5802148e <__muldf3+0x2b6>
5802148c:	92ba                	add	t0,t0,a4
5802148e:	4762                	lw	a4,24(sp)
58021490:	47a2                	lw	a5,8(sp)
58021492:	6541                	lui	a0,0x10
58021494:	157d                	addi	a0,a0,-1
58021496:	97ba                	add	a5,a5,a4
58021498:	00a37733          	and	a4,t1,a0
5802149c:	0742                	slli	a4,a4,0x10
5802149e:	8ce9                	and	s1,s1,a0
580214a0:	94ba                	add	s1,s1,a4
580214a2:	4732                	lw	a4,12(sp)
580214a4:	00b7b5b3          	sltu	a1,a5,a1
580214a8:	97b6                	add	a5,a5,a3
580214aa:	94ba                	add	s1,s1,a4
580214ac:	00b48533          	add	a0,s1,a1
580214b0:	00d7b6b3          	sltu	a3,a5,a3
580214b4:	00c50433          	add	s0,a0,a2
580214b8:	00d403b3          	add	t2,s0,a3
580214bc:	00e4b4b3          	sltu	s1,s1,a4
580214c0:	00b535b3          	sltu	a1,a0,a1
580214c4:	00d3b6b3          	sltu	a3,t2,a3
580214c8:	8dc5                	or	a1,a1,s1
580214ca:	01035313          	srli	t1,t1,0x10
580214ce:	00c43433          	sltu	s0,s0,a2
580214d2:	8c55                	or	s0,s0,a3
580214d4:	959a                	add	a1,a1,t1
580214d6:	942e                	add	s0,s0,a1
580214d8:	46d2                	lw	a3,20(sp)
580214da:	92a2                	add	t0,t0,s0
580214dc:	0173d713          	srli	a4,t2,0x17
580214e0:	00929413          	slli	s0,t0,0x9
580214e4:	8c59                	or	s0,s0,a4
580214e6:	00979713          	slli	a4,a5,0x9
580214ea:	8f55                	or	a4,a4,a3
580214ec:	83dd                	srli	a5,a5,0x17
580214ee:	00e03733          	snez	a4,a4
580214f2:	8f5d                	or	a4,a4,a5
580214f4:	010007b7          	lui	a5,0x1000
580214f8:	03a6                	slli	t2,t2,0x9
580214fa:	8fe1                	and	a5,a5,s0
580214fc:	00776733          	or	a4,a4,t2
58021500:	c7dd                	beqz	a5,580215ae <__muldf3+0x3d6>
58021502:	00175793          	srli	a5,a4,0x1
58021506:	8b05                	andi	a4,a4,1
58021508:	8f5d                	or	a4,a4,a5
5802150a:	01f41793          	slli	a5,s0,0x1f
5802150e:	8f5d                	or	a4,a4,a5
58021510:	8005                	srli	s0,s0,0x1
58021512:	4792                	lw	a5,4(sp)
58021514:	3ff78793          	addi	a5,a5,1023 # 10003ff <HeapMinSize+0xfff3ff>
58021518:	08f05e63          	blez	a5,580215b4 <__muldf3+0x3dc>
5802151c:	00777693          	andi	a3,a4,7
58021520:	ce81                	beqz	a3,58021538 <__muldf3+0x360>
58021522:	00f77693          	andi	a3,a4,15
58021526:	4611                	li	a2,4
58021528:	00c68863          	beq	a3,a2,58021538 <__muldf3+0x360>
5802152c:	00470693          	addi	a3,a4,4
58021530:	00e6b733          	sltu	a4,a3,a4
58021534:	943a                	add	s0,s0,a4
58021536:	8736                	mv	a4,a3
58021538:	010006b7          	lui	a3,0x1000
5802153c:	8ee1                	and	a3,a3,s0
5802153e:	ca81                	beqz	a3,5802154e <__muldf3+0x376>
58021540:	ff0007b7          	lui	a5,0xff000
58021544:	17fd                	addi	a5,a5,-1
58021546:	8c7d                	and	s0,s0,a5
58021548:	4792                	lw	a5,4(sp)
5802154a:	40078793          	addi	a5,a5,1024 # ff000400 <__etext_final+0xa6fda80c>
5802154e:	7fe00693          	li	a3,2046
58021552:	0ef6ce63          	blt	a3,a5,5802164e <__muldf3+0x476>
58021556:	01d41693          	slli	a3,s0,0x1d
5802155a:	830d                	srli	a4,a4,0x3
5802155c:	8f55                	or	a4,a4,a3
5802155e:	800d                	srli	s0,s0,0x3
58021560:	7ff006b7          	lui	a3,0x7ff00
58021564:	07d2                	slli	a5,a5,0x14
58021566:	0432                	slli	s0,s0,0xc
58021568:	8ff5                	and	a5,a5,a3
5802156a:	8031                	srli	s0,s0,0xc
5802156c:	8c5d                	or	s0,s0,a5
5802156e:	4782                	lw	a5,0(sp)
58021570:	5092                	lw	ra,36(sp)
58021572:	44f2                	lw	s1,28(sp)
58021574:	07fe                	slli	a5,a5,0x1f
58021576:	00f466b3          	or	a3,s0,a5
5802157a:	5402                	lw	s0,32(sp)
5802157c:	853a                	mv	a0,a4
5802157e:	85b6                	mv	a1,a3
58021580:	02810113          	addi	sp,sp,40
58021584:	8082                	ret
58021586:	47a2                	lw	a5,8(sp)
58021588:	c03e                	sw	a5,0(sp)
5802158a:	841a                	mv	s0,t1
5802158c:	872e                	mv	a4,a1
5802158e:	87a6                	mv	a5,s1
58021590:	4689                	li	a3,2
58021592:	0ad78e63          	beq	a5,a3,5802164e <__muldf3+0x476>
58021596:	468d                	li	a3,3
58021598:	0ad78463          	beq	a5,a3,58021640 <__muldf3+0x468>
5802159c:	4685                	li	a3,1
5802159e:	f6d79ae3          	bne	a5,a3,58021512 <__muldf3+0x33a>
580215a2:	4401                	li	s0,0
580215a4:	4701                	li	a4,0
580215a6:	a0b5                	j	58021612 <__muldf3+0x43a>
580215a8:	46b2                	lw	a3,12(sp)
580215aa:	c036                	sw	a3,0(sp)
580215ac:	b7d5                	j	58021590 <__muldf3+0x3b8>
580215ae:	47c2                	lw	a5,16(sp)
580215b0:	c23e                	sw	a5,4(sp)
580215b2:	b785                	j	58021512 <__muldf3+0x33a>
580215b4:	4605                	li	a2,1
580215b6:	8e1d                	sub	a2,a2,a5
580215b8:	03800693          	li	a3,56
580215bc:	fec6c3e3          	blt	a3,a2,580215a2 <__muldf3+0x3ca>
580215c0:	46fd                	li	a3,31
580215c2:	04c6ca63          	blt	a3,a2,58021616 <__muldf3+0x43e>
580215c6:	4792                	lw	a5,4(sp)
580215c8:	00c755b3          	srl	a1,a4,a2
580215cc:	41e78793          	addi	a5,a5,1054
580215d0:	00f416b3          	sll	a3,s0,a5
580215d4:	00f71733          	sll	a4,a4,a5
580215d8:	8ecd                	or	a3,a3,a1
580215da:	00e03733          	snez	a4,a4
580215de:	8f55                	or	a4,a4,a3
580215e0:	00c45433          	srl	s0,s0,a2
580215e4:	00777793          	andi	a5,a4,7
580215e8:	cf81                	beqz	a5,58021600 <__muldf3+0x428>
580215ea:	00f77793          	andi	a5,a4,15
580215ee:	4691                	li	a3,4
580215f0:	00d78863          	beq	a5,a3,58021600 <__muldf3+0x428>
580215f4:	00470793          	addi	a5,a4,4
580215f8:	00e7b733          	sltu	a4,a5,a4
580215fc:	943a                	add	s0,s0,a4
580215fe:	873e                	mv	a4,a5
58021600:	008007b7          	lui	a5,0x800
58021604:	8fe1                	and	a5,a5,s0
58021606:	eba9                	bnez	a5,58021658 <__muldf3+0x480>
58021608:	01d41793          	slli	a5,s0,0x1d
5802160c:	830d                	srli	a4,a4,0x3
5802160e:	8f5d                	or	a4,a4,a5
58021610:	800d                	srli	s0,s0,0x3
58021612:	4781                	li	a5,0
58021614:	b7b1                	j	58021560 <__muldf3+0x388>
58021616:	5685                	li	a3,-31
58021618:	40f687b3          	sub	a5,a3,a5
5802161c:	02000593          	li	a1,32
58021620:	00f457b3          	srl	a5,s0,a5
58021624:	4681                	li	a3,0
58021626:	00b60763          	beq	a2,a1,58021634 <__muldf3+0x45c>
5802162a:	4692                	lw	a3,4(sp)
5802162c:	43e68693          	addi	a3,a3,1086 # 7ff0043e <__etext_final+0x27eda84a>
58021630:	00d416b3          	sll	a3,s0,a3
58021634:	8f55                	or	a4,a4,a3
58021636:	00e03733          	snez	a4,a4
5802163a:	8f5d                	or	a4,a4,a5
5802163c:	4401                	li	s0,0
5802163e:	b75d                	j	580215e4 <__muldf3+0x40c>
58021640:	00080437          	lui	s0,0x80
58021644:	4701                	li	a4,0
58021646:	7ff00793          	li	a5,2047
5802164a:	c002                	sw	zero,0(sp)
5802164c:	bf11                	j	58021560 <__muldf3+0x388>
5802164e:	4401                	li	s0,0
58021650:	4701                	li	a4,0
58021652:	7ff00793          	li	a5,2047
58021656:	b729                	j	58021560 <__muldf3+0x388>
58021658:	4401                	li	s0,0
5802165a:	4701                	li	a4,0
5802165c:	4785                	li	a5,1
5802165e:	b709                	j	58021560 <__muldf3+0x388>

58021660 <__subdf3>:
58021660:	00100337          	lui	t1,0x100
58021664:	137d                	addi	t1,t1,-1
58021666:	1131                	addi	sp,sp,-20
58021668:	00b377b3          	and	a5,t1,a1
5802166c:	0145d713          	srli	a4,a1,0x14
58021670:	c426                	sw	s1,8(sp)
58021672:	078e                	slli	a5,a5,0x3
58021674:	7ff77493          	andi	s1,a4,2047
58021678:	01d55713          	srli	a4,a0,0x1d
5802167c:	8fd9                	or	a5,a5,a4
5802167e:	00d37733          	and	a4,t1,a3
58021682:	c622                	sw	s0,12(sp)
58021684:	0146d313          	srli	t1,a3,0x14
58021688:	01f5d413          	srli	s0,a1,0x1f
5802168c:	070e                	slli	a4,a4,0x3
5802168e:	01d65593          	srli	a1,a2,0x1d
58021692:	8f4d                	or	a4,a4,a1
58021694:	c806                	sw	ra,16(sp)
58021696:	7ff37313          	andi	t1,t1,2047
5802169a:	7ff00593          	li	a1,2047
5802169e:	050e                	slli	a0,a0,0x3
580216a0:	82fd                	srli	a3,a3,0x1f
580216a2:	060e                	slli	a2,a2,0x3
580216a4:	00b31563          	bne	t1,a1,580216ae <__subdf3+0x4e>
580216a8:	00c765b3          	or	a1,a4,a2
580216ac:	e199                	bnez	a1,580216b2 <__subdf3+0x52>
580216ae:	0016c693          	xori	a3,a3,1
580216b2:	406482b3          	sub	t0,s1,t1
580216b6:	22869563          	bne	a3,s0,580218e0 <__subdf3+0x280>
580216ba:	0e505263          	blez	t0,5802179e <__subdf3+0x13e>
580216be:	02031863          	bnez	t1,580216ee <__subdf3+0x8e>
580216c2:	00c766b3          	or	a3,a4,a2
580216c6:	58068163          	beqz	a3,58021c48 <__subdf3+0x5e8>
580216ca:	fff28593          	addi	a1,t0,-1 # ffff <HeapMinSize+0xefff>
580216ce:	e989                	bnez	a1,580216e0 <__subdf3+0x80>
580216d0:	962a                	add	a2,a2,a0
580216d2:	00a63533          	sltu	a0,a2,a0
580216d6:	97ba                	add	a5,a5,a4
580216d8:	97aa                	add	a5,a5,a0
580216da:	8532                	mv	a0,a2
580216dc:	4485                	li	s1,1
580216de:	a8b9                	j	5802173c <__subdf3+0xdc>
580216e0:	7ff00693          	li	a3,2047
580216e4:	00d29d63          	bne	t0,a3,580216fe <__subdf3+0x9e>
580216e8:	7ff00493          	li	s1,2047
580216ec:	aa79                	j	5802188a <__subdf3+0x22a>
580216ee:	7ff00693          	li	a3,2047
580216f2:	18d48c63          	beq	s1,a3,5802188a <__subdf3+0x22a>
580216f6:	008006b7          	lui	a3,0x800
580216fa:	8f55                	or	a4,a4,a3
580216fc:	8596                	mv	a1,t0
580216fe:	03800693          	li	a3,56
58021702:	08b6ca63          	blt	a3,a1,58021796 <__subdf3+0x136>
58021706:	46fd                	li	a3,31
58021708:	06b6c163          	blt	a3,a1,5802176a <__subdf3+0x10a>
5802170c:	02000313          	li	t1,32
58021710:	40b30333          	sub	t1,t1,a1
58021714:	006716b3          	sll	a3,a4,t1
58021718:	00b652b3          	srl	t0,a2,a1
5802171c:	00661633          	sll	a2,a2,t1
58021720:	0056e6b3          	or	a3,a3,t0
58021724:	00c03633          	snez	a2,a2
58021728:	8e55                	or	a2,a2,a3
5802172a:	00b75733          	srl	a4,a4,a1
5802172e:	962a                	add	a2,a2,a0
58021730:	00a63533          	sltu	a0,a2,a0
58021734:	973e                	add	a4,a4,a5
58021736:	00a707b3          	add	a5,a4,a0
5802173a:	8532                	mv	a0,a2
5802173c:	00800737          	lui	a4,0x800
58021740:	8f7d                	and	a4,a4,a5
58021742:	14070463          	beqz	a4,5802188a <__subdf3+0x22a>
58021746:	0485                	addi	s1,s1,1
58021748:	7ff00713          	li	a4,2047
5802174c:	48e48e63          	beq	s1,a4,58021be8 <__subdf3+0x588>
58021750:	ff800737          	lui	a4,0xff800
58021754:	177d                	addi	a4,a4,-1
58021756:	8ff9                	and	a5,a5,a4
58021758:	00155713          	srli	a4,a0,0x1
5802175c:	8905                	andi	a0,a0,1
5802175e:	8d59                	or	a0,a0,a4
58021760:	01f79713          	slli	a4,a5,0x1f
58021764:	8d59                	or	a0,a0,a4
58021766:	8385                	srli	a5,a5,0x1
58021768:	a20d                	j	5802188a <__subdf3+0x22a>
5802176a:	fe058693          	addi	a3,a1,-32 # ffe0 <HeapMinSize+0xefe0>
5802176e:	02000293          	li	t0,32
58021772:	00d756b3          	srl	a3,a4,a3
58021776:	4301                	li	t1,0
58021778:	00558863          	beq	a1,t0,58021788 <__subdf3+0x128>
5802177c:	04000313          	li	t1,64
58021780:	40b305b3          	sub	a1,t1,a1
58021784:	00b71333          	sll	t1,a4,a1
58021788:	00c36633          	or	a2,t1,a2
5802178c:	00c03633          	snez	a2,a2
58021790:	8e55                	or	a2,a2,a3
58021792:	4701                	li	a4,0
58021794:	bf69                	j	5802172e <__subdf3+0xce>
58021796:	8e59                	or	a2,a2,a4
58021798:	00c03633          	snez	a2,a2
5802179c:	bfdd                	j	58021792 <__subdf3+0x132>
5802179e:	0a028a63          	beqz	t0,58021852 <__subdf3+0x1f2>
580217a2:	409305b3          	sub	a1,t1,s1
580217a6:	e48d                	bnez	s1,580217d0 <__subdf3+0x170>
580217a8:	00a7e6b3          	or	a3,a5,a0
580217ac:	42068563          	beqz	a3,58021bd6 <__subdf3+0x576>
580217b0:	fff58693          	addi	a3,a1,-1
580217b4:	e699                	bnez	a3,580217c2 <__subdf3+0x162>
580217b6:	9532                	add	a0,a0,a2
580217b8:	97ba                	add	a5,a5,a4
580217ba:	00c53633          	sltu	a2,a0,a2
580217be:	97b2                	add	a5,a5,a2
580217c0:	bf31                	j	580216dc <__subdf3+0x7c>
580217c2:	7ff00293          	li	t0,2047
580217c6:	00559d63          	bne	a1,t0,580217e0 <__subdf3+0x180>
580217ca:	87ba                	mv	a5,a4
580217cc:	8532                	mv	a0,a2
580217ce:	bf29                	j	580216e8 <__subdf3+0x88>
580217d0:	7ff00693          	li	a3,2047
580217d4:	fed30be3          	beq	t1,a3,580217ca <__subdf3+0x16a>
580217d8:	008006b7          	lui	a3,0x800
580217dc:	8fd5                	or	a5,a5,a3
580217de:	86ae                	mv	a3,a1
580217e0:	03800593          	li	a1,56
580217e4:	06d5c363          	blt	a1,a3,5802184a <__subdf3+0x1ea>
580217e8:	45fd                	li	a1,31
580217ea:	02d5ca63          	blt	a1,a3,5802181e <__subdf3+0x1be>
580217ee:	02000293          	li	t0,32
580217f2:	40d282b3          	sub	t0,t0,a3
580217f6:	005795b3          	sll	a1,a5,t0
580217fa:	00d553b3          	srl	t2,a0,a3
580217fe:	00551533          	sll	a0,a0,t0
58021802:	0075e5b3          	or	a1,a1,t2
58021806:	00a03533          	snez	a0,a0
5802180a:	8d4d                	or	a0,a0,a1
5802180c:	00d7d7b3          	srl	a5,a5,a3
58021810:	9532                	add	a0,a0,a2
58021812:	97ba                	add	a5,a5,a4
58021814:	00c53633          	sltu	a2,a0,a2
58021818:	97b2                	add	a5,a5,a2
5802181a:	849a                	mv	s1,t1
5802181c:	b705                	j	5802173c <__subdf3+0xdc>
5802181e:	fe068593          	addi	a1,a3,-32 # 7fffe0 <HeapMinSize+0x7fefe0>
58021822:	02000393          	li	t2,32
58021826:	00b7d5b3          	srl	a1,a5,a1
5802182a:	4281                	li	t0,0
5802182c:	00768863          	beq	a3,t2,5802183c <__subdf3+0x1dc>
58021830:	04000293          	li	t0,64
58021834:	40d286b3          	sub	a3,t0,a3
58021838:	00d792b3          	sll	t0,a5,a3
5802183c:	00a2e533          	or	a0,t0,a0
58021840:	00a03533          	snez	a0,a0
58021844:	8d4d                	or	a0,a0,a1
58021846:	4781                	li	a5,0
58021848:	b7e1                	j	58021810 <__subdf3+0x1b0>
5802184a:	8d5d                	or	a0,a0,a5
5802184c:	00a03533          	snez	a0,a0
58021850:	bfdd                	j	58021846 <__subdf3+0x1e6>
58021852:	00148693          	addi	a3,s1,1
58021856:	7fe6f593          	andi	a1,a3,2046
5802185a:	e1bd                	bnez	a1,580218c0 <__subdf3+0x260>
5802185c:	00a7e6b3          	or	a3,a5,a0
58021860:	e4a9                	bnez	s1,580218aa <__subdf3+0x24a>
58021862:	36068e63          	beqz	a3,58021bde <__subdf3+0x57e>
58021866:	00c766b3          	or	a3,a4,a2
5802186a:	c285                	beqz	a3,5802188a <__subdf3+0x22a>
5802186c:	962a                	add	a2,a2,a0
5802186e:	97ba                	add	a5,a5,a4
58021870:	00a63533          	sltu	a0,a2,a0
58021874:	97aa                	add	a5,a5,a0
58021876:	00800737          	lui	a4,0x800
5802187a:	8f7d                	and	a4,a4,a5
5802187c:	8532                	mv	a0,a2
5802187e:	c711                	beqz	a4,5802188a <__subdf3+0x22a>
58021880:	ff800737          	lui	a4,0xff800
58021884:	177d                	addi	a4,a4,-1
58021886:	8ff9                	and	a5,a5,a4
58021888:	4485                	li	s1,1
5802188a:	00757713          	andi	a4,a0,7
5802188e:	34070f63          	beqz	a4,58021bec <__subdf3+0x58c>
58021892:	00f57713          	andi	a4,a0,15
58021896:	4691                	li	a3,4
58021898:	34d70a63          	beq	a4,a3,58021bec <__subdf3+0x58c>
5802189c:	00450713          	addi	a4,a0,4 # 10004 <HeapMinSize+0xf004>
580218a0:	00a73533          	sltu	a0,a4,a0
580218a4:	97aa                	add	a5,a5,a0
580218a6:	853a                	mv	a0,a4
580218a8:	a691                	j	58021bec <__subdf3+0x58c>
580218aa:	d285                	beqz	a3,580217ca <__subdf3+0x16a>
580218ac:	8e59                	or	a2,a2,a4
580218ae:	e2060de3          	beqz	a2,580216e8 <__subdf3+0x88>
580218b2:	4401                	li	s0,0
580218b4:	004007b7          	lui	a5,0x400
580218b8:	4501                	li	a0,0
580218ba:	7ff00493          	li	s1,2047
580218be:	a63d                	j	58021bec <__subdf3+0x58c>
580218c0:	7ff00593          	li	a1,2047
580218c4:	32b68063          	beq	a3,a1,58021be4 <__subdf3+0x584>
580218c8:	962a                	add	a2,a2,a0
580218ca:	00a63533          	sltu	a0,a2,a0
580218ce:	97ba                	add	a5,a5,a4
580218d0:	97aa                	add	a5,a5,a0
580218d2:	01f79513          	slli	a0,a5,0x1f
580218d6:	8205                	srli	a2,a2,0x1
580218d8:	8d51                	or	a0,a0,a2
580218da:	8385                	srli	a5,a5,0x1
580218dc:	84b6                	mv	s1,a3
580218de:	b775                	j	5802188a <__subdf3+0x22a>
580218e0:	0c505563          	blez	t0,580219aa <__subdf3+0x34a>
580218e4:	08031063          	bnez	t1,58021964 <__subdf3+0x304>
580218e8:	00c766b3          	or	a3,a4,a2
580218ec:	34068e63          	beqz	a3,58021c48 <__subdf3+0x5e8>
580218f0:	fff28593          	addi	a1,t0,-1
580218f4:	e991                	bnez	a1,58021908 <__subdf3+0x2a8>
580218f6:	40c50633          	sub	a2,a0,a2
580218fa:	00c53533          	sltu	a0,a0,a2
580218fe:	8f99                	sub	a5,a5,a4
58021900:	8f89                	sub	a5,a5,a0
58021902:	8532                	mv	a0,a2
58021904:	4485                	li	s1,1
58021906:	a0b1                	j	58021952 <__subdf3+0x2f2>
58021908:	7ff00693          	li	a3,2047
5802190c:	dcd28ee3          	beq	t0,a3,580216e8 <__subdf3+0x88>
58021910:	03800693          	li	a3,56
58021914:	08b6c763          	blt	a3,a1,580219a2 <__subdf3+0x342>
58021918:	46fd                	li	a3,31
5802191a:	04b6ce63          	blt	a3,a1,58021976 <__subdf3+0x316>
5802191e:	02000313          	li	t1,32
58021922:	40b30333          	sub	t1,t1,a1
58021926:	006716b3          	sll	a3,a4,t1
5802192a:	00b652b3          	srl	t0,a2,a1
5802192e:	00661633          	sll	a2,a2,t1
58021932:	0056e6b3          	or	a3,a3,t0
58021936:	00c03633          	snez	a2,a2
5802193a:	8e55                	or	a2,a2,a3
5802193c:	00b75733          	srl	a4,a4,a1
58021940:	40c50633          	sub	a2,a0,a2
58021944:	00c53533          	sltu	a0,a0,a2
58021948:	40e78733          	sub	a4,a5,a4
5802194c:	40a707b3          	sub	a5,a4,a0
58021950:	8532                	mv	a0,a2
58021952:	008005b7          	lui	a1,0x800
58021956:	00b7f733          	and	a4,a5,a1
5802195a:	db05                	beqz	a4,5802188a <__subdf3+0x22a>
5802195c:	15fd                	addi	a1,a1,-1
5802195e:	8dfd                	and	a1,a1,a5
58021960:	832a                	mv	t1,a0
58021962:	aa5d                	j	58021b18 <__subdf3+0x4b8>
58021964:	7ff00693          	li	a3,2047
58021968:	f2d481e3          	beq	s1,a3,5802188a <__subdf3+0x22a>
5802196c:	008006b7          	lui	a3,0x800
58021970:	8f55                	or	a4,a4,a3
58021972:	8596                	mv	a1,t0
58021974:	bf71                	j	58021910 <__subdf3+0x2b0>
58021976:	fe058693          	addi	a3,a1,-32 # 7fffe0 <HeapMinSize+0x7fefe0>
5802197a:	02000293          	li	t0,32
5802197e:	00d756b3          	srl	a3,a4,a3
58021982:	4301                	li	t1,0
58021984:	00558863          	beq	a1,t0,58021994 <__subdf3+0x334>
58021988:	04000313          	li	t1,64
5802198c:	40b305b3          	sub	a1,t1,a1
58021990:	00b71333          	sll	t1,a4,a1
58021994:	00c36633          	or	a2,t1,a2
58021998:	00c03633          	snez	a2,a2
5802199c:	8e55                	or	a2,a2,a3
5802199e:	4701                	li	a4,0
580219a0:	b745                	j	58021940 <__subdf3+0x2e0>
580219a2:	8e59                	or	a2,a2,a4
580219a4:	00c03633          	snez	a2,a2
580219a8:	bfdd                	j	5802199e <__subdf3+0x33e>
580219aa:	0c028463          	beqz	t0,58021a72 <__subdf3+0x412>
580219ae:	409302b3          	sub	t0,t1,s1
580219b2:	e895                	bnez	s1,580219e6 <__subdf3+0x386>
580219b4:	00a7e5b3          	or	a1,a5,a0
580219b8:	28058a63          	beqz	a1,58021c4c <__subdf3+0x5ec>
580219bc:	fff28593          	addi	a1,t0,-1
580219c0:	e991                	bnez	a1,580219d4 <__subdf3+0x374>
580219c2:	40a60533          	sub	a0,a2,a0
580219c6:	40f707b3          	sub	a5,a4,a5
580219ca:	00a63633          	sltu	a2,a2,a0
580219ce:	8f91                	sub	a5,a5,a2
580219d0:	8436                	mv	s0,a3
580219d2:	bf0d                	j	58021904 <__subdf3+0x2a4>
580219d4:	7ff00393          	li	t2,2047
580219d8:	00729f63          	bne	t0,t2,580219f6 <__subdf3+0x396>
580219dc:	87ba                	mv	a5,a4
580219de:	8532                	mv	a0,a2
580219e0:	7ff00493          	li	s1,2047
580219e4:	a07d                	j	58021a92 <__subdf3+0x432>
580219e6:	7ff00593          	li	a1,2047
580219ea:	feb309e3          	beq	t1,a1,580219dc <__subdf3+0x37c>
580219ee:	008005b7          	lui	a1,0x800
580219f2:	8fcd                	or	a5,a5,a1
580219f4:	8596                	mv	a1,t0
580219f6:	03800293          	li	t0,56
580219fa:	06b2c863          	blt	t0,a1,58021a6a <__subdf3+0x40a>
580219fe:	42fd                	li	t0,31
58021a00:	02b2ce63          	blt	t0,a1,58021a3c <__subdf3+0x3dc>
58021a04:	02000393          	li	t2,32
58021a08:	40b383b3          	sub	t2,t2,a1
58021a0c:	007792b3          	sll	t0,a5,t2
58021a10:	00b55433          	srl	s0,a0,a1
58021a14:	00751533          	sll	a0,a0,t2
58021a18:	0082e2b3          	or	t0,t0,s0
58021a1c:	00a03533          	snez	a0,a0
58021a20:	00a2e533          	or	a0,t0,a0
58021a24:	00b7d7b3          	srl	a5,a5,a1
58021a28:	40a60533          	sub	a0,a2,a0
58021a2c:	40f707b3          	sub	a5,a4,a5
58021a30:	00a63633          	sltu	a2,a2,a0
58021a34:	8f91                	sub	a5,a5,a2
58021a36:	849a                	mv	s1,t1
58021a38:	8436                	mv	s0,a3
58021a3a:	bf21                	j	58021952 <__subdf3+0x2f2>
58021a3c:	fe058293          	addi	t0,a1,-32 # 7fffe0 <HeapMinSize+0x7fefe0>
58021a40:	02000413          	li	s0,32
58021a44:	0057d2b3          	srl	t0,a5,t0
58021a48:	4381                	li	t2,0
58021a4a:	00858863          	beq	a1,s0,58021a5a <__subdf3+0x3fa>
58021a4e:	04000393          	li	t2,64
58021a52:	40b385b3          	sub	a1,t2,a1
58021a56:	00b793b3          	sll	t2,a5,a1
58021a5a:	00a3e533          	or	a0,t2,a0
58021a5e:	00a03533          	snez	a0,a0
58021a62:	00a2e533          	or	a0,t0,a0
58021a66:	4781                	li	a5,0
58021a68:	b7c1                	j	58021a28 <__subdf3+0x3c8>
58021a6a:	8d5d                	or	a0,a0,a5
58021a6c:	00a03533          	snez	a0,a0
58021a70:	bfdd                	j	58021a66 <__subdf3+0x406>
58021a72:	00148593          	addi	a1,s1,1
58021a76:	7fe5f593          	andi	a1,a1,2046
58021a7a:	e9a5                	bnez	a1,58021aea <__subdf3+0x48a>
58021a7c:	00a7e333          	or	t1,a5,a0
58021a80:	00c765b3          	or	a1,a4,a2
58021a84:	e8a1                	bnez	s1,58021ad4 <__subdf3+0x474>
58021a86:	00031863          	bnez	t1,58021a96 <__subdf3+0x436>
58021a8a:	1c058563          	beqz	a1,58021c54 <__subdf3+0x5f4>
58021a8e:	87ba                	mv	a5,a4
58021a90:	8532                	mv	a0,a2
58021a92:	8436                	mv	s0,a3
58021a94:	bbdd                	j	5802188a <__subdf3+0x22a>
58021a96:	de058ae3          	beqz	a1,5802188a <__subdf3+0x22a>
58021a9a:	40c50333          	sub	t1,a0,a2
58021a9e:	006532b3          	sltu	t0,a0,t1
58021aa2:	40e785b3          	sub	a1,a5,a4
58021aa6:	405585b3          	sub	a1,a1,t0
58021aaa:	008002b7          	lui	t0,0x800
58021aae:	0055f2b3          	and	t0,a1,t0
58021ab2:	00028a63          	beqz	t0,58021ac6 <__subdf3+0x466>
58021ab6:	40a60533          	sub	a0,a2,a0
58021aba:	40f707b3          	sub	a5,a4,a5
58021abe:	00a63633          	sltu	a2,a2,a0
58021ac2:	8f91                	sub	a5,a5,a2
58021ac4:	b7f9                	j	58021a92 <__subdf3+0x432>
58021ac6:	00b36533          	or	a0,t1,a1
58021aca:	18050963          	beqz	a0,58021c5c <__subdf3+0x5fc>
58021ace:	87ae                	mv	a5,a1
58021ad0:	851a                	mv	a0,t1
58021ad2:	bb65                	j	5802188a <__subdf3+0x22a>
58021ad4:	00031863          	bnez	t1,58021ae4 <__subdf3+0x484>
58021ad8:	18058463          	beqz	a1,58021c60 <__subdf3+0x600>
58021adc:	87ba                	mv	a5,a4
58021ade:	8532                	mv	a0,a2
58021ae0:	8436                	mv	s0,a3
58021ae2:	b119                	j	580216e8 <__subdf3+0x88>
58021ae4:	c00582e3          	beqz	a1,580216e8 <__subdf3+0x88>
58021ae8:	b3e9                	j	580218b2 <__subdf3+0x252>
58021aea:	40c50333          	sub	t1,a0,a2
58021aee:	006532b3          	sltu	t0,a0,t1
58021af2:	40e785b3          	sub	a1,a5,a4
58021af6:	405585b3          	sub	a1,a1,t0
58021afa:	008002b7          	lui	t0,0x800
58021afe:	0055f2b3          	and	t0,a1,t0
58021b02:	06028b63          	beqz	t0,58021b78 <__subdf3+0x518>
58021b06:	40a60333          	sub	t1,a2,a0
58021b0a:	40f707b3          	sub	a5,a4,a5
58021b0e:	00663633          	sltu	a2,a2,t1
58021b12:	40c785b3          	sub	a1,a5,a2
58021b16:	8436                	mv	s0,a3
58021b18:	c5b5                	beqz	a1,58021b84 <__subdf3+0x524>
58021b1a:	852e                	mv	a0,a1
58021b1c:	c21a                	sw	t1,4(sp)
58021b1e:	c02e                	sw	a1,0(sp)
58021b20:	ea0fe0ef          	jal	ra,580201c0 <__clzsi2>
58021b24:	4582                	lw	a1,0(sp)
58021b26:	4312                	lw	t1,4(sp)
58021b28:	ff850713          	addi	a4,a0,-8
58021b2c:	47fd                	li	a5,31
58021b2e:	06e7c563          	blt	a5,a4,58021b98 <__subdf3+0x538>
58021b32:	02000793          	li	a5,32
58021b36:	8f99                	sub	a5,a5,a4
58021b38:	00e595b3          	sll	a1,a1,a4
58021b3c:	00f357b3          	srl	a5,t1,a5
58021b40:	8fcd                	or	a5,a5,a1
58021b42:	00e31533          	sll	a0,t1,a4
58021b46:	08974263          	blt	a4,s1,58021bca <__subdf3+0x56a>
58021b4a:	8f05                	sub	a4,a4,s1
58021b4c:	00170613          	addi	a2,a4,1 # ff800001 <__etext_final+0xa77da40d>
58021b50:	46fd                	li	a3,31
58021b52:	04c6c963          	blt	a3,a2,58021ba4 <__subdf3+0x544>
58021b56:	02000713          	li	a4,32
58021b5a:	8f11                	sub	a4,a4,a2
58021b5c:	00e796b3          	sll	a3,a5,a4
58021b60:	00c555b3          	srl	a1,a0,a2
58021b64:	00e51533          	sll	a0,a0,a4
58021b68:	8ecd                	or	a3,a3,a1
58021b6a:	00a03533          	snez	a0,a0
58021b6e:	8d55                	or	a0,a0,a3
58021b70:	00c7d7b3          	srl	a5,a5,a2
58021b74:	4481                	li	s1,0
58021b76:	bb11                	j	5802188a <__subdf3+0x22a>
58021b78:	00b36533          	or	a0,t1,a1
58021b7c:	fd51                	bnez	a0,58021b18 <__subdf3+0x4b8>
58021b7e:	4781                	li	a5,0
58021b80:	4481                	li	s1,0
58021b82:	a8d9                	j	58021c58 <__subdf3+0x5f8>
58021b84:	851a                	mv	a0,t1
58021b86:	c22e                	sw	a1,4(sp)
58021b88:	c01a                	sw	t1,0(sp)
58021b8a:	e36fe0ef          	jal	ra,580201c0 <__clzsi2>
58021b8e:	4592                	lw	a1,4(sp)
58021b90:	4302                	lw	t1,0(sp)
58021b92:	02050513          	addi	a0,a0,32
58021b96:	bf49                	j	58021b28 <__subdf3+0x4c8>
58021b98:	fd850793          	addi	a5,a0,-40
58021b9c:	00f317b3          	sll	a5,t1,a5
58021ba0:	4501                	li	a0,0
58021ba2:	b755                	j	58021b46 <__subdf3+0x4e6>
58021ba4:	1705                	addi	a4,a4,-31
58021ba6:	02000593          	li	a1,32
58021baa:	00e7d733          	srl	a4,a5,a4
58021bae:	4681                	li	a3,0
58021bb0:	00b60763          	beq	a2,a1,58021bbe <__subdf3+0x55e>
58021bb4:	04000693          	li	a3,64
58021bb8:	8e91                	sub	a3,a3,a2
58021bba:	00d796b3          	sll	a3,a5,a3
58021bbe:	8d55                	or	a0,a0,a3
58021bc0:	00a03533          	snez	a0,a0
58021bc4:	8d59                	or	a0,a0,a4
58021bc6:	4781                	li	a5,0
58021bc8:	b775                	j	58021b74 <__subdf3+0x514>
58021bca:	8c99                	sub	s1,s1,a4
58021bcc:	ff800737          	lui	a4,0xff800
58021bd0:	177d                	addi	a4,a4,-1
58021bd2:	8ff9                	and	a5,a5,a4
58021bd4:	b95d                	j	5802188a <__subdf3+0x22a>
58021bd6:	87ba                	mv	a5,a4
58021bd8:	8532                	mv	a0,a2
58021bda:	84ae                	mv	s1,a1
58021bdc:	b17d                	j	5802188a <__subdf3+0x22a>
58021bde:	87ba                	mv	a5,a4
58021be0:	8532                	mv	a0,a2
58021be2:	b165                	j	5802188a <__subdf3+0x22a>
58021be4:	7ff00493          	li	s1,2047
58021be8:	4781                	li	a5,0
58021bea:	4501                	li	a0,0
58021bec:	00800737          	lui	a4,0x800
58021bf0:	8f7d                	and	a4,a4,a5
58021bf2:	cb11                	beqz	a4,58021c06 <__subdf3+0x5a6>
58021bf4:	0485                	addi	s1,s1,1
58021bf6:	7ff00713          	li	a4,2047
58021bfa:	06e48863          	beq	s1,a4,58021c6a <__subdf3+0x60a>
58021bfe:	ff800737          	lui	a4,0xff800
58021c02:	177d                	addi	a4,a4,-1
58021c04:	8ff9                	and	a5,a5,a4
58021c06:	01d79713          	slli	a4,a5,0x1d
58021c0a:	810d                	srli	a0,a0,0x3
58021c0c:	8d59                	or	a0,a0,a4
58021c0e:	7ff00713          	li	a4,2047
58021c12:	838d                	srli	a5,a5,0x3
58021c14:	00e49963          	bne	s1,a4,58021c26 <__subdf3+0x5c6>
58021c18:	8d5d                	or	a0,a0,a5
58021c1a:	4781                	li	a5,0
58021c1c:	c509                	beqz	a0,58021c26 <__subdf3+0x5c6>
58021c1e:	000807b7          	lui	a5,0x80
58021c22:	4501                	li	a0,0
58021c24:	4401                	li	s0,0
58021c26:	01449713          	slli	a4,s1,0x14
58021c2a:	7ff006b7          	lui	a3,0x7ff00
58021c2e:	07b2                	slli	a5,a5,0xc
58021c30:	8f75                	and	a4,a4,a3
58021c32:	83b1                	srli	a5,a5,0xc
58021c34:	047e                	slli	s0,s0,0x1f
58021c36:	8fd9                	or	a5,a5,a4
58021c38:	40c2                	lw	ra,16(sp)
58021c3a:	0087e733          	or	a4,a5,s0
58021c3e:	4432                	lw	s0,12(sp)
58021c40:	44a2                	lw	s1,8(sp)
58021c42:	85ba                	mv	a1,a4
58021c44:	0151                	addi	sp,sp,20
58021c46:	8082                	ret
58021c48:	8496                	mv	s1,t0
58021c4a:	b181                	j	5802188a <__subdf3+0x22a>
58021c4c:	87ba                	mv	a5,a4
58021c4e:	8532                	mv	a0,a2
58021c50:	8496                	mv	s1,t0
58021c52:	b581                	j	58021a92 <__subdf3+0x432>
58021c54:	4781                	li	a5,0
58021c56:	4501                	li	a0,0
58021c58:	4401                	li	s0,0
58021c5a:	bf49                	j	58021bec <__subdf3+0x58c>
58021c5c:	4781                	li	a5,0
58021c5e:	bfed                	j	58021c58 <__subdf3+0x5f8>
58021c60:	4501                	li	a0,0
58021c62:	4401                	li	s0,0
58021c64:	004007b7          	lui	a5,0x400
58021c68:	b989                	j	580218ba <__subdf3+0x25a>
58021c6a:	4781                	li	a5,0
58021c6c:	4501                	li	a0,0
58021c6e:	bf61                	j	58021c06 <__subdf3+0x5a6>

58021c70 <__fixdfdi>:
58021c70:	00100737          	lui	a4,0x100
58021c74:	0145d613          	srli	a2,a1,0x14
58021c78:	fff70793          	addi	a5,a4,-1 # fffff <HeapMinSize+0xfefff>
58021c7c:	7ff67613          	andi	a2,a2,2047
58021c80:	3fe00693          	li	a3,1022
58021c84:	8fed                	and	a5,a5,a1
58021c86:	08c6d463          	bge	a3,a2,58021d0e <__fixdfdi+0x9e>
58021c8a:	1151                	addi	sp,sp,-12
58021c8c:	c222                	sw	s0,4(sp)
58021c8e:	c406                	sw	ra,8(sp)
58021c90:	43d00693          	li	a3,1085
58021c94:	01f5d413          	srli	s0,a1,0x1f
58021c98:	02c6d263          	bge	a3,a2,58021cbc <__fixdfdi+0x4c>
58021c9c:	4505                	li	a0,1
58021c9e:	8d01                	sub	a0,a0,s0
58021ca0:	41f55713          	srai	a4,a0,0x1f
58021ca4:	800005b7          	lui	a1,0x80000
58021ca8:	00a037b3          	snez	a5,a0
58021cac:	8d99                	sub	a1,a1,a4
58021cae:	40a00533          	neg	a0,a0
58021cb2:	8d9d                	sub	a1,a1,a5
58021cb4:	40a2                	lw	ra,8(sp)
58021cb6:	4412                	lw	s0,4(sp)
58021cb8:	0131                	addi	sp,sp,12
58021cba:	8082                	ret
58021cbc:	00e7e5b3          	or	a1,a5,a4
58021cc0:	43200793          	li	a5,1074
58021cc4:	00c7de63          	bge	a5,a2,58021ce0 <__fixdfdi+0x70>
58021cc8:	bcd60613          	addi	a2,a2,-1075
58021ccc:	22f5                	jal	58021eb8 <__ashldi3>
58021cce:	d07d                	beqz	s0,58021cb4 <__fixdfdi+0x44>
58021cd0:	00a037b3          	snez	a5,a0
58021cd4:	40b005b3          	neg	a1,a1
58021cd8:	8d9d                	sub	a1,a1,a5
58021cda:	40a00533          	neg	a0,a0
58021cde:	bfd9                	j	58021cb4 <__fixdfdi+0x44>
58021ce0:	43300793          	li	a5,1075
58021ce4:	8f91                	sub	a5,a5,a2
58021ce6:	477d                	li	a4,31
58021ce8:	00f74c63          	blt	a4,a5,58021d00 <__fixdfdi+0x90>
58021cec:	bed60613          	addi	a2,a2,-1043
58021cf0:	00c59633          	sll	a2,a1,a2
58021cf4:	00f55533          	srl	a0,a0,a5
58021cf8:	8d51                	or	a0,a0,a2
58021cfa:	00f5d5b3          	srl	a1,a1,a5
58021cfe:	bfc1                	j	58021cce <__fixdfdi+0x5e>
58021d00:	41300513          	li	a0,1043
58021d04:	8d11                	sub	a0,a0,a2
58021d06:	00a5d533          	srl	a0,a1,a0
58021d0a:	4581                	li	a1,0
58021d0c:	b7c9                	j	58021cce <__fixdfdi+0x5e>
58021d0e:	4501                	li	a0,0
58021d10:	4581                	li	a1,0
58021d12:	8082                	ret

58021d14 <__floatdidf>:
58021d14:	1101                	addi	sp,sp,-32
58021d16:	ce06                	sw	ra,28(sp)
58021d18:	cc22                	sw	s0,24(sp)
58021d1a:	ca26                	sw	s1,20(sp)
58021d1c:	00b56733          	or	a4,a0,a1
58021d20:	16070163          	beqz	a4,58021e82 <__floatdidf+0x16e>
58021d24:	01f5d693          	srli	a3,a1,0x1f
58021d28:	c036                	sw	a3,0(sp)
58021d2a:	87aa                	mv	a5,a0
58021d2c:	872e                	mv	a4,a1
58021d2e:	0005d963          	bgez	a1,58021d40 <__floatdidf+0x2c>
58021d32:	00a036b3          	snez	a3,a0
58021d36:	40b00733          	neg	a4,a1
58021d3a:	8f15                	sub	a4,a4,a3
58021d3c:	40a007b3          	neg	a5,a0
58021d40:	843a                	mv	s0,a4
58021d42:	c72d                	beqz	a4,58021dac <__floatdidf+0x98>
58021d44:	853a                	mv	a0,a4
58021d46:	c43e                	sw	a5,8(sp)
58021d48:	c23a                	sw	a4,4(sp)
58021d4a:	c76fe0ef          	jal	ra,580201c0 <__clzsi2>
58021d4e:	47a2                	lw	a5,8(sp)
58021d50:	84aa                	mv	s1,a0
58021d52:	8722                	mv	a4,s0
58021d54:	43e00693          	li	a3,1086
58021d58:	8e85                	sub	a3,a3,s1
58021d5a:	43300593          	li	a1,1075
58021d5e:	06d5c763          	blt	a1,a3,58021dcc <__floatdidf+0xb8>
58021d62:	45ad                	li	a1,11
58021d64:	0295d363          	bge	a1,s1,58021d8a <__floatdidf+0x76>
58021d68:	02a00613          	li	a2,42
58021d6c:	04964a63          	blt	a2,s1,58021dc0 <__floatdidf+0xac>
58021d70:	02b00613          	li	a2,43
58021d74:	ff548513          	addi	a0,s1,-11
58021d78:	8e05                	sub	a2,a2,s1
58021d7a:	00c7d633          	srl	a2,a5,a2
58021d7e:	00a71733          	sll	a4,a4,a0
58021d82:	00e66433          	or	s0,a2,a4
58021d86:	00a797b3          	sll	a5,a5,a0
58021d8a:	4702                	lw	a4,0(sp)
58021d8c:	00c41613          	slli	a2,s0,0xc
58021d90:	06d2                	slli	a3,a3,0x14
58021d92:	8231                	srli	a2,a2,0xc
58021d94:	01f71413          	slli	s0,a4,0x1f
58021d98:	8ed1                	or	a3,a3,a2
58021d9a:	40f2                	lw	ra,28(sp)
58021d9c:	0086e733          	or	a4,a3,s0
58021da0:	4462                	lw	s0,24(sp)
58021da2:	44d2                	lw	s1,20(sp)
58021da4:	853e                	mv	a0,a5
58021da6:	85ba                	mv	a1,a4
58021da8:	6105                	addi	sp,sp,32
58021daa:	8082                	ret
58021dac:	853e                	mv	a0,a5
58021dae:	c43a                	sw	a4,8(sp)
58021db0:	c23e                	sw	a5,4(sp)
58021db2:	c0efe0ef          	jal	ra,580201c0 <__clzsi2>
58021db6:	4722                	lw	a4,8(sp)
58021db8:	4792                	lw	a5,4(sp)
58021dba:	02050493          	addi	s1,a0,32
58021dbe:	bf59                	j	58021d54 <__floatdidf+0x40>
58021dc0:	fd548713          	addi	a4,s1,-43
58021dc4:	00e79433          	sll	s0,a5,a4
58021dc8:	4781                	li	a5,0
58021dca:	b7c1                	j	58021d8a <__floatdidf+0x76>
58021dcc:	43600613          	li	a2,1078
58021dd0:	02d65b63          	bge	a2,a3,58021e06 <__floatdidf+0xf2>
58021dd4:	4621                	li	a2,8
58021dd6:	8e05                	sub	a2,a2,s1
58021dd8:	853e                	mv	a0,a5
58021dda:	85ba                	mv	a1,a4
58021ddc:	c836                	sw	a3,16(sp)
58021dde:	c63e                	sw	a5,12(sp)
58021de0:	c43a                	sw	a4,8(sp)
58021de2:	206d                	jal	58021e8c <__lshrdi3>
58021de4:	47b2                	lw	a5,12(sp)
58021de6:	4722                	lw	a4,8(sp)
58021de8:	c22a                	sw	a0,4(sp)
58021dea:	842e                	mv	s0,a1
58021dec:	853e                	mv	a0,a5
58021dee:	85ba                	mv	a1,a4
58021df0:	03848613          	addi	a2,s1,56
58021df4:	20d1                	jal	58021eb8 <__ashldi3>
58021df6:	4292                	lw	t0,4(sp)
58021df8:	8d4d                	or	a0,a0,a1
58021dfa:	46c2                	lw	a3,16(sp)
58021dfc:	00a037b3          	snez	a5,a0
58021e00:	0057e7b3          	or	a5,a5,t0
58021e04:	8722                	mv	a4,s0
58021e06:	85ba                	mv	a1,a4
58021e08:	4721                	li	a4,8
58021e0a:	02975263          	bge	a4,s1,58021e2e <__floatdidf+0x11a>
58021e0e:	02700713          	li	a4,39
58021e12:	06974263          	blt	a4,s1,58021e76 <__floatdidf+0x162>
58021e16:	ff848613          	addi	a2,s1,-8
58021e1a:	00c59733          	sll	a4,a1,a2
58021e1e:	02800593          	li	a1,40
58021e22:	8d85                	sub	a1,a1,s1
58021e24:	00b7d5b3          	srl	a1,a5,a1
58021e28:	8dd9                	or	a1,a1,a4
58021e2a:	00c797b3          	sll	a5,a5,a2
58021e2e:	ff800737          	lui	a4,0xff800
58021e32:	177d                	addi	a4,a4,-1
58021e34:	0077f613          	andi	a2,a5,7
58021e38:	8f6d                	and	a4,a4,a1
58021e3a:	ce01                	beqz	a2,58021e52 <__floatdidf+0x13e>
58021e3c:	00f7f613          	andi	a2,a5,15
58021e40:	4591                	li	a1,4
58021e42:	00b60863          	beq	a2,a1,58021e52 <__floatdidf+0x13e>
58021e46:	00478613          	addi	a2,a5,4 # 400004 <HeapMinSize+0x3ff004>
58021e4a:	00f637b3          	sltu	a5,a2,a5
58021e4e:	973e                	add	a4,a4,a5
58021e50:	87b2                	mv	a5,a2
58021e52:	00800637          	lui	a2,0x800
58021e56:	8e79                	and	a2,a2,a4
58021e58:	ca01                	beqz	a2,58021e68 <__floatdidf+0x154>
58021e5a:	ff8006b7          	lui	a3,0xff800
58021e5e:	16fd                	addi	a3,a3,-1
58021e60:	8f75                	and	a4,a4,a3
58021e62:	43f00693          	li	a3,1087
58021e66:	8e85                	sub	a3,a3,s1
58021e68:	838d                	srli	a5,a5,0x3
58021e6a:	01d71513          	slli	a0,a4,0x1d
58021e6e:	8fc9                	or	a5,a5,a0
58021e70:	00375413          	srli	s0,a4,0x3
58021e74:	bf19                	j	58021d8a <__floatdidf+0x76>
58021e76:	fd848713          	addi	a4,s1,-40
58021e7a:	00e795b3          	sll	a1,a5,a4
58021e7e:	4781                	li	a5,0
58021e80:	b77d                	j	58021e2e <__floatdidf+0x11a>
58021e82:	4401                	li	s0,0
58021e84:	4781                	li	a5,0
58021e86:	4681                	li	a3,0
58021e88:	c002                	sw	zero,0(sp)
58021e8a:	b701                	j	58021d8a <__floatdidf+0x76>

58021e8c <__lshrdi3>:
58021e8c:	00060d63          	beqz	a2,58021ea6 <__lshrdi3+0x1a>
58021e90:	02000793          	li	a5,32
58021e94:	8f91                	sub	a5,a5,a2
58021e96:	00f04963          	bgtz	a5,58021ea8 <__lshrdi3+0x1c>
58021e9a:	fe060513          	addi	a0,a2,-32 # 7fffe0 <HeapMinSize+0x7fefe0>
58021e9e:	4701                	li	a4,0
58021ea0:	00a5d533          	srl	a0,a1,a0
58021ea4:	85ba                	mv	a1,a4
58021ea6:	8082                	ret
58021ea8:	00c5d733          	srl	a4,a1,a2
58021eac:	00c55533          	srl	a0,a0,a2
58021eb0:	00f595b3          	sll	a1,a1,a5
58021eb4:	8d4d                	or	a0,a0,a1
58021eb6:	b7fd                	j	58021ea4 <__lshrdi3+0x18>

58021eb8 <__ashldi3>:
58021eb8:	00060d63          	beqz	a2,58021ed2 <__ashldi3+0x1a>
58021ebc:	02000793          	li	a5,32
58021ec0:	8f91                	sub	a5,a5,a2
58021ec2:	00f04963          	bgtz	a5,58021ed4 <__ashldi3+0x1c>
58021ec6:	fe060593          	addi	a1,a2,-32
58021eca:	4701                	li	a4,0
58021ecc:	00b515b3          	sll	a1,a0,a1
58021ed0:	853a                	mv	a0,a4
58021ed2:	8082                	ret
58021ed4:	00c51733          	sll	a4,a0,a2
58021ed8:	00c595b3          	sll	a1,a1,a2
58021edc:	00f55533          	srl	a0,a0,a5
58021ee0:	8dc9                	or	a1,a1,a0
58021ee2:	b7fd                	j	58021ed0 <__ashldi3+0x18>

58021ee4 <main>:

#define DBG_TAG "MAIN"
#include "log.h"

int main(void)
{
58021ee4:	1151                	addi	sp,sp,-12
58021ee6:	c222                	sw	s0,4(sp)
58021ee8:	c026                	sw	s1,0(sp)
58021eea:	c406                	sw	ra,8(sp)
58021eec:	580244b7          	lui	s1,0x58024
    board_init();
58021ef0:	6f0020ef          	jal	ra,580245e0 <board_init>
58021ef4:	58024437          	lui	s0,0x58024
    while (1) {
        LOG_F("hello world lp\r\n");
58021ef8:	6c048513          	addi	a0,s1,1728 # 580246c0 <__fsymtab_end>
58021efc:	07a010ef          	jal	ra,58022f76 <printf>
        LOG_E("hello world lp\r\n");
58021f00:	6dc40513          	addi	a0,s0,1756 # 580246dc <__fsymtab_end+0x1c>
58021f04:	072010ef          	jal	ra,58022f76 <printf>
        LOG_W("hello world lp\r\n");
58021f08:	580247b7          	lui	a5,0x58024
58021f0c:	6f878513          	addi	a0,a5,1784 # 580246f8 <__fsymtab_end+0x38>
58021f10:	066010ef          	jal	ra,58022f76 <printf>
        LOG_I("hello world lp\r\n");
58021f14:	580247b7          	lui	a5,0x58024
58021f18:	71478513          	addi	a0,a5,1812 # 58024714 <__fsymtab_end+0x54>
58021f1c:	05a010ef          	jal	ra,58022f76 <printf>
        LOG_D("hello world lp\r\n");
        LOG_T("hello world lp\r\n");
        bflb_mtimer_delay_ms(1000);
58021f20:	3e800513          	li	a0,1000
58021f24:	ca00a097          	auipc	ra,0xca00a
58021f28:	214080e7          	jalr	532(ra) # 2202c138 <bflb_mtimer_delay_ms>
    while (1) {
58021f2c:	b7f1                	j	58021ef8 <main+0x14>

58021f2e <strcmp>:
 * Public Functions
 ****************************************************************************/

#ifndef CONFIG_LIBC_ARCH_STRCMP
int strcmp(FAR const char *cs, FAR const char *ct)
{
58021f2e:	87aa                	mv	a5,a0
58021f30:	a011                	j	58021f34 <strcmp+0x6>
  register signed char result;
  for (; ; )
    {
      if ((result = *cs - *ct++) != 0 || !*cs++)
58021f32:	cf01                	beqz	a4,58021f4a <strcmp+0x1c>
58021f34:	0007c703          	lbu	a4,0(a5)
58021f38:	0005c503          	lbu	a0,0(a1) # 80000000 <__etext_final+0x27fda40c>
58021f3c:	0785                	addi	a5,a5,1
58021f3e:	0585                	addi	a1,a1,1
58021f40:	40a70533          	sub	a0,a4,a0
58021f44:	0562                	slli	a0,a0,0x18
58021f46:	8561                	srai	a0,a0,0x18
58021f48:	d56d                	beqz	a0,58021f32 <strcmp+0x4>
      break;
    }

  return result;
}
58021f4a:	8082                	ret

58021f4c <out_buffer>:


// internal buffer output
static inline void out_buffer(char character, void* buffer, size_t idx, size_t maxlen)
{
  if (idx < maxlen) {
58021f4c:	00d67563          	bgeu	a2,a3,58021f56 <out_buffer+0xa>
    ((char*)buffer)[idx] = character;
58021f50:	95b2                	add	a1,a1,a2
58021f52:	00a58023          	sb	a0,0(a1)
  }
}
58021f56:	8082                	ret

58021f58 <out_discard>:

// internal null output
static inline void out_discard(char character, void* buffer, size_t idx, size_t maxlen)
{
  (void)character; (void)buffer; (void)idx; (void)maxlen;
}
58021f58:	8082                	ret

58021f5a <out_rev_>:
}


// output the specified string in reverse, taking care of any zero-padding
static size_t out_rev_(out_fct_type out, char* buffer, size_t idx, size_t maxlen, const char* buf, size_t len, unsigned int width, unsigned int flags)
{
58021f5a:	fd810113          	addi	sp,sp,-40
58021f5e:	d022                	sw	s0,32(sp)
  const size_t start_idx = idx;

  // pad spaces up to given width
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
58021f60:	5432                	lw	s0,44(sp)
{
58021f62:	d206                	sw	ra,36(sp)
58021f64:	ce26                	sw	s1,28(sp)
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
58021f66:	00347313          	andi	t1,s0,3
{
58021f6a:	c02a                	sw	a0,0(sp)
58021f6c:	ca32                	sw	a2,20(sp)
58021f6e:	c43a                	sw	a4,8(sp)
58021f70:	c83e                	sw	a5,16(sp)
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
58021f72:	02031663          	bnez	t1,58021f9e <out_rev_+0x44>
    for (size_t i = len; i < width; i++) {
58021f76:	5722                	lw	a4,40(sp)
58021f78:	02e7f363          	bgeu	a5,a4,58021f9e <out_rev_+0x44>
58021f7c:	40f70433          	sub	s0,a4,a5
58021f80:	84b2                	mv	s1,a2
58021f82:	9432                	add	s0,s0,a2
      out(' ', buffer, idx++, maxlen);
58021f84:	4782                	lw	a5,0(sp)
58021f86:	8626                	mv	a2,s1
58021f88:	c636                	sw	a3,12(sp)
58021f8a:	c22e                	sw	a1,4(sp)
58021f8c:	02000513          	li	a0,32
58021f90:	9782                	jalr	a5
58021f92:	0485                	addi	s1,s1,1
    for (size_t i = len; i < width; i++) {
58021f94:	4592                	lw	a1,4(sp)
58021f96:	46b2                	lw	a3,12(sp)
58021f98:	fe8496e3          	bne	s1,s0,58021f84 <out_rev_+0x2a>
58021f9c:	a011                	j	58021fa0 <out_rev_+0x46>
58021f9e:	4452                	lw	s0,20(sp)
    }
  }

  // reverse string
  while (len) {
58021fa0:	47c2                	lw	a5,16(sp)
58021fa2:	cf85                	beqz	a5,58021fda <out_rev_+0x80>
58021fa4:	4722                	lw	a4,8(sp)
58021fa6:	cc22                	sw	s0,24(sp)
58021fa8:	00f704b3          	add	s1,a4,a5
58021fac:	008487b3          	add	a5,s1,s0
58021fb0:	c63e                	sw	a5,12(sp)
58021fb2:	8426                	mv	s0,s1
58021fb4:	84ae                	mv	s1,a1
    out(buf[--len], buffer, idx++, maxlen);
58021fb6:	47b2                	lw	a5,12(sp)
58021fb8:	fff44503          	lbu	a0,-1(s0)
58021fbc:	c236                	sw	a3,4(sp)
58021fbe:	40878633          	sub	a2,a5,s0
58021fc2:	4782                	lw	a5,0(sp)
58021fc4:	85a6                	mv	a1,s1
  while (len) {
58021fc6:	147d                	addi	s0,s0,-1
    out(buf[--len], buffer, idx++, maxlen);
58021fc8:	9782                	jalr	a5
  while (len) {
58021fca:	47a2                	lw	a5,8(sp)
58021fcc:	4692                	lw	a3,4(sp)
58021fce:	fe8794e3          	bne	a5,s0,58021fb6 <out_rev_+0x5c>
    out(buf[--len], buffer, idx++, maxlen);
58021fd2:	4462                	lw	s0,24(sp)
58021fd4:	47c2                	lw	a5,16(sp)
58021fd6:	85a6                	mv	a1,s1
58021fd8:	943e                	add	s0,s0,a5
  }

  // append pad spaces up to given width
  if (flags & FLAGS_LEFT) {
58021fda:	57b2                	lw	a5,44(sp)
58021fdc:	8b89                	andi	a5,a5,2
58021fde:	cb8d                	beqz	a5,58022010 <out_rev_+0xb6>
    while (idx - start_idx < width) {
58021fe0:	47d2                	lw	a5,20(sp)
58021fe2:	40f404b3          	sub	s1,s0,a5
58021fe6:	57a2                	lw	a5,40(sp)
58021fe8:	02f4f463          	bgeu	s1,a5,58022010 <out_rev_+0xb6>
58021fec:	87a2                	mv	a5,s0
58021fee:	8426                	mv	s0,s1
58021ff0:	84be                	mv	s1,a5
      out(' ', buffer, idx++, maxlen);
58021ff2:	4782                	lw	a5,0(sp)
58021ff4:	8626                	mv	a2,s1
58021ff6:	c436                	sw	a3,8(sp)
58021ff8:	c22e                	sw	a1,4(sp)
58021ffa:	02000513          	li	a0,32
58021ffe:	9782                	jalr	a5
    while (idx - start_idx < width) {
58022000:	57a2                	lw	a5,40(sp)
58022002:	0405                	addi	s0,s0,1
58022004:	4592                	lw	a1,4(sp)
58022006:	46a2                	lw	a3,8(sp)
      out(' ', buffer, idx++, maxlen);
58022008:	0485                	addi	s1,s1,1
    while (idx - start_idx < width) {
5802200a:	fef464e3          	bltu	s0,a5,58021ff2 <out_rev_+0x98>
5802200e:	8426                	mv	s0,s1
    }
  }

  return idx;
}
58022010:	5092                	lw	ra,36(sp)
58022012:	8522                	mv	a0,s0
58022014:	5402                	lw	s0,32(sp)
58022016:	44f2                	lw	s1,28(sp)
58022018:	02810113          	addi	sp,sp,40
5802201c:	8082                	ret

5802201e <print_integer>:
  return out_rev_(out, buffer, idx, maxlen, buf, len, width, flags);
}

// An internal itoa-like function
static size_t print_integer(out_fct_type out, char* buffer, size_t idx, size_t maxlen, printf_unsigned_value_t value, bool negative, numeric_base_t base, unsigned int precision, unsigned int width, unsigned int flags)
{
5802201e:	fa810113          	addi	sp,sp,-88
58022022:	c6a6                	sw	s1,76(sp)
58022024:	c43a                	sw	a4,8(sp)
58022026:	84be                	mv	s1,a5
  char buf[PRINTF_INTEGER_BUFFER_SIZE];
  size_t len = 0U;

  if (!value) {
58022028:	8f5d                	or	a4,a4,a5
{
5802202a:	05814783          	lbu	a5,88(sp)
5802202e:	8332                	mv	t1,a2
58022030:	ca86                	sw	ra,84(sp)
58022032:	d43e                	sw	a5,40(sp)
58022034:	c8a2                	sw	s0,80(sp)
58022036:	cc2a                	sw	a0,24(sp)
58022038:	ce2e                	sw	a1,28(sp)
5802203a:	d01a                	sw	t1,32(sp)
5802203c:	d236                	sw	a3,36(sp)
5802203e:	05c14603          	lbu	a2,92(sp)
    if ( !(flags & FLAGS_PRECISION) ) {
58022042:	57a6                	lw	a5,104(sp)
  if (!value) {
58022044:	eb49                	bnez	a4,580220d6 <print_integer+0xb8>
    if ( !(flags & FLAGS_PRECISION) ) {
58022046:	4007f793          	andi	a5,a5,1024
5802204a:	10079163          	bnez	a5,5802214c <print_integer+0x12e>
      buf[len++] = '0';
5802204e:	03000793          	li	a5,48
58022052:	02f10623          	sb	a5,44(sp)
      flags &= ~FLAGS_HASH;
58022056:	57a6                	lw	a5,104(sp)
      buf[len++] = '0';
58022058:	4405                	li	s0,1
      flags &= ~FLAGS_HASH;
5802205a:	9bbd                	andi	a5,a5,-17
5802205c:	d4be                	sw	a5,104(sp)
5802205e:	107c                	addi	a5,sp,44
58022060:	c83e                	sw	a5,16(sp)
    if (!(flags & FLAGS_LEFT)) {
58022062:	57a6                	lw	a5,104(sp)
58022064:	8b89                	andi	a5,a5,2
58022066:	e799                	bnez	a5,58022074 <print_integer+0x56>
      if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
58022068:	5796                	lw	a5,100(sp)
5802206a:	c789                	beqz	a5,58022074 <print_integer+0x56>
5802206c:	57a6                	lw	a5,104(sp)
5802206e:	8b85                	andi	a5,a5,1
58022070:	18079163          	bnez	a5,580221f2 <print_integer+0x1d4>
58022074:	87a2                	mv	a5,s0
    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
58022076:	5706                	lw	a4,96(sp)
58022078:	02e7f663          	bgeu	a5,a4,580220a4 <print_integer+0x86>
5802207c:	02000693          	li	a3,32
      buf[len++] = '0';
58022080:	03000593          	li	a1,48
    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
58022084:	02000513          	li	a0,32
58022088:	00d78e63          	beq	a5,a3,580220a4 <print_integer+0x86>
5802208c:	5686                	lw	a3,96(sp)
5802208e:	4342                	lw	t1,16(sp)
58022090:	a019                	j	58022096 <print_integer+0x78>
58022092:	00a78963          	beq	a5,a0,580220a4 <print_integer+0x86>
      buf[len++] = '0';
58022096:	0785                	addi	a5,a5,1
58022098:	00f30733          	add	a4,t1,a5
5802209c:	feb70fa3          	sb	a1,-1(a4) # ff7fffff <__etext_final+0xa77da40b>
    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
580220a0:	fef699e3          	bne	a3,a5,58022092 <print_integer+0x74>
    if (base == BASE_OCTAL && (len > unpadded_len)) {
580220a4:	46a1                	li	a3,8
580220a6:	10d60e63          	beq	a2,a3,580221c2 <print_integer+0x1a4>
  if (flags & (FLAGS_HASH | FLAGS_POINTER)) {
580220aa:	5726                	lw	a4,104(sp)
580220ac:	6685                	lui	a3,0x1
580220ae:	06c1                	addi	a3,a3,16
580220b0:	8ef9                	and	a3,a3,a4
580220b2:	caf9                	beqz	a3,58022188 <print_integer+0x16a>
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
580220b4:	40077693          	andi	a3,a4,1024
580220b8:	e6dd                	bnez	a3,58022166 <print_integer+0x148>
580220ba:	0a079063          	bnez	a5,5802215a <print_integer+0x13c>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
580220be:	47c1                	li	a5,16
580220c0:	20f60663          	beq	a2,a5,580222cc <print_integer+0x2ae>
    else if ((base == BASE_BINARY) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
580220c4:	4789                	li	a5,2
580220c6:	22f60363          	beq	a2,a5,580222ec <print_integer+0x2ce>
      buf[len++] = '0';
580220ca:	03000793          	li	a5,48
580220ce:	02f10623          	sb	a5,44(sp)
580220d2:	4785                	li	a5,1
580220d4:	a875                	j	58022190 <print_integer+0x172>
    }
  }
  else {
    do {
      const char digit = (char)(value % base);
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
580220d6:	0207f713          	andi	a4,a5,32
580220da:	c735                	beqz	a4,58022146 <print_integer+0x128>
580220dc:	04100693          	li	a3,65
580220e0:	107c                	addi	a5,sp,44
580220e2:	c83e                	sw	a5,16(sp)
580220e4:	ff668793          	addi	a5,a3,-10 # ff6 <StackSize+0xbf6>
  size_t len = 0U;
580220e8:	4401                	li	s0,0
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
580220ea:	ca3e                	sw	a5,20(sp)
580220ec:	a80d                	j	5802211e <print_integer+0x100>
580220ee:	0ff6f313          	andi	t1,a3,255
580220f2:	47c2                	lw	a5,16(sp)
      value /= base;
580220f4:	4522                	lw	a0,8(sp)
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
580220f6:	0405                	addi	s0,s0,1
580220f8:	008782b3          	add	t0,a5,s0
      value /= base;
580220fc:	85a6                	mv	a1,s1
580220fe:	4681                	li	a3,0
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
58022100:	fe628fa3          	sb	t1,-1(t0) # 7fffff <HeapMinSize+0x7fefff>
      value /= base;
58022104:	c632                	sw	a2,12(sp)
58022106:	82dfe0ef          	jal	ra,58020932 <__udivdi3>
    } while (value && (len < PRINTF_INTEGER_BUFFER_SIZE));
5802210a:	4781                	li	a5,0
5802210c:	4632                	lw	a2,12(sp)
5802210e:	0c978063          	beq	a5,s1,580221ce <print_integer+0x1b0>
58022112:	02000793          	li	a5,32
58022116:	f4f406e3          	beq	s0,a5,58022062 <print_integer+0x44>
      value /= base;
5802211a:	c42a                	sw	a0,8(sp)
5802211c:	84ae                	mv	s1,a1
      const char digit = (char)(value % base);
5802211e:	4522                	lw	a0,8(sp)
58022120:	4681                	li	a3,0
58022122:	85a6                	mv	a1,s1
58022124:	c632                	sw	a2,12(sp)
58022126:	b77fe0ef          	jal	ra,58020c9c <__umoddi3>
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
5802212a:	47d2                	lw	a5,20(sp)
      const char digit = (char)(value % base);
5802212c:	0ff57513          	andi	a0,a0,255
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
58022130:	4632                	lw	a2,12(sp)
58022132:	00f50333          	add	t1,a0,a5
58022136:	47a5                	li	a5,9
58022138:	03050693          	addi	a3,a0,48
5802213c:	faa7f9e3          	bgeu	a5,a0,580220ee <print_integer+0xd0>
58022140:	0ff37313          	andi	t1,t1,255
58022144:	b77d                	j	580220f2 <print_integer+0xd4>
58022146:	06100693          	li	a3,97
5802214a:	bf59                	j	580220e0 <print_integer+0xc2>
    else if (base == BASE_HEX) {
5802214c:	47c1                	li	a5,16
5802214e:	10f60763          	beq	a2,a5,5802225c <print_integer+0x23e>
58022152:	107c                	addi	a5,sp,44
  size_t len = 0U;
58022154:	4401                	li	s0,0
58022156:	c83e                	sw	a5,16(sp)
58022158:	b729                	j	58022062 <print_integer+0x44>
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
5802215a:	5706                	lw	a4,96(sp)
5802215c:	10f70b63          	beq	a4,a5,58022272 <print_integer+0x254>
58022160:	5716                	lw	a4,100(sp)
58022162:	10f70863          	beq	a4,a5,58022272 <print_integer+0x254>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
58022166:	4741                	li	a4,16
58022168:	12e60663          	beq	a2,a4,58022294 <print_integer+0x276>
    else if ((base == BASE_BINARY) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
5802216c:	4709                	li	a4,2
5802216e:	0ce60863          	beq	a2,a4,5802223e <print_integer+0x220>
    if (len < PRINTF_INTEGER_BUFFER_SIZE) {
58022172:	02000713          	li	a4,32
58022176:	02e78663          	beq	a5,a4,580221a2 <print_integer+0x184>
      buf[len++] = '0';
5802217a:	00f8                	addi	a4,sp,76
5802217c:	973e                	add	a4,a4,a5
5802217e:	03000693          	li	a3,48
58022182:	0785                	addi	a5,a5,1
58022184:	fed70023          	sb	a3,-32(a4)
  if (len < PRINTF_INTEGER_BUFFER_SIZE) {
58022188:	02000713          	li	a4,32
5802218c:	00e78b63          	beq	a5,a4,580221a2 <print_integer+0x184>
    if (negative) {
58022190:	5722                	lw	a4,40(sp)
58022192:	c331                	beqz	a4,580221d6 <print_integer+0x1b8>
      buf[len++] = '-';
58022194:	00f8                	addi	a4,sp,76
58022196:	973e                	add	a4,a4,a5
58022198:	02d00693          	li	a3,45
5802219c:	fed70023          	sb	a3,-32(a4)
580221a0:	0785                	addi	a5,a5,1
  return out_rev_(out, buffer, idx, maxlen, buf, len, width, flags);
580221a2:	5726                	lw	a4,104(sp)
580221a4:	5692                	lw	a3,36(sp)
580221a6:	5602                	lw	a2,32(sp)
580221a8:	c23a                	sw	a4,4(sp)
580221aa:	5716                	lw	a4,100(sp)
580221ac:	45f2                	lw	a1,28(sp)
580221ae:	4562                	lw	a0,24(sp)
580221b0:	c03a                	sw	a4,0(sp)
580221b2:	4742                	lw	a4,16(sp)
580221b4:	335d                	jal	58021f5a <out_rev_>
  }

  return print_integer_finalization(out, buffer, idx, maxlen, buf, len, negative, base, precision, width, flags);
}
580221b6:	40d6                	lw	ra,84(sp)
580221b8:	4446                	lw	s0,80(sp)
580221ba:	44b6                	lw	s1,76(sp)
580221bc:	05810113          	addi	sp,sp,88
580221c0:	8082                	ret
    if (base == BASE_OCTAL && (len > unpadded_len)) {
580221c2:	eef474e3          	bgeu	s0,a5,580220aa <print_integer+0x8c>
      flags &= ~FLAGS_HASH;
580221c6:	5726                	lw	a4,104(sp)
580221c8:	9b3d                	andi	a4,a4,-17
580221ca:	d4ba                	sw	a4,104(sp)
580221cc:	bdf9                	j	580220aa <print_integer+0x8c>
    } while (value && (len < PRINTF_INTEGER_BUFFER_SIZE));
580221ce:	47a2                	lw	a5,8(sp)
580221d0:	f4c7f1e3          	bgeu	a5,a2,58022112 <print_integer+0xf4>
580221d4:	b579                	j	58022062 <print_integer+0x44>
    else if (flags & FLAGS_PLUS) {
580221d6:	5726                	lw	a4,104(sp)
580221d8:	8b11                	andi	a4,a4,4
580221da:	eb31                	bnez	a4,5802222e <print_integer+0x210>
    else if (flags & FLAGS_SPACE) {
580221dc:	5726                	lw	a4,104(sp)
580221de:	8b21                	andi	a4,a4,8
580221e0:	d369                	beqz	a4,580221a2 <print_integer+0x184>
      buf[len++] = ' ';
580221e2:	00f8                	addi	a4,sp,76
580221e4:	973e                	add	a4,a4,a5
580221e6:	02000693          	li	a3,32
580221ea:	fed70023          	sb	a3,-32(a4)
580221ee:	0785                	addi	a5,a5,1
580221f0:	bf4d                	j	580221a2 <print_integer+0x184>
      if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
580221f2:	57a2                	lw	a5,40(sp)
580221f4:	ebbd                	bnez	a5,5802226a <print_integer+0x24c>
580221f6:	57a6                	lw	a5,104(sp)
580221f8:	8bb1                	andi	a5,a5,12
580221fa:	eba5                	bnez	a5,5802226a <print_integer+0x24c>
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
580221fc:	5796                	lw	a5,100(sp)
580221fe:	e6f47be3          	bgeu	s0,a5,58022074 <print_integer+0x56>
58022202:	46fd                	li	a3,31
58022204:	87a2                	mv	a5,s0
58022206:	0886e463          	bltu	a3,s0,5802228e <print_integer+0x270>
5802220a:	5696                	lw	a3,100(sp)
5802220c:	4342                	lw	t1,16(sp)
        buf[len++] = '0';
5802220e:	03000593          	li	a1,48
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
58022212:	02000513          	li	a0,32
58022216:	a019                	j	5802221c <print_integer+0x1fe>
58022218:	06a78b63          	beq	a5,a0,5802228e <print_integer+0x270>
        buf[len++] = '0';
5802221c:	0785                	addi	a5,a5,1
5802221e:	00f30733          	add	a4,t1,a5
58022222:	feb70fa3          	sb	a1,-1(a4)
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
58022226:	fed799e3          	bne	a5,a3,58022218 <print_integer+0x1fa>
5802222a:	5796                	lw	a5,100(sp)
5802222c:	b5a9                	j	58022076 <print_integer+0x58>
      buf[len++] = '+';  // ignore the space if the '+' exists
5802222e:	00f8                	addi	a4,sp,76
58022230:	973e                	add	a4,a4,a5
58022232:	02b00693          	li	a3,43
58022236:	fed70023          	sb	a3,-32(a4)
5802223a:	0785                	addi	a5,a5,1
5802223c:	b79d                	j	580221a2 <print_integer+0x184>
    else if ((base == BASE_BINARY) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
5802223e:	02000713          	li	a4,32
58022242:	f6e780e3          	beq	a5,a4,580221a2 <print_integer+0x184>
58022246:	86be                	mv	a3,a5
      buf[len++] = 'b';
58022248:	00fc                	addi	a5,sp,76
5802224a:	00d78733          	add	a4,a5,a3
5802224e:	00168793          	addi	a5,a3,1
58022252:	06200693          	li	a3,98
58022256:	fed70023          	sb	a3,-32(a4)
5802225a:	bf21                	j	58022172 <print_integer+0x154>
      flags &= ~FLAGS_HASH;
5802225c:	57a6                	lw	a5,104(sp)
  size_t len = 0U;
5802225e:	4401                	li	s0,0
      flags &= ~FLAGS_HASH;
58022260:	9bbd                	andi	a5,a5,-17
58022262:	d4be                	sw	a5,104(sp)
58022264:	107c                	addi	a5,sp,44
58022266:	c83e                	sw	a5,16(sp)
58022268:	bbed                	j	58022062 <print_integer+0x44>
        width--;
5802226a:	5796                	lw	a5,100(sp)
5802226c:	17fd                	addi	a5,a5,-1
5802226e:	d2be                	sw	a5,100(sp)
58022270:	b771                	j	580221fc <print_integer+0x1de>
      if (unpadded_len < len) {
58022272:	eef47ae3          	bgeu	s0,a5,58022166 <print_integer+0x148>
        len--;
58022276:	fff78693          	addi	a3,a5,-1
      if (len && (base == BASE_HEX)) {
5802227a:	e40682e3          	beqz	a3,580220be <print_integer+0xa0>
5802227e:	45c1                	li	a1,16
58022280:	06b60c63          	beq	a2,a1,580222f8 <print_integer+0x2da>
    else if ((base == BASE_BINARY) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
58022284:	4789                	li	a5,2
58022286:	fcf601e3          	beq	a2,a5,58022248 <print_integer+0x22a>
        len--;
5802228a:	87b6                	mv	a5,a3
5802228c:	b5fd                	j	5802217a <print_integer+0x15c>
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
5802228e:	02000793          	li	a5,32
58022292:	bd09                	j	580220a4 <print_integer+0x86>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
58022294:	5726                	lw	a4,104(sp)
58022296:	02077713          	andi	a4,a4,32
5802229a:	cf09                	beqz	a4,580222b4 <print_integer+0x296>
    else if ((base == BASE_HEX) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
5802229c:	02000713          	li	a4,32
580222a0:	f0e781e3          	beq	a5,a4,580221a2 <print_integer+0x184>
      buf[len++] = 'X';
580222a4:	00f8                	addi	a4,sp,76
580222a6:	973e                	add	a4,a4,a5
580222a8:	05800693          	li	a3,88
580222ac:	0785                	addi	a5,a5,1
580222ae:	fed70023          	sb	a3,-32(a4)
580222b2:	b5c1                	j	58022172 <print_integer+0x154>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
580222b4:	02000713          	li	a4,32
580222b8:	eee785e3          	beq	a5,a4,580221a2 <print_integer+0x184>
      buf[len++] = 'x';
580222bc:	4742                	lw	a4,16(sp)
580222be:	973e                	add	a4,a4,a5
580222c0:	0785                	addi	a5,a5,1
580222c2:	07800693          	li	a3,120
580222c6:	00d70023          	sb	a3,0(a4)
580222ca:	b565                	j	58022172 <print_integer+0x154>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
580222cc:	57a6                	lw	a5,104(sp)
580222ce:	0207f793          	andi	a5,a5,32
580222d2:	e799                	bnez	a5,580222e0 <print_integer+0x2c2>
      buf[len++] = 'x';
580222d4:	07800793          	li	a5,120
580222d8:	02f10623          	sb	a5,44(sp)
580222dc:	4785                	li	a5,1
580222de:	bd71                	j	5802217a <print_integer+0x15c>
      buf[len++] = 'X';
580222e0:	05800793          	li	a5,88
580222e4:	02f10623          	sb	a5,44(sp)
580222e8:	4785                	li	a5,1
580222ea:	bd41                	j	5802217a <print_integer+0x15c>
      buf[len++] = 'b';
580222ec:	06200793          	li	a5,98
580222f0:	02f10623          	sb	a5,44(sp)
580222f4:	4785                	li	a5,1
580222f6:	b551                	j	5802217a <print_integer+0x15c>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
580222f8:	5726                	lw	a4,104(sp)
580222fa:	02077613          	andi	a2,a4,32
        if (unpadded_len < len) {
580222fe:	00d47863          	bgeu	s0,a3,5802230e <print_integer+0x2f0>
          len--;
58022302:	17f9                	addi	a5,a5,-2
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
58022304:	f245                	bnez	a2,580222a4 <print_integer+0x286>
      buf[len++] = 'x';
58022306:	4742                	lw	a4,16(sp)
58022308:	973e                	add	a4,a4,a5
5802230a:	87b6                	mv	a5,a3
5802230c:	bf5d                	j	580222c2 <print_integer+0x2a4>
        len--;
5802230e:	87b6                	mv	a5,a3
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
58022310:	d655                	beqz	a2,580222bc <print_integer+0x29e>
58022312:	bf49                	j	580222a4 <print_integer+0x286>

58022314 <vsnprintf>:
  // return written chars without terminating \0
  return (int)idx;
}

int vsnprintf(char *buf, size_t size, const char *fmt, va_list args)
{
58022314:	7175                	addi	sp,sp,-144
58022316:	c326                	sw	s1,132(sp)
58022318:	c706                	sw	ra,140(sp)
5802231a:	c522                	sw	s0,136(sp)
5802231c:	cc2a                	sw	a0,24(sp)
5802231e:	ca2e                	sw	a1,20(sp)
58022320:	d036                	sw	a3,32(sp)
58022322:	84b2                	mv	s1,a2
  if (!buffer) {
58022324:	60050f63          	beqz	a0,58022942 <vsnprintf+0x62e>
58022328:	580227b7          	lui	a5,0x58022
  while (*format)
5802232c:	0004c503          	lbu	a0,0(s1)
58022330:	f4c78793          	addi	a5,a5,-180 # 58021f4c <out_buffer>
58022334:	ce3e                	sw	a5,28(sp)
58022336:	4401                	li	s0,0
58022338:	60050f63          	beqz	a0,58022956 <vsnprintf+0x642>
5802233c:	82a2                	mv	t0,s0
5802233e:	8426                	mv	s0,s1
58022340:	a829                	j	5802235a <vsnprintf+0x46>
        out(*format, buffer, idx++, maxlen);
58022342:	46d2                	lw	a3,20(sp)
58022344:	45e2                	lw	a1,24(sp)
58022346:	47f2                	lw	a5,28(sp)
58022348:	8616                	mv	a2,t0
5802234a:	00128493          	addi	s1,t0,1
5802234e:	9782                	jalr	a5
58022350:	82a6                	mv	t0,s1
  while (*format)
58022352:	00044503          	lbu	a0,0(s0)
58022356:	3c050b63          	beqz	a0,5802272c <vsnprintf+0x418>
    if (*format != '%') {
5802235a:	02500793          	li	a5,37
      format++;
5802235e:	0405                	addi	s0,s0,1
    if (*format != '%') {
58022360:	fef511e3          	bne	a0,a5,58022342 <vsnprintf+0x2e>
      switch (*format) {
58022364:	00044503          	lbu	a0,0(s0)
      format++;
58022368:	00140693          	addi	a3,s0,1
      switch (*format) {
5802236c:	02b00613          	li	a2,43
    flags = 0U;
58022370:	4701                	li	a4,0
      switch (*format) {
58022372:	02d00493          	li	s1,45
58022376:	03000093          	li	ra,48
5802237a:	02000393          	li	t2,32
5802237e:	02300593          	li	a1,35
      format++;
58022382:	87b6                	mv	a5,a3
      switch (*format) {
58022384:	02c50263          	beq	a0,a2,580223a8 <vsnprintf+0x94>
58022388:	02a66463          	bltu	a2,a0,580223b0 <vsnprintf+0x9c>
5802238c:	02750a63          	beq	a0,t2,580223c0 <vsnprintf+0xac>
58022390:	04b51063          	bne	a0,a1,580223d0 <vsnprintf+0xbc>
        case '#': flags |= FLAGS_HASH;    format++; n = 1U; break;
58022394:	01076713          	ori	a4,a4,16
      format++;
58022398:	843e                	mv	s0,a5
      switch (*format) {
5802239a:	00044503          	lbu	a0,0(s0)
      format++;
5802239e:	00140693          	addi	a3,s0,1
580223a2:	87b6                	mv	a5,a3
      switch (*format) {
580223a4:	fec512e3          	bne	a0,a2,58022388 <vsnprintf+0x74>
        case '+': flags |= FLAGS_PLUS;    format++; n = 1U; break;
580223a8:	00476713          	ori	a4,a4,4
      format++;
580223ac:	843e                	mv	s0,a5
580223ae:	b7f5                	j	5802239a <vsnprintf+0x86>
      switch (*format) {
580223b0:	00950c63          	beq	a0,s1,580223c8 <vsnprintf+0xb4>
580223b4:	381511e3          	bne	a0,ra,58022f36 <vsnprintf+0xc22>
        case '0': flags |= FLAGS_ZEROPAD; format++; n = 1U; break;
580223b8:	00176713          	ori	a4,a4,1
      format++;
580223bc:	843e                	mv	s0,a5
580223be:	bff1                	j	5802239a <vsnprintf+0x86>
        case ' ': flags |= FLAGS_SPACE;   format++; n = 1U; break;
580223c0:	00876713          	ori	a4,a4,8
      format++;
580223c4:	843e                	mv	s0,a5
580223c6:	bfd1                	j	5802239a <vsnprintf+0x86>
        case '-': flags |= FLAGS_LEFT;    format++; n = 1U; break;
580223c8:	00276713          	ori	a4,a4,2
      format++;
580223cc:	843e                	mv	s0,a5
580223ce:	b7f1                	j	5802239a <vsnprintf+0x86>
    else if (*format == '*') {
580223d0:	02a00613          	li	a2,42
580223d4:	44c50863          	beq	a0,a2,58022824 <vsnprintf+0x510>
    width = 0U;
580223d8:	4481                	li	s1,0
    precision = 0U;
580223da:	4381                	li	t2,0
    switch (*format) {
580223dc:	06c00793          	li	a5,108
580223e0:	48f50863          	beq	a0,a5,58022870 <vsnprintf+0x55c>
580223e4:	08a7ea63          	bltu	a5,a0,58022478 <vsnprintf+0x164>
580223e8:	06800793          	li	a5,104
580223ec:	4af50163          	beq	a0,a5,5802288e <vsnprintf+0x57a>
580223f0:	06a00793          	li	a5,106
580223f4:	32f51ae3          	bne	a0,a5,58022f28 <vsnprintf+0xc14>
    switch (*format) {
580223f8:	00144503          	lbu	a0,1(s0)
        flags |= (sizeof(intmax_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
580223fc:	20076713          	ori	a4,a4,512
        format++;
58022400:	00168413          	addi	s0,a3,1
    switch (*format) {
58022404:	06600793          	li	a5,102
58022408:	08f50a63          	beq	a0,a5,5802249c <vsnprintf+0x188>
5802240c:	34a7e463          	bltu	a5,a0,58022754 <vsnprintf+0x440>
58022410:	04600793          	li	a5,70
58022414:	68f50763          	beq	a0,a5,58022aa2 <vsnprintf+0x78e>
58022418:	2ea7f863          	bgeu	a5,a0,58022708 <vsnprintf+0x3f4>
5802241c:	06300793          	li	a5,99
58022420:	2cf51a63          	bne	a0,a5,580226f4 <vsnprintf+0x3e0>
            idx = print_integer(out, buffer, idx, maxlen, (printf_unsigned_value_t) va_arg(va, unsigned long), false, base, precision, width, flags);
58022424:	5682                	lw	a3,32(sp)
        if (!(flags & FLAGS_LEFT)) {
58022426:	8b09                	andi	a4,a4,2
      out(*format, buffer, idx++, maxlen);
58022428:	00128793          	addi	a5,t0,1
            idx = print_integer(out, buffer, idx, maxlen, (printf_unsigned_value_t) va_arg(va, unsigned long), false, base, precision, width, flags);
5802242c:	0691                	addi	a3,a3,4
5802242e:	d436                	sw	a3,40(sp)
        if (!(flags & FLAGS_LEFT)) {
58022430:	56070b63          	beqz	a4,580229a6 <vsnprintf+0x692>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
58022434:	d63e                	sw	a5,44(sp)
58022436:	d23e                	sw	a5,36(sp)
58022438:	5782                	lw	a5,32(sp)
5802243a:	46d2                	lw	a3,20(sp)
5802243c:	45e2                	lw	a1,24(sp)
5802243e:	0007c503          	lbu	a0,0(a5)
58022442:	47f2                	lw	a5,28(sp)
58022444:	8616                	mv	a2,t0
58022446:	d016                	sw	t0,32(sp)
58022448:	9782                	jalr	a5
          while (l++ < width) {
5802244a:	5282                	lw	t0,32(sp)
5802244c:	4705                	li	a4,1
5802244e:	5312                	lw	t1,36(sp)
58022450:	57b2                	lw	a5,44(sp)
58022452:	92a6                	add	t0,t0,s1
58022454:	289773e3          	bgeu	a4,s1,58022eda <vsnprintf+0xbc6>
58022458:	d022                	sw	s0,32(sp)
5802245a:	8496                	mv	s1,t0
5802245c:	841a                	mv	s0,t1
            out(' ', buffer, idx++, maxlen);
5802245e:	46d2                	lw	a3,20(sp)
58022460:	45e2                	lw	a1,24(sp)
58022462:	47f2                	lw	a5,28(sp)
58022464:	8622                	mv	a2,s0
58022466:	02000513          	li	a0,32
5802246a:	0405                	addi	s0,s0,1
5802246c:	9782                	jalr	a5
          while (l++ < width) {
5802246e:	fe8498e3          	bne	s1,s0,5802245e <vsnprintf+0x14a>
58022472:	5402                	lw	s0,32(sp)
58022474:	82a6                	mv	t0,s1
58022476:	abad                	j	580229f0 <vsnprintf+0x6dc>
    switch (*format) {
58022478:	07400793          	li	a5,116
5802247c:	00f50663          	beq	a0,a5,58022488 <vsnprintf+0x174>
58022480:	07a00793          	li	a5,122
58022484:	2cf51763          	bne	a0,a5,58022752 <vsnprintf+0x43e>
    switch (*format) {
58022488:	00144503          	lbu	a0,1(s0)
5802248c:	06600793          	li	a5,102
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
58022490:	10076713          	ori	a4,a4,256
        format++;
58022494:	00168413          	addi	s0,a3,1
    switch (*format) {
58022498:	f6f51ae3          	bne	a0,a5,5802240c <vsnprintf+0xf8>
        idx = print_floating_point(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags, PRINTF_PREFER_DECIMAL);
5802249c:	5782                	lw	a5,32(sp)
5802249e:	d63a                	sw	a4,44(sp)
580224a0:	da16                	sw	t0,52(sp)
580224a2:	4398                	lw	a4,0(a5)
580224a4:	43d4                	lw	a3,4(a5)
580224a6:	07a1                	addi	a5,a5,8
580224a8:	853a                	mv	a0,a4
  if (value != value)
580224aa:	863a                	mv	a2,a4
580224ac:	85b6                	mv	a1,a3
580224ae:	d81e                	sw	t2,48(sp)
        idx = print_floating_point(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags, PRINTF_PREFER_DECIMAL);
580224b0:	d23a                	sw	a4,36(sp)
580224b2:	d036                	sw	a3,32(sp)
580224b4:	d43e                	sw	a5,40(sp)
  if (value != value)
580224b6:	b3bfe0ef          	jal	ra,58020ff0 <__eqdf2>
580224ba:	5732                	lw	a4,44(sp)
580224bc:	53c2                	lw	t2,48(sp)
580224be:	52d2                	lw	t0,52(sp)
580224c0:	62051663          	bnez	a0,58022aec <vsnprintf+0x7d8>
  if (value < -DBL_MAX)
580224c4:	580257b7          	lui	a5,0x58025
580224c8:	e9078793          	addi	a5,a5,-368 # 58024e90 <__clz_tab+0x140>
580224cc:	4390                	lw	a2,0(a5)
580224ce:	43d4                	lw	a3,4(a5)
580224d0:	5092                	lw	ra,36(sp)
580224d2:	5782                	lw	a5,32(sp)
580224d4:	da16                	sw	t0,52(sp)
580224d6:	8506                	mv	a0,ra
580224d8:	85be                	mv	a1,a5
580224da:	d81e                	sw	t2,48(sp)
580224dc:	d63a                	sw	a4,44(sp)
580224de:	c45fe0ef          	jal	ra,58021122 <__ledf2>
580224e2:	5732                	lw	a4,44(sp)
580224e4:	53c2                	lw	t2,48(sp)
580224e6:	52d2                	lw	t0,52(sp)
580224e8:	6e054163          	bltz	a0,58022bca <vsnprintf+0x8b6>
  if (value > DBL_MAX)
580224ec:	580257b7          	lui	a5,0x58025
580224f0:	e9878793          	addi	a5,a5,-360 # 58024e98 <__clz_tab+0x148>
580224f4:	4390                	lw	a2,0(a5)
580224f6:	43d4                	lw	a3,4(a5)
580224f8:	5092                	lw	ra,36(sp)
580224fa:	5782                	lw	a5,32(sp)
580224fc:	da16                	sw	t0,52(sp)
580224fe:	8506                	mv	a0,ra
58022500:	85be                	mv	a1,a5
58022502:	d81e                	sw	t2,48(sp)
58022504:	d63a                	sw	a4,44(sp)
58022506:	b67fe0ef          	jal	ra,5802106c <__gedf2>
5802250a:	5732                	lw	a4,44(sp)
5802250c:	53c2                	lw	t2,48(sp)
5802250e:	52d2                	lw	t0,52(sp)
58022510:	4ea04363          	bgtz	a0,580229f6 <vsnprintf+0x6e2>
  if (!prefer_exponential && ((value > PRINTF_FLOAT_NOTATION_THRESHOLD) || (value < -PRINTF_FLOAT_NOTATION_THRESHOLD))) {
58022514:	580257b7          	lui	a5,0x58025
58022518:	ea078793          	addi	a5,a5,-352 # 58024ea0 <__clz_tab+0x150>
5802251c:	5592                	lw	a1,36(sp)
5802251e:	4390                	lw	a2,0(a5)
58022520:	43d4                	lw	a3,4(a5)
58022522:	5782                	lw	a5,32(sp)
58022524:	852e                	mv	a0,a1
58022526:	d816                	sw	t0,48(sp)
58022528:	85be                	mv	a1,a5
5802252a:	da1e                	sw	t2,52(sp)
5802252c:	d63a                	sw	a4,44(sp)
5802252e:	b3ffe0ef          	jal	ra,5802106c <__gedf2>
58022532:	5aa04663          	bgtz	a0,58022ade <vsnprintf+0x7ca>
58022536:	580257b7          	lui	a5,0x58025
5802253a:	ea878793          	addi	a5,a5,-344 # 58024ea8 <__clz_tab+0x158>
5802253e:	5592                	lw	a1,36(sp)
58022540:	4390                	lw	a2,0(a5)
58022542:	43d4                	lw	a3,4(a5)
58022544:	5782                	lw	a5,32(sp)
58022546:	852e                	mv	a0,a1
58022548:	85be                	mv	a1,a5
5802254a:	bd9fe0ef          	jal	ra,58021122 <__ledf2>
5802254e:	58054863          	bltz	a0,58022ade <vsnprintf+0x7ca>
  if (!(flags & FLAGS_PRECISION)) {
58022552:	5732                	lw	a4,44(sp)
58022554:	52c2                	lw	t0,48(sp)
58022556:	40077793          	andi	a5,a4,1024
5802255a:	68078f63          	beqz	a5,58022bf8 <vsnprintf+0x8e4>
5802255e:	53d2                	lw	t2,52(sp)
58022560:	10dc                	addi	a5,sp,100
58022562:	fe038593          	addi	a1,t2,-32 # ffe0 <HeapMinSize+0xefe0>
    precision = PRINTF_DEFAULT_FLOAT_PRECISION;
58022566:	831e                	mv	t1,t2
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
58022568:	46c5                	li	a3,17
    buf[len++] = '0'; // This respects the precision in terms of result length only
5802256a:	03000613          	li	a2,48
5802256e:	a039                	j	5802257c <vsnprintf+0x268>
58022570:	00c78023          	sb	a2,0(a5)
    precision--;
58022574:	137d                	addi	t1,t1,-1
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
58022576:	0785                	addi	a5,a5,1
58022578:	0c658de3          	beq	a1,t1,58022e52 <vsnprintf+0xb3e>
    buf[len++] = '0'; // This respects the precision in terms of result length only
5802257c:	40638533          	sub	a0,t2,t1
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
58022580:	fe66e8e3          	bltu	a3,t1,58022570 <vsnprintf+0x25c>
58022584:	d62a                	sw	a0,44(sp)
  number_.is_negative = get_sign(number);
58022586:	5682                	lw	a3,32(sp)
58022588:	01f6d793          	srli	a5,a3,0x1f
5802258c:	c2be                	sw	a5,68(sp)
  double abs_number = (number_.is_negative) ? -number : number;
5802258e:	c789                	beqz	a5,58022598 <vsnprintf+0x284>
58022590:	800007b7          	lui	a5,0x80000
58022594:	8fb5                	xor	a5,a5,a3
58022596:	d03e                	sw	a5,32(sp)
  number_.integral = (int_fast64_t)abs_number;
58022598:	5692                	lw	a3,36(sp)
5802259a:	5782                	lw	a5,32(sp)
5802259c:	ce96                	sw	t0,92(sp)
5802259e:	8536                	mv	a0,a3
580225a0:	85be                	mv	a1,a5
580225a2:	d81a                	sw	t1,48(sp)
580225a4:	ccba                	sw	a4,88(sp)
580225a6:	ecaff0ef          	jal	ra,58021c70 <__fixdfdi>
  double remainder = (abs_number - number_.integral) * powers_of_10[precision];
580225aa:	5342                	lw	t1,48(sp)
580225ac:	580247b7          	lui	a5,0x58024
580225b0:	75878793          	addi	a5,a5,1880 # 58024758 <powers_of_10>
580225b4:	00331693          	slli	a3,t1,0x3
580225b8:	97b6                	add	a5,a5,a3
580225ba:	4398                	lw	a4,0(a5)
580225bc:	43dc                	lw	a5,4(a5)
580225be:	ca9a                	sw	t1,84(sp)
580225c0:	de3a                	sw	a4,60(sp)
580225c2:	c0be                	sw	a5,64(sp)
  number_.integral = (int_fast64_t)abs_number;
580225c4:	da2a                	sw	a0,52(sp)
580225c6:	dc2e                	sw	a1,56(sp)
  double remainder = (abs_number - number_.integral) * powers_of_10[precision];
580225c8:	f4cff0ef          	jal	ra,58021d14 <__floatdidf>
580225cc:	5782                	lw	a5,32(sp)
580225ce:	86ae                	mv	a3,a1
580225d0:	5592                	lw	a1,36(sp)
580225d2:	862a                	mv	a2,a0
580225d4:	852e                	mv	a0,a1
580225d6:	85be                	mv	a1,a5
580225d8:	888ff0ef          	jal	ra,58021660 <__subdf3>
580225dc:	5672                	lw	a2,60(sp)
580225de:	4686                	lw	a3,64(sp)
580225e0:	bf9fe0ef          	jal	ra,580211d8 <__muldf3>
580225e4:	c8aa                	sw	a0,80(sp)
580225e6:	c4ae                	sw	a1,72(sp)
  number_.fractional = (int_fast64_t)remainder;
580225e8:	e88ff0ef          	jal	ra,58021c70 <__fixdfdi>
580225ec:	c6aa                	sw	a0,76(sp)
580225ee:	d82e                	sw	a1,48(sp)
  remainder -= (double) number_.fractional;
580225f0:	f24ff0ef          	jal	ra,58021d14 <__floatdidf>
580225f4:	47c6                	lw	a5,80(sp)
580225f6:	86ae                	mv	a3,a1
580225f8:	45a6                	lw	a1,72(sp)
580225fa:	862a                	mv	a2,a0
580225fc:	853e                	mv	a0,a5
580225fe:	862ff0ef          	jal	ra,58021660 <__subdf3>
  if (remainder > 0.5) {
58022602:	580257b7          	lui	a5,0x58025
58022606:	eb078793          	addi	a5,a5,-336 # 58024eb0 <__clz_tab+0x160>
5802260a:	c4be                	sw	a5,72(sp)
5802260c:	580257b7          	lui	a5,0x58025
58022610:	eb078793          	addi	a5,a5,-336 # 58024eb0 <__clz_tab+0x160>
58022614:	4390                	lw	a2,0(a5)
58022616:	43d4                	lw	a3,4(a5)
  remainder -= (double) number_.fractional;
58022618:	c8aa                	sw	a0,80(sp)
5802261a:	d0ae                	sw	a1,96(sp)
  if (remainder > 0.5) {
5802261c:	a51fe0ef          	jal	ra,5802106c <__gedf2>
58022620:	42f6                	lw	t0,92(sp)
58022622:	4766                	lw	a4,88(sp)
58022624:	43b6                	lw	t2,76(sp)
58022626:	cc96                	sw	t0,88(sp)
58022628:	4356                	lw	t1,84(sp)
5802262a:	7ca05f63          	blez	a0,58022e08 <vsnprintf+0xaf4>
    ++number_.fractional;
5802262e:	56c2                	lw	a3,48(sp)
58022630:	00138793          	addi	a5,t2,1
58022634:	0077b3b3          	sltu	t2,a5,t2
58022638:	00d38333          	add	t1,t2,a3
    if ((double) number_.fractional >= powers_of_10[precision]) {
5802263c:	859a                	mv	a1,t1
5802263e:	853e                	mv	a0,a5
58022640:	c8ba                	sw	a4,80(sp)
    ++number_.fractional;
58022642:	d81a                	sw	t1,48(sp)
    if ((double) number_.fractional >= powers_of_10[precision]) {
58022644:	c6be                	sw	a5,76(sp)
58022646:	eceff0ef          	jal	ra,58021d14 <__floatdidf>
5802264a:	862a                	mv	a2,a0
5802264c:	86ae                	mv	a3,a1
5802264e:	5572                	lw	a0,60(sp)
58022650:	4586                	lw	a1,64(sp)
58022652:	ad1fe0ef          	jal	ra,58021122 <__ledf2>
58022656:	43b6                	lw	t2,76(sp)
58022658:	4746                	lw	a4,80(sp)
5802265a:	4356                	lw	t1,84(sp)
5802265c:	42e6                	lw	t0,88(sp)
5802265e:	00a04d63          	bgtz	a0,58022678 <vsnprintf+0x364>
      ++number_.integral;
58022662:	56d2                	lw	a3,52(sp)
58022664:	5662                	lw	a2,56(sp)
      number_.fractional = 0;
58022666:	4381                	li	t2,0
      ++number_.integral;
58022668:	00168793          	addi	a5,a3,1
5802266c:	00d7b6b3          	sltu	a3,a5,a3
58022670:	96b2                	add	a3,a3,a2
58022672:	dc36                	sw	a3,56(sp)
58022674:	da3e                	sw	a5,52(sp)
      number_.fractional = 0;
58022676:	d802                	sw	zero,48(sp)
  if (precision == 0U) {
58022678:	60030863          	beqz	t1,58022c88 <vsnprintf+0x974>
5802267c:	de3a                	sw	a4,60(sp)
5802267e:	c6a6                	sw	s1,76(sp)
58022680:	c8a2                	sw	s0,80(sp)
58022682:	54b2                	lw	s1,44(sp)
58022684:	5742                	lw	a4,48(sp)
58022686:	c496                	sw	t0,72(sp)
58022688:	841a                	mv	s0,t1
5802268a:	a82d                	j	580226c4 <vsnprintf+0x3b0>
5802268c:	d23a                	sw	a4,36(sp)
5802268e:	d01e                	sw	t2,32(sp)
        buf[len++] = (char)('0' + number_.fractional % 10U);
58022690:	f11fd0ef          	jal	ra,580205a0 <__moddi3>
        if (!(number_.fractional /= 10U)) {
58022694:	5712                	lw	a4,36(sp)
58022696:	5382                	lw	t2,32(sp)
        buf[len++] = (char)('0' + number_.fractional % 10U);
58022698:	0485                	addi	s1,s1,1
        if (!(number_.fractional /= 10U)) {
5802269a:	85ba                	mv	a1,a4
        buf[len++] = (char)('0' + number_.fractional % 10U);
5802269c:	10d8                	addi	a4,sp,100
5802269e:	03050793          	addi	a5,a0,48
580226a2:	9726                	add	a4,a4,s1
580226a4:	fef70fa3          	sb	a5,-1(a4)
        if (!(number_.fractional /= 10U)) {
580226a8:	851e                	mv	a0,t2
580226aa:	4681                	li	a3,0
580226ac:	4629                	li	a2,10
580226ae:	b4ffd0ef          	jal	ra,580201fc <__divdi3>
580226b2:	00a5e6b3          	or	a3,a1,a0
580226b6:	83aa                	mv	t2,a0
580226b8:	872e                	mv	a4,a1
        --count;
580226ba:	fff40793          	addi	a5,s0,-1
        if (!(number_.fractional /= 10U)) {
580226be:	66068d63          	beqz	a3,58022d38 <vsnprintf+0xa24>
        --count;
580226c2:	843e                	mv	s0,a5
      while (len < PRINTF_FTOA_BUFFER_SIZE) {
580226c4:	02000793          	li	a5,32
        buf[len++] = (char)('0' + number_.fractional % 10U);
580226c8:	4629                	li	a2,10
580226ca:	4681                	li	a3,0
580226cc:	851e                	mv	a0,t2
580226ce:	85ba                	mv	a1,a4
      while (len < PRINTF_FTOA_BUFFER_SIZE) {
580226d0:	faf49ee3          	bne	s1,a5,5802268c <vsnprintf+0x378>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
580226d4:	5772                	lw	a4,60(sp)
580226d6:	d626                	sw	s1,44(sp)
580226d8:	4685                	li	a3,1
580226da:	00377793          	andi	a5,a4,3
580226de:	42a6                	lw	t0,72(sp)
580226e0:	44b6                	lw	s1,76(sp)
580226e2:	4446                	lw	s0,80(sp)
580226e4:	02d789e3          	beq	a5,a3,58022f16 <vsnprintf+0xc02>
  return out_rev_(out, buffer, idx, maxlen, buf, len, width, flags);
580226e8:	c23a                	sw	a4,4(sp)
580226ea:	57b2                	lw	a5,44(sp)
580226ec:	8616                	mv	a2,t0
580226ee:	c026                	sw	s1,0(sp)
580226f0:	10d8                	addi	a4,sp,100
580226f2:	a129                	j	58022afc <vsnprintf+0x7e8>
    switch (*format) {
580226f4:	0ca7f363          	bgeu	a5,a0,580227ba <vsnprintf+0x4a6>
580226f8:	06400793          	li	a5,100
580226fc:	12f51163          	bne	a0,a5,5802281e <vsnprintf+0x50a>
          flags &= ~FLAGS_HASH;   // no hash for dec format
58022700:	fef77593          	andi	a1,a4,-17
          base = BASE_DECIMAL;
58022704:	46a9                	li	a3,10
58022706:	a0e1                	j	580227ce <vsnprintf+0x4ba>
    switch (*format) {
58022708:	02500793          	li	a5,37
5802270c:	c2f51be3          	bne	a0,a5,58022342 <vsnprintf+0x2e>
        out('%', buffer, idx++, maxlen);
58022710:	46d2                	lw	a3,20(sp)
58022712:	45e2                	lw	a1,24(sp)
58022714:	47f2                	lw	a5,28(sp)
58022716:	8616                	mv	a2,t0
58022718:	02500513          	li	a0,37
5802271c:	00128493          	addi	s1,t0,1
58022720:	9782                	jalr	a5
  while (*format)
58022722:	00044503          	lbu	a0,0(s0)
        out('%', buffer, idx++, maxlen);
58022726:	82a6                	mv	t0,s1
  while (*format)
58022728:	c20519e3          	bnez	a0,5802235a <vsnprintf+0x46>
  return (int)idx;
5802272c:	8416                	mv	s0,t0
5802272e:	8496                	mv	s1,t0
  out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);
58022730:	47d2                	lw	a5,20(sp)
58022732:	00f46463          	bltu	s0,a5,5802273a <vsnprintf+0x426>
58022736:	fff78413          	addi	s0,a5,-1
5802273a:	46d2                	lw	a3,20(sp)
5802273c:	45e2                	lw	a1,24(sp)
5802273e:	47f2                	lw	a5,28(sp)
58022740:	8622                	mv	a2,s0
58022742:	4501                	li	a0,0
58022744:	9782                	jalr	a5
  return __vsnprintf(out_buffer, buf, size, fmt, args);
58022746:	40ba                	lw	ra,140(sp)
58022748:	442a                	lw	s0,136(sp)
5802274a:	8526                	mv	a0,s1
5802274c:	449a                	lw	s1,132(sp)
5802274e:	6149                	addi	sp,sp,144
58022750:	8082                	ret
    switch (*format) {
58022752:	8436                	mv	s0,a3
    switch (*format) {
58022754:	f9750693          	addi	a3,a0,-105
58022758:	0ff6f793          	andi	a5,a3,255
5802275c:	46bd                	li	a3,15
5802275e:	bef6e2e3          	bltu	a3,a5,58022342 <vsnprintf+0x2e>
58022762:	4685                	li	a3,1
58022764:	00f696b3          	sll	a3,a3,a5
58022768:	67a5                	lui	a5,0x9
5802276a:	04178793          	addi	a5,a5,65 # 9041 <HeapMinSize+0x8041>
5802276e:	8ff5                	and	a5,a5,a3
58022770:	2a079163          	bnez	a5,58022a12 <vsnprintf+0x6fe>
58022774:	4006f613          	andi	a2,a3,1024
58022778:	12061463          	bnez	a2,580228a0 <vsnprintf+0x58c>
5802277c:	0806f693          	andi	a3,a3,128
58022780:	bc0681e3          	beqz	a3,58022342 <vsnprintf+0x2e>
        uintptr_t value = (uintptr_t)va_arg(va, void*);
58022784:	5602                	lw	a2,32(sp)
        flags |= FLAGS_ZEROPAD | FLAGS_POINTER;
58022786:	6785                	lui	a5,0x1
58022788:	0785                	addi	a5,a5,1
        uintptr_t value = (uintptr_t)va_arg(va, void*);
5802278a:	4214                	lw	a3,0(a2)
5802278c:	00460493          	addi	s1,a2,4
        flags |= FLAGS_ZEROPAD | FLAGS_POINTER;
58022790:	8fd9                	or	a5,a5,a4
          out_rev_(out, buffer, idx, maxlen, ")lin(", 5, width, flags) :
58022792:	8616                	mv	a2,t0
58022794:	32068563          	beqz	a3,58022abe <vsnprintf+0x7aa>
          print_integer(out, buffer, idx, maxlen, (printf_unsigned_value_t) value, false, BASE_HEX, precision, width, flags);
58022798:	c83e                	sw	a5,16(sp)
5802279a:	8736                	mv	a4,a3
5802279c:	47a9                	li	a5,10
5802279e:	46d2                	lw	a3,20(sp)
580227a0:	45e2                	lw	a1,24(sp)
580227a2:	4572                	lw	a0,28(sp)
580227a4:	c63e                	sw	a5,12(sp)
580227a6:	47c1                	li	a5,16
580227a8:	c23e                	sw	a5,4(sp)
580227aa:	c41e                	sw	t2,8(sp)
580227ac:	c002                	sw	zero,0(sp)
580227ae:	4781                	li	a5,0
580227b0:	86fff0ef          	jal	ra,5802201e <print_integer>
580227b4:	82aa                	mv	t0,a0
        uintptr_t value = (uintptr_t)va_arg(va, void*);
580227b6:	d026                	sw	s1,32(sp)
        break;
580227b8:	be69                	j	58022352 <vsnprintf+0x3e>
    switch (*format) {
580227ba:	05800793          	li	a5,88
580227be:	2ef50563          	beq	a0,a5,58022aa8 <vsnprintf+0x794>
580227c2:	06200793          	li	a5,98
          base =  BASE_BINARY;
580227c6:	4689                	li	a3,2
    switch (*format) {
580227c8:	b6f51de3          	bne	a0,a5,58022342 <vsnprintf+0x2e>
    switch (*format) {
580227cc:	85ba                	mv	a1,a4
        if ((*format != 'i') && (*format != 'd')) {
580227ce:	06400713          	li	a4,100
        if (flags & FLAGS_PRECISION) {
580227d2:	4005f793          	andi	a5,a1,1024
        if ((*format != 'i') && (*format != 'd')) {
580227d6:	74e51c63          	bne	a0,a4,58022f2e <vsnprintf+0xc1a>
        if (flags & FLAGS_PRECISION) {
580227da:	24079763          	bnez	a5,58022a28 <vsnprintf+0x714>
          if (flags & FLAGS_LONG_LONG) {
580227de:	2005f713          	andi	a4,a1,512
580227e2:	34071963          	bnez	a4,58022b34 <vsnprintf+0x820>
            idx = print_integer(out, buffer, idx, maxlen, (printf_unsigned_value_t) va_arg(va, unsigned long), false, base, precision, width, flags);
580227e6:	5702                	lw	a4,32(sp)
          else if (flags & FLAGS_LONG) {
580227e8:	1005f793          	andi	a5,a1,256
            idx = print_integer(out, buffer, idx, maxlen, (printf_unsigned_value_t) va_arg(va, unsigned long), false, base, precision, width, flags);
580227ec:	00470313          	addi	t1,a4,4
          else if (flags & FLAGS_LONG) {
580227f0:	30078d63          	beqz	a5,58022b0a <vsnprintf+0x7f6>
            const long value = va_arg(va, long);
580227f4:	4308                	lw	a0,0(a4)
            idx = print_integer(out, buffer, idx, maxlen, ABS_FOR_PRINTING(value), value < 0, base, precision, width, flags);
580227f6:	32a05663          	blez	a0,58022b22 <vsnprintf+0x80e>
            idx = print_integer(out, buffer, idx, maxlen, ABS_FOR_PRINTING(value), value < 0, base, precision, width, flags);
580227fa:	872a                	mv	a4,a0
580227fc:	41f55793          	srai	a5,a0,0x1f
58022800:	817d                	srli	a0,a0,0x1f
58022802:	d01a                	sw	t1,32(sp)
58022804:	8616                	mv	a2,t0
58022806:	c82e                	sw	a1,16(sp)
58022808:	c626                	sw	s1,12(sp)
5802280a:	c41e                	sw	t2,8(sp)
5802280c:	c236                	sw	a3,4(sp)
5802280e:	c02a                	sw	a0,0(sp)
            idx = print_integer(out, buffer, idx, maxlen, (printf_unsigned_value_t) value, false, base, precision, width, flags);
58022810:	46d2                	lw	a3,20(sp)
58022812:	45e2                	lw	a1,24(sp)
58022814:	4572                	lw	a0,28(sp)
58022816:	809ff0ef          	jal	ra,5802201e <print_integer>
5802281a:	82aa                	mv	t0,a0
        break;
5802281c:	be1d                	j	58022352 <vsnprintf+0x3e>
    switch (*format) {
5802281e:	06500513          	li	a0,101
58022822:	b605                	j	58022342 <vsnprintf+0x2e>
      const int w = va_arg(va, int);
58022824:	5682                	lw	a3,32(sp)
58022826:	4284                	lw	s1,0(a3)
58022828:	00468613          	addi	a2,a3,4
      if (w < 0) {
5802282c:	0404cc63          	bltz	s1,58022884 <vsnprintf+0x570>
    if (*format == '.') {
58022830:	00144503          	lbu	a0,1(s0)
      format++;
58022834:	00240693          	addi	a3,s0,2
      const int w = va_arg(va, int);
58022838:	d032                	sw	a2,32(sp)
      format++;
5802283a:	843e                	mv	s0,a5
    if (*format == '.') {
5802283c:	02e00793          	li	a5,46
58022840:	b8f51de3          	bne	a0,a5,580223da <vsnprintf+0xc6>
      if (is_digit_(*format)) {
58022844:	00144503          	lbu	a0,1(s0)
58022848:	4625                	li	a2,9
      flags |= FLAGS_PRECISION;
5802284a:	40076713          	ori	a4,a4,1024
  return (ch >= '0') && (ch <= '9');
5802284e:	fd050793          	addi	a5,a0,-48
      if (is_digit_(*format)) {
58022852:	0ff7f793          	andi	a5,a5,255
58022856:	10f67263          	bgeu	a2,a5,5802295a <vsnprintf+0x646>
      else if (*format == '*') {
5802285a:	02a00793          	li	a5,42
5802285e:	12f50363          	beq	a0,a5,58022984 <vsnprintf+0x670>
    switch (*format) {
58022862:	06c00793          	li	a5,108
        format++;
58022866:	8436                	mv	s0,a3
    precision = 0U;
58022868:	4381                	li	t2,0
        format++;
5802286a:	0685                	addi	a3,a3,1
    switch (*format) {
5802286c:	b6f51ce3          	bne	a0,a5,580223e4 <vsnprintf+0xd0>
        if (*format == 'l') {
58022870:	00144503          	lbu	a0,1(s0)
58022874:	c0f51ce3          	bne	a0,a5,5802248c <vsnprintf+0x178>
    switch (*format) {
58022878:	00244503          	lbu	a0,2(s0)
          flags |= FLAGS_LONG_LONG;
5802287c:	30076713          	ori	a4,a4,768
        format++;
58022880:	040d                	addi	s0,s0,3
58022882:	b649                	j	58022404 <vsnprintf+0xf0>
        flags |= FLAGS_LEFT;    // reverse padding
58022884:	00276713          	ori	a4,a4,2
        width = (unsigned int)-w;
58022888:	409004b3          	neg	s1,s1
5802288c:	b755                	j	58022830 <vsnprintf+0x51c>
        if (*format == 'h') {
5802288e:	00144503          	lbu	a0,1(s0)
58022892:	1ef50363          	beq	a0,a5,58022a78 <vsnprintf+0x764>
        flags |= FLAGS_SHORT;
58022896:	08076713          	ori	a4,a4,128
        format++;
5802289a:	00168413          	addi	s0,a3,1
5802289e:	b69d                	j	58022404 <vsnprintf+0xf0>
        const char* p = va_arg(va, char*);
580228a0:	5682                	lw	a3,32(sp)
580228a2:	4290                	lw	a2,0(a3)
580228a4:	0691                	addi	a3,a3,4
580228a6:	d636                	sw	a3,44(sp)
580228a8:	d032                	sw	a2,32(sp)
        if (p == NULL) {
580228aa:	1c060d63          	beqz	a2,58022a84 <vsnprintf+0x770>
  for (s = str; *s && maxsize--; ++s);
580228ae:	5682                	lw	a3,32(sp)
580228b0:	0006c503          	lbu	a0,0(a3)
          unsigned int l = strnlen_s_(p, precision ? precision : (size_t)-1);
580228b4:	0e038663          	beqz	t2,580229a0 <vsnprintf+0x68c>
  for (s = str; *s && maxsize--; ++s);
580228b8:	02050163          	beqz	a0,580228da <vsnprintf+0x5c6>
580228bc:	fff38693          	addi	a3,t2,-1
580228c0:	5782                	lw	a5,32(sp)
580228c2:	0685                	addi	a3,a3,1
580228c4:	00d78633          	add	a2,a5,a3
580228c8:	a019                	j	580228ce <vsnprintf+0x5ba>
580228ca:	00c78663          	beq	a5,a2,580228d6 <vsnprintf+0x5c2>
580228ce:	0017c683          	lbu	a3,1(a5) # 1001 <HeapMinSize+0x1>
580228d2:	0785                	addi	a5,a5,1
580228d4:	fafd                	bnez	a3,580228ca <vsnprintf+0x5b6>
  return (unsigned int)(s - str);
580228d6:	5682                	lw	a3,32(sp)
580228d8:	8f95                	sub	a5,a5,a3
          if (flags & FLAGS_PRECISION) {
580228da:	40077693          	andi	a3,a4,1024
580228de:	d236                	sw	a3,36(sp)
580228e0:	c681                	beqz	a3,580228e8 <vsnprintf+0x5d4>
            l = (l < precision ? l : precision);
580228e2:	00f3f363          	bgeu	t2,a5,580228e8 <vsnprintf+0x5d4>
580228e6:	879e                	mv	a5,t2
          if (!(flags & FLAGS_LEFT)) {
580228e8:	8b09                	andi	a4,a4,2
580228ea:	d83a                	sw	a4,48(sp)
580228ec:	28070c63          	beqz	a4,58022b84 <vsnprintf+0x870>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
580228f0:	26050363          	beqz	a0,58022b56 <vsnprintf+0x842>
580228f4:	de22                	sw	s0,60(sp)
580228f6:	8716                	mv	a4,t0
580228f8:	d416                	sw	t0,40(sp)
580228fa:	da3e                	sw	a5,52(sp)
580228fc:	dc26                	sw	s1,56(sp)
580228fe:	841e                	mv	s0,t2
58022900:	5792                	lw	a5,36(sp)
            out(*(p++), buffer, idx++, maxlen);
58022902:	46d2                	lw	a3,20(sp)
58022904:	45e2                	lw	a1,24(sp)
58022906:	00170493          	addi	s1,a4,1
5802290a:	863a                	mv	a2,a4
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
5802290c:	c791                	beqz	a5,58022918 <vsnprintf+0x604>
5802290e:	fff40793          	addi	a5,s0,-1
58022912:	1c040863          	beqz	s0,58022ae2 <vsnprintf+0x7ce>
58022916:	843e                	mv	s0,a5
            out(*(p++), buffer, idx++, maxlen);
58022918:	47f2                	lw	a5,28(sp)
5802291a:	9782                	jalr	a5
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
5802291c:	57a2                	lw	a5,40(sp)
5802291e:	5702                	lw	a4,32(sp)
58022920:	40f487b3          	sub	a5,s1,a5
58022924:	97ba                	add	a5,a5,a4
58022926:	0007c503          	lbu	a0,0(a5)
            out(*(p++), buffer, idx++, maxlen);
5802292a:	8726                	mv	a4,s1
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
5802292c:	f971                	bnez	a0,58022900 <vsnprintf+0x5ec>
            out(*(p++), buffer, idx++, maxlen);
5802292e:	57d2                	lw	a5,52(sp)
58022930:	54e2                	lw	s1,56(sp)
58022932:	5472                	lw	s0,60(sp)
58022934:	82ba                	mv	t0,a4
          if (flags & FLAGS_LEFT) {
58022936:	5742                	lw	a4,48(sp)
58022938:	20071f63          	bnez	a4,58022b56 <vsnprintf+0x842>
        const char* p = va_arg(va, char*);
5802293c:	57b2                	lw	a5,44(sp)
5802293e:	d03e                	sw	a5,32(sp)
        break;
58022940:	bc09                	j	58022352 <vsnprintf+0x3e>
    out = out_discard;
58022942:	580227b7          	lui	a5,0x58022
  while (*format)
58022946:	0004c503          	lbu	a0,0(s1)
    out = out_discard;
5802294a:	f5878793          	addi	a5,a5,-168 # 58021f58 <out_discard>
5802294e:	ce3e                	sw	a5,28(sp)
  while (*format)
58022950:	4401                	li	s0,0
58022952:	9e0515e3          	bnez	a0,5802233c <vsnprintf+0x28>
58022956:	4481                	li	s1,0
58022958:	bbe1                	j	58022730 <vsnprintf+0x41c>
  unsigned int i = 0U;
5802295a:	4381                	li	t2,0
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
5802295c:	4329                	li	t1,10
5802295e:	026383b3          	mul	t2,t2,t1
58022962:	85b6                	mv	a1,a3
58022964:	0685                	addi	a3,a3,1
58022966:	93aa                	add	t2,t2,a0
  while (is_digit_(**str)) {
58022968:	0006c503          	lbu	a0,0(a3)
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
5802296c:	fd038393          	addi	t2,t2,-48
  return (ch >= '0') && (ch <= '9');
58022970:	fd050793          	addi	a5,a0,-48
  while (is_digit_(**str)) {
58022974:	0ff7f793          	andi	a5,a5,255
58022978:	fef673e3          	bgeu	a2,a5,5802295e <vsnprintf+0x64a>
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
5802297c:	8436                	mv	s0,a3
        format++;
5802297e:	00258693          	addi	a3,a1,2
58022982:	bca9                	j	580223dc <vsnprintf+0xc8>
        precision = precision_ > 0 ? (unsigned int)precision_ : 0U;
58022984:	5782                	lw	a5,32(sp)
58022986:	0007a383          	lw	t2,0(a5)
        const int precision_ = (int)va_arg(va, int);
5802298a:	0791                	addi	a5,a5,4
        precision = precision_ > 0 ? (unsigned int)precision_ : 0U;
5802298c:	0003d363          	bgez	t2,58022992 <vsnprintf+0x67e>
58022990:	4381                	li	t2,0
    switch (*format) {
58022992:	00244503          	lbu	a0,2(s0)
        format++;
58022996:	00340693          	addi	a3,s0,3
        const int precision_ = (int)va_arg(va, int);
5802299a:	d03e                	sw	a5,32(sp)
        format++;
5802299c:	0409                	addi	s0,s0,2
5802299e:	bc3d                	j	580223dc <vsnprintf+0xc8>
  for (s = str; *s && maxsize--; ++s);
580229a0:	56f9                	li	a3,-2
580229a2:	fd19                	bnez	a0,580228c0 <vsnprintf+0x5ac>
580229a4:	bf1d                	j	580228da <vsnprintf+0x5c6>
          while (l++ < width) {
580229a6:	4705                	li	a4,1
580229a8:	52977b63          	bgeu	a4,s1,58022ede <vsnprintf+0xbca>
580229ac:	fff28713          	addi	a4,t0,-1
580229b0:	94ba                	add	s1,s1,a4
580229b2:	d226                	sw	s1,36(sp)
580229b4:	d622                	sw	s0,44(sp)
580229b6:	84be                	mv	s1,a5
580229b8:	8416                	mv	s0,t0
580229ba:	a011                	j	580229be <vsnprintf+0x6aa>
580229bc:	0485                	addi	s1,s1,1
            out(' ', buffer, idx++, maxlen);
580229be:	47f2                	lw	a5,28(sp)
580229c0:	46d2                	lw	a3,20(sp)
580229c2:	45e2                	lw	a1,24(sp)
580229c4:	8622                	mv	a2,s0
580229c6:	02000513          	li	a0,32
580229ca:	9782                	jalr	a5
          while (l++ < width) {
580229cc:	5792                	lw	a5,36(sp)
            out(' ', buffer, idx++, maxlen);
580229ce:	8426                	mv	s0,s1
          while (l++ < width) {
580229d0:	fe9796e3          	bne	a5,s1,580229bc <vsnprintf+0x6a8>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
580229d4:	5492                	lw	s1,36(sp)
580229d6:	5432                	lw	s0,44(sp)
580229d8:	00148293          	addi	t0,s1,1
580229dc:	5782                	lw	a5,32(sp)
580229de:	46d2                	lw	a3,20(sp)
580229e0:	45e2                	lw	a1,24(sp)
580229e2:	0007c503          	lbu	a0,0(a5)
580229e6:	47f2                	lw	a5,28(sp)
580229e8:	d216                	sw	t0,36(sp)
580229ea:	8626                	mv	a2,s1
580229ec:	9782                	jalr	a5
        if (flags & FLAGS_LEFT) {
580229ee:	5292                	lw	t0,36(sp)
        break;
580229f0:	57a2                	lw	a5,40(sp)
580229f2:	d03e                	sw	a5,32(sp)
580229f4:	bab9                	j	58022352 <vsnprintf+0x3e>
    return out_rev_(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
580229f6:	00477793          	andi	a5,a4,4
580229fa:	1e079163          	bnez	a5,58022bdc <vsnprintf+0x8c8>
580229fe:	580246b7          	lui	a3,0x58024
58022a02:	73068693          	addi	a3,a3,1840 # 58024730 <__fsymtab_end+0x70>
58022a06:	478d                	li	a5,3
58022a08:	c23a                	sw	a4,4(sp)
58022a0a:	8616                	mv	a2,t0
58022a0c:	c026                	sw	s1,0(sp)
58022a0e:	8736                	mv	a4,a3
58022a10:	a0f5                	j	58022afc <vsnprintf+0x7e8>
        if (*format == 'x' || *format == 'X') {
58022a12:	07800793          	li	a5,120
58022a16:	1ef51b63          	bne	a0,a5,58022c0c <vsnprintf+0x8f8>
        if (flags & FLAGS_PRECISION) {
58022a1a:	40077793          	andi	a5,a4,1024
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
58022a1e:	ff377593          	andi	a1,a4,-13
        if (flags & FLAGS_PRECISION) {
58022a22:	1c078d63          	beqz	a5,58022bfc <vsnprintf+0x8e8>
          base = BASE_HEX;
58022a26:	46c1                	li	a3,16
          flags &= ~FLAGS_ZEROPAD;
58022a28:	99f9                	andi	a1,a1,-2
        if ((*format == 'i') || (*format == 'd')) {
58022a2a:	06900793          	li	a5,105
          if (flags & FLAGS_LONG_LONG) {
58022a2e:	2005f713          	andi	a4,a1,512
        if ((*format == 'i') || (*format == 'd')) {
58022a32:	daf508e3          	beq	a0,a5,580227e2 <vsnprintf+0x4ce>
58022a36:	06400793          	li	a5,100
58022a3a:	daf504e3          	beq	a0,a5,580227e2 <vsnprintf+0x4ce>
          if (flags & FLAGS_LONG_LONG) {
58022a3e:	1e071c63          	bnez	a4,58022c36 <vsnprintf+0x922>
            idx = print_integer(out, buffer, idx, maxlen, (printf_unsigned_value_t) va_arg(va, unsigned long), false, base, precision, width, flags);
58022a42:	5702                	lw	a4,32(sp)
          else if (flags & FLAGS_LONG) {
58022a44:	1005f793          	andi	a5,a1,256
            idx = print_integer(out, buffer, idx, maxlen, (printf_unsigned_value_t) va_arg(va, unsigned long), false, base, precision, width, flags);
58022a48:	00470313          	addi	t1,a4,4
          else if (flags & FLAGS_LONG) {
58022a4c:	20079b63          	bnez	a5,58022c62 <vsnprintf+0x94e>
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
58022a50:	0405f793          	andi	a5,a1,64
58022a54:	18079e63          	bnez	a5,58022bf0 <vsnprintf+0x8dc>
58022a58:	0805f793          	andi	a5,a1,128
58022a5c:	40078063          	beqz	a5,58022e5c <vsnprintf+0xb48>
58022a60:	5782                	lw	a5,32(sp)
58022a62:	0007d703          	lhu	a4,0(a5)
58022a66:	d01a                	sw	t1,32(sp)
            idx = print_integer(out, buffer, idx, maxlen, (printf_unsigned_value_t) value, false, base, precision, width, flags);
58022a68:	8616                	mv	a2,t0
58022a6a:	c82e                	sw	a1,16(sp)
58022a6c:	c626                	sw	s1,12(sp)
58022a6e:	c41e                	sw	t2,8(sp)
58022a70:	c236                	sw	a3,4(sp)
58022a72:	c002                	sw	zero,0(sp)
58022a74:	4781                	li	a5,0
58022a76:	bb69                	j	58022810 <vsnprintf+0x4fc>
    switch (*format) {
58022a78:	00244503          	lbu	a0,2(s0)
          flags |= FLAGS_CHAR;
58022a7c:	0c076713          	ori	a4,a4,192
        format++;
58022a80:	040d                	addi	s0,s0,3
58022a82:	b249                	j	58022404 <vsnprintf+0xf0>
          idx = out_rev_(out, buffer, idx, maxlen, ")llun(", 6, width, flags);
58022a84:	46d2                	lw	a3,20(sp)
58022a86:	45e2                	lw	a1,24(sp)
58022a88:	4572                	lw	a0,28(sp)
58022a8a:	c23a                	sw	a4,4(sp)
58022a8c:	58024737          	lui	a4,0x58024
58022a90:	8616                	mv	a2,t0
58022a92:	c026                	sw	s1,0(sp)
58022a94:	4799                	li	a5,6
58022a96:	74870713          	addi	a4,a4,1864 # 58024748 <__fsymtab_end+0x88>
58022a9a:	cc0ff0ef          	jal	ra,58021f5a <out_rev_>
58022a9e:	82aa                	mv	t0,a0
58022aa0:	bd71                	j	5802293c <vsnprintf+0x628>
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
58022aa2:	02076713          	ori	a4,a4,32
58022aa6:	badd                	j	5802249c <vsnprintf+0x188>
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
58022aa8:	ff377593          	andi	a1,a4,-13
        if (flags & FLAGS_PRECISION) {
58022aac:	40077793          	andi	a5,a4,1024
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
58022ab0:	0205e593          	ori	a1,a1,32
        if (flags & FLAGS_PRECISION) {
58022ab4:	fbad                	bnez	a5,58022a26 <vsnprintf+0x712>
        if ((*format == 'i') || (*format == 'd')) {
58022ab6:	20077713          	andi	a4,a4,512
          base = BASE_HEX;
58022aba:	46c1                	li	a3,16
58022abc:	b749                	j	58022a3e <vsnprintf+0x72a>
          out_rev_(out, buffer, idx, maxlen, ")lin(", 5, width, flags) :
58022abe:	46d2                	lw	a3,20(sp)
58022ac0:	45e2                	lw	a1,24(sp)
58022ac2:	4572                	lw	a0,28(sp)
58022ac4:	c23e                	sw	a5,4(sp)
58022ac6:	58024737          	lui	a4,0x58024
58022aca:	47a9                	li	a5,10
58022acc:	c03e                	sw	a5,0(sp)
58022ace:	75070713          	addi	a4,a4,1872 # 58024750 <__fsymtab_end+0x90>
58022ad2:	4795                	li	a5,5
58022ad4:	c86ff0ef          	jal	ra,58021f5a <out_rev_>
58022ad8:	82aa                	mv	t0,a0
        uintptr_t value = (uintptr_t)va_arg(va, void*);
58022ada:	d026                	sw	s1,32(sp)
58022adc:	b89d                	j	58022352 <vsnprintf+0x3e>
    return 0U;
58022ade:	4281                	li	t0,0
        break;
58022ae0:	bf01                	j	580229f0 <vsnprintf+0x6dc>
58022ae2:	57d2                	lw	a5,52(sp)
58022ae4:	54e2                	lw	s1,56(sp)
58022ae6:	5472                	lw	s0,60(sp)
58022ae8:	82ba                	mv	t0,a4
58022aea:	b5b1                	j	58022936 <vsnprintf+0x622>
    return out_rev_(out, buffer, idx, maxlen, "nan", 3, width, flags);
58022aec:	c23a                	sw	a4,4(sp)
58022aee:	58024737          	lui	a4,0x58024
58022af2:	8616                	mv	a2,t0
58022af4:	c026                	sw	s1,0(sp)
58022af6:	478d                	li	a5,3
58022af8:	73c70713          	addi	a4,a4,1852 # 5802473c <__fsymtab_end+0x7c>
  return out_rev_(out, buffer, idx, maxlen, buf, len, width, flags);
58022afc:	46d2                	lw	a3,20(sp)
58022afe:	45e2                	lw	a1,24(sp)
58022b00:	4572                	lw	a0,28(sp)
58022b02:	c58ff0ef          	jal	ra,58021f5a <out_rev_>
58022b06:	82aa                	mv	t0,a0
      print_decimal_number(out, buffer, idx, maxlen, value, precision, width, flags, buf, len);
58022b08:	b5e5                	j	580229f0 <vsnprintf+0x6dc>
            const int value = (flags & FLAGS_CHAR) ? (signed char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
58022b0a:	0405f793          	andi	a5,a1,64
58022b0e:	efe9                	bnez	a5,58022be8 <vsnprintf+0x8d4>
58022b10:	0805f793          	andi	a5,a1,128
58022b14:	36078563          	beqz	a5,58022e7e <vsnprintf+0xb6a>
58022b18:	5782                	lw	a5,32(sp)
58022b1a:	00079503          	lh	a0,0(a5)
            idx = print_integer(out, buffer, idx, maxlen, ABS_FOR_PRINTING(value), value < 0, base, precision, width, flags);
58022b1e:	cca04ee3          	bgtz	a0,580227fa <vsnprintf+0x4e6>
58022b22:	00a037b3          	snez	a5,a0
58022b26:	01f55613          	srli	a2,a0,0x1f
58022b2a:	40a00733          	neg	a4,a0
58022b2e:	40f607b3          	sub	a5,a2,a5
58022b32:	b1f9                	j	58022800 <vsnprintf+0x4ec>
            const long long value = va_arg(va, long long);
58022b34:	5782                	lw	a5,32(sp)
58022b36:	43c8                	lw	a0,4(a5)
            idx = print_integer(out, buffer, idx, maxlen, ABS_FOR_PRINTING(value), value < 0, base, precision, width, flags);
58022b38:	4398                	lw	a4,0(a5)
            const long long value = va_arg(va, long long);
58022b3a:	00878313          	addi	t1,a5,8
            idx = print_integer(out, buffer, idx, maxlen, ABS_FOR_PRINTING(value), value < 0, base, precision, width, flags);
58022b3e:	87aa                	mv	a5,a0
58022b40:	cc0550e3          	bgez	a0,58022800 <vsnprintf+0x4ec>
58022b44:	00e037b3          	snez	a5,a4
58022b48:	40a00633          	neg	a2,a0
58022b4c:	40f607b3          	sub	a5,a2,a5
58022b50:	40e00733          	neg	a4,a4
58022b54:	b175                	j	58022800 <vsnprintf+0x4ec>
58022b56:	8716                	mv	a4,t0
            while (l++ < width) {
58022b58:	de97f2e3          	bgeu	a5,s1,5802293c <vsnprintf+0x628>
58022b5c:	00928533          	add	a0,t0,s1
58022b60:	40f502b3          	sub	t0,a0,a5
58022b64:	d022                	sw	s0,32(sp)
58022b66:	8496                	mv	s1,t0
58022b68:	843a                	mv	s0,a4
              out(' ', buffer, idx++, maxlen);
58022b6a:	46d2                	lw	a3,20(sp)
58022b6c:	45e2                	lw	a1,24(sp)
58022b6e:	47f2                	lw	a5,28(sp)
58022b70:	8622                	mv	a2,s0
58022b72:	02000513          	li	a0,32
58022b76:	0405                	addi	s0,s0,1
58022b78:	9782                	jalr	a5
            while (l++ < width) {
58022b7a:	fe9418e3          	bne	s0,s1,58022b6a <vsnprintf+0x856>
58022b7e:	5402                	lw	s0,32(sp)
58022b80:	82a6                	mv	t0,s1
58022b82:	bb6d                	j	5802293c <vsnprintf+0x628>
            while (l++ < width) {
58022b84:	00178713          	addi	a4,a5,1
58022b88:	0697fe63          	bgeu	a5,s1,58022c04 <vsnprintf+0x8f0>
58022b8c:	00928733          	add	a4,t0,s1
58022b90:	40f707b3          	sub	a5,a4,a5
58022b94:	da26                	sw	s1,52(sp)
58022b96:	dc22                	sw	s0,56(sp)
58022b98:	d41e                	sw	t2,40(sp)
58022b9a:	84be                	mv	s1,a5
58022b9c:	8416                	mv	s0,t0
              out(' ', buffer, idx++, maxlen);
58022b9e:	46d2                	lw	a3,20(sp)
58022ba0:	45e2                	lw	a1,24(sp)
58022ba2:	47f2                	lw	a5,28(sp)
58022ba4:	8622                	mv	a2,s0
58022ba6:	02000513          	li	a0,32
58022baa:	0405                	addi	s0,s0,1
58022bac:	9782                	jalr	a5
            while (l++ < width) {
58022bae:	fe9418e3          	bne	s0,s1,58022b9e <vsnprintf+0x88a>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
58022bb2:	5782                	lw	a5,32(sp)
58022bb4:	54d2                	lw	s1,52(sp)
58022bb6:	82a2                	mv	t0,s0
58022bb8:	0007c503          	lbu	a0,0(a5)
58022bbc:	53a2                	lw	t2,40(sp)
58022bbe:	5462                	lw	s0,56(sp)
            while (l++ < width) {
58022bc0:	00148793          	addi	a5,s1,1
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
58022bc4:	d20518e3          	bnez	a0,580228f4 <vsnprintf+0x5e0>
58022bc8:	bb95                	j	5802293c <vsnprintf+0x628>
    return out_rev_(out, buffer, idx, maxlen, "fni-", 4, width, flags);
58022bca:	c23a                	sw	a4,4(sp)
58022bcc:	58024737          	lui	a4,0x58024
58022bd0:	8616                	mv	a2,t0
58022bd2:	c026                	sw	s1,0(sp)
58022bd4:	4791                	li	a5,4
58022bd6:	74070713          	addi	a4,a4,1856 # 58024740 <__fsymtab_end+0x80>
58022bda:	b70d                	j	58022afc <vsnprintf+0x7e8>
    return out_rev_(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
58022bdc:	580246b7          	lui	a3,0x58024
58022be0:	73468693          	addi	a3,a3,1844 # 58024734 <__fsymtab_end+0x74>
58022be4:	4791                	li	a5,4
58022be6:	b50d                	j	58022a08 <vsnprintf+0x6f4>
            const int value = (flags & FLAGS_CHAR) ? (signed char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
58022be8:	5782                	lw	a5,32(sp)
58022bea:	00078503          	lb	a0,0(a5)
58022bee:	bf05                	j	58022b1e <vsnprintf+0x80a>
58022bf0:	5782                	lw	a5,32(sp)
58022bf2:	0007c703          	lbu	a4,0(a5)
58022bf6:	bd85                	j	58022a66 <vsnprintf+0x752>
    precision = PRINTF_DEFAULT_FLOAT_PRECISION;
58022bf8:	4399                	li	t2,6
58022bfa:	b29d                	j	58022560 <vsnprintf+0x24c>
          if (flags & FLAGS_LONG_LONG) {
58022bfc:	20077713          	andi	a4,a4,512
          base = BASE_HEX;
58022c00:	46c1                	li	a3,16
58022c02:	bd15                	j	58022a36 <vsnprintf+0x722>
            while (l++ < width) {
58022c04:	87ba                	mv	a5,a4
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
58022c06:	ce0517e3          	bnez	a0,580228f4 <vsnprintf+0x5e0>
58022c0a:	bb0d                	j	5802293c <vsnprintf+0x628>
        else if (*format == 'o') {
58022c0c:	06f00793          	li	a5,111
          base =  BASE_OCTAL;
58022c10:	46a1                	li	a3,8
        else if (*format == 'o') {
58022c12:	baf50de3          	beq	a0,a5,580227cc <vsnprintf+0x4b8>
        if ((*format != 'i') && (*format != 'd')) {
58022c16:	06900693          	li	a3,105
          flags &= ~FLAGS_HASH;   // no hash for dec format
58022c1a:	fef77593          	andi	a1,a4,-17
        if (flags & FLAGS_PRECISION) {
58022c1e:	40077793          	andi	a5,a4,1024
        if ((*format != 'i') && (*format != 'd')) {
58022c22:	aed511e3          	bne	a0,a3,58022704 <vsnprintf+0x3f0>
        if (flags & FLAGS_PRECISION) {
58022c26:	00079663          	bnez	a5,58022c32 <vsnprintf+0x91e>
          if (flags & FLAGS_LONG_LONG) {
58022c2a:	20077713          	andi	a4,a4,512
          base = BASE_DECIMAL;
58022c2e:	46a9                	li	a3,10
58022c30:	be4d                	j	580227e2 <vsnprintf+0x4ce>
58022c32:	46a9                	li	a3,10
58022c34:	bbd5                	j	58022a28 <vsnprintf+0x714>
            idx = print_integer(out, buffer, idx, maxlen, (printf_unsigned_value_t) va_arg(va, unsigned long long), false, base, precision, width, flags);
58022c36:	5302                	lw	t1,32(sp)
58022c38:	4572                	lw	a0,28(sp)
58022c3a:	8616                	mv	a2,t0
58022c3c:	00032703          	lw	a4,0(t1) # 100000 <HeapMinSize+0xff000>
58022c40:	00432783          	lw	a5,4(t1)
58022c44:	c82e                	sw	a1,16(sp)
58022c46:	c236                	sw	a3,4(sp)
58022c48:	45e2                	lw	a1,24(sp)
58022c4a:	46d2                	lw	a3,20(sp)
58022c4c:	c626                	sw	s1,12(sp)
58022c4e:	c41e                	sw	t2,8(sp)
58022c50:	c002                	sw	zero,0(sp)
58022c52:	00830493          	addi	s1,t1,8
58022c56:	bc8ff0ef          	jal	ra,5802201e <print_integer>
58022c5a:	82aa                	mv	t0,a0
58022c5c:	d026                	sw	s1,32(sp)
58022c5e:	ef4ff06f          	j	58022352 <vsnprintf+0x3e>
            idx = print_integer(out, buffer, idx, maxlen, (printf_unsigned_value_t) va_arg(va, unsigned long), false, base, precision, width, flags);
58022c62:	4318                	lw	a4,0(a4)
58022c64:	4572                	lw	a0,28(sp)
58022c66:	c82e                	sw	a1,16(sp)
58022c68:	c236                	sw	a3,4(sp)
58022c6a:	45e2                	lw	a1,24(sp)
58022c6c:	46d2                	lw	a3,20(sp)
58022c6e:	8616                	mv	a2,t0
58022c70:	c626                	sw	s1,12(sp)
58022c72:	c41e                	sw	t2,8(sp)
58022c74:	c002                	sw	zero,0(sp)
58022c76:	4781                	li	a5,0
58022c78:	d21a                	sw	t1,36(sp)
58022c7a:	ba4ff0ef          	jal	ra,5802201e <print_integer>
58022c7e:	5312                	lw	t1,36(sp)
58022c80:	82aa                	mv	t0,a0
58022c82:	d01a                	sw	t1,32(sp)
58022c84:	eceff06f          	j	58022352 <vsnprintf+0x3e>
    remainder = abs_number - (double) number_.integral;
58022c88:	5552                	lw	a0,52(sp)
58022c8a:	55e2                	lw	a1,56(sp)
58022c8c:	de16                	sw	t0,60(sp)
58022c8e:	d83a                	sw	a4,48(sp)
58022c90:	884ff0ef          	jal	ra,58021d14 <__floatdidf>
58022c94:	5782                	lw	a5,32(sp)
58022c96:	86ae                	mv	a3,a1
58022c98:	5592                	lw	a1,36(sp)
58022c9a:	862a                	mv	a2,a0
58022c9c:	852e                	mv	a0,a1
58022c9e:	85be                	mv	a1,a5
58022ca0:	9c1fe0ef          	jal	ra,58021660 <__subdf3>
    if ((!(remainder < 0.5) || (remainder > 0.5)) && (number_.integral & 1)) {
58022ca4:	47a6                	lw	a5,72(sp)
    remainder = abs_number - (double) number_.integral;
58022ca6:	d02a                	sw	a0,32(sp)
58022ca8:	d22e                	sw	a1,36(sp)
    if ((!(remainder < 0.5) || (remainder > 0.5)) && (number_.integral & 1)) {
58022caa:	0007a303          	lw	t1,0(a5)
58022cae:	0047a383          	lw	t2,4(a5)
58022cb2:	861a                	mv	a2,t1
58022cb4:	869e                	mv	a3,t2
58022cb6:	c6cfe0ef          	jal	ra,58021122 <__ledf2>
58022cba:	5742                	lw	a4,48(sp)
58022cbc:	52f2                	lw	t0,60(sp)
58022cbe:	02055463          	bgez	a0,58022ce6 <vsnprintf+0x9d2>
58022cc2:	580257b7          	lui	a5,0x58025
58022cc6:	eb078793          	addi	a5,a5,-336 # 58024eb0 <__clz_tab+0x160>
58022cca:	0007a303          	lw	t1,0(a5)
58022cce:	0047a383          	lw	t2,4(a5)
58022cd2:	5502                	lw	a0,32(sp)
58022cd4:	5592                	lw	a1,36(sp)
58022cd6:	861a                	mv	a2,t1
58022cd8:	869e                	mv	a3,t2
58022cda:	b92fe0ef          	jal	ra,5802106c <__gedf2>
58022cde:	5742                	lw	a4,48(sp)
58022ce0:	52f2                	lw	t0,60(sp)
58022ce2:	00a05e63          	blez	a0,58022cfe <vsnprintf+0x9ea>
58022ce6:	56d2                	lw	a3,52(sp)
58022ce8:	0016f793          	andi	a5,a3,1
58022cec:	cb89                	beqz	a5,58022cfe <vsnprintf+0x9ea>
      ++number_.integral;
58022cee:	5662                	lw	a2,56(sp)
58022cf0:	00168793          	addi	a5,a3,1
58022cf4:	00d7b6b3          	sltu	a3,a5,a3
58022cf8:	96b2                	add	a3,a3,a2
58022cfa:	dc36                	sw	a3,56(sp)
58022cfc:	da3e                	sw	a5,52(sp)
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
58022cfe:	00377693          	andi	a3,a4,3
    if (flags & FLAGS_HASH) {
58022d02:	01077793          	andi	a5,a4,16
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
58022d06:	d236                	sw	a3,36(sp)
    if (flags & FLAGS_HASH) {
58022d08:	c3c1                	beqz	a5,58022d88 <vsnprintf+0xa74>
      if (len < PRINTF_FTOA_BUFFER_SIZE) {
58022d0a:	56b2                	lw	a3,44(sp)
58022d0c:	02000793          	li	a5,32
58022d10:	1ef69863          	bne	a3,a5,58022f00 <vsnprintf+0xbec>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
58022d14:	5692                	lw	a3,36(sp)
58022d16:	4785                	li	a5,1
58022d18:	9cf698e3          	bne	a3,a5,580226e8 <vsnprintf+0x3d4>
    if (width && (number_.is_negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
58022d1c:	9c0486e3          	beqz	s1,580226e8 <vsnprintf+0x3d4>
58022d20:	4796                	lw	a5,68(sp)
58022d22:	1e079d63          	bnez	a5,58022f1c <vsnprintf+0xc08>
58022d26:	00c77793          	andi	a5,a4,12
58022d2a:	24078263          	beqz	a5,58022f6e <vsnprintf+0xc5a>
      width--;
58022d2e:	14fd                	addi	s1,s1,-1
      buf[len++] = '+';  // ignore the space if the '+' exists
58022d30:	02000793          	li	a5,32
58022d34:	d63e                	sw	a5,44(sp)
58022d36:	ba4d                	j	580226e8 <vsnprintf+0x3d4>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
58022d38:	5772                	lw	a4,60(sp)
58022d3a:	8526                	mv	a0,s1
58022d3c:	8322                	mv	t1,s0
58022d3e:	00377613          	andi	a2,a4,3
58022d42:	d232                	sw	a2,36(sp)
      while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
58022d44:	02000613          	li	a2,32
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
58022d48:	42a6                	lw	t0,72(sp)
58022d4a:	44b6                	lw	s1,76(sp)
58022d4c:	4446                	lw	s0,80(sp)
      while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
58022d4e:	86aa                	mv	a3,a0
58022d50:	12c50e63          	beq	a0,a2,58022e8c <vsnprintf+0xb78>
58022d54:	02078263          	beqz	a5,58022d78 <vsnprintf+0xa64>
        buf[len++] = '0';
58022d58:	03000593          	li	a1,48
58022d5c:	0685                	addi	a3,a3,1
58022d5e:	06410393          	addi	t2,sp,100
      while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
58022d62:	fff6c793          	not	a5,a3
        buf[len++] = '0';
58022d66:	93b6                	add	t2,t2,a3
      while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
58022d68:	97aa                	add	a5,a5,a0
        buf[len++] = '0';
58022d6a:	feb38fa3          	sb	a1,-1(t2)
      while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
58022d6e:	979a                	add	a5,a5,t1
58022d70:	10c68e63          	beq	a3,a2,58022e8c <vsnprintf+0xb78>
58022d74:	fe0794e3          	bnez	a5,58022d5c <vsnprintf+0xa48>
        buf[len++] = '.';
58022d78:	015c                	addi	a5,sp,132
58022d7a:	97b6                	add	a5,a5,a3
58022d7c:	0685                	addi	a3,a3,1
58022d7e:	d636                	sw	a3,44(sp)
58022d80:	02e00693          	li	a3,46
58022d84:	fed78023          	sb	a3,-32(a5)
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
58022d88:	d83a                	sw	a4,48(sp)
58022d8a:	c4a6                	sw	s1,72(sp)
58022d8c:	c6a2                	sw	s0,76(sp)
58022d8e:	54b2                	lw	s1,44(sp)
58022d90:	5452                	lw	s0,52(sp)
58022d92:	5762                	lw	a4,56(sp)
58022d94:	de16                	sw	t0,60(sp)
58022d96:	02000793          	li	a5,32
    buf[len++] = (char)('0' + (number_.integral % 10));
58022d9a:	4629                	li	a2,10
58022d9c:	4681                	li	a3,0
58022d9e:	8522                	mv	a0,s0
58022da0:	85ba                	mv	a1,a4
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
58022da2:	0ef48163          	beq	s1,a5,58022e84 <vsnprintf+0xb70>
58022da6:	d03a                	sw	a4,32(sp)
    buf[len++] = (char)('0' + (number_.integral % 10));
58022da8:	ff8fd0ef          	jal	ra,580205a0 <__moddi3>
    if (!(number_.integral /= 10)) {
58022dac:	5702                	lw	a4,32(sp)
    buf[len++] = (char)('0' + (number_.integral % 10));
58022dae:	0485                	addi	s1,s1,1
58022db0:	10dc                	addi	a5,sp,100
58022db2:	03050313          	addi	t1,a0,48
58022db6:	97a6                	add	a5,a5,s1
    if (!(number_.integral /= 10)) {
58022db8:	8522                	mv	a0,s0
58022dba:	85ba                	mv	a1,a4
58022dbc:	4681                	li	a3,0
58022dbe:	4629                	li	a2,10
    buf[len++] = (char)('0' + (number_.integral % 10));
58022dc0:	fe678fa3          	sb	t1,-1(a5)
    if (!(number_.integral /= 10)) {
58022dc4:	c38fd0ef          	jal	ra,580201fc <__divdi3>
58022dc8:	00a5e6b3          	or	a3,a1,a0
58022dcc:	872e                	mv	a4,a1
58022dce:	842a                	mv	s0,a0
58022dd0:	f2f9                	bnez	a3,58022d96 <vsnprintf+0xa82>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
58022dd2:	5692                	lw	a3,36(sp)
58022dd4:	d626                	sw	s1,44(sp)
58022dd6:	4785                	li	a5,1
58022dd8:	5742                	lw	a4,48(sp)
58022dda:	52f2                	lw	t0,60(sp)
58022ddc:	44a6                	lw	s1,72(sp)
58022dde:	4436                	lw	s0,76(sp)
58022de0:	0af68d63          	beq	a3,a5,58022e9a <vsnprintf+0xb86>
  if (len < PRINTF_FTOA_BUFFER_SIZE) {
58022de4:	56b2                	lw	a3,44(sp)
58022de6:	02000793          	li	a5,32
58022dea:	f4f683e3          	beq	a3,a5,58022d30 <vsnprintf+0xa1c>
    if (number_.is_negative) {
58022dee:	4696                	lw	a3,68(sp)
58022df0:	caad                	beqz	a3,58022e62 <vsnprintf+0xb4e>
      buf[len++] = '-';
58022df2:	5632                	lw	a2,44(sp)
58022df4:	015c                	addi	a5,sp,132
58022df6:	02d00693          	li	a3,45
58022dfa:	97b2                	add	a5,a5,a2
58022dfc:	fed78023          	sb	a3,-32(a5)
58022e00:	00160793          	addi	a5,a2,1
58022e04:	d63e                	sw	a5,44(sp)
58022e06:	b0cd                	j	580226e8 <vsnprintf+0x3d4>
  else if (remainder == 0.5) {
58022e08:	580257b7          	lui	a5,0x58025
58022e0c:	eb078793          	addi	a5,a5,-336 # 58024eb0 <__clz_tab+0x160>
58022e10:	4546                	lw	a0,80(sp)
58022e12:	5586                	lw	a1,96(sp)
58022e14:	4390                	lw	a2,0(a5)
58022e16:	43d4                	lw	a3,4(a5)
58022e18:	ca9e                	sw	t2,84(sp)
58022e1a:	c69a                	sw	t1,76(sp)
58022e1c:	de3a                	sw	a4,60(sp)
58022e1e:	9d2fe0ef          	jal	ra,58020ff0 <__eqdf2>
58022e22:	5772                	lw	a4,60(sp)
58022e24:	4336                	lw	t1,76(sp)
58022e26:	43d6                	lw	t2,84(sp)
58022e28:	42e6                	lw	t0,88(sp)
58022e2a:	840517e3          	bnez	a0,58022678 <vsnprintf+0x364>
    if ((number_.fractional == 0U) || (number_.fractional & 1U)) {
58022e2e:	57c2                	lw	a5,48(sp)
58022e30:	00f3e7b3          	or	a5,t2,a5
58022e34:	c789                	beqz	a5,58022e3e <vsnprintf+0xb2a>
58022e36:	0013f793          	andi	a5,t2,1
58022e3a:	82078fe3          	beqz	a5,58022678 <vsnprintf+0x364>
      ++number_.fractional;
58022e3e:	56c2                	lw	a3,48(sp)
58022e40:	00138793          	addi	a5,t2,1
58022e44:	0077b3b3          	sltu	t2,a5,t2
58022e48:	969e                	add	a3,a3,t2
58022e4a:	d836                	sw	a3,48(sp)
58022e4c:	83be                	mv	t2,a5
58022e4e:	82bff06f          	j	58022678 <vsnprintf+0x364>
58022e52:	02000793          	li	a5,32
58022e56:	d63e                	sw	a5,44(sp)
58022e58:	f2eff06f          	j	58022586 <vsnprintf+0x272>
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
58022e5c:	5782                	lw	a5,32(sp)
58022e5e:	4398                	lw	a4,0(a5)
58022e60:	b119                	j	58022a66 <vsnprintf+0x752>
    else if (flags & FLAGS_PLUS) {
58022e62:	00477693          	andi	a3,a4,4
58022e66:	cebd                	beqz	a3,58022ee4 <vsnprintf+0xbd0>
      buf[len++] = '+';  // ignore the space if the '+' exists
58022e68:	5632                	lw	a2,44(sp)
58022e6a:	015c                	addi	a5,sp,132
58022e6c:	02b00693          	li	a3,43
58022e70:	97b2                	add	a5,a5,a2
58022e72:	fed78023          	sb	a3,-32(a5)
58022e76:	00160793          	addi	a5,a2,1
58022e7a:	d63e                	sw	a5,44(sp)
58022e7c:	b0b5                	j	580226e8 <vsnprintf+0x3d4>
            const int value = (flags & FLAGS_CHAR) ? (signed char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
58022e7e:	5782                	lw	a5,32(sp)
58022e80:	4388                	lw	a0,0(a5)
58022e82:	b971                	j	58022b1e <vsnprintf+0x80a>
58022e84:	5742                	lw	a4,48(sp)
58022e86:	52f2                	lw	t0,60(sp)
58022e88:	44a6                	lw	s1,72(sp)
58022e8a:	4436                	lw	s0,76(sp)
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
58022e8c:	5692                	lw	a3,36(sp)
58022e8e:	4785                	li	a5,1
58022e90:	eaf690e3          	bne	a3,a5,58022d30 <vsnprintf+0xa1c>
58022e94:	02000793          	li	a5,32
58022e98:	d63e                	sw	a5,44(sp)
    if (width && (number_.is_negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
58022e9a:	d4a9                	beqz	s1,58022de4 <vsnprintf+0xad0>
58022e9c:	4796                	lw	a5,68(sp)
58022e9e:	ef85                	bnez	a5,58022ed6 <vsnprintf+0xbc2>
58022ea0:	00c77793          	andi	a5,a4,12
58022ea4:	eb8d                	bnez	a5,58022ed6 <vsnprintf+0xbc2>
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
58022ea6:	55b2                	lw	a1,44(sp)
58022ea8:	f295fee3          	bgeu	a1,s1,58022de4 <vsnprintf+0xad0>
58022eac:	02000793          	li	a5,32
      buf[len++] = '0';
58022eb0:	03000613          	li	a2,48
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
58022eb4:	02000693          	li	a3,32
58022eb8:	e6f58ce3          	beq	a1,a5,58022d30 <vsnprintf+0xa1c>
58022ebc:	57b2                	lw	a5,44(sp)
58022ebe:	a019                	j	58022ec4 <vsnprintf+0xbb0>
58022ec0:	e6d788e3          	beq	a5,a3,58022d30 <vsnprintf+0xa1c>
      buf[len++] = '0';
58022ec4:	0785                	addi	a5,a5,1
58022ec6:	10cc                	addi	a1,sp,100
58022ec8:	95be                	add	a1,a1,a5
58022eca:	fec58fa3          	sb	a2,-1(a1)
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
58022ece:	fe9799e3          	bne	a5,s1,58022ec0 <vsnprintf+0xbac>
58022ed2:	d63e                	sw	a5,44(sp)
58022ed4:	bf01                	j	58022de4 <vsnprintf+0xad0>
      width--;
58022ed6:	14fd                	addi	s1,s1,-1
58022ed8:	b7f9                	j	58022ea6 <vsnprintf+0xb92>
          while (l++ < width) {
58022eda:	82be                	mv	t0,a5
58022edc:	be11                	j	580229f0 <vsnprintf+0x6dc>
          while (l++ < width) {
58022ede:	8496                	mv	s1,t0
58022ee0:	82be                	mv	t0,a5
58022ee2:	bced                	j	580229dc <vsnprintf+0x6c8>
    else if (flags & FLAGS_SPACE) {
58022ee4:	00877693          	andi	a3,a4,8
58022ee8:	800680e3          	beqz	a3,580226e8 <vsnprintf+0x3d4>
      buf[len++] = ' ';
58022eec:	5632                	lw	a2,44(sp)
58022eee:	0154                	addi	a3,sp,132
58022ef0:	96b2                	add	a3,a3,a2
58022ef2:	fef68023          	sb	a5,-32(a3)
58022ef6:	00160793          	addi	a5,a2,1
58022efa:	d63e                	sw	a5,44(sp)
58022efc:	fecff06f          	j	580226e8 <vsnprintf+0x3d4>
        buf[len++] = '.';
58022f00:	5632                	lw	a2,44(sp)
58022f02:	015c                	addi	a5,sp,132
58022f04:	02e00693          	li	a3,46
58022f08:	97b2                	add	a5,a5,a2
58022f0a:	fed78023          	sb	a3,-32(a5)
58022f0e:	00160793          	addi	a5,a2,1
58022f12:	d63e                	sw	a5,44(sp)
58022f14:	bd95                	j	58022d88 <vsnprintf+0xa74>
    if (width && (number_.is_negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
58022f16:	f0d9                	bnez	s1,58022e9c <vsnprintf+0xb88>
58022f18:	fd0ff06f          	j	580226e8 <vsnprintf+0x3d4>
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
58022f1c:	57b2                	lw	a5,44(sp)
      width--;
58022f1e:	14fd                	addi	s1,s1,-1
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
58022f20:	e097e8e3          	bltu	a5,s1,58022d30 <vsnprintf+0xa1c>
58022f24:	fc4ff06f          	j	580226e8 <vsnprintf+0x3d4>
    switch (*format) {
58022f28:	8436                	mv	s0,a3
58022f2a:	cdaff06f          	j	58022404 <vsnprintf+0xf0>
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
58022f2e:	99cd                	andi	a1,a1,-13
        if (flags & FLAGS_PRECISION) {
58022f30:	ae078de3          	beqz	a5,58022a2a <vsnprintf+0x716>
58022f34:	bcd5                	j	58022a28 <vsnprintf+0x714>
  return (ch >= '0') && (ch <= '9');
58022f36:	fd050613          	addi	a2,a0,-48
    if (is_digit_(*format)) {
58022f3a:	0ff67613          	andi	a2,a2,255
58022f3e:	45a5                	li	a1,9
  unsigned int i = 0U;
58022f40:	4481                	li	s1,0
    if (is_digit_(*format)) {
58022f42:	8ec5ede3          	bltu	a1,a2,5802283c <vsnprintf+0x528>
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
58022f46:	43a9                	li	t2,10
  while (is_digit_(**str)) {
58022f48:	45a5                	li	a1,9
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
58022f4a:	027484b3          	mul	s1,s1,t2
58022f4e:	86a2                	mv	a3,s0
58022f50:	843e                	mv	s0,a5
58022f52:	0785                	addi	a5,a5,1
58022f54:	94aa                	add	s1,s1,a0
  while (is_digit_(**str)) {
58022f56:	fff7c503          	lbu	a0,-1(a5)
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
58022f5a:	fd048493          	addi	s1,s1,-48
  return (ch >= '0') && (ch <= '9');
58022f5e:	fd050613          	addi	a2,a0,-48
  while (is_digit_(**str)) {
58022f62:	0ff67613          	andi	a2,a2,255
58022f66:	fec5f2e3          	bgeu	a1,a2,58022f4a <vsnprintf+0xc36>
      format++;
58022f6a:	0689                	addi	a3,a3,2
58022f6c:	b8c1                	j	5802283c <vsnprintf+0x528>
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
58022f6e:	57b2                	lw	a5,44(sp)
58022f70:	e697fae3          	bgeu	a5,s1,58022de4 <vsnprintf+0xad0>
58022f74:	bb75                	j	58022d30 <vsnprintf+0xa1c>

58022f76 <printf>:
    
    return 0;
}

int printf(const char *fmt, ...)
{
58022f76:	bdc10113          	addi	sp,sp,-1060
58022f7a:	40812423          	sw	s0,1032(sp)
    char print_buf[1024];
    uint32_t len;
    va_list ap;

    if (console == NULL) {
58022f7e:	05018413          	addi	s0,gp,80 # 22034850 <console>
58022f82:	00042303          	lw	t1,0(s0)
{
58022f86:	40112623          	sw	ra,1036(sp)
58022f8a:	40b12823          	sw	a1,1040(sp)
58022f8e:	40c12a23          	sw	a2,1044(sp)
58022f92:	40d12c23          	sw	a3,1048(sp)
58022f96:	40e12e23          	sw	a4,1052(sp)
58022f9a:	42f12023          	sw	a5,1056(sp)
    if (console == NULL) {
58022f9e:	02030663          	beqz	t1,58022fca <printf+0x54>
58022fa2:	862a                	mv	a2,a0
        return 0;
    }

    va_start(ap, fmt);
58022fa4:	41010693          	addi	a3,sp,1040
    len = vsnprintf(print_buf, sizeof(print_buf), fmt, ap);
58022fa8:	40000593          	li	a1,1024
58022fac:	0048                	addi	a0,sp,4
    va_start(ap, fmt);
58022fae:	c036                	sw	a3,0(sp)
    len = vsnprintf(print_buf, sizeof(print_buf), fmt, ap);
58022fb0:	b64ff0ef          	jal	ra,58022314 <vsnprintf>
    va_end(ap);

    len = (len > sizeof(print_buf)) ? sizeof(print_buf) : len;
58022fb4:	40000793          	li	a5,1024
    len = vsnprintf(print_buf, sizeof(print_buf), fmt, ap);
58022fb8:	862a                	mv	a2,a0
    len = (len > sizeof(print_buf)) ? sizeof(print_buf) : len;
58022fba:	02a7e063          	bltu	a5,a0,58022fda <printf+0x64>

    bflb_uart_put(console, (uint8_t *)print_buf, len);
58022fbe:	4008                	lw	a0,0(s0)
58022fc0:	004c                	addi	a1,sp,4
58022fc2:	ca009097          	auipc	ra,0xca009
58022fc6:	03e080e7          	jalr	62(ra) # 2202c000 <bflb_uart_put>

    return 0;
}
58022fca:	40c12083          	lw	ra,1036(sp)
58022fce:	40812403          	lw	s0,1032(sp)
58022fd2:	4501                	li	a0,0
58022fd4:	42410113          	addi	sp,sp,1060
58022fd8:	8082                	ret
    len = (len > sizeof(print_buf)) ? sizeof(print_buf) : len;
58022fda:	40000613          	li	a2,1024
58022fde:	b7c5                	j	58022fbe <printf+0x48>

58022fe0 <bflb_uart_set_console>:
    return 0;
}

void bflb_uart_set_console(struct bflb_device_s *dev)
{
    console = dev;
58022fe0:	04a1a823          	sw	a0,80(gp) # 22034850 <console>
58022fe4:	8082                	ret

58022fe6 <log_start>:
    bflog_direct_resume(direct);

    /*!< resume record */
    bflog_resume(record);
#endif
}
58022fe6:	8082                	ret

58022fe8 <bflb_gpio_uart_init>:
    putreg32(regval, cfg_address);
#endif
}

void bflb_gpio_uart_init(struct bflb_device_s *dev, uint8_t pin, uint8_t uart_func)
{
58022fe8:	1141                	addi	sp,sp,-16
58022fea:	87ae                	mv	a5,a1
58022fec:	c22e                	sw	a1,4(sp)
    putreg32(regval, reg_base + GLB_UART_SIG_SEL_0_OFFSET);
#elif defined(BL616) || defined(BL808) || defined(BL606P) || defined(BL628)
#define GLB_UART_CFG1_OFFSET (0x154)
#define GLB_UART_CFG2_OFFSET (0x158)
    uint32_t regval2;
    sig = pin % 12;
58022fee:	45b1                	li	a1,12
58022ff0:	02b7f5b3          	remu	a1,a5,a1
{
58022ff4:	c426                	sw	s1,8(sp)
58022ff6:	c622                	sw	s0,12(sp)
58022ff8:	c02a                	sw	a0,0(sp)

    if (sig < 8) {
58022ffa:	479d                	li	a5,7
    reg_base = dev->reg_base;
58022ffc:	4144                	lw	s1,4(a0)
    if (sig < 8) {
58022ffe:	08b7e363          	bltu	a5,a1,58023084 <bflb_gpio_uart_init+0x9c>
        sig_pos = sig << 2;

        regval = getreg32(reg_base + GLB_UART_CFG1_OFFSET);
        regval &= (~(0x0f << sig_pos));
58023002:	00259713          	slli	a4,a1,0x2
        regval = getreg32(reg_base + GLB_UART_CFG1_OFFSET);
58023006:	1544a503          	lw	a0,340(s1)
        regval &= (~(0x0f << sig_pos));
5802300a:	47bd                	li	a5,15
5802300c:	00e797b3          	sll	a5,a5,a4
58023010:	fff7c793          	not	a5,a5
58023014:	8fe9                	and	a5,a5,a0
        regval |= (uart_func << sig_pos);
58023016:	00e61533          	sll	a0,a2,a4
5802301a:	8d5d                	or	a0,a0,a5
5802301c:	4701                	li	a4,0

        for (uint8_t i = 0; i < 8; i++) {
            /* reset other sigs which are the same with uart_func */
            sig_pos = i << 2;
            if (((regval & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
5802301e:	42bd                	li	t0,15
        for (uint8_t i = 0; i < 8; i++) {
58023020:	43a1                	li	t2,8
58023022:	a021                	j	5802302a <bflb_gpio_uart_init+0x42>
58023024:	0705                	addi	a4,a4,1
58023026:	02770a63          	beq	a4,t2,5802305a <bflb_gpio_uart_init+0x72>
            if (((regval & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
5802302a:	00271793          	slli	a5,a4,0x2
5802302e:	00f296b3          	sll	a3,t0,a5
58023032:	00a6f333          	and	t1,a3,a0
58023036:	00f617b3          	sll	a5,a2,a5
5802303a:	fef315e3          	bne	t1,a5,58023024 <bflb_gpio_uart_init+0x3c>
                regval &= (~(0x0f << sig_pos));
5802303e:	fff6c793          	not	a5,a3
            if (((regval & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
58023042:	0ff77313          	andi	t1,a4,255
                regval &= (~(0x0f << sig_pos));
58023046:	8fe9                	and	a5,a5,a0
            if (((regval & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
58023048:	fc658ee3          	beq	a1,t1,58023024 <bflb_gpio_uart_init+0x3c>
5802304c:	fc560ce3          	beq	a2,t0,58023024 <bflb_gpio_uart_init+0x3c>
        for (uint8_t i = 0; i < 8; i++) {
58023050:	0705                	addi	a4,a4,1
                regval |= (0x0f << sig_pos);
58023052:	00f6e533          	or	a0,a3,a5
        for (uint8_t i = 0; i < 8; i++) {
58023056:	fc771ae3          	bne	a4,t2,5802302a <bflb_gpio_uart_init+0x42>
            }
        }
        regval2 = getreg32(reg_base + GLB_UART_CFG2_OFFSET);
5802305a:	1584a683          	lw	a3,344(s1)
5802305e:	4781                	li	a5,0

        for (uint8_t i = 8; i < 12; i++) {
            /* reset other sigs which are the same with uart_func */
            sig_pos = (i - 8) << 2;
            if (((regval2 & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
58023060:	42bd                	li	t0,15
        for (uint8_t i = 8; i < 12; i++) {
58023062:	43c1                	li	t2,16
            if (((regval2 & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
58023064:	00f29733          	sll	a4,t0,a5
58023068:	00f615b3          	sll	a1,a2,a5
5802306c:	00d77333          	and	t1,a4,a3
        for (uint8_t i = 8; i < 12; i++) {
58023070:	0791                	addi	a5,a5,4
            if (((regval2 & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
58023072:	0cb30963          	beq	t1,a1,58023144 <bflb_gpio_uart_init+0x15c>
        for (uint8_t i = 8; i < 12; i++) {
58023076:	fe7797e3          	bne	a5,t2,58023064 <bflb_gpio_uart_init+0x7c>
                regval2 &= (~(0x0f << sig_pos));
                regval2 |= (0x0f << sig_pos);
            }
        }
        putreg32(regval, reg_base + GLB_UART_CFG1_OFFSET);
5802307a:	14a4aa23          	sw	a0,340(s1)
        putreg32(regval2, reg_base + GLB_UART_CFG2_OFFSET);
5802307e:	14d4ac23          	sw	a3,344(s1)
58023082:	a88d                	j	580230f4 <bflb_gpio_uart_init+0x10c>
    } else {
        sig_pos = (sig - 8) << 2;
58023084:	ff858713          	addi	a4,a1,-8
58023088:	070a                	slli	a4,a4,0x2

        regval = getreg32(reg_base + GLB_UART_CFG2_OFFSET);
        regval &= (~(0x0f << sig_pos));
5802308a:	0ff77713          	andi	a4,a4,255
        regval = getreg32(reg_base + GLB_UART_CFG2_OFFSET);
5802308e:	1584a683          	lw	a3,344(s1)
        regval &= (~(0x0f << sig_pos));
58023092:	47bd                	li	a5,15
58023094:	00e797b3          	sll	a5,a5,a4
58023098:	fff7c793          	not	a5,a5
5802309c:	8efd                	and	a3,a3,a5
        regval |= (uart_func << sig_pos);
5802309e:	00e617b3          	sll	a5,a2,a4
580230a2:	8fd5                	or	a5,a5,a3
580230a4:	4701                	li	a4,0

        for (uint8_t i = 8; i < 12; i++) {
580230a6:	46a1                	li	a3,8
            /* reset other sigs which are the same with uart_func */
            sig_pos = (i - 8) << 2;
            if (((regval & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
580230a8:	443d                	li	s0,15
580230aa:	00e41533          	sll	a0,s0,a4
580230ae:	00f573b3          	and	t2,a0,a5
580230b2:	00e612b3          	sll	t0,a2,a4
        for (uint8_t i = 8; i < 12; i++) {
580230b6:	00168313          	addi	t1,a3,1
            if (((regval & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
580230ba:	06538a63          	beq	t2,t0,5802312e <bflb_gpio_uart_init+0x146>
        for (uint8_t i = 8; i < 12; i++) {
580230be:	0ff37693          	andi	a3,t1,255
580230c2:	4531                	li	a0,12
580230c4:	0711                	addi	a4,a4,4
580230c6:	fea692e3          	bne	a3,a0,580230aa <bflb_gpio_uart_init+0xc2>
                regval &= (~(0x0f << sig_pos));
                regval |= (0x0f << sig_pos);
            }
        }
        regval2 = getreg32(reg_base + GLB_UART_CFG1_OFFSET);
580230ca:	1544a303          	lw	t1,340(s1)
580230ce:	4701                	li	a4,0

        for (uint8_t i = 0; i < 8; i++) {
            /* reset other sigs which are the same with uart_func */
            sig_pos = i << 2;
            if (((regval2 & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
580230d0:	42bd                	li	t0,15
        for (uint8_t i = 0; i < 8; i++) {
580230d2:	02000393          	li	t2,32
            if (((regval2 & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
580230d6:	00e296b3          	sll	a3,t0,a4
580230da:	00e615b3          	sll	a1,a2,a4
580230de:	0066f533          	and	a0,a3,t1
        for (uint8_t i = 0; i < 8; i++) {
580230e2:	0711                	addi	a4,a4,4
            if (((regval2 & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
580230e4:	02b50a63          	beq	a0,a1,58023118 <bflb_gpio_uart_init+0x130>
        for (uint8_t i = 0; i < 8; i++) {
580230e8:	fe7717e3          	bne	a4,t2,580230d6 <bflb_gpio_uart_init+0xee>
                regval2 &= (~(0x0f << sig_pos));
                regval2 |= (0x0f << sig_pos);
            }
        }
        putreg32(regval, reg_base + GLB_UART_CFG2_OFFSET);
580230ec:	14f4ac23          	sw	a5,344(s1)
        putreg32(regval2, reg_base + GLB_UART_CFG1_OFFSET);
580230f0:	1464aa23          	sw	t1,340(s1)
    cfg_address = reg_base + GLB_GPIO_CFG0_OFFSET + (pin << 2);
580230f4:	4782                	lw	a5,0(sp)
    }
#endif
    bflb_gpio_init(dev, pin, (7 << GPIO_FUNC_SHIFT) | GPIO_ALTERNATE | GPIO_PULLUP | GPIO_SMT_EN | GPIO_DRV_1);
}
580230f6:	4432                	lw	s0,12(sp)
580230f8:	44a2                	lw	s1,8(sp)
    cfg_address = reg_base + GLB_GPIO_CFG0_OFFSET + (pin << 2);
580230fa:	43cc                	lw	a1,4(a5)
580230fc:	6785                	lui	a5,0x1
580230fe:	8c478793          	addi	a5,a5,-1852 # 8c4 <StackSize+0x4c4>
58023102:	95be                	add	a1,a1,a5
58023104:	4792                	lw	a5,4(sp)
58023106:	078a                	slli	a5,a5,0x2
58023108:	95be                	add	a1,a1,a5
    putreg32(cfg, cfg_address);
5802310a:	404007b7          	lui	a5,0x40400
5802310e:	71778793          	addi	a5,a5,1815 # 40400717 <__HeapLimit+0x1e3c8717>
58023112:	c19c                	sw	a5,0(a1)
}
58023114:	0141                	addi	sp,sp,16
58023116:	8082                	ret
                regval2 &= (~(0x0f << sig_pos));
58023118:	fff6c593          	not	a1,a3
5802311c:	0065f5b3          	and	a1,a1,t1
            if (((regval2 & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
58023120:	fc5604e3          	beq	a2,t0,580230e8 <bflb_gpio_uart_init+0x100>
                regval2 |= (0x0f << sig_pos);
58023124:	00b6e333          	or	t1,a3,a1
        for (uint8_t i = 0; i < 8; i++) {
58023128:	fa7717e3          	bne	a4,t2,580230d6 <bflb_gpio_uart_init+0xee>
5802312c:	b7c1                	j	580230ec <bflb_gpio_uart_init+0x104>
                regval &= (~(0x0f << sig_pos));
5802312e:	fff54293          	not	t0,a0
58023132:	00f2f2b3          	and	t0,t0,a5
            if (((regval & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
58023136:	f8d584e3          	beq	a1,a3,580230be <bflb_gpio_uart_init+0xd6>
5802313a:	f88602e3          	beq	a2,s0,580230be <bflb_gpio_uart_init+0xd6>
                regval |= (0x0f << sig_pos);
5802313e:	005567b3          	or	a5,a0,t0
58023142:	bfb5                	j	580230be <bflb_gpio_uart_init+0xd6>
                regval2 &= (~(0x0f << sig_pos));
58023144:	fff74593          	not	a1,a4
58023148:	8df5                	and	a1,a1,a3
            if (((regval2 & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
5802314a:	f25606e3          	beq	a2,t0,58023076 <bflb_gpio_uart_init+0x8e>
                regval2 |= (0x0f << sig_pos);
5802314e:	00b766b3          	or	a3,a4,a1
        for (uint8_t i = 8; i < 12; i++) {
58023152:	f07799e3          	bne	a5,t2,58023064 <bflb_gpio_uart_init+0x7c>
58023156:	b715                	j	5802307a <bflb_gpio_uart_init+0x92>

58023158 <bflb_uart_init>:
#include "bflb_uart.h"
#include "bflb_clock.h"
#include "hardware/uart_reg.h"

void bflb_uart_init(struct bflb_device_s *dev, const struct bflb_uart_config_s *config)
{
58023158:	1151                	addi	sp,sp,-12
5802315a:	c222                	sw	s0,4(sp)
5802315c:	c026                	sw	s1,0(sp)
5802315e:	c406                	sw	ra,8(sp)
58023160:	84ae                	mv	s1,a1
    uint32_t reg_base;
    uint32_t regval;

    reg_base = dev->reg_base;
    /* Cal the baud rate divisor */
    div = (bflb_clk_get_peripheral_clock(BFLB_DEVICE_TYPE_UART, dev->idx) * 10 / config->baudrate + 5) / 10;
58023162:	00954583          	lbu	a1,9(a0)
{
58023166:	87aa                	mv	a5,a0
    div = (bflb_clk_get_peripheral_clock(BFLB_DEVICE_TYPE_UART, dev->idx) * 10 / config->baudrate + 5) / 10;
58023168:	4515                	li	a0,5
    reg_base = dev->reg_base;
5802316a:	43c0                	lw	s0,4(a5)
    div = (bflb_clk_get_peripheral_clock(BFLB_DEVICE_TYPE_UART, dev->idx) * 10 / config->baudrate + 5) / 10;
5802316c:	3b0010ef          	jal	ra,5802451c <bflb_clk_get_peripheral_clock>
58023170:	45a9                	li	a1,10
58023172:	02b507b3          	mul	a5,a0,a1
58023176:	4088                	lw	a0,0(s1)

    tx_cfg = getreg32(reg_base + UART_UTX_CONFIG_OFFSET);
58023178:	4010                	lw	a2,0(s0)
    rx_cfg = getreg32(reg_base + UART_URX_CONFIG_OFFSET);
5802317a:	4058                	lw	a4,4(s0)
    /* configure parity type */

    tx_cfg = getreg32(reg_base + UART_UTX_CONFIG_OFFSET);
    rx_cfg = getreg32(reg_base + UART_URX_CONFIG_OFFSET);

    switch (config->parity) {
5802317c:	4685                	li	a3,1
    tx_cfg &= ~UART_CR_UTX_EN;
5802317e:	9a79                	andi	a2,a2,-2
    putreg32(tx_cfg, reg_base + UART_UTX_CONFIG_OFFSET);
58023180:	c010                	sw	a2,0(s0)
    rx_cfg &= ~UART_CR_URX_EN;
58023182:	9b79                	andi	a4,a4,-2
    putreg32(rx_cfg, reg_base + UART_URX_CONFIG_OFFSET);
58023184:	c058                	sw	a4,4(s0)
    div = (bflb_clk_get_peripheral_clock(BFLB_DEVICE_TYPE_UART, dev->idx) * 10 / config->baudrate + 5) / 10;
58023186:	02a7d7b3          	divu	a5,a5,a0
5802318a:	0795                	addi	a5,a5,5
5802318c:	02b7d7b3          	divu	a5,a5,a1
    putreg32(((div - 1) << 0x10) | ((div - 1) & 0xFFFF), reg_base + UART_BIT_PRD_OFFSET);
58023190:	17fd                	addi	a5,a5,-1
58023192:	01079713          	slli	a4,a5,0x10
58023196:	07c2                	slli	a5,a5,0x10
58023198:	83c1                	srli	a5,a5,0x10
5802319a:	8fd9                	or	a5,a5,a4
5802319c:	c41c                	sw	a5,8(s0)
    switch (config->parity) {
5802319e:	0074c783          	lbu	a5,7(s1)
    tx_cfg = getreg32(reg_base + UART_UTX_CONFIG_OFFSET);
580231a2:	4018                	lw	a4,0(s0)
    rx_cfg = getreg32(reg_base + UART_URX_CONFIG_OFFSET);
580231a4:	4050                	lw	a2,4(s0)
    switch (config->parity) {
580231a6:	0ad78d63          	beq	a5,a3,58023260 <bflb_uart_init+0x108>
580231aa:	4689                	li	a3,2
580231ac:	0cd78263          	beq	a5,a3,58023270 <bflb_uart_init+0x118>
580231b0:	0a078d63          	beqz	a5,5802326a <bflb_uart_init+0x112>
            break;
    }

    /* Configure data bits */
    tx_cfg &= ~UART_CR_UTX_BIT_CNT_D_MASK;
    tx_cfg |= (config->data_bits + 4) << UART_CR_UTX_BIT_CNT_D_SHIFT;
580231b4:	0054c783          	lbu	a5,5(s1)
    rx_cfg &= ~UART_CR_URX_BIT_CNT_D_MASK;
    rx_cfg |= (config->data_bits + 4) << UART_CR_URX_BIT_CNT_D_SHIFT;

    /* Configure tx stop bits */
    tx_cfg &= ~UART_CR_UTX_BIT_CNT_P_MASK;
    tx_cfg |= config->stop_bits << UART_CR_UTX_BIT_CNT_P_SHIFT;
580231b8:	0064c683          	lbu	a3,6(s1)

    /* Configure tx cts flow control function */
    if (config->flow_ctrl & UART_FLOWCTRL_CTS) {
580231bc:	0094c583          	lbu	a1,9(s1)
    tx_cfg |= (config->data_bits + 4) << UART_CR_UTX_BIT_CNT_D_SHIFT;
580231c0:	0791                	addi	a5,a5,4
580231c2:	07a2                	slli	a5,a5,0x8
    tx_cfg &= ~UART_CR_UTX_BIT_CNT_D_MASK;
580231c4:	8ff77713          	andi	a4,a4,-1793
    tx_cfg &= ~UART_CR_UTX_BIT_CNT_P_MASK;
580231c8:	7579                	lui	a0,0xffffe
    tx_cfg |= (config->data_bits + 4) << UART_CR_UTX_BIT_CNT_D_SHIFT;
580231ca:	8f5d                	or	a4,a4,a5
    tx_cfg &= ~UART_CR_UTX_BIT_CNT_P_MASK;
580231cc:	7ff50513          	addi	a0,a0,2047 # ffffe7ff <__etext_final+0xa7fd8c0b>
    rx_cfg &= ~UART_CR_URX_BIT_CNT_D_MASK;
580231d0:	8ff67613          	andi	a2,a2,-1793
    tx_cfg &= ~UART_CR_UTX_BIT_CNT_P_MASK;
580231d4:	8f69                	and	a4,a4,a0
    tx_cfg |= config->stop_bits << UART_CR_UTX_BIT_CNT_P_SHIFT;
580231d6:	06ae                	slli	a3,a3,0xb
    if (config->flow_ctrl & UART_FLOWCTRL_CTS) {
580231d8:	8989                	andi	a1,a1,2
    rx_cfg |= (config->data_bits + 4) << UART_CR_URX_BIT_CNT_D_SHIFT;
580231da:	8fd1                	or	a5,a5,a2
    tx_cfg |= config->stop_bits << UART_CR_UTX_BIT_CNT_P_SHIFT;
580231dc:	8f55                	or	a4,a4,a3
    if (config->flow_ctrl & UART_FLOWCTRL_CTS) {
580231de:	cdbd                	beqz	a1,5802325c <bflb_uart_init+0x104>
        tx_cfg |= UART_CR_UTX_CTS_EN;
580231e0:	00276713          	ori	a4,a4,2
    }

    rx_cfg &= ~UART_CR_URX_DEG_EN;

    /* Write back */
    putreg32(tx_cfg, reg_base + UART_UTX_CONFIG_OFFSET);
580231e4:	c018                	sw	a4,0(s0)
    rx_cfg &= ~UART_CR_URX_DEG_EN;
580231e6:	777d                	lui	a4,0xfffff
580231e8:	7ff70713          	addi	a4,a4,2047 # fffff7ff <__etext_final+0xa7fd9c0b>
580231ec:	8ff9                	and	a5,a5,a4
    putreg32(rx_cfg, reg_base + UART_URX_CONFIG_OFFSET);
580231ee:	c05c                	sw	a5,4(s0)
    regval = getreg32(reg_base + UART_URX_CONFIG_OFFSET);
    regval &= ~UART_CR_URX_RTS_SW_MODE;
    putreg32(regval, reg_base + UART_URX_CONFIG_OFFSET);

#else
    regval = getreg32(reg_base + UART_SW_MODE_OFFSET);
580231f0:	4c5c                	lw	a5,28(s0)

    /* Configure FIFO thresholds */
    regval = getreg32(reg_base + UART_FIFO_CONFIG_1_OFFSET);
    regval &= ~UART_TX_FIFO_TH_MASK;
    regval &= ~UART_RX_FIFO_TH_MASK;
    regval |= (config->tx_fifo_threshold << UART_TX_FIFO_TH_SHIFT) & UART_TX_FIFO_TH_MASK;
580231f2:	001f0637          	lui	a2,0x1f0
    rx_cfg = getreg32(reg_base + UART_URX_CONFIG_OFFSET);
    tx_cfg |= UART_CR_UTX_EN;
    rx_cfg |= UART_CR_URX_EN;
    putreg32(tx_cfg, reg_base + UART_UTX_CONFIG_OFFSET);
    putreg32(rx_cfg, reg_base + UART_URX_CONFIG_OFFSET);
}
580231f6:	40a2                	lw	ra,8(sp)
    regval &= ~UART_CR_URX_RTS_SW_MODE;
580231f8:	9bed                	andi	a5,a5,-5
    putreg32(regval, reg_base + UART_SW_MODE_OFFSET);
580231fa:	cc5c                	sw	a5,28(s0)
    regval = getreg32(reg_base + UART_DATA_CONFIG_OFFSET);
580231fc:	445c                	lw	a5,12(s0)
    regval &= ~UART_CR_UART_BIT_INV;
580231fe:	9bf9                	andi	a5,a5,-2
    putreg32(regval, reg_base + UART_DATA_CONFIG_OFFSET);
58023200:	c45c                	sw	a5,12(s0)
    regval = getreg32(reg_base + UART_UTX_CONFIG_OFFSET);
58023202:	401c                	lw	a5,0(s0)
    regval |= UART_CR_UTX_FRM_EN;
58023204:	0047e793          	ori	a5,a5,4
    putreg32(regval, reg_base + UART_UTX_CONFIG_OFFSET);
58023208:	c01c                	sw	a5,0(s0)
    regval |= (config->tx_fifo_threshold << UART_TX_FIFO_TH_SHIFT) & UART_TX_FIFO_TH_MASK;
5802320a:	00a4c783          	lbu	a5,10(s1)
    regval |= (config->rx_fifo_threshold << UART_RX_FIFO_TH_SHIFT) & UART_RX_FIFO_TH_MASK;
5802320e:	00b4c703          	lbu	a4,11(s1)
    regval = getreg32(reg_base + UART_FIFO_CONFIG_1_OFFSET);
58023212:	08442683          	lw	a3,132(s0)
    regval |= (config->tx_fifo_threshold << UART_TX_FIFO_TH_SHIFT) & UART_TX_FIFO_TH_MASK;
58023216:	07c2                	slli	a5,a5,0x10
58023218:	8ff1                	and	a5,a5,a2
    regval |= (config->rx_fifo_threshold << UART_RX_FIFO_TH_SHIFT) & UART_RX_FIFO_TH_MASK;
5802321a:	0762                	slli	a4,a4,0x18
5802321c:	1f000637          	lui	a2,0x1f000
58023220:	8f71                	and	a4,a4,a2
    regval &= ~UART_RX_FIFO_TH_MASK;
58023222:	e0e10637          	lui	a2,0xe0e10
58023226:	167d                	addi	a2,a2,-1
    regval |= (config->rx_fifo_threshold << UART_RX_FIFO_TH_SHIFT) & UART_RX_FIFO_TH_MASK;
58023228:	8fd9                	or	a5,a5,a4
    regval &= ~UART_RX_FIFO_TH_MASK;
5802322a:	8ef1                	and	a3,a3,a2
    regval |= (config->rx_fifo_threshold << UART_RX_FIFO_TH_SHIFT) & UART_RX_FIFO_TH_MASK;
5802322c:	8fd5                	or	a5,a5,a3
    putreg32(regval, reg_base + UART_FIFO_CONFIG_1_OFFSET);
5802322e:	08f42223          	sw	a5,132(s0)
    regval = getreg32(reg_base + UART_FIFO_CONFIG_0_OFFSET);
58023232:	08042783          	lw	a5,128(s0)
}
58023236:	4482                	lw	s1,0(sp)
58023238:	9bf1                	andi	a5,a5,-4
    regval &= ~UART_DMA_RX_EN;
5802323a:	00c7e793          	ori	a5,a5,12
    putreg32(regval, reg_base + UART_FIFO_CONFIG_0_OFFSET);
5802323e:	08f42023          	sw	a5,128(s0)
    putreg32(0xFFFFFFFF, reg_base + UART_INT_MASK_OFFSET);
58023242:	57fd                	li	a5,-1
58023244:	d05c                	sw	a5,36(s0)
    tx_cfg = getreg32(reg_base + UART_UTX_CONFIG_OFFSET);
58023246:	4018                	lw	a4,0(s0)
    rx_cfg = getreg32(reg_base + UART_URX_CONFIG_OFFSET);
58023248:	405c                	lw	a5,4(s0)
    tx_cfg |= UART_CR_UTX_EN;
5802324a:	00176713          	ori	a4,a4,1
    putreg32(tx_cfg, reg_base + UART_UTX_CONFIG_OFFSET);
5802324e:	c018                	sw	a4,0(s0)
    rx_cfg |= UART_CR_URX_EN;
58023250:	0017e793          	ori	a5,a5,1
    putreg32(rx_cfg, reg_base + UART_URX_CONFIG_OFFSET);
58023254:	c05c                	sw	a5,4(s0)
}
58023256:	4412                	lw	s0,4(sp)
58023258:	0131                	addi	sp,sp,12
5802325a:	8082                	ret
        tx_cfg &= ~UART_CR_UTX_CTS_EN;
5802325c:	9b75                	andi	a4,a4,-3
5802325e:	b759                	j	580231e4 <bflb_uart_init+0x8c>
            tx_cfg |= UART_CR_UTX_PRT_SEL;
58023260:	03076713          	ori	a4,a4,48
            rx_cfg |= UART_CR_URX_PRT_SEL;
58023264:	03066613          	ori	a2,a2,48
            break;
58023268:	b7b1                	j	580231b4 <bflb_uart_init+0x5c>
            tx_cfg &= ~UART_CR_UTX_PRT_EN;
5802326a:	9b3d                	andi	a4,a4,-17
            rx_cfg &= ~UART_CR_URX_PRT_EN;
5802326c:	9a3d                	andi	a2,a2,-17
            break;
5802326e:	b799                	j	580231b4 <bflb_uart_init+0x5c>
            tx_cfg &= ~UART_CR_UTX_PRT_SEL;
58023270:	fdf77713          	andi	a4,a4,-33
58023274:	fdf67613          	andi	a2,a2,-33
58023278:	01076713          	ori	a4,a4,16
            rx_cfg &= ~UART_CR_URX_PRT_SEL;
5802327c:	01066613          	ori	a2,a2,16
            break;
58023280:	bf15                	j	580231b4 <bflb_uart_init+0x5c>

58023282 <irq_unexpected_isr>:
#endif

extern struct bflb_irq_info_s g_irqvector[];

static void irq_unexpected_isr(int irq, void *arg)
{
58023282:	85aa                	mv	a1,a0
    printf("irq :%d unregistered\r\n", irq);
58023284:	58024537          	lui	a0,0x58024
58023288:	7e850513          	addi	a0,a0,2024 # 580247e8 <powers_of_10+0x90>
5802328c:	b1ed                	j	58022f76 <printf>

5802328e <bflb_irq_initialize>:
void bflb_irq_initialize(void)
{
    int i;

    /* Point all interrupt vectors to the unexpected interrupt */
    for (i = 0; i < CONFIG_IRQ_NUM; i++) {
5802328e:	dd018793          	addi	a5,gp,-560 # 220345d0 <g_irqvector>
58023292:	58023737          	lui	a4,0x58023
58023296:	28078693          	addi	a3,a5,640
5802329a:	28270713          	addi	a4,a4,642 # 58023282 <irq_unexpected_isr>
        g_irqvector[i].handler = irq_unexpected_isr;
5802329e:	c398                	sw	a4,0(a5)
        g_irqvector[i].arg = NULL;
580232a0:	0007a223          	sw	zero,4(a5)
    for (i = 0; i < CONFIG_IRQ_NUM; i++) {
580232a4:	07a1                	addi	a5,a5,8
580232a6:	fed79ce3          	bne	a5,a3,5802329e <bflb_irq_initialize+0x10>
    }
}
580232aa:	8082                	ret

580232ac <bflb_device_get_by_name>:
      .user_data = NULL },
};
#endif

struct bflb_device_s *bflb_device_get_by_name(const char *name)
{
580232ac:	1141                	addi	sp,sp,-16
580232ae:	220347b7          	lui	a5,0x22034
580232b2:	c422                	sw	s0,8(sp)
580232b4:	c226                	sw	s1,4(sp)
580232b6:	c606                	sw	ra,12(sp)
580232b8:	85aa                	mv	a1,a0
580232ba:	00078413          	mv	s0,a5
580232be:	4481                	li	s1,0
580232c0:	a031                	j	580232cc <bflb_device_get_by_name+0x20>
    for (uint8_t i = 0; i < sizeof(bl808_device_table) / sizeof(bl808_device_table[0]); i++) {
580232c2:	0485                	addi	s1,s1,1
580232c4:	02900793          	li	a5,41
580232c8:	02f48663          	beq	s1,a5,580232f4 <bflb_device_get_by_name+0x48>
        if (strcmp(bl808_device_table[i].name, name) == 0) {
580232cc:	4008                	lw	a0,0(s0)
580232ce:	c02e                	sw	a1,0(sp)
    for (uint8_t i = 0; i < sizeof(bl808_device_table) / sizeof(bl808_device_table[0]); i++) {
580232d0:	0441                	addi	s0,s0,16
        if (strcmp(bl808_device_table[i].name, name) == 0) {
580232d2:	c5dfe0ef          	jal	ra,58021f2e <strcmp>
580232d6:	4582                	lw	a1,0(sp)
580232d8:	f56d                	bnez	a0,580232c2 <bflb_device_get_by_name+0x16>
            return &bl808_device_table[i];
        }
    }
    return NULL;
}
580232da:	40b2                	lw	ra,12(sp)
580232dc:	4422                	lw	s0,8(sp)
            return &bl808_device_table[i];
580232de:	220347b7          	lui	a5,0x22034
580232e2:	00449713          	slli	a4,s1,0x4
580232e6:	00078793          	mv	a5,a5
}
580232ea:	4492                	lw	s1,4(sp)
            return &bl808_device_table[i];
580232ec:	00e78533          	add	a0,a5,a4
}
580232f0:	0141                	addi	sp,sp,16
580232f2:	8082                	ret
580232f4:	40b2                	lw	ra,12(sp)
580232f6:	4422                	lw	s0,8(sp)
580232f8:	4492                	lw	s1,4(sp)
    return NULL;
580232fa:	4501                	li	a0,0
}
580232fc:	0141                	addi	sp,sp,16
580232fe:	8082                	ret

58023300 <start_load>:

    /* Copy ITCM code */
    pSrc = &__itcm_load_addr;
    pDest = &__tcm_code_start__;

    for (; pDest < &__tcm_code_end__;) {
58023300:	2202c737          	lui	a4,0x2202c
58023304:	2202d7b7          	lui	a5,0x2202d
58023308:	00070613          	mv	a2,a4
5802330c:	aac78793          	addi	a5,a5,-1364 # 2202caac <__tcm_code_end__>
58023310:	02f67763          	bgeu	a2,a5,5802333e <start_load+0x3e>
58023314:	fff78693          	addi	a3,a5,-1
58023318:	8e91                	sub	a3,a3,a2
5802331a:	580257b7          	lui	a5,0x58025
5802331e:	9af1                	andi	a3,a3,-4
58023320:	eb878613          	addi	a2,a5,-328 # 58024eb8 <__text_code_end__>
58023324:	0691                	addi	a3,a3,4
58023326:	96b2                	add	a3,a3,a2
    pDest = &__tcm_code_start__;
58023328:	00070713          	mv	a4,a4
    pSrc = &__itcm_load_addr;
5802332c:	eb878793          	addi	a5,a5,-328
        *pDest++ = *pSrc++;
58023330:	4390                	lw	a2,0(a5)
58023332:	0791                	addi	a5,a5,4
58023334:	0711                	addi	a4,a4,4
58023336:	fec72e23          	sw	a2,-4(a4) # 2202bffc <HeapMinSize+0x2202affc>
    for (; pDest < &__tcm_code_end__;) {
5802333a:	fed79be3          	bne	a5,a3,58023330 <start_load+0x30>

    /* Copy DTCM code */
    pSrc = &__dtcm_load_addr;
    pDest = &__tcm_data_start__;

    for (; pDest < &__tcm_data_end__;) {
5802333e:	22030737          	lui	a4,0x22030
58023342:	220307b7          	lui	a5,0x22030
58023346:	00070613          	mv	a2,a4
5802334a:	00078793          	mv	a5,a5
5802334e:	02f67763          	bgeu	a2,a5,5802337c <start_load+0x7c>
58023352:	fff78693          	addi	a3,a5,-1 # 2202ffff <__tcm_code_end__+0x3553>
58023356:	8e91                	sub	a3,a3,a2
58023358:	580267b7          	lui	a5,0x58026
5802335c:	9af1                	andi	a3,a3,-4
5802335e:	96478613          	addi	a2,a5,-1692 # 58025964 <__dtcm_load_addr>
58023362:	0691                	addi	a3,a3,4
58023364:	96b2                	add	a3,a3,a2
    pDest = &__tcm_data_start__;
58023366:	00070713          	mv	a4,a4
    pSrc = &__dtcm_load_addr;
5802336a:	96478793          	addi	a5,a5,-1692
        *pDest++ = *pSrc++;
5802336e:	4390                	lw	a2,0(a5)
58023370:	0791                	addi	a5,a5,4
58023372:	0711                	addi	a4,a4,4
58023374:	fec72e23          	sw	a2,-4(a4) # 2202fffc <__tcm_code_end__+0x3550>
    for (; pDest < &__tcm_data_end__;) {
58023378:	fed79be3          	bne	a5,a3,5802336e <start_load+0x6e>

    /* BF Add OCARAM data copy */
    pSrc = &__ram_load_addr;
    pDest = &__ram_data_start__;

    for (; pDest < &__ram_data_end__;) {
5802337c:	22034737          	lui	a4,0x22034
58023380:	00070613          	mv	a2,a4
58023384:	a9018793          	addi	a5,gp,-1392 # 22034290 <__bflog_tags_end__>
58023388:	02f67763          	bgeu	a2,a5,580233b6 <start_load+0xb6>
5802338c:	fff78693          	addi	a3,a5,-1
58023390:	8e91                	sub	a3,a3,a2
58023392:	580267b7          	lui	a5,0x58026
58023396:	9af1                	andi	a3,a3,-4
58023398:	96478613          	addi	a2,a5,-1692 # 58025964 <__dtcm_load_addr>
5802339c:	0691                	addi	a3,a3,4
5802339e:	96b2                	add	a3,a3,a2
    pDest = &__ram_data_start__;
580233a0:	00070713          	mv	a4,a4
    pSrc = &__ram_load_addr;
580233a4:	96478793          	addi	a5,a5,-1692
        *pDest++ = *pSrc++;
580233a8:	4390                	lw	a2,0(a5)
580233aa:	0791                	addi	a5,a5,4
580233ac:	0711                	addi	a4,a4,4
580233ae:	fec72e23          	sw	a2,-4(a4) # 22033ffc <__StackLimit+0x3fc>
    for (; pDest < &__ram_data_end__;) {
580233b2:	fed79be3          	bne	a5,a3,580233a8 <start_load+0xa8>

    /* BF Add no cache ram data copy */
    pSrc = &__nocache_ram_load_addr;
    pDest = &__nocache_ram_data_start__;

    for (; pDest < &__nocache_ram_data_end__;) {
580233b6:	22030737          	lui	a4,0x22030
580233ba:	220307b7          	lui	a5,0x22030
580233be:	00070613          	mv	a2,a4
580233c2:	00078793          	mv	a5,a5
580233c6:	02f67763          	bgeu	a2,a5,580233f4 <start_load+0xf4>
580233ca:	fff78693          	addi	a3,a5,-1 # 2202ffff <__tcm_code_end__+0x3553>
580233ce:	8e91                	sub	a3,a3,a2
580233d0:	580267b7          	lui	a5,0x58026
580233d4:	9af1                	andi	a3,a3,-4
580233d6:	96478613          	addi	a2,a5,-1692 # 58025964 <__dtcm_load_addr>
580233da:	0691                	addi	a3,a3,4
580233dc:	96b2                	add	a3,a3,a2
    pDest = &__nocache_ram_data_start__;
580233de:	00070713          	mv	a4,a4
    pSrc = &__nocache_ram_load_addr;
580233e2:	96478793          	addi	a5,a5,-1692
        *pDest++ = *pSrc++;
580233e6:	4390                	lw	a2,0(a5)
580233e8:	0791                	addi	a5,a5,4
580233ea:	0711                	addi	a4,a4,4
580233ec:	fec72e23          	sw	a2,-4(a4) # 2202fffc <__tcm_code_end__+0x3550>
    for (; pDest < &__nocache_ram_data_end__;) {
580233f0:	fef69be3          	bne	a3,a5,580233e6 <start_load+0xe6>
	 *
	 *  Both addresses must be aligned to 4 bytes boundary.
	 */
    pDest = &__bss_start__;

    for (; pDest < &__bss_end__;) {
580233f4:	a9018713          	addi	a4,gp,-1392 # 22034290 <__bflog_tags_end__>
580233f8:	05818693          	addi	a3,gp,88 # 22034858 <__HeapBase>
580233fc:	00d77e63          	bgeu	a4,a3,58023418 <start_load+0x118>
58023400:	16fd                	addi	a3,a3,-1
58023402:	8e99                	sub	a3,a3,a4
58023404:	9af1                	andi	a3,a3,-4
58023406:	0691                	addi	a3,a3,4
58023408:	9736                	add	a4,a4,a3
    pDest = &__bss_start__;
5802340a:	a9018793          	addi	a5,gp,-1392 # 22034290 <__bflog_tags_end__>
        *pDest++ = 0ul;
5802340e:	0791                	addi	a5,a5,4
58023410:	fe07ae23          	sw	zero,-4(a5)
    for (; pDest < &__bss_end__;) {
58023414:	fef71de3          	bne	a4,a5,5802340e <start_load+0x10e>
    }

#endif
}
58023418:	8082                	ret

5802341a <SystemInit>:
void SystemInit(void)
{
    uint32_t i = 0;

    /* get interrupt level from info */
    CLIC->CLICCFG = (((CLIC->CLICINFO & CLIC_INFO_CLICINTCTLBITS_Msk) >> CLIC_INFO_CLICINTCTLBITS_Pos) << CLIC_CLICCFG_NLBIT_Pos);
5802341a:	e08006b7          	lui	a3,0xe0800
5802341e:	42dc                	lw	a5,4(a3)
58023420:	0006c603          	lbu	a2,0(a3) # e0800000 <__etext_final+0x887da40c>

    /* Every interrupt should be clear by software*/
    for (i = 0; i < IRQn_LAST; i++) {
58023424:	4701                	li	a4,0
    CLIC->CLICCFG = (((CLIC->CLICINFO & CLIC_INFO_CLICINTCTLBITS_Msk) >> CLIC_INFO_CLICINTCTLBITS_Pos) << CLIC_CLICCFG_NLBIT_Pos);
58023426:	83d1                	srli	a5,a5,0x14
58023428:	8bf9                	andi	a5,a5,30
5802342a:	00f68023          	sb	a5,0(a3)
    for (i = 0; i < IRQn_LAST; i++) {
5802342e:	e0800537          	lui	a0,0xe0800
        CLIC->CLICINT[i].IE = 0;
58023432:	6585                	lui	a1,0x1
        CLIC->CLICINT[i].IP = 0;
        CLIC->CLICINT[i].ATTR = 1; /* use vector interrupt */
58023434:	4605                	li	a2,1
    for (i = 0; i < IRQn_LAST; i++) {
58023436:	05000693          	li	a3,80
        CLIC->CLICINT[i].IE = 0;
5802343a:	00271793          	slli	a5,a4,0x2
5802343e:	97aa                	add	a5,a5,a0
58023440:	97ae                	add	a5,a5,a1
58023442:	000780a3          	sb	zero,1(a5)
        CLIC->CLICINT[i].IP = 0;
58023446:	00078023          	sb	zero,0(a5)
        CLIC->CLICINT[i].ATTR = 1; /* use vector interrupt */
5802344a:	00c78123          	sb	a2,2(a5)
    for (i = 0; i < IRQn_LAST; i++) {
5802344e:	0705                	addi	a4,a4,1
58023450:	fed715e3          	bne	a4,a3,5802343a <SystemInit+0x20>
    }

    CLIC->CLICINT[MSOFT_IRQn].ATTR = 0x3;
58023454:	e08017b7          	lui	a5,0xe0801
58023458:	470d                	li	a4,3
5802345a:	00e78723          	sb	a4,14(a5) # e080100e <__etext_final+0x887db41a>
}
5802345e:	8082                	ret

58023460 <System_Post_Init>:
  \details Enables IRQ interrupts by setting the IE-bit in the PSR.
           Can only be executed in Privileged modes.
 */
__ALWAYS_STATIC_INLINE void __enable_irq(void)
{
    __ASM volatile("csrs mstatus, 8");
58023460:	30046073          	csrsi	mstatus,8

void System_Post_Init(void)
{
    /* global IRQ enable */
    __enable_irq();
58023464:	8082                	ret

58023466 <exception_entry>:
{
    unsigned long cause;
    unsigned long epc;
    unsigned long tval;

    printf("exception_entry\r\n");
58023466:	58025537          	lui	a0,0x58025
{
5802346a:	715d                	addi	sp,sp,-80
    printf("exception_entry\r\n");
5802346c:	ab850513          	addi	a0,a0,-1352 # 58024ab8 <powers_of_10+0x360>
{
58023470:	c686                	sw	ra,76(sp)
58023472:	c4a2                	sw	s0,72(sp)
58023474:	c2a6                	sw	s1,68(sp)
    printf("exception_entry\r\n");
58023476:	3601                	jal	58022f76 <printf>

    cause = READ_CSR(CSR_MCAUSE);
58023478:	342024f3          	csrr	s1,mcause
    printf("mcause=%08x\r\n", (int)cause);
5802347c:	58025537          	lui	a0,0x58025
58023480:	85a6                	mv	a1,s1
58023482:	acc50513          	addi	a0,a0,-1332 # 58024acc <powers_of_10+0x374>
58023486:	3cc5                	jal	58022f76 <printf>
    epc = READ_CSR(CSR_MEPC);
58023488:	34102473          	csrr	s0,mepc
    printf("mepc:%08x\r\n", (int)epc);
5802348c:	58025537          	lui	a0,0x58025
58023490:	85a2                	mv	a1,s0
58023492:	adc50513          	addi	a0,a0,-1316 # 58024adc <powers_of_10+0x384>
58023496:	34c5                	jal	58022f76 <printf>
    tval = READ_CSR(CSR_MTVAL);
58023498:	343025f3          	csrr	a1,mtval
    printf("mtval:%08x\r\n", (int)tval);
5802349c:	58025537          	lui	a0,0x58025
580234a0:	ae850513          	addi	a0,a0,-1304 # 58024ae8 <powers_of_10+0x390>
580234a4:	3cc9                	jal	58022f76 <printf>

    cause = (cause & 0x3ff);

    const char *mcause_str[] = {
580234a6:	580257b7          	lui	a5,0x58025
580234aa:	b0078793          	addi	a5,a5,-1280 # 58024b00 <powers_of_10+0x3a8>
    cause = (cause & 0x3ff);
580234ae:	3ff4f613          	andi	a2,s1,1023
    const char *mcause_str[] = {
580234b2:	0058                	addi	a4,sp,4
580234b4:	04078293          	addi	t0,a5,64
580234b8:	0007a303          	lw	t1,0(a5)
580234bc:	43c8                	lw	a0,4(a5)
580234be:	478c                	lw	a1,8(a5)
580234c0:	47d4                	lw	a3,12(a5)
580234c2:	00672023          	sw	t1,0(a4)
580234c6:	c348                	sw	a0,4(a4)
580234c8:	c70c                	sw	a1,8(a4)
580234ca:	c754                	sw	a3,12(a4)
580234cc:	07c1                	addi	a5,a5,16
580234ce:	0741                	addi	a4,a4,16
580234d0:	fe5794e3          	bne	a5,t0,580234b8 <exception_entry+0x52>
        "Load page fault",
        "RSVD",
        "Store/AMO page fault"
    };

    printf("%s\r\n", mcause_str[cause & 0xf]);
580234d4:	00f4f793          	andi	a5,s1,15
580234d8:	00d8                	addi	a4,sp,68
580234da:	078a                	slli	a5,a5,0x2
580234dc:	97ba                	add	a5,a5,a4
580234de:	fc07a583          	lw	a1,-64(a5)
580234e2:	58025537          	lui	a0,0x58025
580234e6:	af850513          	addi	a0,a0,-1288 # 58024af8 <powers_of_10+0x3a0>
580234ea:	c032                	sw	a2,0(sp)
580234ec:	3469                	jal	58022f76 <printf>
    printf("s7 = 0x%08x  ", regs[REG_S7]); printf("\n\r");
    printf("s8 = 0x%08x  ", regs[REG_S8]); printf("s9 = 0x%08x  ", regs[REG_S9]); printf("s10 = 0x%08x ", regs[REG_S10]);
    printf("s11 = 0x%08x  ", regs[REG_S11]); printf("\n\r");
#endif
    // clang-format on
    if ((cause == 8) || (cause == 11)) {
580234ee:	4602                	lw	a2,0(sp)
580234f0:	47a1                	li	a5,8
580234f2:	00f60663          	beq	a2,a5,580234fe <exception_entry+0x98>
580234f6:	47ad                	li	a5,11
580234f8:	00f60363          	beq	a2,a5,580234fe <exception_entry+0x98>
        epc += 4;
        WRITE_CSR(CSR_MEPC, epc);
    } else {
        while (1) {
580234fc:	a001                	j	580234fc <exception_entry+0x96>
        epc += 4;
580234fe:	0411                	addi	s0,s0,4
        WRITE_CSR(CSR_MEPC, epc);
58023500:	34141073          	csrw	mepc,s0
        }
    }
}
58023504:	40b6                	lw	ra,76(sp)
58023506:	4426                	lw	s0,72(sp)
58023508:	4496                	lw	s1,68(sp)
5802350a:	6161                	addi	sp,sp,80
5802350c:	8082                	ret

5802350e <interrupt_entry>:

void interrupt_entry(void)
{
5802350e:	1171                	addi	sp,sp,-4
    irq_callback handler;
    void *arg;
    volatile uint32_t mcause = 0UL;
58023510:	c002                	sw	zero,0(sp)
    uint32_t irq_num;

    mcause = READ_CSR(CSR_MCAUSE);
58023512:	342027f3          	csrr	a5,mcause
58023516:	c03e                	sw	a5,0(sp)
    irq_num = mcause & 0x3FF;
58023518:	4502                	lw	a0,0(sp)

    if (irq_num < CONFIG_IRQ_NUM) {
5802351a:	04f00793          	li	a5,79
    irq_num = mcause & 0x3FF;
5802351e:	3ff57513          	andi	a0,a0,1023
    if (irq_num < CONFIG_IRQ_NUM) {
58023522:	00a7ec63          	bltu	a5,a0,5802353a <interrupt_entry+0x2c>
        handler = g_irqvector[irq_num].handler;
58023526:	dd018713          	addi	a4,gp,-560 # 220345d0 <g_irqvector>
5802352a:	00351793          	slli	a5,a0,0x3
5802352e:	97ba                	add	a5,a5,a4
58023530:	4398                	lw	a4,0(a5)
        arg = g_irqvector[irq_num].arg;
        if (handler) {
58023532:	c701                	beqz	a4,5802353a <interrupt_entry+0x2c>
            handler(irq_num, arg);
58023534:	43cc                	lw	a1,4(a5)
        } else {
        }
    } else {
    }
}
58023536:	0111                	addi	sp,sp,4
            handler(irq_num, arg);
58023538:	8702                	jr	a4
}
5802353a:	0111                	addi	sp,sp,4
5802353c:	8082                	ret

5802353e <Clock_Peripheral_Clock_Get>:
 *
 * @return Peripheral1 clock value
 *
*******************************************************************************/
uint32_t Clock_Peripheral_Clock_Get(BL_Peripheral_Type type)
{
5802353e:	1131                	addi	sp,sp,-20
58023540:	c806                	sw	ra,16(sp)
58023542:	c622                	sw	s0,12(sp)
58023544:	c426                	sw	s1,8(sp)
    uint32_t clock = 0;
    uint32_t div = 0;

    switch (type) {
58023546:	4745                	li	a4,17
58023548:	0ae500e3          	beq	a0,a4,58023de8 <Clock_Peripheral_Clock_Get+0x8aa>
5802354c:	06a76063          	bltu	a4,a0,580235ac <Clock_Peripheral_Clock_Get+0x6e>
58023550:	4725                	li	a4,9
58023552:	02e50ae3          	beq	a0,a4,58023d86 <Clock_Peripheral_Clock_Get+0x848>
58023556:	10a77963          	bgeu	a4,a0,58023668 <Clock_Peripheral_Clock_Get+0x12a>
5802355a:	4739                	li	a4,14
5802355c:	7ee50563          	beq	a0,a4,58023d46 <Clock_Peripheral_Clock_Get+0x808>
58023560:	0ca77963          	bgeu	a4,a0,58023632 <Clock_Peripheral_Clock_Get+0xf4>
58023564:	473d                	li	a4,15
58023566:	7ae50963          	beq	a0,a4,58023d18 <Clock_Peripheral_Clock_Get+0x7da>
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CPU);
5802356a:	300077b7          	lui	a5,0x30007
5802356e:	43c0                	lw	s0,4(a5)
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CPU);
58023570:	43dc                	lw	a5,4(a5)
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_H264_CLK_SEL);
58023572:	83a5                	srli	a5,a5,0x9
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_H264_CLK_DIV);
58023574:	8031                	srli	s0,s0,0xc
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_H264_CLK_SEL);
58023576:	8b8d                	andi	a5,a5,3
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_H264_CLK_DIV);
58023578:	881d                	andi	s0,s0,7
    if (sel == 0) {
5802357a:	120784e3          	beqz	a5,58023ea2 <Clock_Peripheral_Clock_Get+0x964>
    } else if (sel == 1) {
5802357e:	4705                	li	a4,1
58023580:	36e785e3          	beq	a5,a4,580240ea <Clock_Peripheral_Clock_Get+0xbac>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_DIG_CLK_CFG1);
58023584:	200007b7          	lui	a5,0x20000
58023588:	2547a783          	lw	a5,596(a5) # 20000254 <HeapMinSize+0x1ffff254>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_MM_MUXPLL_320M_SEL);
5802358c:	8389                	srli	a5,a5,0x2
    if (sel == 0) {
5802358e:	8b85                	andi	a5,a5,1
58023590:	c7e9                	beqz	a5,5802365a <Clock_Peripheral_Clock_Get+0x11c>
        return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV1);
58023592:	4501                	li	a0,0
58023594:	ca009097          	auipc	ra,0xca009
58023598:	d82080e7          	jalr	-638(ra) # 2202c316 <Clock_Get_AUPLL_Output>
    return Clock_H264_Clk_Mux_Output(Clock_Get_H264_Clk_Sel_Val()) / (div + 1);
5802359c:	0405                	addi	s0,s0,1
5802359e:	02855533          	divu	a0,a0,s0
            return Clock_Get_Clk();
#endif
        default:
            return 0;
    }
}
580235a2:	40c2                	lw	ra,16(sp)
580235a4:	4432                	lw	s0,12(sp)
580235a6:	44a2                	lw	s1,8(sp)
580235a8:	0151                	addi	sp,sp,20
580235aa:	8082                	ret
    switch (type) {
580235ac:	4761                	li	a4,24
580235ae:	00e500e3          	beq	a0,a4,58023dae <Clock_Peripheral_Clock_Get+0x870>
580235b2:	16a77663          	bgeu	a4,a0,5802371e <Clock_Peripheral_Clock_Get+0x1e0>
580235b6:	476d                	li	a4,27
580235b8:	70e50763          	beq	a0,a4,58023cc6 <Clock_Peripheral_Clock_Get+0x788>
580235bc:	10a77d63          	bgeu	a4,a0,580236d6 <Clock_Peripheral_Clock_Get+0x198>
580235c0:	4771                	li	a4,28
580235c2:	5ee50463          	beq	a0,a4,58023baa <Clock_Peripheral_Clock_Get+0x66c>
580235c6:	4775                	li	a4,29
580235c8:	36e51863          	bne	a0,a4,58023938 <Clock_Peripheral_Clock_Get+0x3fa>
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_DP_CLK);
580235cc:	30007737          	lui	a4,0x30007
580235d0:	471c                	lw	a5,8(a4)
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_DP_CLK);
580235d2:	4718                	lw	a4,8(a4)
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_CLK_DIV);
580235d4:	83a1                	srli	a5,a5,0x8
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_CLK_SEL);
580235d6:	8305                	srli	a4,a4,0x1
580235d8:	8b0d                	andi	a4,a4,3
580235da:	0ff7f793          	andi	a5,a5,255
    if (sel == 0) {
580235de:	3a070263          	beqz	a4,58023982 <Clock_Peripheral_Clock_Get+0x444>
    } else if (sel == 1) {
580235e2:	4685                	li	a3,1
    return Clock_Clk_Mux_Output(Clock_Get_Clk_Sel_Val()) / (div + 1);
580235e4:	00178413          	addi	s0,a5,1
    } else if (sel == 1) {
580235e8:	40d700e3          	beq	a4,a3,580241e8 <Clock_Peripheral_Clock_Get+0xcaa>
    } else if (sel == 2) {
580235ec:	4789                	li	a5,2
580235ee:	2ef709e3          	beq	a4,a5,580240e0 <Clock_Peripheral_Clock_Get+0xba2>
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CTRL_CPU);
580235f2:	300077b7          	lui	a5,0x30007
580235f6:	439c                	lw	a5,0(a5)
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_XCLK_CLK_SEL);
580235f8:	83a9                	srli	a5,a5,0xa
    if (sel == 0) {
580235fa:	8b85                	andi	a5,a5,1
580235fc:	000787e3          	beqz	a5,58023e0a <Clock_Peripheral_Clock_Get+0x8cc>
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
58023600:	00710513          	addi	a0,sp,7
    uint8_t xtalType = 0;
58023604:	000103a3          	sb	zero,7(sp)
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
58023608:	ca009097          	auipc	ra,0xca009
5802360c:	b82080e7          	jalr	-1150(ra) # 2202c18a <HBN_Get_Xtal_Type>
58023610:	0e0510e3          	bnez	a0,58023ef0 <Clock_Peripheral_Clock_Get+0x9b2>
        switch (xtalType) {
58023614:	00714783          	lbu	a5,7(sp)
58023618:	4719                	li	a4,6
5802361a:	30f76f63          	bltu	a4,a5,58023938 <Clock_Peripheral_Clock_Get+0x3fa>
    return Clock_Clk_Mux_Output(Clock_Get_Clk_Sel_Val()) / (div + 1);
5802361e:	2202d737          	lui	a4,0x2202d
58023622:	078a                	slli	a5,a5,0x2
58023624:	a9070713          	addi	a4,a4,-1392 # 2202ca90 <CSWTCH.123>
58023628:	97ba                	add	a5,a5,a4
5802362a:	4388                	lw	a0,0(a5)
5802362c:	02855533          	divu	a0,a0,s0
58023630:	bf8d                	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
    switch (type) {
58023632:	4731                	li	a4,12
58023634:	46e50663          	beq	a0,a4,58023aa0 <Clock_Peripheral_Clock_Get+0x562>
58023638:	4735                	li	a4,13
5802363a:	2ee51f63          	bne	a0,a4,58023938 <Clock_Peripheral_Clock_Get+0x3fa>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_PSRAM_CFG0);
5802363e:	200007b7          	lui	a5,0x20000
58023642:	6207a403          	lw	s0,1568(a5) # 20000620 <HeapMinSize+0x1ffff620>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_PSRAM_CFG0);
58023646:	6207a783          	lw	a5,1568(a5)
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_PSRAMB_CLK_DIV);
5802364a:	8079                	srli	s0,s0,0x1e
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_PSRAMB_CLK_SEL);
5802364c:	83f1                	srli	a5,a5,0x1c
5802364e:	8b8d                	andi	a5,a5,3
    if (sel == 0) {
58023650:	3c078363          	beqz	a5,58023a16 <Clock_Peripheral_Clock_Get+0x4d8>
    } else if (sel == 1) {
58023654:	4705                	li	a4,1
58023656:	f2e79ee3          	bne	a5,a4,58023592 <Clock_Peripheral_Clock_Get+0x54>
    return Clock_Get_WIFI_PLL_Output(pllOut);
5802365a:	1312d537          	lui	a0,0x1312d
5802365e:	ca009097          	auipc	ra,0xca009
58023662:	e0e080e7          	jalr	-498(ra) # 2202c46c <Clock_Get_WIFI_PLL_Output>
        return Clock_DSP_Get_WIFI_PLL_Output(320 * 1000 * 1000);
58023666:	bf1d                	j	5802359c <Clock_Peripheral_Clock_Get+0x5e>
    switch (type) {
58023668:	4715                	li	a4,5
5802366a:	5ae50363          	beq	a0,a4,58023c10 <Clock_Peripheral_Clock_Get+0x6d2>
5802366e:	16a77463          	bgeu	a4,a0,580237d6 <Clock_Peripheral_Clock_Get+0x298>
58023672:	471d                	li	a4,7
58023674:	10a76363          	bltu	a4,a0,5802377a <Clock_Peripheral_Clock_Get+0x23c>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_I2C_CFG0);
58023678:	20000437          	lui	s0,0x20000
5802367c:	18042783          	lw	a5,384(s0) # 20000180 <HeapMinSize+0x1ffff180>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_I2C_CLK_SEL);
58023680:	83e5                	srli	a5,a5,0x19
    if (sel == 0) {
58023682:	8b85                	andi	a5,a5,1
58023684:	32078463          	beqz	a5,580239ac <Clock_Peripheral_Clock_Get+0x46e>
    tmpVal = BL_RD_REG(HBN_BASE, HBN_GLB);
58023688:	2000f7b7          	lui	a5,0x2000f
5802368c:	5b9c                	lw	a5,48(a5)
    if (sel == 0) {
5802368e:	8b85                	andi	a5,a5,1
58023690:	520782e3          	beqz	a5,580243b4 <Clock_Peripheral_Clock_Get+0xe76>
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
58023694:	00710513          	addi	a0,sp,7
    uint8_t xtalType = 0;
58023698:	000103a3          	sb	zero,7(sp)
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
5802369c:	ca009097          	auipc	ra,0xca009
580236a0:	aee080e7          	jalr	-1298(ra) # 2202c18a <HBN_Get_Xtal_Type>
580236a4:	52051ee3          	bnez	a0,580243e0 <Clock_Peripheral_Clock_Get+0xea2>
        switch (xtalType) {
580236a8:	00714783          	lbu	a5,7(sp)
580236ac:	4719                	li	a4,6
580236ae:	48f76ae3          	bltu	a4,a5,58024342 <Clock_Peripheral_Clock_Get+0xe04>
580236b2:	2202d737          	lui	a4,0x2202d
580236b6:	078a                	slli	a5,a5,0x2
580236b8:	a9070713          	addi	a4,a4,-1392 # 2202ca90 <CSWTCH.123>
580236bc:	97ba                	add	a5,a5,a4
580236be:	4388                	lw	a0,0(a5)
    tmpVal = BL_RD_REG(GLB_BASE, GLB_I2C_CFG0);
580236c0:	200007b7          	lui	a5,0x20000
580236c4:	1807a783          	lw	a5,384(a5) # 20000180 <HeapMinSize+0x1ffff180>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_I2C_CLK_DIV);
580236c8:	83c1                	srli	a5,a5,0x10
            return clock / (div + 1);
580236ca:	0ff7f793          	andi	a5,a5,255
580236ce:	0785                	addi	a5,a5,1
580236d0:	02f55533          	divu	a0,a0,a5
580236d4:	b5f9                	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
    switch (type) {
580236d6:	4765                	li	a4,25
580236d8:	5ae50d63          	beq	a0,a4,58023c92 <Clock_Peripheral_Clock_Get+0x754>
580236dc:	4769                	li	a4,26
580236de:	24e51d63          	bne	a0,a4,58023938 <Clock_Peripheral_Clock_Get+0x3fa>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_SWRST_CFG2);
580236e2:	20000437          	lui	s0,0x20000
580236e6:	54842783          	lw	a5,1352(s0) # 20000548 <HeapMinSize+0x1ffff548>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_PKA_CLK_SEL);
580236ea:	83e1                	srli	a5,a5,0x18
    if (sel == 0) {
580236ec:	8b85                	andi	a5,a5,1
580236ee:	2c078d63          	beqz	a5,580239c8 <Clock_Peripheral_Clock_Get+0x48a>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_DIG_CLK_CFG1);
580236f2:	25442783          	lw	a5,596(s0)
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_TOP_MUXPLL_160M_SEL);
580236f6:	83a9                	srli	a5,a5,0xa
580236f8:	8b8d                	andi	a5,a5,3
    if (sel == 0) {
580236fa:	48078ce3          	beqz	a5,58024392 <Clock_Peripheral_Clock_Get+0xe54>
    } else if (sel == 1) {
580236fe:	4705                	li	a4,1
58023700:	5ae78ce3          	beq	a5,a4,580244b8 <Clock_Peripheral_Clock_Get+0xf7a>
    } else if (sel == 2) {
58023704:	4709                	li	a4,2
        return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV2);
58023706:	4505                	li	a0,1
    } else if (sel == 2) {
58023708:	00e78363          	beq	a5,a4,5802370e <Clock_Peripheral_Clock_Get+0x1d0>
        return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV2P5);
5802370c:	4509                	li	a0,2
}
5802370e:	4432                	lw	s0,12(sp)
58023710:	40c2                	lw	ra,16(sp)
58023712:	44a2                	lw	s1,8(sp)
58023714:	0151                	addi	sp,sp,20
        return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV2P5);
58023716:	ca009317          	auipc	t1,0xca009
5802371a:	c0030067          	jr	-1024(t1) # 2202c316 <Clock_Get_AUPLL_Output>
    switch (type) {
5802371e:	4755                	li	a4,21
58023720:	30e50463          	beq	a0,a4,58023a28 <Clock_Peripheral_Clock_Get+0x4ea>
58023724:	10a77e63          	bgeu	a4,a0,58023840 <Clock_Peripheral_Clock_Get+0x302>
58023728:	4759                	li	a4,22
5802372a:	32e50763          	beq	a0,a4,58023a58 <Clock_Peripheral_Clock_Get+0x51a>
5802372e:	475d                	li	a4,23
58023730:	20e51463          	bne	a0,a4,58023938 <Clock_Peripheral_Clock_Get+0x3fa>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_DIG_CLK_CFG0);
58023734:	200007b7          	lui	a5,0x20000
58023738:	2507a783          	lw	a5,592(a5) # 20000250 <HeapMinSize+0x1ffff250>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_DIG_CLK_SRC_SEL);
5802373c:	83f1                	srli	a5,a5,0x1c
5802373e:	8b8d                	andi	a5,a5,3
    if (sel == 0) {
58023740:	2c078263          	beqz	a5,58023a04 <Clock_Peripheral_Clock_Get+0x4c6>
    } else if (sel == 1) {
58023744:	4705                	li	a4,1
58023746:	7ee78863          	beq	a5,a4,58023f36 <Clock_Peripheral_Clock_Get+0x9f8>
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(CCI_BASE, CCI_AUDIO_PLL_CFG1), CCI_AUPLL_POSTDIV);
5802374a:	200087b7          	lui	a5,0x20008
5802374e:	7547a403          	lw	s0,1876(a5) # 20008754 <HeapMinSize+0x20007754>
    return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV1) / tmpVal;
58023752:	4501                	li	a0,0
58023754:	ca009097          	auipc	ra,0xca009
58023758:	bc2080e7          	jalr	-1086(ra) # 2202c316 <Clock_Get_AUPLL_Output>
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(CCI_BASE, CCI_AUDIO_PLL_CFG1), CCI_AUPLL_POSTDIV);
5802375c:	07f47413          	andi	s0,s0,127
    return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV1) / tmpVal;
58023760:	02855533          	divu	a0,a0,s0
    tmpVal = BL_RD_REG(GLB_BASE, GLB_DIG_CLK_CFG0);
58023764:	200007b7          	lui	a5,0x20000
58023768:	2507a783          	lw	a5,592(a5) # 20000250 <HeapMinSize+0x1ffff250>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_DIG_512K_DIV);
5802376c:	83c1                	srli	a5,a5,0x10
5802376e:	07f7f793          	andi	a5,a5,127
            return clock / (div + 1);
58023772:	0785                	addi	a5,a5,1
58023774:	02f55533          	divu	a0,a0,a5
58023778:	b52d                	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
    switch (type) {
5802377a:	4721                	li	a4,8
5802377c:	1ae51e63          	bne	a0,a4,58023938 <Clock_Peripheral_Clock_Get+0x3fa>
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CTRL_CPU);
58023780:	30007737          	lui	a4,0x30007
58023784:	431c                	lw	a5,0(a4)
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_I2C_CLK_SEL);
58023786:	8399                	srli	a5,a5,0x6
    if (sel == 0) {
58023788:	8b85                	andi	a5,a5,1
5802378a:	1e078163          	beqz	a5,5802396c <Clock_Peripheral_Clock_Get+0x42e>
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CTRL_CPU);
5802378e:	431c                	lw	a5,0(a4)
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_XCLK_CLK_SEL);
58023790:	83a9                	srli	a5,a5,0xa
    if (sel == 0) {
58023792:	8b85                	andi	a5,a5,1
58023794:	200789e3          	beqz	a5,580241a6 <Clock_Peripheral_Clock_Get+0xc68>
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
58023798:	00710513          	addi	a0,sp,7
    uint8_t xtalType = 0;
5802379c:	000103a3          	sb	zero,7(sp)
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
580237a0:	ca009097          	auipc	ra,0xca009
580237a4:	9ea080e7          	jalr	-1558(ra) # 2202c18a <HBN_Get_Xtal_Type>
580237a8:	2c051fe3          	bnez	a0,58024286 <Clock_Peripheral_Clock_Get+0xd48>
        switch (xtalType) {
580237ac:	00714783          	lbu	a5,7(sp)
580237b0:	4719                	li	a4,6
580237b2:	16f76de3          	bltu	a4,a5,5802412c <Clock_Peripheral_Clock_Get+0xbee>
580237b6:	2202d737          	lui	a4,0x2202d
580237ba:	078a                	slli	a5,a5,0x2
580237bc:	a9070713          	addi	a4,a4,-1392 # 2202ca90 <CSWTCH.123>
580237c0:	97ba                	add	a5,a5,a4
580237c2:	4388                	lw	a0,0(a5)
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CTRL_PERI);
580237c4:	300077b7          	lui	a5,0x30007
580237c8:	4b9c                	lw	a5,16(a5)
            return clock / (div + 1);
580237ca:	0ff7f793          	andi	a5,a5,255
580237ce:	0785                	addi	a5,a5,1
580237d0:	02f55533          	divu	a0,a0,a5
580237d4:	b3f9                	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
    switch (type) {
580237d6:	470d                	li	a4,3
580237d8:	3ce50e63          	beq	a0,a4,58023bb4 <Clock_Peripheral_Clock_Get+0x676>
580237dc:	0ea77963          	bgeu	a4,a0,580238ce <Clock_Peripheral_Clock_Get+0x390>
580237e0:	4711                	li	a4,4
580237e2:	14e51b63          	bne	a0,a4,58023938 <Clock_Peripheral_Clock_Get+0x3fa>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_SPI_CFG0);
580237e6:	200007b7          	lui	a5,0x20000
580237ea:	1b07a783          	lw	a5,432(a5) # 200001b0 <HeapMinSize+0x1ffff1b0>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_SPI_CLK_SEL);
580237ee:	83a5                	srli	a5,a5,0x9
    if (sel == 0) {
580237f0:	8b85                	andi	a5,a5,1
580237f2:	14078963          	beqz	a5,58023944 <Clock_Peripheral_Clock_Get+0x406>
    tmpVal = BL_RD_REG(HBN_BASE, HBN_GLB);
580237f6:	2000f7b7          	lui	a5,0x2000f
580237fa:	5b9c                	lw	a5,48(a5)
    if (sel == 0) {
580237fc:	8b85                	andi	a5,a5,1
580237fe:	1a078ae3          	beqz	a5,580241b2 <Clock_Peripheral_Clock_Get+0xc74>
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
58023802:	00710513          	addi	a0,sp,7
    uint8_t xtalType = 0;
58023806:	000103a3          	sb	zero,7(sp)
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
5802380a:	ca009097          	auipc	ra,0xca009
5802380e:	980080e7          	jalr	-1664(ra) # 2202c18a <HBN_Get_Xtal_Type>
58023812:	280510e3          	bnez	a0,58024292 <Clock_Peripheral_Clock_Get+0xd54>
        switch (xtalType) {
58023816:	00714783          	lbu	a5,7(sp)
5802381a:	4719                	li	a4,6
5802381c:	10f76be3          	bltu	a4,a5,58024132 <Clock_Peripheral_Clock_Get+0xbf4>
58023820:	2202d737          	lui	a4,0x2202d
58023824:	078a                	slli	a5,a5,0x2
58023826:	a9070713          	addi	a4,a4,-1392 # 2202ca90 <CSWTCH.123>
5802382a:	97ba                	add	a5,a5,a4
5802382c:	4388                	lw	a0,0(a5)
    tmpVal = BL_RD_REG(GLB_BASE, GLB_SPI_CFG0);
5802382e:	200007b7          	lui	a5,0x20000
58023832:	1b07a783          	lw	a5,432(a5) # 200001b0 <HeapMinSize+0x1ffff1b0>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_SPI_CLK_DIV);
58023836:	8bfd                	andi	a5,a5,31
            return clock / (div + 1);
58023838:	0785                	addi	a5,a5,1
5802383a:	02f55533          	divu	a0,a0,a5
5802383e:	b395                	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
    switch (type) {
58023840:	474d                	li	a4,19
58023842:	42e50163          	beq	a0,a4,58023c64 <Clock_Peripheral_Clock_Get+0x726>
58023846:	4751                	li	a4,20
58023848:	02e51a63          	bne	a0,a4,5802387c <Clock_Peripheral_Clock_Get+0x33e>
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(CCI_BASE, CCI_AUDIO_PLL_CFG1), CCI_AUPLL_POSTDIV);
5802384c:	200087b7          	lui	a5,0x20008
58023850:	7547a403          	lw	s0,1876(a5) # 20008754 <HeapMinSize+0x20007754>
    return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV1) / tmpVal;
58023854:	4501                	li	a0,0
58023856:	ca009097          	auipc	ra,0xca009
5802385a:	ac0080e7          	jalr	-1344(ra) # 2202c316 <Clock_Get_AUPLL_Output>
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(CCI_BASE, CCI_AUDIO_PLL_CFG1), CCI_AUPLL_POSTDIV);
5802385e:	07f47413          	andi	s0,s0,127
    return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV1) / tmpVal;
58023862:	02855533          	divu	a0,a0,s0
    tmpVal = BL_RD_REG(GLB_BASE, GLB_AUDIO_CFG0);
58023866:	200007b7          	lui	a5,0x20000
5802386a:	3407a783          	lw	a5,832(a5) # 20000340 <HeapMinSize+0x1ffff340>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_AUDIO_ADC_CLK_DIV);
5802386e:	83a1                	srli	a5,a5,0x8
58023870:	03f7f793          	andi	a5,a5,63
    return clock / (div + 1);
58023874:	0785                	addi	a5,a5,1
58023876:	02f55533          	divu	a0,a0,a5
            return Clock_Audio_ADC_Clock_Get();
5802387a:	b325                	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
    switch (type) {
5802387c:	4749                	li	a4,18
5802387e:	0ae51d63          	bne	a0,a4,58023938 <Clock_Peripheral_Clock_Get+0x3fa>
    tmpVal = BL_RD_REG(HBN_BASE, HBN_GLB);
58023882:	2000f7b7          	lui	a5,0x2000f
58023886:	5b9c                	lw	a5,48(a5)
    if (sel == 0) {
58023888:	8b85                	andi	a5,a5,1
5802388a:	c7fd                	beqz	a5,58023978 <Clock_Peripheral_Clock_Get+0x43a>
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
5802388c:	00710513          	addi	a0,sp,7
    uint8_t xtalType = 0;
58023890:	000103a3          	sb	zero,7(sp)
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
58023894:	ca009097          	auipc	ra,0xca009
58023898:	8f6080e7          	jalr	-1802(ra) # 2202c18a <HBN_Get_Xtal_Type>
5802389c:	06051fe3          	bnez	a0,5802411a <Clock_Peripheral_Clock_Get+0xbdc>
        switch (xtalType) {
580238a0:	00714783          	lbu	a5,7(sp)
580238a4:	4719                	li	a4,6
580238a6:	66f76363          	bltu	a4,a5,58023f0c <Clock_Peripheral_Clock_Get+0x9ce>
580238aa:	2202d737          	lui	a4,0x2202d
580238ae:	078a                	slli	a5,a5,0x2
580238b0:	a9070713          	addi	a4,a4,-1392 # 2202ca90 <CSWTCH.123>
580238b4:	97ba                	add	a5,a5,a4
580238b6:	4388                	lw	a0,0(a5)
    tmpVal = BL_RD_REG(GLB_BASE, GLB_IR_CFG0);
580238b8:	200007b7          	lui	a5,0x20000
580238bc:	1407a783          	lw	a5,320(a5) # 20000140 <HeapMinSize+0x1ffff140>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_IR_CLK_DIV);
580238c0:	83c1                	srli	a5,a5,0x10
580238c2:	03f7f793          	andi	a5,a5,63
            return clock / (div + 1);
580238c6:	0785                	addi	a5,a5,1
580238c8:	02f55533          	divu	a0,a0,a5
580238cc:	b9d9                	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
    switch (type) {
580238ce:	06e50563          	beq	a0,a4,58023938 <Clock_Peripheral_Clock_Get+0x3fa>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_UART_CFG0);
580238d2:	200007b7          	lui	a5,0x20000
580238d6:	1507a703          	lw	a4,336(a5) # 20000150 <HeapMinSize+0x1ffff150>
    return ((BL_GET_REG_BITS_VAL(tmpVal, GLB_HBN_UART_CLK_SEL2) << 1) | BL_GET_REG_BITS_VAL(tmpVal, GLB_HBN_UART_CLK_SEL));
580238da:	01575793          	srli	a5,a4,0x15
580238de:	831d                	srli	a4,a4,0x7
580238e0:	8b89                	andi	a5,a5,2
580238e2:	8b05                	andi	a4,a4,1
580238e4:	8fd9                	or	a5,a5,a4
    if (sel == 0) {
580238e6:	cffd                	beqz	a5,580239e4 <Clock_Peripheral_Clock_Get+0x4a6>
    } else if (sel == 1) {
580238e8:	4705                	li	a4,1
580238ea:	62e78363          	beq	a5,a4,58023f10 <Clock_Peripheral_Clock_Get+0x9d2>
    tmpVal = BL_RD_REG(HBN_BASE, HBN_GLB);
580238ee:	2000f7b7          	lui	a5,0x2000f
580238f2:	5b9c                	lw	a5,48(a5)
    if (sel == 0) {
580238f4:	8b85                	andi	a5,a5,1
580238f6:	0a0782e3          	beqz	a5,5802419a <Clock_Peripheral_Clock_Get+0xc5c>
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
580238fa:	00710513          	addi	a0,sp,7
    uint8_t xtalType = 0;
580238fe:	000103a3          	sb	zero,7(sp)
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
58023902:	ca009097          	auipc	ra,0xca009
58023906:	888080e7          	jalr	-1912(ra) # 2202c18a <HBN_Get_Xtal_Type>
5802390a:	14051ae3          	bnez	a0,5802425e <Clock_Peripheral_Clock_Get+0xd20>
        switch (xtalType) {
5802390e:	00714783          	lbu	a5,7(sp)
58023912:	4719                	li	a4,6
58023914:	00f769e3          	bltu	a4,a5,58024126 <Clock_Peripheral_Clock_Get+0xbe8>
58023918:	2202d737          	lui	a4,0x2202d
5802391c:	078a                	slli	a5,a5,0x2
5802391e:	a9070713          	addi	a4,a4,-1392 # 2202ca90 <CSWTCH.123>
58023922:	97ba                	add	a5,a5,a4
58023924:	4388                	lw	a0,0(a5)
    tmpVal = BL_RD_REG(GLB_BASE, GLB_UART_CFG0);
58023926:	200007b7          	lui	a5,0x20000
5802392a:	1507a783          	lw	a5,336(a5) # 20000150 <HeapMinSize+0x1ffff150>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_UART_CLK_DIV);
5802392e:	8b9d                	andi	a5,a5,7
            return clock / (div + 1);
58023930:	0785                	addi	a5,a5,1
58023932:	02f55533          	divu	a0,a0,a5
58023936:	b1b5                	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
}
58023938:	40c2                	lw	ra,16(sp)
5802393a:	4432                	lw	s0,12(sp)
5802393c:	44a2                	lw	s1,8(sp)
    switch (type) {
5802393e:	4501                	li	a0,0
}
58023940:	0151                	addi	sp,sp,20
58023942:	8082                	ret
    tmpVal = BL_RD_REG(GLB_BASE, GLB_DIG_CLK_CFG1);
58023944:	200007b7          	lui	a5,0x20000
58023948:	2547a783          	lw	a5,596(a5) # 20000254 <HeapMinSize+0x1ffff254>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_TOP_MUXPLL_160M_SEL);
5802394c:	83a9                	srli	a5,a5,0xa
5802394e:	8b8d                	andi	a5,a5,3
    if (sel == 0) {
58023950:	080782e3          	beqz	a5,580241d4 <Clock_Peripheral_Clock_Get+0xc96>
    } else if (sel == 1) {
58023954:	4705                	li	a4,1
58023956:	1ee789e3          	beq	a5,a4,58024348 <Clock_Peripheral_Clock_Get+0xe0a>
    } else if (sel == 2) {
5802395a:	4709                	li	a4,2
5802395c:	22e784e3          	beq	a5,a4,58024384 <Clock_Peripheral_Clock_Get+0xe46>
        return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV2P5);
58023960:	4509                	li	a0,2
58023962:	ca009097          	auipc	ra,0xca009
58023966:	9b4080e7          	jalr	-1612(ra) # 2202c316 <Clock_Get_AUPLL_Output>
5802396a:	b5d1                	j	5802382e <Clock_Peripheral_Clock_Get+0x2f0>
        return Clock_System_Clock_Get(BL_SYSTEM_CLOCK_DSP_PBCLK);
5802396c:	4525                	li	a0,9
5802396e:	ca009097          	auipc	ra,0xca009
58023972:	bda080e7          	jalr	-1062(ra) # 2202c548 <Clock_System_Clock_Get>
58023976:	b5b9                	j	580237c4 <Clock_Peripheral_Clock_Get+0x286>
        return (32 * 1000 * 1000);
58023978:	01e85537          	lui	a0,0x1e85
5802397c:	80050513          	addi	a0,a0,-2048 # 1e84800 <HeapMinSize+0x1e83800>
58023980:	bf25                	j	580238b8 <Clock_Peripheral_Clock_Get+0x37a>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_DIG_CLK_CFG1);
58023982:	20000737          	lui	a4,0x20000
58023986:	25472703          	lw	a4,596(a4) # 20000254 <HeapMinSize+0x1ffff254>
    return Clock_Clk_Mux_Output(Clock_Get_Clk_Sel_Val()) / (div + 1);
5802398a:	00178413          	addi	s0,a5,1
    return Clock_Get_WIFI_PLL_Output(pllOut);
5802398e:	09897537          	lui	a0,0x9897
    if (sel == 0) {
58023992:	00177793          	andi	a5,a4,1
    return Clock_Get_WIFI_PLL_Output(pllOut);
58023996:	80050513          	addi	a0,a0,-2048 # 9896800 <HeapMinSize+0x9895800>
    if (sel == 0) {
5802399a:	160782e3          	beqz	a5,580242fe <Clock_Peripheral_Clock_Get+0xdc0>
        return Clock_Get_CPU_PLL_Output(400 * 1000 * 1000);
5802399e:	ca009097          	auipc	ra,0xca009
580239a2:	81e080e7          	jalr	-2018(ra) # 2202c1bc <Clock_Get_CPU_PLL_Output>
    return Clock_Clk_Mux_Output(Clock_Get_Clk_Sel_Val()) / (div + 1);
580239a6:	02855533          	divu	a0,a0,s0
        return Clock_Get_CPU_PLL_Output(400 * 1000 * 1000);
580239aa:	bee5                	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
            clock = Clock_System_Clock_Get(BL_SYSTEM_CLOCK_MCU_CLK);
580239ac:	4509                	li	a0,2
580239ae:	ca009097          	auipc	ra,0xca009
580239b2:	b9a080e7          	jalr	-1126(ra) # 2202c548 <Clock_System_Clock_Get>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_SYS_CFG0);
580239b6:	09042783          	lw	a5,144(s0)
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_BCLK_DIV);
580239ba:	83c1                	srli	a5,a5,0x10
            return clock / (div + 1);
580239bc:	0ff7f793          	andi	a5,a5,255
580239c0:	0785                	addi	a5,a5,1
580239c2:	02f55533          	divu	a0,a0,a5
        return Clock_System_Clock_Get(BL_SYSTEM_CLOCK_MCU_PBCLK);
580239c6:	b9ed                	j	580236c0 <Clock_Peripheral_Clock_Get+0x182>
            clock = Clock_System_Clock_Get(BL_SYSTEM_CLOCK_MCU_CLK);
580239c8:	4509                	li	a0,2
580239ca:	ca009097          	auipc	ra,0xca009
580239ce:	b7e080e7          	jalr	-1154(ra) # 2202c548 <Clock_System_Clock_Get>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_SYS_CFG0);
580239d2:	09042783          	lw	a5,144(s0)
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_BCLK_DIV);
580239d6:	83c1                	srli	a5,a5,0x10
            return clock / (div + 1);
580239d8:	0ff7f793          	andi	a5,a5,255
580239dc:	0785                	addi	a5,a5,1
580239de:	02f55533          	divu	a0,a0,a5
        return Clock_System_Clock_Get(BL_SYSTEM_CLOCK_MCU_PBCLK);
580239e2:	b6c1                	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
            clock = Clock_System_Clock_Get(BL_SYSTEM_CLOCK_MCU_CLK);
580239e4:	4509                	li	a0,2
580239e6:	ca009097          	auipc	ra,0xca009
580239ea:	b62080e7          	jalr	-1182(ra) # 2202c548 <Clock_System_Clock_Get>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_SYS_CFG0);
580239ee:	200007b7          	lui	a5,0x20000
580239f2:	0907a783          	lw	a5,144(a5) # 20000090 <HeapMinSize+0x1ffff090>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_BCLK_DIV);
580239f6:	83c1                	srli	a5,a5,0x10
            return clock / (div + 1);
580239f8:	0ff7f793          	andi	a5,a5,255
580239fc:	0785                	addi	a5,a5,1
580239fe:	02f55533          	divu	a0,a0,a5
        return Clock_System_Clock_Get(BL_SYSTEM_CLOCK_MCU_PBCLK);
58023a02:	b715                	j	58023926 <Clock_Peripheral_Clock_Get+0x3e8>
        return Clock_Get_WIFI_PLL_Output(32 * 1000 * 1000);
58023a04:	01e85537          	lui	a0,0x1e85
58023a08:	80050513          	addi	a0,a0,-2048 # 1e84800 <HeapMinSize+0x1e83800>
58023a0c:	ca009097          	auipc	ra,0xca009
58023a10:	a60080e7          	jalr	-1440(ra) # 2202c46c <Clock_Get_WIFI_PLL_Output>
58023a14:	bb81                	j	58023764 <Clock_Peripheral_Clock_Get+0x226>
    return Clock_Get_CPU_PLL_Output(pllOut);
58023a16:	17d78537          	lui	a0,0x17d78
58023a1a:	40050513          	addi	a0,a0,1024 # 17d78400 <HeapMinSize+0x17d77400>
58023a1e:	ca008097          	auipc	ra,0xca008
58023a22:	79e080e7          	jalr	1950(ra) # 2202c1bc <Clock_Get_CPU_PLL_Output>
        return Clock_EMI_Get_CPU_PLL_Output(400 * 1000 * 1000);
58023a26:	be9d                	j	5802359c <Clock_Peripheral_Clock_Get+0x5e>
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(CCI_BASE, CCI_AUDIO_PLL_CFG1), CCI_AUPLL_POSTDIV);
58023a28:	200087b7          	lui	a5,0x20008
58023a2c:	7547a403          	lw	s0,1876(a5) # 20008754 <HeapMinSize+0x20007754>
    return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV1) / tmpVal;
58023a30:	4501                	li	a0,0
58023a32:	ca009097          	auipc	ra,0xca009
58023a36:	8e4080e7          	jalr	-1820(ra) # 2202c316 <Clock_Get_AUPLL_Output>
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(CCI_BASE, CCI_AUDIO_PLL_CFG1), CCI_AUPLL_POSTDIV);
58023a3a:	07f47413          	andi	s0,s0,127
    return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV1) / tmpVal;
58023a3e:	02855533          	divu	a0,a0,s0
    tmpVal = BL_RD_REG(GLB_BASE, GLB_AUDIO_CFG0);
58023a42:	200007b7          	lui	a5,0x20000
58023a46:	3407a783          	lw	a5,832(a5) # 20000340 <HeapMinSize+0x1ffff340>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_AUDIO_DAC_CLK_DIV);
58023a4a:	83c1                	srli	a5,a5,0x10
58023a4c:	03f7f793          	andi	a5,a5,63
    return clock / (div + 1);
58023a50:	0785                	addi	a5,a5,1
58023a52:	02f55533          	divu	a0,a0,a5
            return Clock_Audio_DAC_Clock_Get();
58023a56:	b6b1                	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
    tmpVal = BL_RD_REG(HBN_BASE, HBN_PIR_CFG);
58023a58:	2000f737          	lui	a4,0x2000f
58023a5c:	531c                	lw	a5,32(a4)
    return BL_GET_REG_BITS_VAL(tmpVal, HBN_GPADC_CS);
58023a5e:	83a1                	srli	a5,a5,0x8
    if (sel == 1) {
58023a60:	8b85                	andi	a5,a5,1
58023a62:	46079163          	bnez	a5,58023ec4 <Clock_Peripheral_Clock_Get+0x986>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_ADC_CFG0);
58023a66:	200007b7          	lui	a5,0x20000
58023a6a:	1107a503          	lw	a0,272(a5) # 20000110 <HeapMinSize+0x1ffff110>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_ADC_CFG0);
58023a6e:	1107a783          	lw	a5,272(a5)
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_GPADC_32M_CLK_DIV);
58023a72:	03f57413          	andi	s0,a0,63
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_GPADC_32M_CLK_SEL);
58023a76:	839d                	srli	a5,a5,0x7
    if (sel == 0) {
58023a78:	8b85                	andi	a5,a5,1
58023a7a:	48079363          	bnez	a5,58023f00 <Clock_Peripheral_Clock_Get+0x9c2>
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(CCI_BASE, CCI_AUDIO_PLL_CFG1), CCI_AUPLL_POSTDIV);
58023a7e:	200087b7          	lui	a5,0x20008
58023a82:	7547a483          	lw	s1,1876(a5) # 20008754 <HeapMinSize+0x20007754>
    return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV1) / tmpVal;
58023a86:	4501                	li	a0,0
58023a88:	ca009097          	auipc	ra,0xca009
58023a8c:	88e080e7          	jalr	-1906(ra) # 2202c316 <Clock_Get_AUPLL_Output>
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(CCI_BASE, CCI_AUDIO_PLL_CFG1), CCI_AUPLL_POSTDIV);
58023a90:	07f4f493          	andi	s1,s1,127
    return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV1) / tmpVal;
58023a94:	02955533          	divu	a0,a0,s1
        return Clock_GPADC_Clk_Output(Clock_Get_GPADC_32M_Clk_Sel_Val()) / (div + 1);
58023a98:	0405                	addi	s0,s0,1
58023a9a:	02855533          	divu	a0,a0,s0
        return Clock_Get_Audio_PLL_Output();
58023a9e:	b611                	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
    uint8_t xtalType = 0;
58023aa0:	000103a3          	sb	zero,7(sp)
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(GLB_BASE, GLB_UHS_PLL_CFG6), GLB_UHSPLL_SDMIN);
58023aa4:	200007b7          	lui	a5,0x20000
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
58023aa8:	00710513          	addi	a0,sp,7
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(GLB_BASE, GLB_UHS_PLL_CFG6), GLB_UHSPLL_SDMIN);
58023aac:	7e87a403          	lw	s0,2024(a5) # 200007e8 <HeapMinSize+0x1ffff7e8>
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
58023ab0:	ca008097          	auipc	ra,0xca008
58023ab4:	6da080e7          	jalr	1754(ra) # 2202c18a <HBN_Get_Xtal_Type>
58023ab8:	e80510e3          	bnez	a0,58023938 <Clock_Peripheral_Clock_Get+0x3fa>
        switch (xtalType) {
58023abc:	00714783          	lbu	a5,7(sp)
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(GLB_BASE, GLB_UHS_PLL_CFG6), GLB_UHSPLL_SDMIN);
58023ac0:	0436                	slli	s0,s0,0xd
        switch (xtalType) {
58023ac2:	4711                	li	a4,4
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(GLB_BASE, GLB_UHS_PLL_CFG6), GLB_UHSPLL_SDMIN);
58023ac4:	8035                	srli	s0,s0,0xd
        switch (xtalType) {
58023ac6:	7ee78563          	beq	a5,a4,580242b0 <Clock_Peripheral_Clock_Get+0xd72>
58023aca:	36f76663          	bltu	a4,a5,58023e36 <Clock_Peripheral_Clock_Get+0x8f8>
58023ace:	4709                	li	a4,2
58023ad0:	36e78963          	beq	a5,a4,58023e42 <Clock_Peripheral_Clock_Get+0x904>
58023ad4:	470d                	li	a4,3
58023ad6:	34e79263          	bne	a5,a4,58023e1a <Clock_Peripheral_Clock_Get+0x8dc>
                vcoFreq = 384 * 25 * tmpVal / calculationDiv * (4000 / 2);
58023ada:	6789                	lui	a5,0x2
58023adc:	58078793          	addi	a5,a5,1408 # 2580 <HeapMinSize+0x1580>
58023ae0:	02f407b3          	mul	a5,s0,a5
58023ae4:	7d000713          	li	a4,2000
58023ae8:	83ad                	srli	a5,a5,0xb
58023aea:	02e787b3          	mul	a5,a5,a4
    if ((vcoFreq >= 2295000000) && (vcoFreq <= 2305000000)) {
58023aee:	77351737          	lui	a4,0x77351
58023af2:	44070713          	addi	a4,a4,1088 # 77351440 <__etext_final+0x1f32b84c>
58023af6:	009896b7          	lui	a3,0x989
58023afa:	973e                	add	a4,a4,a5
58023afc:	68068693          	addi	a3,a3,1664 # 989680 <HeapMinSize+0x988680>
58023b00:	6ce6f463          	bgeu	a3,a4,580241c8 <Clock_Peripheral_Clock_Get+0xc8a>
    } else if ((vcoFreq >= 2195000000) && (vcoFreq <= 2205000000)) {
58023b04:	7d2af737          	lui	a4,0x7d2af
58023b08:	54070713          	addi	a4,a4,1344 # 7d2af540 <__etext_final+0x2528994c>
58023b0c:	973e                	add	a4,a4,a5
58023b0e:	78e6f863          	bgeu	a3,a4,5802429e <Clock_Peripheral_Clock_Get+0xd60>
    } else if ((vcoFreq >= 2095000000) && (vcoFreq <= 2105000000)) {
58023b12:	8320d737          	lui	a4,0x8320d
58023b16:	64070713          	addi	a4,a4,1600 # 8320d640 <__etext_final+0x2b1e7a4c>
58023b1a:	973e                	add	a4,a4,a5
58023b1c:	7ce6f563          	bgeu	a3,a4,580242e6 <Clock_Peripheral_Clock_Get+0xda8>
    } else if ((vcoFreq >= 1995000000 && vcoFreq <= 2005000000)) {
58023b20:	8916b737          	lui	a4,0x8916b
58023b24:	74070713          	addi	a4,a4,1856 # 8916b740 <__etext_final+0x31145b4c>
58023b28:	973e                	add	a4,a4,a5
58023b2a:	00e6f4e3          	bgeu	a3,a4,58024332 <Clock_Peripheral_Clock_Get+0xdf4>
    } else if ((vcoFreq >= 1595000000 && vcoFreq <= 1605000000)) {
58023b2e:	a0ee4737          	lui	a4,0xa0ee4
58023b32:	b4070713          	addi	a4,a4,-1216 # a0ee3b40 <__etext_final+0x48ebdf4c>
58023b36:	973e                	add	a4,a4,a5
58023b38:	02e6fde3          	bgeu	a3,a4,58024372 <Clock_Peripheral_Clock_Get+0xe34>
    } else if ((vcoFreq >= 1495000000 && vcoFreq <= 1505000000)) {
58023b3c:	a6e42737          	lui	a4,0xa6e42
58023b40:	c4070713          	addi	a4,a4,-960 # a6e41c40 <__etext_final+0x4ee1c04c>
58023b44:	973e                	add	a4,a4,a5
58023b46:	08e6f2e3          	bgeu	a3,a4,580243ca <Clock_Peripheral_Clock_Get+0xe8c>
    } else if ((vcoFreq >= 1395000000 && vcoFreq <= 1405000000)) {
58023b4a:	acda0737          	lui	a4,0xacda0
58023b4e:	d4070713          	addi	a4,a4,-704 # acd9fd40 <__etext_final+0x54d7a14c>
58023b52:	973e                	add	a4,a4,a5
58023b54:	0ae6f1e3          	bgeu	a3,a4,580243f6 <Clock_Peripheral_Clock_Get+0xeb8>
    } else if ((vcoFreq >= 1064000000 && vcoFreq <= 1068000000)) {
58023b58:	c094a737          	lui	a4,0xc094a
58023b5c:	60070713          	addi	a4,a4,1536 # c094a600 <__etext_final+0x68924a0c>
58023b60:	003d16b7          	lui	a3,0x3d1
58023b64:	973e                	add	a4,a4,a5
58023b66:	90068693          	addi	a3,a3,-1792 # 3d0900 <HeapMinSize+0x3cf900>
58023b6a:	0ce6f3e3          	bgeu	a3,a4,58024430 <Clock_Peripheral_Clock_Get+0xef2>
    } else if ((vcoFreq >= 799000000 && vcoFreq <= 801000000)) {
58023b6e:	d0604737          	lui	a4,0xd0604
58023b72:	a4070713          	addi	a4,a4,-1472 # d0603a40 <__etext_final+0x785dde4c>
58023b76:	001e86b7          	lui	a3,0x1e8
58023b7a:	973e                	add	a4,a4,a5
58023b7c:	48068693          	addi	a3,a3,1152 # 1e8480 <HeapMinSize+0x1e7480>
58023b80:	0ee6fee3          	bgeu	a3,a4,5802447c <Clock_Peripheral_Clock_Get+0xf3e>
    } else if ((vcoFreq >= 666000000 && vcoFreq <= 668000000)) {
58023b84:	d84da737          	lui	a4,0xd84da
58023b88:	58070713          	addi	a4,a4,1408 # d84da580 <__etext_final+0x804b498c>
58023b8c:	973e                	add	a4,a4,a5
58023b8e:	14e6fde3          	bgeu	a3,a4,580244e8 <Clock_Peripheral_Clock_Get+0xfaa>
    } else if ((vcoFreq >= 399000000 && vcoFreq <= 401000000)) {
58023b92:	e837c737          	lui	a4,0xe837c
58023b96:	e4070713          	addi	a4,a4,-448 # e837be40 <__etext_final+0x9035624c>
58023b9a:	97ba                	add	a5,a5,a4
58023b9c:	d8f6eee3          	bltu	a3,a5,58023938 <Clock_Peripheral_Clock_Get+0x3fa>
        return (400000000);
58023ba0:	17d78537          	lui	a0,0x17d78
58023ba4:	40050513          	addi	a0,a0,1024 # 17d78400 <HeapMinSize+0x17d77400>
            return Clock_Get_UHS_PLL_Output();
58023ba8:	baed                	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_CODEC_CLK);
58023baa:	300077b7          	lui	a5,0x30007
58023bae:	47c0                	lw	s0,12(a5)
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_CODEC_CLK);
58023bb0:	47dc                	lw	a5,12(a5)
58023bb2:	b2c1                	j	58023572 <Clock_Peripheral_Clock_Get+0x34>
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CTRL_CPU);
58023bb4:	30007737          	lui	a4,0x30007
58023bb8:	431c                	lw	a5,0(a4)
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_UART_CLK_SEL);
58023bba:	8391                	srli	a5,a5,0x4
58023bbc:	8b8d                	andi	a5,a5,3
    if (sel == 0) {
58023bbe:	40078363          	beqz	a5,58023fc4 <Clock_Peripheral_Clock_Get+0xa86>
    } else if (sel == 1) {
58023bc2:	4685                	li	a3,1
58023bc4:	66d78463          	beq	a5,a3,5802422c <Clock_Peripheral_Clock_Get+0xcee>
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CTRL_CPU);
58023bc8:	431c                	lw	a5,0(a4)
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_XCLK_CLK_SEL);
58023bca:	83a9                	srli	a5,a5,0xa
    if (sel == 0) {
58023bcc:	8b85                	andi	a5,a5,1
58023bce:	56078563          	beqz	a5,58024138 <Clock_Peripheral_Clock_Get+0xbfa>
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
58023bd2:	00710513          	addi	a0,sp,7
    uint8_t xtalType = 0;
58023bd6:	000103a3          	sb	zero,7(sp)
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
58023bda:	ca008097          	auipc	ra,0xca008
58023bde:	5b0080e7          	jalr	1456(ra) # 2202c18a <HBN_Get_Xtal_Type>
58023be2:	7e051a63          	bnez	a0,580243d6 <Clock_Peripheral_Clock_Get+0xe98>
        switch (xtalType) {
58023be6:	00714783          	lbu	a5,7(sp)
58023bea:	4719                	li	a4,6
58023bec:	72f76763          	bltu	a4,a5,5802431a <Clock_Peripheral_Clock_Get+0xddc>
58023bf0:	2202d737          	lui	a4,0x2202d
58023bf4:	078a                	slli	a5,a5,0x2
58023bf6:	a9070713          	addi	a4,a4,-1392 # 2202ca90 <CSWTCH.123>
58023bfa:	97ba                	add	a5,a5,a4
58023bfc:	4388                	lw	a0,0(a5)
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CTRL_PERI);
58023bfe:	300077b7          	lui	a5,0x30007
58023c02:	4b9c                	lw	a5,16(a5)
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_UART0_CLK_DIV);
58023c04:	83c5                	srli	a5,a5,0x11
58023c06:	8b9d                	andi	a5,a5,7
            return clock / (div + 1);
58023c08:	0785                	addi	a5,a5,1
58023c0a:	02f55533          	divu	a0,a0,a5
58023c0e:	ba51                	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CTRL_CPU);
58023c10:	30007737          	lui	a4,0x30007
58023c14:	431c                	lw	a5,0(a4)
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_SPI_CLK_SEL);
58023c16:	839d                	srli	a5,a5,0x7
    if (sel == 0) {
58023c18:	8b85                	andi	a5,a5,1
58023c1a:	4a078363          	beqz	a5,580240c0 <Clock_Peripheral_Clock_Get+0xb82>
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CTRL_CPU);
58023c1e:	431c                	lw	a5,0(a4)
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_XCLK_CLK_SEL);
58023c20:	83a9                	srli	a5,a5,0xa
    if (sel == 0) {
58023c22:	8b85                	andi	a5,a5,1
58023c24:	78078e63          	beqz	a5,580243c0 <Clock_Peripheral_Clock_Get+0xe82>
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
58023c28:	00710513          	addi	a0,sp,7
    uint8_t xtalType = 0;
58023c2c:	000103a3          	sb	zero,7(sp)
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
58023c30:	ca008097          	auipc	ra,0xca008
58023c34:	55a080e7          	jalr	1370(ra) # 2202c18a <HBN_Get_Xtal_Type>
58023c38:	7a051a63          	bnez	a0,580243ec <Clock_Peripheral_Clock_Get+0xeae>
        switch (xtalType) {
58023c3c:	00714783          	lbu	a5,7(sp)
58023c40:	4719                	li	a4,6
58023c42:	6ef76e63          	bltu	a4,a5,5802433e <Clock_Peripheral_Clock_Get+0xe00>
58023c46:	2202d737          	lui	a4,0x2202d
58023c4a:	078a                	slli	a5,a5,0x2
58023c4c:	a9070713          	addi	a4,a4,-1392 # 2202ca90 <CSWTCH.123>
58023c50:	97ba                	add	a5,a5,a4
58023c52:	4388                	lw	a0,0(a5)
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CTRL_PERI);
58023c54:	300077b7          	lui	a5,0x30007
58023c58:	4b9c                	lw	a5,16(a5)
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_SPI_CLK_DIV);
58023c5a:	83e1                	srli	a5,a5,0x18
            return clock / (div + 1);
58023c5c:	0785                	addi	a5,a5,1
58023c5e:	02f55533          	divu	a0,a0,a5
58023c62:	b281                	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(CCI_BASE, CCI_AUDIO_PLL_CFG1), CCI_AUPLL_POSTDIV);
58023c64:	200087b7          	lui	a5,0x20008
58023c68:	7547a403          	lw	s0,1876(a5) # 20008754 <HeapMinSize+0x20007754>
    return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV1) / tmpVal;
58023c6c:	4501                	li	a0,0
58023c6e:	ca008097          	auipc	ra,0xca008
58023c72:	6a8080e7          	jalr	1704(ra) # 2202c316 <Clock_Get_AUPLL_Output>
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(CCI_BASE, CCI_AUDIO_PLL_CFG1), CCI_AUPLL_POSTDIV);
58023c76:	07f47413          	andi	s0,s0,127
    return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV1) / tmpVal;
58023c7a:	02855533          	divu	a0,a0,s0
    tmpVal = BL_RD_REG(GLB_BASE, GLB_AUDIO_CFG0);
58023c7e:	200007b7          	lui	a5,0x20000
58023c82:	3407a783          	lw	a5,832(a5) # 20000340 <HeapMinSize+0x1ffff340>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_AUDIO_PDM_CLK_DIV);
58023c86:	03f7f793          	andi	a5,a5,63
            return clock / (div + 1);
58023c8a:	0785                	addi	a5,a5,1
58023c8c:	02f55533          	divu	a0,a0,a5
58023c90:	ba09                	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_SDH_CFG0);
58023c92:	200007b7          	lui	a5,0x20000
58023c96:	4307a783          	lw	a5,1072(a5) # 20000430 <HeapMinSize+0x1ffff430>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_SDH_CLK_SEL);
58023c9a:	83b1                	srli	a5,a5,0xc
    if (sel == 0) {
58023c9c:	8b85                	andi	a5,a5,1
58023c9e:	1a079d63          	bnez	a5,58023e58 <Clock_Peripheral_Clock_Get+0x91a>
        return Clock_Get_WIFI_PLL_Output(96 * 1000 * 1000);
58023ca2:	05b8e537          	lui	a0,0x5b8e
58023ca6:	80050513          	addi	a0,a0,-2048 # 5b8d800 <HeapMinSize+0x5b8c800>
58023caa:	ca008097          	auipc	ra,0xca008
58023cae:	7c2080e7          	jalr	1986(ra) # 2202c46c <Clock_Get_WIFI_PLL_Output>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_SDH_CFG0);
58023cb2:	200007b7          	lui	a5,0x20000
58023cb6:	4307a783          	lw	a5,1072(a5) # 20000430 <HeapMinSize+0x1ffff430>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_SDH_CLK_DIV);
58023cba:	83a5                	srli	a5,a5,0x9
58023cbc:	8b9d                	andi	a5,a5,7
            return clock / (div + 1);
58023cbe:	0785                	addi	a5,a5,1
58023cc0:	02f55533          	divu	a0,a0,a5
58023cc4:	b8f9                	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_EMI_CFG0);
58023cc6:	200004b7          	lui	s1,0x20000
58023cca:	0e04a503          	lw	a0,224(s1) # 200000e0 <HeapMinSize+0x1ffff0e0>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_EMI_CFG0);
58023cce:	0e04a783          	lw	a5,224(s1)
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_EMI_CLK_DIV);
58023cd2:	8159                	srli	a0,a0,0x16
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_EMI_CLK_SEL);
58023cd4:	83b9                	srli	a5,a5,0xe
58023cd6:	0077f713          	andi	a4,a5,7
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_EMI_CLK_DIV);
58023cda:	00357413          	andi	s0,a0,3
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_EMI_CLK_SEL);
58023cde:	0ff7f793          	andi	a5,a5,255
    if (sel == 0) {
58023ce2:	2a070f63          	beqz	a4,58023fa0 <Clock_Peripheral_Clock_Get+0xa62>
    } else if (sel == 1 || sel == 5) {
58023ce6:	8b8d                	andi	a5,a5,3
58023ce8:	4685                	li	a3,1
    return Clock_EMI_Clk_Mux_Output(Clock_Get_EMI_Clk_Sel_Val()) / (div + 1);
58023cea:	0405                	addi	s0,s0,1
    } else if (sel == 1 || sel == 5) {
58023cec:	2ad78163          	beq	a5,a3,58023f8e <Clock_Peripheral_Clock_Get+0xa50>
    } else if (sel == 2 || sel == 6) {
58023cf0:	4689                	li	a3,2
58023cf2:	40d78a63          	beq	a5,a3,58024106 <Clock_Peripheral_Clock_Get+0xbc8>
    } else if (sel == 3 || sel == 7) {
58023cf6:	468d                	li	a3,3
58023cf8:	3ed78463          	beq	a5,a3,580240e0 <Clock_Peripheral_Clock_Get+0xba2>
    } else if (sel == 4) {
58023cfc:	4791                	li	a5,4
58023cfe:	c2f71de3          	bne	a4,a5,58023938 <Clock_Peripheral_Clock_Get+0x3fa>
    return Clock_Get_CPU_PLL_Output(pllOut);
58023d02:	0bebc537          	lui	a0,0xbebc
58023d06:	20050513          	addi	a0,a0,512 # bebc200 <HeapMinSize+0xbebb200>
58023d0a:	ca008097          	auipc	ra,0xca008
58023d0e:	4b2080e7          	jalr	1202(ra) # 2202c1bc <Clock_Get_CPU_PLL_Output>
    return Clock_EMI_Clk_Mux_Output(Clock_Get_EMI_Clk_Sel_Val()) / (div + 1);
58023d12:	02855533          	divu	a0,a0,s0
        return Clock_EMI_Get_CPU_PLL_Output(200 * 1000 * 1000);
58023d16:	b071                	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(CCI_BASE, CCI_AUDIO_PLL_CFG1), CCI_AUPLL_POSTDIV);
58023d18:	200087b7          	lui	a5,0x20008
58023d1c:	7547a403          	lw	s0,1876(a5) # 20008754 <HeapMinSize+0x20007754>
    return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV1) / tmpVal;
58023d20:	4501                	li	a0,0
58023d22:	ca008097          	auipc	ra,0xca008
58023d26:	5f4080e7          	jalr	1524(ra) # 2202c316 <Clock_Get_AUPLL_Output>
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(CCI_BASE, CCI_AUDIO_PLL_CFG1), CCI_AUPLL_POSTDIV);
58023d2a:	07f47413          	andi	s0,s0,127
    return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV1) / tmpVal;
58023d2e:	02855533          	divu	a0,a0,s0
    tmpVal = BL_RD_REG(GLB_BASE, GLB_I2S_CFG0);
58023d32:	200007b7          	lui	a5,0x20000
58023d36:	1907a783          	lw	a5,400(a5) # 20000190 <HeapMinSize+0x1ffff190>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_I2S_REF_CLK_DIV);
58023d3a:	03f7f793          	andi	a5,a5,63
            return clock / (div + 1);
58023d3e:	0785                	addi	a5,a5,1
58023d40:	02f55533          	divu	a0,a0,a5
58023d44:	b8b9                	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_SF_CFG0);
58023d46:	20000437          	lui	s0,0x20000
58023d4a:	17042783          	lw	a5,368(s0) # 20000170 <HeapMinSize+0x1ffff170>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_SF_CLK_SEL);
58023d4e:	83b1                	srli	a5,a5,0xc
58023d50:	8b8d                	andi	a5,a5,3
    if (sel == 0) {
58023d52:	30078563          	beqz	a5,5802405c <Clock_Peripheral_Clock_Get+0xb1e>
    } else if (sel == 1) {
58023d56:	4705                	li	a4,1
58023d58:	4ae78963          	beq	a5,a4,5802420a <Clock_Peripheral_Clock_Get+0xccc>
    } else if (sel == 2) {
58023d5c:	4709                	li	a4,2
58023d5e:	20e78a63          	beq	a5,a4,58023f72 <Clock_Peripheral_Clock_Get+0xa34>
        return Clock_Get_WIFI_PLL_Output(96 * 1000 * 1000);
58023d62:	05b8e537          	lui	a0,0x5b8e
58023d66:	80050513          	addi	a0,a0,-2048 # 5b8d800 <HeapMinSize+0x5b8c800>
58023d6a:	ca008097          	auipc	ra,0xca008
58023d6e:	702080e7          	jalr	1794(ra) # 2202c46c <Clock_Get_WIFI_PLL_Output>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_SF_CFG0);
58023d72:	200007b7          	lui	a5,0x20000
58023d76:	1707a783          	lw	a5,368(a5) # 20000170 <HeapMinSize+0x1ffff170>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_SF_CLK_DIV);
58023d7a:	83a1                	srli	a5,a5,0x8
58023d7c:	8b9d                	andi	a5,a5,7
            return clock / (div + 1);
58023d7e:	0785                	addi	a5,a5,1
58023d80:	02f55533          	divu	a0,a0,a5
58023d84:	b839                	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CTRL_CPU);
58023d86:	30007737          	lui	a4,0x30007
58023d8a:	431c                	lw	a5,0(a4)
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_I2C_CLK_SEL);
58023d8c:	8399                	srli	a5,a5,0x6
    if (sel == 0) {
58023d8e:	8b85                	andi	a5,a5,1
58023d90:	efe9                	bnez	a5,58023e6a <Clock_Peripheral_Clock_Get+0x92c>
        return Clock_System_Clock_Get(BL_SYSTEM_CLOCK_DSP_PBCLK);
58023d92:	ca008097          	auipc	ra,0xca008
58023d96:	7b6080e7          	jalr	1974(ra) # 2202c548 <Clock_System_Clock_Get>
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CTRL_PERI3);
58023d9a:	300077b7          	lui	a5,0x30007
58023d9e:	4f9c                	lw	a5,24(a5)
            return clock / (div + 1);
58023da0:	0ff7f793          	andi	a5,a5,255
58023da4:	0785                	addi	a5,a5,1
58023da6:	02f55533          	divu	a0,a0,a5
58023daa:	ff8ff06f          	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_CAM_CFG0);
58023dae:	200007b7          	lui	a5,0x20000
58023db2:	4207a783          	lw	a5,1056(a5) # 20000420 <HeapMinSize+0x1ffff420>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_CAM_REF_CLK_SRC_SEL);
58023db6:	83f1                	srli	a5,a5,0x1c
58023db8:	8b8d                	andi	a5,a5,3
    if (sel == 0) {
58023dba:	2c078663          	beqz	a5,58024086 <Clock_Peripheral_Clock_Get+0xb48>
    } else if (sel == 1) {
58023dbe:	4705                	li	a4,1
58023dc0:	48e78663          	beq	a5,a4,5802424c <Clock_Peripheral_Clock_Get+0xd0e>
        return Clock_Get_CPU_PLL_Output(100 * 1000 * 1000);
58023dc4:	05f5e537          	lui	a0,0x5f5e
58023dc8:	10050513          	addi	a0,a0,256 # 5f5e100 <HeapMinSize+0x5f5d100>
58023dcc:	ca008097          	auipc	ra,0xca008
58023dd0:	3f0080e7          	jalr	1008(ra) # 2202c1bc <Clock_Get_CPU_PLL_Output>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_CAM_CFG0);
58023dd4:	200007b7          	lui	a5,0x20000
58023dd8:	4207a783          	lw	a5,1056(a5) # 20000420 <HeapMinSize+0x1ffff420>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_CAM_REF_CLK_DIV);
58023ddc:	83f9                	srli	a5,a5,0x1e
            return clock / (div + 1);
58023dde:	0785                	addi	a5,a5,1
58023de0:	02f55533          	divu	a0,a0,a5
58023de4:	fbeff06f          	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_DP_CLK);
58023de8:	300076b7          	lui	a3,0x30007
58023dec:	4688                	lw	a0,8(a3)
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_DP_CLK);
58023dee:	469c                	lw	a5,8(a3)
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_DP_CLK_DIV);
58023df0:	8151                	srli	a0,a0,0x14
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_DP_CLK_SEL);
58023df2:	83c5                	srli	a5,a5,0x11
    if (sel == 0) {
58023df4:	8b85                	andi	a5,a5,1
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_DP_CLK_DIV);
58023df6:	00f57413          	andi	s0,a0,15
    if (sel == 0) {
58023dfa:	1c078b63          	beqz	a5,58023fd0 <Clock_Peripheral_Clock_Get+0xa92>
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CTRL_CPU);
58023dfe:	429c                	lw	a5,0(a3)
    return Clock_Display_Clk_Mux_Output(Clock_Get_Display_Clk_Sel_Val()) / (div + 1);
58023e00:	0405                	addi	s0,s0,1
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_XCLK_CLK_SEL);
58023e02:	83a9                	srli	a5,a5,0xa
    if (sel == 0) {
58023e04:	8b85                	andi	a5,a5,1
58023e06:	fe079d63          	bnez	a5,58023600 <Clock_Peripheral_Clock_Get+0xc2>
    return Clock_Clk_Mux_Output(Clock_Get_Clk_Sel_Val()) / (div + 1);
58023e0a:	01e85537          	lui	a0,0x1e85
58023e0e:	80050513          	addi	a0,a0,-2048 # 1e84800 <HeapMinSize+0x1e83800>
58023e12:	02855533          	divu	a0,a0,s0
58023e16:	f8cff06f          	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
        switch (xtalType) {
58023e1a:	4705                	li	a4,1
58023e1c:	f8e79363          	bne	a5,a4,580235a2 <Clock_Peripheral_Clock_Get+0x64>
                vcoFreq = 24 * 500 * tmpVal / calculationDiv * 2000;
58023e20:	678d                	lui	a5,0x3
58023e22:	ee078793          	addi	a5,a5,-288 # 2ee0 <HeapMinSize+0x1ee0>
58023e26:	02f407b3          	mul	a5,s0,a5
58023e2a:	7d000713          	li	a4,2000
58023e2e:	83ad                	srli	a5,a5,0xb
58023e30:	02e787b3          	mul	a5,a5,a4
                break;
58023e34:	b96d                	j	58023aee <Clock_Peripheral_Clock_Get+0x5b0>
        switch (xtalType) {
58023e36:	4715                	li	a4,5
58023e38:	48e78763          	beq	a5,a4,580242c6 <Clock_Peripheral_Clock_Get+0xd88>
58023e3c:	4719                	li	a4,6
58023e3e:	aee79de3          	bne	a5,a4,58023938 <Clock_Peripheral_Clock_Get+0x3fa>
                vcoFreq = 32 * 250 * tmpVal / calculationDiv * (4000 / 2);
58023e42:	6789                	lui	a5,0x2
58023e44:	f4078793          	addi	a5,a5,-192 # 1f40 <HeapMinSize+0xf40>
58023e48:	02f407b3          	mul	a5,s0,a5
58023e4c:	7d000713          	li	a4,2000
58023e50:	83ad                	srli	a5,a5,0xb
58023e52:	02e787b3          	mul	a5,a5,a4
                break;
58023e56:	b961                	j	58023aee <Clock_Peripheral_Clock_Get+0x5b0>
        return Clock_Get_CPU_PLL_Output(100 * 1000 * 1000);
58023e58:	05f5e537          	lui	a0,0x5f5e
58023e5c:	10050513          	addi	a0,a0,256 # 5f5e100 <HeapMinSize+0x5f5d100>
58023e60:	ca008097          	auipc	ra,0xca008
58023e64:	35c080e7          	jalr	860(ra) # 2202c1bc <Clock_Get_CPU_PLL_Output>
58023e68:	b5a9                	j	58023cb2 <Clock_Peripheral_Clock_Get+0x774>
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CTRL_CPU);
58023e6a:	431c                	lw	a5,0(a4)
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_XCLK_CLK_SEL);
58023e6c:	83a9                	srli	a5,a5,0xa
    if (sel == 0) {
58023e6e:	8b85                	andi	a5,a5,1
58023e70:	34078763          	beqz	a5,580241be <Clock_Peripheral_Clock_Get+0xc80>
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
58023e74:	00710513          	addi	a0,sp,7
    uint8_t xtalType = 0;
58023e78:	000103a3          	sb	zero,7(sp)
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
58023e7c:	ca008097          	auipc	ra,0xca008
58023e80:	30e080e7          	jalr	782(ra) # 2202c18a <HBN_Get_Xtal_Type>
58023e84:	3e051c63          	bnez	a0,5802427c <Clock_Peripheral_Clock_Get+0xd3e>
        switch (xtalType) {
58023e88:	00714783          	lbu	a5,7(sp)
58023e8c:	4719                	li	a4,6
58023e8e:	2af76a63          	bltu	a4,a5,58024142 <Clock_Peripheral_Clock_Get+0xc04>
58023e92:	2202d737          	lui	a4,0x2202d
58023e96:	078a                	slli	a5,a5,0x2
58023e98:	a9070713          	addi	a4,a4,-1392 # 2202ca90 <CSWTCH.123>
58023e9c:	97ba                	add	a5,a5,a4
58023e9e:	4388                	lw	a0,0(a5)
58023ea0:	bded                	j	58023d9a <Clock_Peripheral_Clock_Get+0x85c>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_DIG_CLK_CFG1);
58023ea2:	200007b7          	lui	a5,0x20000
58023ea6:	2547a783          	lw	a5,596(a5) # 20000254 <HeapMinSize+0x1ffff254>
    return Clock_Get_WIFI_PLL_Output(pllOut);
58023eaa:	09897537          	lui	a0,0x9897
58023eae:	80050513          	addi	a0,a0,-2048 # 9896800 <HeapMinSize+0x9895800>
    if (sel == 0) {
58023eb2:	8b85                	andi	a5,a5,1
58023eb4:	2c078d63          	beqz	a5,5802418e <Clock_Peripheral_Clock_Get+0xc50>
        return Clock_Get_CPU_PLL_Output(160 * 1000 * 1000);
58023eb8:	ca008097          	auipc	ra,0xca008
58023ebc:	304080e7          	jalr	772(ra) # 2202c1bc <Clock_Get_CPU_PLL_Output>
58023ec0:	edcff06f          	j	5802359c <Clock_Peripheral_Clock_Get+0x5e>
    tmpVal = BL_RD_REG(HBN_BASE, HBN_GLB);
58023ec4:	5b1c                	lw	a5,48(a4)
    tmpVal = BL_RD_REG(GLB_BASE, GLB_DIG_CLK_CFG0);
58023ec6:	20000737          	lui	a4,0x20000
58023eca:	25072403          	lw	s0,592(a4) # 20000250 <HeapMinSize+0x1ffff250>
    return BL_GET_REG_BITS_VAL(tmpVal, HBN_F32K_SEL);
58023ece:	838d                	srli	a5,a5,0x3
    if (sel == 0) {
58023ed0:	8b89                	andi	a5,a5,2
58023ed2:	40078563          	beqz	a5,580242dc <Clock_Peripheral_Clock_Get+0xd9e>
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
58023ed6:	00710513          	addi	a0,sp,7
    uint8_t xtalType = 0;
58023eda:	000103a3          	sb	zero,7(sp)
    div = BL_GET_REG_BITS_VAL(tmpVal, GLB_DIG_32K_DIV);
58023ede:	7ff47413          	andi	s0,s0,2047
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
58023ee2:	ca008097          	auipc	ra,0xca008
58023ee6:	2a8080e7          	jalr	680(ra) # 2202c18a <HBN_Get_Xtal_Type>
        return Clock_Xtal_Output() / (div + 1);
58023eea:	0405                	addi	s0,s0,1
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
58023eec:	f2050463          	beqz	a0,58023614 <Clock_Peripheral_Clock_Get+0xd6>
    return Clock_Clk_Mux_Output(Clock_Get_Clk_Sel_Val()) / (div + 1);
58023ef0:	02626537          	lui	a0,0x2626
58023ef4:	a0050513          	addi	a0,a0,-1536 # 2625a00 <HeapMinSize+0x2624a00>
58023ef8:	02855533          	divu	a0,a0,s0
58023efc:	ea6ff06f          	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
    tmpVal = BL_RD_REG(HBN_BASE, HBN_GLB);
58023f00:	5b1c                	lw	a5,48(a4)
        return Clock_GPADC_Clk_Output(Clock_Get_GPADC_32M_Clk_Sel_Val()) / (div + 1);
58023f02:	0405                	addi	s0,s0,1
    if (sel == 0) {
58023f04:	8b85                	andi	a5,a5,1
58023f06:	ee079d63          	bnez	a5,58023600 <Clock_Peripheral_Clock_Get+0xc2>
58023f0a:	b701                	j	58023e0a <Clock_Peripheral_Clock_Get+0x8cc>
        switch (xtalType) {
58023f0c:	4501                	li	a0,0
        return Clock_Xtal_Output();
58023f0e:	b26d                	j	580238b8 <Clock_Peripheral_Clock_Get+0x37a>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_DIG_CLK_CFG1);
58023f10:	20000737          	lui	a4,0x20000
58023f14:	25472703          	lw	a4,596(a4) # 20000254 <HeapMinSize+0x1ffff254>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_TOP_MUXPLL_160M_SEL);
58023f18:	8329                	srli	a4,a4,0xa
58023f1a:	8b0d                	andi	a4,a4,3
    if (sel == 0) {
58023f1c:	40070163          	beqz	a4,5802431e <Clock_Peripheral_Clock_Get+0xde0>
    } else if (sel == 1) {
58023f20:	4ef70163          	beq	a4,a5,58024402 <Clock_Peripheral_Clock_Get+0xec4>
    } else if (sel == 2) {
58023f24:	4789                	li	a5,2
58023f26:	4ef70863          	beq	a4,a5,58024416 <Clock_Peripheral_Clock_Get+0xed8>
        return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV2P5);
58023f2a:	4509                	li	a0,2
58023f2c:	ca008097          	auipc	ra,0xca008
58023f30:	3ea080e7          	jalr	1002(ra) # 2202c316 <Clock_Get_AUPLL_Output>
58023f34:	bacd                	j	58023926 <Clock_Peripheral_Clock_Get+0x3e8>
    tmpVal = BL_RD_REG(HBN_BASE, HBN_GLB);
58023f36:	2000f7b7          	lui	a5,0x2000f
58023f3a:	5b9c                	lw	a5,48(a5)
    if (sel == 0) {
58023f3c:	8b85                	andi	a5,a5,1
58023f3e:	3c078863          	beqz	a5,5802430e <Clock_Peripheral_Clock_Get+0xdd0>
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
58023f42:	00710513          	addi	a0,sp,7
    uint8_t xtalType = 0;
58023f46:	000103a3          	sb	zero,7(sp)
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
58023f4a:	ca008097          	auipc	ra,0xca008
58023f4e:	240080e7          	jalr	576(ra) # 2202c18a <HBN_Get_Xtal_Type>
58023f52:	40051563          	bnez	a0,5802435c <Clock_Peripheral_Clock_Get+0xe1e>
        switch (xtalType) {
58023f56:	00714783          	lbu	a5,7(sp)
58023f5a:	4719                	li	a4,6
58023f5c:	34f76763          	bltu	a4,a5,580242aa <Clock_Peripheral_Clock_Get+0xd6c>
58023f60:	2202d737          	lui	a4,0x2202d
58023f64:	078a                	slli	a5,a5,0x2
58023f66:	a9070713          	addi	a4,a4,-1392 # 2202ca90 <CSWTCH.123>
58023f6a:	97ba                	add	a5,a5,a4
58023f6c:	4388                	lw	a0,0(a5)
58023f6e:	ff6ff06f          	j	58023764 <Clock_Peripheral_Clock_Get+0x226>
            clock = Clock_System_Clock_Get(BL_SYSTEM_CLOCK_MCU_CLK);
58023f72:	4509                	li	a0,2
58023f74:	ca008097          	auipc	ra,0xca008
58023f78:	5d4080e7          	jalr	1492(ra) # 2202c548 <Clock_System_Clock_Get>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_SYS_CFG0);
58023f7c:	09042783          	lw	a5,144(s0)
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_BCLK_DIV);
58023f80:	83c1                	srli	a5,a5,0x10
            return clock / (div + 1);
58023f82:	0ff7f793          	andi	a5,a5,255
58023f86:	0785                	addi	a5,a5,1
58023f88:	02f55533          	divu	a0,a0,a5
        return Clock_System_Clock_Get(BL_SYSTEM_CLOCK_MCU_PBCLK);
58023f8c:	b3dd                	j	58023d72 <Clock_Peripheral_Clock_Get+0x834>
        return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV1);
58023f8e:	4501                	li	a0,0
58023f90:	ca008097          	auipc	ra,0xca008
58023f94:	386080e7          	jalr	902(ra) # 2202c316 <Clock_Get_AUPLL_Output>
    return Clock_EMI_Clk_Mux_Output(Clock_Get_EMI_Clk_Sel_Val()) / (div + 1);
58023f98:	02855533          	divu	a0,a0,s0
        return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV1);
58023f9c:	e06ff06f          	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
            clock = Clock_System_Clock_Get(BL_SYSTEM_CLOCK_MCU_CLK);
58023fa0:	4509                	li	a0,2
58023fa2:	ca008097          	auipc	ra,0xca008
58023fa6:	5a6080e7          	jalr	1446(ra) # 2202c548 <Clock_System_Clock_Get>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_SYS_CFG0);
58023faa:	0904a783          	lw	a5,144(s1)
    return Clock_EMI_Clk_Mux_Output(Clock_Get_EMI_Clk_Sel_Val()) / (div + 1);
58023fae:	0405                	addi	s0,s0,1
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_BCLK_DIV);
58023fb0:	83c1                	srli	a5,a5,0x10
            return clock / (div + 1);
58023fb2:	0ff7f793          	andi	a5,a5,255
58023fb6:	0785                	addi	a5,a5,1
58023fb8:	02f55533          	divu	a0,a0,a5
    return Clock_EMI_Clk_Mux_Output(Clock_Get_EMI_Clk_Sel_Val()) / (div + 1);
58023fbc:	02855533          	divu	a0,a0,s0
        return Clock_System_Clock_Get(BL_SYSTEM_CLOCK_MCU_PBCLK);
58023fc0:	de2ff06f          	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
        return Clock_System_Clock_Get(BL_SYSTEM_CLOCK_DSP_PBCLK);
58023fc4:	4525                	li	a0,9
58023fc6:	ca008097          	auipc	ra,0xca008
58023fca:	582080e7          	jalr	1410(ra) # 2202c548 <Clock_System_Clock_Get>
58023fce:	b905                	j	58023bfe <Clock_Peripheral_Clock_Get+0x6c0>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_MIPI_PLL_CFG1);
58023fd0:	200007b7          	lui	a5,0x20000
58023fd4:	7947a703          	lw	a4,1940(a5) # 20000794 <HeapMinSize+0x1ffff794>
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
58023fd8:	00710513          	addi	a0,sp,7
    uint8_t xtalType = 0;
58023fdc:	000103a3          	sb	zero,7(sp)
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(GLB_BASE, GLB_MIPI_PLL_CFG6), GLB_MIPIPLL_SDMIN);
58023fe0:	7a87a483          	lw	s1,1960(a5)
    tmpVal = BL_RD_REG(GLB_BASE, GLB_MIPI_PLL_CFG1);
58023fe4:	c03a                	sw	a4,0(sp)
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
58023fe6:	ca008097          	auipc	ra,0xca008
58023fea:	1a4080e7          	jalr	420(ra) # 2202c18a <HBN_Get_Xtal_Type>
58023fee:	940515e3          	bnez	a0,58023938 <Clock_Peripheral_Clock_Get+0x3fa>
        switch (xtalType) {
58023ff2:	00714683          	lbu	a3,7(sp)
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(GLB_BASE, GLB_MIPI_PLL_CFG6), GLB_MIPIPLL_SDMIN);
58023ff6:	00d49793          	slli	a5,s1,0xd
        switch (xtalType) {
58023ffa:	4611                	li	a2,4
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(GLB_BASE, GLB_MIPI_PLL_CFG6), GLB_MIPIPLL_SDMIN);
58023ffc:	83b5                	srli	a5,a5,0xd
        switch (xtalType) {
58023ffe:	48c68563          	beq	a3,a2,58024488 <Clock_Peripheral_Clock_Get+0xf4a>
58024002:	16d66163          	bltu	a2,a3,58024164 <Clock_Peripheral_Clock_Get+0xc26>
58024006:	4609                	li	a2,2
58024008:	48c68c63          	beq	a3,a2,580244a0 <Clock_Peripheral_Clock_Get+0xf62>
5802400c:	460d                	li	a2,3
5802400e:	12c69c63          	bne	a3,a2,58024146 <Clock_Peripheral_Clock_Get+0xc08>
                vcoFreq = 384 * 50 * tmpVal / calculationDiv * (2000 / 2);
58024012:	6695                	lui	a3,0x5
58024014:	b0068693          	addi	a3,a3,-1280 # 4b00 <HeapMinSize+0x3b00>
58024018:	02d787b3          	mul	a5,a5,a3
5802401c:	00b7d693          	srli	a3,a5,0xb
58024020:	3e800793          	li	a5,1000
58024024:	02f687b3          	mul	a5,a3,a5
    if ((vcoFreq >= 1490000000) && (vcoFreq <= 1510000000)) {
58024028:	a73066b7          	lui	a3,0xa7306
5802402c:	78068693          	addi	a3,a3,1920 # a7306780 <__etext_final+0x4f2e0b8c>
58024030:	97b6                	add	a5,a5,a3
58024032:	013136b7          	lui	a3,0x1313
58024036:	d0068693          	addi	a3,a3,-768 # 1312d00 <HeapMinSize+0x1311d00>
5802403a:	8ef6efe3          	bltu	a3,a5,58023938 <Clock_Peripheral_Clock_Get+0x3fa>
        div = Clock_Get_MIPI_Div_Val();
5802403e:	4782                	lw	a5,0(sp)
        return Clock_MIPI_Clk_Mux_Output() / div;
58024040:	59683537          	lui	a0,0x59683
58024044:	f0050513          	addi	a0,a0,-256 # 59682f00 <__etext_final+0x165d30c>
        div = Clock_Get_MIPI_Div_Val();
58024048:	07f7f493          	andi	s1,a5,127
        return Clock_MIPI_Clk_Mux_Output() / div;
5802404c:	02955533          	divu	a0,a0,s1
    return Clock_Display_Clk_Mux_Output(Clock_Get_Display_Clk_Sel_Val()) / (div + 1);
58024050:	00140713          	addi	a4,s0,1
58024054:	02e55533          	divu	a0,a0,a4
58024058:	d4aff06f          	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_SF_CFG0);
5802405c:	17042783          	lw	a5,368(s0)
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_SF_CLK_SEL2);
58024060:	83b9                	srli	a5,a5,0xe
58024062:	8b8d                	andi	a5,a5,3
    if (sel == 0) {
58024064:	20078363          	beqz	a5,5802426a <Clock_Peripheral_Clock_Get+0xd2c>
    } else if (sel == 1) {
58024068:	4705                	li	a4,1
5802406a:	3ce78963          	beq	a5,a4,5802443c <Clock_Peripheral_Clock_Get+0xefe>
    } else if (sel == 2) {
5802406e:	4709                	li	a4,2
58024070:	1ee78d63          	beq	a5,a4,5802426a <Clock_Peripheral_Clock_Get+0xd2c>
        return Clock_Get_CPU_PLL_Output(100 * 1000 * 1000);
58024074:	05f5e537          	lui	a0,0x5f5e
58024078:	10050513          	addi	a0,a0,256 # 5f5e100 <HeapMinSize+0x5f5d100>
5802407c:	ca008097          	auipc	ra,0xca008
58024080:	140080e7          	jalr	320(ra) # 2202c1bc <Clock_Get_CPU_PLL_Output>
58024084:	b1fd                	j	58023d72 <Clock_Peripheral_Clock_Get+0x834>
    tmpVal = BL_RD_REG(HBN_BASE, HBN_GLB);
58024086:	2000f7b7          	lui	a5,0x2000f
5802408a:	5b9c                	lw	a5,48(a5)
    if (sel == 0) {
5802408c:	8b85                	andi	a5,a5,1
5802408e:	2c078d63          	beqz	a5,58024368 <Clock_Peripheral_Clock_Get+0xe2a>
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
58024092:	00710513          	addi	a0,sp,7
    uint8_t xtalType = 0;
58024096:	000103a3          	sb	zero,7(sp)
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
5802409a:	ca008097          	auipc	ra,0xca008
5802409e:	0f0080e7          	jalr	240(ra) # 2202c18a <HBN_Get_Xtal_Type>
580240a2:	30051463          	bnez	a0,580243aa <Clock_Peripheral_Clock_Get+0xe6c>
        switch (xtalType) {
580240a6:	00714783          	lbu	a5,7(sp)
580240aa:	4719                	li	a4,6
580240ac:	24f76363          	bltu	a4,a5,580242f2 <Clock_Peripheral_Clock_Get+0xdb4>
580240b0:	2202d737          	lui	a4,0x2202d
580240b4:	078a                	slli	a5,a5,0x2
580240b6:	a9070713          	addi	a4,a4,-1392 # 2202ca90 <CSWTCH.123>
580240ba:	97ba                	add	a5,a5,a4
580240bc:	4388                	lw	a0,0(a5)
580240be:	bb19                	j	58023dd4 <Clock_Peripheral_Clock_Get+0x896>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_DIG_CLK_CFG1);
580240c0:	200007b7          	lui	a5,0x20000
580240c4:	2547a783          	lw	a5,596(a5) # 20000254 <HeapMinSize+0x1ffff254>
    return Clock_Get_WIFI_PLL_Output(pllOut);
580240c8:	09897537          	lui	a0,0x9897
580240cc:	80050513          	addi	a0,a0,-2048 # 9896800 <HeapMinSize+0x9895800>
    if (sel == 0) {
580240d0:	8b85                	andi	a5,a5,1
580240d2:	2a078463          	beqz	a5,5802437a <Clock_Peripheral_Clock_Get+0xe3c>
        return Clock_Get_CPU_PLL_Output(160 * 1000 * 1000);
580240d6:	ca008097          	auipc	ra,0xca008
580240da:	0e6080e7          	jalr	230(ra) # 2202c1bc <Clock_Get_CPU_PLL_Output>
580240de:	be9d                	j	58023c54 <Clock_Peripheral_Clock_Get+0x716>
        return Clock_Get_CPU_PLL_Output(400 * 1000 * 1000);
580240e0:	17d78537          	lui	a0,0x17d78
580240e4:	40050513          	addi	a0,a0,1024 # 17d78400 <HeapMinSize+0x17d77400>
580240e8:	b85d                	j	5802399e <Clock_Peripheral_Clock_Get+0x460>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_DIG_CLK_CFG1);
580240ea:	200007b7          	lui	a5,0x20000
580240ee:	2547a783          	lw	a5,596(a5) # 20000254 <HeapMinSize+0x1ffff254>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_MM_MUXPLL_240M_SEL);
580240f2:	8385                	srli	a5,a5,0x1
    if (sel == 0) {
580240f4:	8b85                	andi	a5,a5,1
580240f6:	cbc1                	beqz	a5,58024186 <Clock_Peripheral_Clock_Get+0xc48>
        return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV2);
580240f8:	4505                	li	a0,1
580240fa:	ca008097          	auipc	ra,0xca008
580240fe:	21c080e7          	jalr	540(ra) # 2202c316 <Clock_Get_AUPLL_Output>
58024102:	c9aff06f          	j	5802359c <Clock_Peripheral_Clock_Get+0x5e>
    return Clock_Get_WIFI_PLL_Output(pllOut);
58024106:	1312d537          	lui	a0,0x1312d
5802410a:	ca008097          	auipc	ra,0xca008
5802410e:	362080e7          	jalr	866(ra) # 2202c46c <Clock_Get_WIFI_PLL_Output>
    return Clock_EMI_Clk_Mux_Output(Clock_Get_EMI_Clk_Sel_Val()) / (div + 1);
58024112:	02855533          	divu	a0,a0,s0
        return Clock_EMI_Get_WIFI_PLL_Output(320 * 1000 * 1000);
58024116:	c8cff06f          	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
        return 40 * 1000 * 1000;
5802411a:	02626537          	lui	a0,0x2626
5802411e:	a0050513          	addi	a0,a0,-1536 # 2625a00 <HeapMinSize+0x2624a00>
58024122:	f96ff06f          	j	580238b8 <Clock_Peripheral_Clock_Get+0x37a>
        switch (xtalType) {
58024126:	4501                	li	a0,0
        return Clock_Xtal_Output();
58024128:	ffeff06f          	j	58023926 <Clock_Peripheral_Clock_Get+0x3e8>
        switch (xtalType) {
5802412c:	4501                	li	a0,0
        return Clock_Xtal_Output();
5802412e:	e96ff06f          	j	580237c4 <Clock_Peripheral_Clock_Get+0x286>
        switch (xtalType) {
58024132:	4501                	li	a0,0
        return Clock_Xtal_Output();
58024134:	efaff06f          	j	5802382e <Clock_Peripheral_Clock_Get+0x2f0>
        return (32 * 1000 * 1000);
58024138:	01e85537          	lui	a0,0x1e85
5802413c:	80050513          	addi	a0,a0,-2048 # 1e84800 <HeapMinSize+0x1e83800>
58024140:	bc7d                	j	58023bfe <Clock_Peripheral_Clock_Get+0x6c0>
        switch (xtalType) {
58024142:	4501                	li	a0,0
        return Clock_Xtal_Output();
58024144:	b999                	j	58023d9a <Clock_Peripheral_Clock_Get+0x85c>
        switch (xtalType) {
58024146:	4605                	li	a2,1
58024148:	c4c69d63          	bne	a3,a2,580235a2 <Clock_Peripheral_Clock_Get+0x64>
                vcoFreq = 24 * 1000 * tmpVal / calculationDiv * 1000;
5802414c:	6699                	lui	a3,0x6
5802414e:	dc068693          	addi	a3,a3,-576 # 5dc0 <HeapMinSize+0x4dc0>
58024152:	02d787b3          	mul	a5,a5,a3
58024156:	00b7d693          	srli	a3,a5,0xb
5802415a:	3e800793          	li	a5,1000
5802415e:	02f687b3          	mul	a5,a3,a5
                break;
58024162:	b5d9                	j	58024028 <Clock_Peripheral_Clock_Get+0xaea>
        switch (xtalType) {
58024164:	4615                	li	a2,5
58024166:	36c68563          	beq	a3,a2,580244d0 <Clock_Peripheral_Clock_Get+0xf92>
5802416a:	4619                	li	a2,6
5802416c:	fcc69663          	bne	a3,a2,58023938 <Clock_Peripheral_Clock_Get+0x3fa>
                vcoFreq = 32 * 500 * tmpVal / calculationDiv * (2000 / 2);
58024170:	6691                	lui	a3,0x4
58024172:	e8068693          	addi	a3,a3,-384 # 3e80 <HeapMinSize+0x2e80>
58024176:	02d787b3          	mul	a5,a5,a3
5802417a:	3e800693          	li	a3,1000
5802417e:	83ad                	srli	a5,a5,0xb
58024180:	02d787b3          	mul	a5,a5,a3
                break;
58024184:	b555                	j	58024028 <Clock_Peripheral_Clock_Get+0xaea>
    return Clock_Get_WIFI_PLL_Output(pllOut);
58024186:	0e4e2537          	lui	a0,0xe4e2
5802418a:	c0050513          	addi	a0,a0,-1024 # e4e1c00 <HeapMinSize+0xe4e0c00>
5802418e:	ca008097          	auipc	ra,0xca008
58024192:	2de080e7          	jalr	734(ra) # 2202c46c <Clock_Get_WIFI_PLL_Output>
        return Clock_DSP_Get_WIFI_PLL_Output(240 * 1000 * 1000);
58024196:	c06ff06f          	j	5802359c <Clock_Peripheral_Clock_Get+0x5e>
        return (32 * 1000 * 1000);
5802419a:	01e85537          	lui	a0,0x1e85
5802419e:	80050513          	addi	a0,a0,-2048 # 1e84800 <HeapMinSize+0x1e83800>
580241a2:	f84ff06f          	j	58023926 <Clock_Peripheral_Clock_Get+0x3e8>
        return (32 * 1000 * 1000);
580241a6:	01e85537          	lui	a0,0x1e85
580241aa:	80050513          	addi	a0,a0,-2048 # 1e84800 <HeapMinSize+0x1e83800>
580241ae:	e16ff06f          	j	580237c4 <Clock_Peripheral_Clock_Get+0x286>
        return (32 * 1000 * 1000);
580241b2:	01e85537          	lui	a0,0x1e85
580241b6:	80050513          	addi	a0,a0,-2048 # 1e84800 <HeapMinSize+0x1e83800>
580241ba:	e74ff06f          	j	5802382e <Clock_Peripheral_Clock_Get+0x2f0>
        return (32 * 1000 * 1000);
580241be:	01e85537          	lui	a0,0x1e85
580241c2:	80050513          	addi	a0,a0,-2048 # 1e84800 <HeapMinSize+0x1e83800>
580241c6:	bed1                	j	58023d9a <Clock_Peripheral_Clock_Get+0x85c>
        return (2300000000);
580241c8:	89173537          	lui	a0,0x89173
580241cc:	70050513          	addi	a0,a0,1792 # 89173700 <__etext_final+0x3114db0c>
580241d0:	bd2ff06f          	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
        return Clock_Get_WIFI_PLL_Output(160 * 1000 * 1000);
580241d4:	09897537          	lui	a0,0x9897
580241d8:	80050513          	addi	a0,a0,-2048 # 9896800 <HeapMinSize+0x9895800>
580241dc:	ca008097          	auipc	ra,0xca008
580241e0:	290080e7          	jalr	656(ra) # 2202c46c <Clock_Get_WIFI_PLL_Output>
580241e4:	e4aff06f          	j	5802382e <Clock_Peripheral_Clock_Get+0x2f0>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_DIG_CLK_CFG1);
580241e8:	200007b7          	lui	a5,0x20000
580241ec:	2547a783          	lw	a5,596(a5) # 20000254 <HeapMinSize+0x1ffff254>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_MM_MUXPLL_240M_SEL);
580241f0:	8385                	srli	a5,a5,0x1
    if (sel == 0) {
580241f2:	8b85                	andi	a5,a5,1
580241f4:	10078163          	beqz	a5,580242f6 <Clock_Peripheral_Clock_Get+0xdb8>
        return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV2);
580241f8:	4505                	li	a0,1
580241fa:	ca008097          	auipc	ra,0xca008
580241fe:	11c080e7          	jalr	284(ra) # 2202c316 <Clock_Get_AUPLL_Output>
    return Clock_Clk_Mux_Output(Clock_Get_Clk_Sel_Val()) / (div + 1);
58024202:	02855533          	divu	a0,a0,s0
        return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV2);
58024206:	b9cff06f          	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_DIG_CLK_CFG1);
5802420a:	25442703          	lw	a4,596(s0)
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_TOP_MUXPLL_80M_SEL);
5802420e:	8321                	srli	a4,a4,0x8
58024210:	8b0d                	andi	a4,a4,3
    if (sel == 0) {
58024212:	24070c63          	beqz	a4,5802446a <Clock_Peripheral_Clock_Get+0xf2c>
    } else if (sel == 1) {
58024216:	2ef70563          	beq	a4,a5,58024500 <Clock_Peripheral_Clock_Get+0xfc2>
    } else if (sel == 2) {
5802421a:	4789                	li	a5,2
5802421c:	2cf70c63          	beq	a4,a5,580244f4 <Clock_Peripheral_Clock_Get+0xfb6>
        return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV6);
58024220:	4519                	li	a0,6
58024222:	ca008097          	auipc	ra,0xca008
58024226:	0f4080e7          	jalr	244(ra) # 2202c316 <Clock_Get_AUPLL_Output>
5802422a:	b6a1                	j	58023d72 <Clock_Peripheral_Clock_Get+0x834>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_DIG_CLK_CFG1);
5802422c:	200007b7          	lui	a5,0x20000
58024230:	2547a783          	lw	a5,596(a5) # 20000254 <HeapMinSize+0x1ffff254>
    return Clock_Get_WIFI_PLL_Output(pllOut);
58024234:	09897537          	lui	a0,0x9897
58024238:	80050513          	addi	a0,a0,-2048 # 9896800 <HeapMinSize+0x9895800>
    if (sel == 0) {
5802423c:	8b85                	andi	a5,a5,1
5802423e:	1e078363          	beqz	a5,58024424 <Clock_Peripheral_Clock_Get+0xee6>
        return Clock_Get_CPU_PLL_Output(160 * 1000 * 1000);
58024242:	ca008097          	auipc	ra,0xca008
58024246:	f7a080e7          	jalr	-134(ra) # 2202c1bc <Clock_Get_CPU_PLL_Output>
5802424a:	ba55                	j	58023bfe <Clock_Peripheral_Clock_Get+0x6c0>
        return Clock_Get_WIFI_PLL_Output(96 * 1000 * 1000);
5802424c:	05b8e537          	lui	a0,0x5b8e
58024250:	80050513          	addi	a0,a0,-2048 # 5b8d800 <HeapMinSize+0x5b8c800>
58024254:	ca008097          	auipc	ra,0xca008
58024258:	218080e7          	jalr	536(ra) # 2202c46c <Clock_Get_WIFI_PLL_Output>
5802425c:	bea5                	j	58023dd4 <Clock_Peripheral_Clock_Get+0x896>
        return 40 * 1000 * 1000;
5802425e:	02626537          	lui	a0,0x2626
58024262:	a0050513          	addi	a0,a0,-1536 # 2625a00 <HeapMinSize+0x2624a00>
58024266:	ec0ff06f          	j	58023926 <Clock_Peripheral_Clock_Get+0x3e8>
        return Clock_Get_WIFI_PLL_Output(120 * 1000 * 1000);
5802426a:	07271537          	lui	a0,0x7271
5802426e:	e0050513          	addi	a0,a0,-512 # 7270e00 <HeapMinSize+0x726fe00>
58024272:	ca008097          	auipc	ra,0xca008
58024276:	1fa080e7          	jalr	506(ra) # 2202c46c <Clock_Get_WIFI_PLL_Output>
5802427a:	bce5                	j	58023d72 <Clock_Peripheral_Clock_Get+0x834>
        return 40 * 1000 * 1000;
5802427c:	02626537          	lui	a0,0x2626
58024280:	a0050513          	addi	a0,a0,-1536 # 2625a00 <HeapMinSize+0x2624a00>
58024284:	be19                	j	58023d9a <Clock_Peripheral_Clock_Get+0x85c>
58024286:	02626537          	lui	a0,0x2626
5802428a:	a0050513          	addi	a0,a0,-1536 # 2625a00 <HeapMinSize+0x2624a00>
5802428e:	d36ff06f          	j	580237c4 <Clock_Peripheral_Clock_Get+0x286>
58024292:	02626537          	lui	a0,0x2626
58024296:	a0050513          	addi	a0,a0,-1536 # 2625a00 <HeapMinSize+0x2624a00>
5802429a:	d94ff06f          	j	5802382e <Clock_Peripheral_Clock_Get+0x2f0>
        return (2200000000);
5802429e:	83215537          	lui	a0,0x83215
580242a2:	60050513          	addi	a0,a0,1536 # 83215600 <__etext_final+0x2b1efa0c>
580242a6:	afcff06f          	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
        switch (xtalType) {
580242aa:	4501                	li	a0,0
        return Clock_Xtal_Output();
580242ac:	cb8ff06f          	j	58023764 <Clock_Peripheral_Clock_Get+0x226>
                vcoFreq = 40 * 250 * tmpVal / calculationDiv * (4000 / 2);
580242b0:	6789                	lui	a5,0x2
580242b2:	71078793          	addi	a5,a5,1808 # 2710 <HeapMinSize+0x1710>
580242b6:	02f407b3          	mul	a5,s0,a5
580242ba:	7d000713          	li	a4,2000
580242be:	83ad                	srli	a5,a5,0xb
580242c0:	02e787b3          	mul	a5,a5,a4
                break;
580242c4:	b02d                	j	58023aee <Clock_Peripheral_Clock_Get+0x5b0>
                vcoFreq = 26 * 500 * tmpVal / calculationDiv * 2000;
580242c6:	678d                	lui	a5,0x3
580242c8:	2c878793          	addi	a5,a5,712 # 32c8 <HeapMinSize+0x22c8>
580242cc:	02f407b3          	mul	a5,s0,a5
580242d0:	7d000713          	li	a4,2000
580242d4:	83ad                	srli	a5,a5,0xb
580242d6:	02e787b3          	mul	a5,a5,a4
                break;
580242da:	b811                	j	58023aee <Clock_Peripheral_Clock_Get+0x5b0>
        return (32 * 1000);
580242dc:	6521                	lui	a0,0x8
580242de:	d0050513          	addi	a0,a0,-768 # 7d00 <HeapMinSize+0x6d00>
580242e2:	ac0ff06f          	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
        return (2100000000);
580242e6:	7d2b7537          	lui	a0,0x7d2b7
580242ea:	50050513          	addi	a0,a0,1280 # 7d2b7500 <__etext_final+0x2529190c>
580242ee:	ab4ff06f          	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
        switch (xtalType) {
580242f2:	4501                	li	a0,0
        return Clock_Xtal_Output();
580242f4:	b4c5                	j	58023dd4 <Clock_Peripheral_Clock_Get+0x896>
    return Clock_Get_WIFI_PLL_Output(pllOut);
580242f6:	0e4e2537          	lui	a0,0xe4e2
580242fa:	c0050513          	addi	a0,a0,-1024 # e4e1c00 <HeapMinSize+0xe4e0c00>
580242fe:	ca008097          	auipc	ra,0xca008
58024302:	16e080e7          	jalr	366(ra) # 2202c46c <Clock_Get_WIFI_PLL_Output>
    return Clock_Clk_Mux_Output(Clock_Get_Clk_Sel_Val()) / (div + 1);
58024306:	02855533          	divu	a0,a0,s0
        return Clock_DSP_Get_WIFI_PLL_Output(240 * 1000 * 1000);
5802430a:	a98ff06f          	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
        return (32 * 1000 * 1000);
5802430e:	01e85537          	lui	a0,0x1e85
58024312:	80050513          	addi	a0,a0,-2048 # 1e84800 <HeapMinSize+0x1e83800>
58024316:	c4eff06f          	j	58023764 <Clock_Peripheral_Clock_Get+0x226>
        switch (xtalType) {
5802431a:	4501                	li	a0,0
        return Clock_Xtal_Output();
5802431c:	b0cd                	j	58023bfe <Clock_Peripheral_Clock_Get+0x6c0>
        return Clock_Get_WIFI_PLL_Output(160 * 1000 * 1000);
5802431e:	09897537          	lui	a0,0x9897
58024322:	80050513          	addi	a0,a0,-2048 # 9896800 <HeapMinSize+0x9895800>
58024326:	ca008097          	auipc	ra,0xca008
5802432a:	146080e7          	jalr	326(ra) # 2202c46c <Clock_Get_WIFI_PLL_Output>
5802432e:	df8ff06f          	j	58023926 <Clock_Peripheral_Clock_Get+0x3e8>
        return (2000000000);
58024332:	77359537          	lui	a0,0x77359
58024336:	40050513          	addi	a0,a0,1024 # 77359400 <__etext_final+0x1f33380c>
5802433a:	a68ff06f          	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
        switch (xtalType) {
5802433e:	4501                	li	a0,0
        return Clock_Xtal_Output();
58024340:	ba11                	j	58023c54 <Clock_Peripheral_Clock_Get+0x716>
        switch (xtalType) {
58024342:	4501                	li	a0,0
        return Clock_Xtal_Output();
58024344:	b7cff06f          	j	580236c0 <Clock_Peripheral_Clock_Get+0x182>
        return Clock_Get_CPU_PLL_Output(160 * 1000 * 1000);
58024348:	09897537          	lui	a0,0x9897
5802434c:	80050513          	addi	a0,a0,-2048 # 9896800 <HeapMinSize+0x9895800>
58024350:	ca008097          	auipc	ra,0xca008
58024354:	e6c080e7          	jalr	-404(ra) # 2202c1bc <Clock_Get_CPU_PLL_Output>
58024358:	cd6ff06f          	j	5802382e <Clock_Peripheral_Clock_Get+0x2f0>
        return 40 * 1000 * 1000;
5802435c:	02626537          	lui	a0,0x2626
58024360:	a0050513          	addi	a0,a0,-1536 # 2625a00 <HeapMinSize+0x2624a00>
58024364:	c00ff06f          	j	58023764 <Clock_Peripheral_Clock_Get+0x226>
        return (32 * 1000 * 1000);
58024368:	01e85537          	lui	a0,0x1e85
5802436c:	80050513          	addi	a0,a0,-2048 # 1e84800 <HeapMinSize+0x1e83800>
58024370:	b495                	j	58023dd4 <Clock_Peripheral_Clock_Get+0x896>
        return (1600000000);
58024372:	5f5e1537          	lui	a0,0x5f5e1
58024376:	a2cff06f          	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
    return Clock_Get_WIFI_PLL_Output(pllOut);
5802437a:	ca008097          	auipc	ra,0xca008
5802437e:	0f2080e7          	jalr	242(ra) # 2202c46c <Clock_Get_WIFI_PLL_Output>
        return Clock_DSP_Get_WIFI_PLL_Output(160 * 1000 * 1000);
58024382:	b8c9                	j	58023c54 <Clock_Peripheral_Clock_Get+0x716>
        return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV2);
58024384:	4505                	li	a0,1
58024386:	ca008097          	auipc	ra,0xca008
5802438a:	f90080e7          	jalr	-112(ra) # 2202c316 <Clock_Get_AUPLL_Output>
5802438e:	ca0ff06f          	j	5802382e <Clock_Peripheral_Clock_Get+0x2f0>
}
58024392:	4432                	lw	s0,12(sp)
58024394:	40c2                	lw	ra,16(sp)
58024396:	44a2                	lw	s1,8(sp)
        return Clock_Get_WIFI_PLL_Output(160 * 1000 * 1000);
58024398:	09897537          	lui	a0,0x9897
5802439c:	80050513          	addi	a0,a0,-2048 # 9896800 <HeapMinSize+0x9895800>
}
580243a0:	0151                	addi	sp,sp,20
        return Clock_Get_WIFI_PLL_Output(160 * 1000 * 1000);
580243a2:	ca008317          	auipc	t1,0xca008
580243a6:	0ca30067          	jr	202(t1) # 2202c46c <Clock_Get_WIFI_PLL_Output>
        return 40 * 1000 * 1000;
580243aa:	02626537          	lui	a0,0x2626
580243ae:	a0050513          	addi	a0,a0,-1536 # 2625a00 <HeapMinSize+0x2624a00>
580243b2:	b40d                	j	58023dd4 <Clock_Peripheral_Clock_Get+0x896>
        return (32 * 1000 * 1000);
580243b4:	01e85537          	lui	a0,0x1e85
580243b8:	80050513          	addi	a0,a0,-2048 # 1e84800 <HeapMinSize+0x1e83800>
580243bc:	b04ff06f          	j	580236c0 <Clock_Peripheral_Clock_Get+0x182>
        return (32 * 1000 * 1000);
580243c0:	01e85537          	lui	a0,0x1e85
580243c4:	80050513          	addi	a0,a0,-2048 # 1e84800 <HeapMinSize+0x1e83800>
580243c8:	b071                	j	58023c54 <Clock_Peripheral_Clock_Get+0x716>
        return (1500000000);
580243ca:	59683537          	lui	a0,0x59683
580243ce:	f0050513          	addi	a0,a0,-256 # 59682f00 <__etext_final+0x165d30c>
580243d2:	9d0ff06f          	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
        return 40 * 1000 * 1000;
580243d6:	02626537          	lui	a0,0x2626
580243da:	a0050513          	addi	a0,a0,-1536 # 2625a00 <HeapMinSize+0x2624a00>
580243de:	b005                	j	58023bfe <Clock_Peripheral_Clock_Get+0x6c0>
580243e0:	02626537          	lui	a0,0x2626
580243e4:	a0050513          	addi	a0,a0,-1536 # 2625a00 <HeapMinSize+0x2624a00>
580243e8:	ad8ff06f          	j	580236c0 <Clock_Peripheral_Clock_Get+0x182>
580243ec:	02626537          	lui	a0,0x2626
580243f0:	a0050513          	addi	a0,a0,-1536 # 2625a00 <HeapMinSize+0x2624a00>
580243f4:	b085                	j	58023c54 <Clock_Peripheral_Clock_Get+0x716>
        return (1400000000);
580243f6:	53725537          	lui	a0,0x53725
580243fa:	e0050513          	addi	a0,a0,-512 # 53724e00 <__HeapLimit+0x316ece00>
580243fe:	9a4ff06f          	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
        return Clock_Get_CPU_PLL_Output(160 * 1000 * 1000);
58024402:	09897537          	lui	a0,0x9897
58024406:	80050513          	addi	a0,a0,-2048 # 9896800 <HeapMinSize+0x9895800>
5802440a:	ca008097          	auipc	ra,0xca008
5802440e:	db2080e7          	jalr	-590(ra) # 2202c1bc <Clock_Get_CPU_PLL_Output>
58024412:	d14ff06f          	j	58023926 <Clock_Peripheral_Clock_Get+0x3e8>
        return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV2);
58024416:	4505                	li	a0,1
58024418:	ca008097          	auipc	ra,0xca008
5802441c:	efe080e7          	jalr	-258(ra) # 2202c316 <Clock_Get_AUPLL_Output>
58024420:	d06ff06f          	j	58023926 <Clock_Peripheral_Clock_Get+0x3e8>
    return Clock_Get_WIFI_PLL_Output(pllOut);
58024424:	ca008097          	auipc	ra,0xca008
58024428:	048080e7          	jalr	72(ra) # 2202c46c <Clock_Get_WIFI_PLL_Output>
        return Clock_DSP_Get_WIFI_PLL_Output(160 * 1000 * 1000);
5802442c:	fd2ff06f          	j	58023bfe <Clock_Peripheral_Clock_Get+0x6c0>
        return (1066000000);
58024430:	3f89e537          	lui	a0,0x3f89e
58024434:	e8050513          	addi	a0,a0,-384 # 3f89de80 <__HeapLimit+0x1d865e80>
58024438:	96aff06f          	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
5802443c:	00710513          	addi	a0,sp,7
    uint8_t xtalType = 0;
58024440:	000103a3          	sb	zero,7(sp)
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
58024444:	ca008097          	auipc	ra,0xca008
58024448:	d46080e7          	jalr	-698(ra) # 2202c18a <HBN_Get_Xtal_Type>
5802444c:	e179                	bnez	a0,58024512 <Clock_Peripheral_Clock_Get+0xfd4>
        switch (xtalType) {
5802444e:	00714783          	lbu	a5,7(sp)
58024452:	4719                	li	a4,6
58024454:	90f76fe3          	bltu	a4,a5,58023d72 <Clock_Peripheral_Clock_Get+0x834>
58024458:	00279713          	slli	a4,a5,0x2
5802445c:	2202d7b7          	lui	a5,0x2202d
58024460:	a9078793          	addi	a5,a5,-1392 # 2202ca90 <CSWTCH.123>
58024464:	97ba                	add	a5,a5,a4
58024466:	4388                	lw	a0,0(a5)
58024468:	b229                	j	58023d72 <Clock_Peripheral_Clock_Get+0x834>
        return Clock_Get_WIFI_PLL_Output(80 * 1000 * 1000);
5802446a:	04c4b537          	lui	a0,0x4c4b
5802446e:	40050513          	addi	a0,a0,1024 # 4c4b400 <HeapMinSize+0x4c4a400>
58024472:	ca008097          	auipc	ra,0xca008
58024476:	ffa080e7          	jalr	-6(ra) # 2202c46c <Clock_Get_WIFI_PLL_Output>
5802447a:	b8e5                	j	58023d72 <Clock_Peripheral_Clock_Get+0x834>
        return (800000000);
5802447c:	2faf1537          	lui	a0,0x2faf1
58024480:	80050513          	addi	a0,a0,-2048 # 2faf0800 <__HeapLimit+0xdab8800>
58024484:	91eff06f          	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
                vcoFreq = 40 * 500 * tmpVal / calculationDiv * (2000 / 2);
58024488:	6695                	lui	a3,0x5
5802448a:	e2068693          	addi	a3,a3,-480 # 4e20 <HeapMinSize+0x3e20>
5802448e:	02d787b3          	mul	a5,a5,a3
58024492:	00b7d693          	srli	a3,a5,0xb
58024496:	3e800793          	li	a5,1000
5802449a:	02f687b3          	mul	a5,a3,a5
                break;
5802449e:	b669                	j	58024028 <Clock_Peripheral_Clock_Get+0xaea>
                vcoFreq = 32 * 500 * tmpVal / calculationDiv * (2000 / 2);
580244a0:	6691                	lui	a3,0x4
580244a2:	e8068693          	addi	a3,a3,-384 # 3e80 <HeapMinSize+0x2e80>
580244a6:	02d787b3          	mul	a5,a5,a3
580244aa:	00b7d693          	srli	a3,a5,0xb
580244ae:	3e800793          	li	a5,1000
580244b2:	02f687b3          	mul	a5,a3,a5
                break;
580244b6:	be8d                	j	58024028 <Clock_Peripheral_Clock_Get+0xaea>
}
580244b8:	4432                	lw	s0,12(sp)
580244ba:	40c2                	lw	ra,16(sp)
580244bc:	44a2                	lw	s1,8(sp)
        return Clock_Get_CPU_PLL_Output(160 * 1000 * 1000);
580244be:	09897537          	lui	a0,0x9897
580244c2:	80050513          	addi	a0,a0,-2048 # 9896800 <HeapMinSize+0x9895800>
}
580244c6:	0151                	addi	sp,sp,20
        return Clock_Get_CPU_PLL_Output(160 * 1000 * 1000);
580244c8:	ca008317          	auipc	t1,0xca008
580244cc:	cf430067          	jr	-780(t1) # 2202c1bc <Clock_Get_CPU_PLL_Output>
                vcoFreq = 26 * 1000 * tmpVal / calculationDiv * 1000;
580244d0:	6699                	lui	a3,0x6
580244d2:	59068693          	addi	a3,a3,1424 # 6590 <HeapMinSize+0x5590>
580244d6:	02d787b3          	mul	a5,a5,a3
580244da:	00b7d693          	srli	a3,a5,0xb
580244de:	3e800793          	li	a5,1000
580244e2:	02f687b3          	mul	a5,a3,a5
                break;
580244e6:	b689                	j	58024028 <Clock_Peripheral_Clock_Get+0xaea>
        return (667000000);
580244e8:	27c1a537          	lui	a0,0x27c1a
580244ec:	cc050513          	addi	a0,a0,-832 # 27c19cc0 <__HeapLimit+0x5be1cc0>
580244f0:	8b2ff06f          	j	580235a2 <Clock_Peripheral_Clock_Get+0x64>
        return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV5);
580244f4:	4515                	li	a0,5
580244f6:	ca008097          	auipc	ra,0xca008
580244fa:	e20080e7          	jalr	-480(ra) # 2202c316 <Clock_Get_AUPLL_Output>
580244fe:	b895                	j	58023d72 <Clock_Peripheral_Clock_Get+0x834>
        return Clock_Get_CPU_PLL_Output(80 * 1000 * 1000);
58024500:	04c4b537          	lui	a0,0x4c4b
58024504:	40050513          	addi	a0,a0,1024 # 4c4b400 <HeapMinSize+0x4c4a400>
58024508:	ca008097          	auipc	ra,0xca008
5802450c:	cb4080e7          	jalr	-844(ra) # 2202c1bc <Clock_Get_CPU_PLL_Output>
58024510:	b08d                	j	58023d72 <Clock_Peripheral_Clock_Get+0x834>
        return 40 * 1000 * 1000;
58024512:	02626537          	lui	a0,0x2626
58024516:	a0050513          	addi	a0,a0,-1536 # 2625a00 <HeapMinSize+0x2624a00>
5802451a:	b8a1                	j	58023d72 <Clock_Peripheral_Clock_Get+0x834>

5802451c <bflb_clk_get_peripheral_clock>:
    return 0;
}

uint32_t bflb_clk_get_peripheral_clock(uint8_t type, uint8_t idx)
{
    if (type == BFLB_DEVICE_TYPE_UART) {
5802451c:	4795                	li	a5,5
5802451e:	00f50d63          	beq	a0,a5,58024538 <bflb_clk_get_peripheral_clock+0x1c>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_UART0);
    } else if (type == BFLB_DEVICE_TYPE_SPI) {
58024522:	4799                	li	a5,6
58024524:	00f50d63          	beq	a0,a5,5802453e <bflb_clk_get_peripheral_clock+0x22>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_SPI0);
    } else if (type == BFLB_DEVICE_TYPE_I2C) {
58024528:	479d                	li	a5,7
5802452a:	00f50d63          	beq	a0,a5,58024544 <bflb_clk_get_peripheral_clock+0x28>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_I2C0);
    } else if (type == BFLB_DEVICE_TYPE_SDH) {
5802452e:	47c5                	li	a5,17
58024530:	00f50d63          	beq	a0,a5,5802454a <bflb_clk_get_peripheral_clock+0x2e>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_SDH);
    }
    return 0;
58024534:	4501                	li	a0,0
58024536:	8082                	ret
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_UART0);
58024538:	4501                	li	a0,0
5802453a:	804ff06f          	j	5802353e <Clock_Peripheral_Clock_Get>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_SPI0);
5802453e:	4511                	li	a0,4
58024540:	ffffe06f          	j	5802353e <Clock_Peripheral_Clock_Get>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_I2C0);
58024544:	4519                	li	a0,6
58024546:	ff9fe06f          	j	5802353e <Clock_Peripheral_Clock_Get>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_SDH);
5802454a:	4565                	li	a0,25
5802454c:	ff3fe06f          	j	5802353e <Clock_Peripheral_Clock_Get>

58024550 <bl_show_log>:
}
#endif
#endif

void bl_show_log(void)
{
58024550:	1151                	addi	sp,sp,-12
58024552:	c222                	sw	s0,4(sp)
    printf("\r\n");
58024554:	58024437          	lui	s0,0x58024
58024558:	7fc40513          	addi	a0,s0,2044 # 580247fc <powers_of_10+0xa4>
{
5802455c:	c406                	sw	ra,8(sp)
    printf("\r\n");
5802455e:	a19fe0ef          	jal	ra,58022f76 <printf>
    printf("  ____               __  __      _       _       _     \r\n");
58024562:	58025537          	lui	a0,0x58025
58024566:	b4050513          	addi	a0,a0,-1216 # 58024b40 <powers_of_10+0x3e8>
5802456a:	a0dfe0ef          	jal	ra,58022f76 <printf>
    printf(" |  _ \\             / _|/ _|    | |     | |     | |    \r\n");
5802456e:	58025537          	lui	a0,0x58025
58024572:	b7c50513          	addi	a0,a0,-1156 # 58024b7c <powers_of_10+0x424>
58024576:	a01fe0ef          	jal	ra,58022f76 <printf>
    printf(" | |_) | ___  _   _| |_| |_ __ _| | ___ | | __ _| |__  \r\n");
5802457a:	58025537          	lui	a0,0x58025
5802457e:	bb850513          	addi	a0,a0,-1096 # 58024bb8 <powers_of_10+0x460>
58024582:	9f5fe0ef          	jal	ra,58022f76 <printf>
    printf(" |  _ < / _ \\| | | |  _|  _/ _` | |/ _ \\| |/ _` | '_ \\ \r\n");
58024586:	58025537          	lui	a0,0x58025
5802458a:	bf450513          	addi	a0,a0,-1036 # 58024bf4 <powers_of_10+0x49c>
5802458e:	9e9fe0ef          	jal	ra,58022f76 <printf>
    printf(" | |_) | (_) | |_| | | | || (_| | | (_) | | (_| | |_) |\r\n");
58024592:	58025537          	lui	a0,0x58025
58024596:	c3050513          	addi	a0,a0,-976 # 58024c30 <powers_of_10+0x4d8>
5802459a:	9ddfe0ef          	jal	ra,58022f76 <printf>
    printf(" |____/ \\___/ \\__,_|_| |_| \\__,_|_|\\___/|_|\\__,_|_.__/ \r\n");
5802459e:	58025537          	lui	a0,0x58025
580245a2:	c6c50513          	addi	a0,a0,-916 # 58024c6c <powers_of_10+0x514>
580245a6:	9d1fe0ef          	jal	ra,58022f76 <printf>
    printf("\r\n");
580245aa:	7fc40513          	addi	a0,s0,2044
580245ae:	9c9fe0ef          	jal	ra,58022f76 <printf>
    printf("Build:%s,%s\r\n", __TIME__, __DATE__);
580245b2:	58025637          	lui	a2,0x58025
580245b6:	580255b7          	lui	a1,0x58025
580245ba:	58025537          	lui	a0,0x58025
580245be:	ca860613          	addi	a2,a2,-856 # 58024ca8 <powers_of_10+0x550>
580245c2:	cb458593          	addi	a1,a1,-844 # 58024cb4 <powers_of_10+0x55c>
580245c6:	cc050513          	addi	a0,a0,-832 # 58024cc0 <powers_of_10+0x568>
580245ca:	9adfe0ef          	jal	ra,58022f76 <printf>
    printf("Copyright (c) 2022 Bouffalolab team\r\n");
}
580245ce:	4412                	lw	s0,4(sp)
580245d0:	40a2                	lw	ra,8(sp)
    printf("Copyright (c) 2022 Bouffalolab team\r\n");
580245d2:	58025537          	lui	a0,0x58025
580245d6:	cd050513          	addi	a0,a0,-816 # 58024cd0 <powers_of_10+0x578>
}
580245da:	0131                	addi	sp,sp,12
    printf("Copyright (c) 2022 Bouffalolab team\r\n");
580245dc:	99bfe06f          	j	58022f76 <printf>

580245e0 <board_init>:

    log_start();
}
#elif defined(CPU_LP)
void board_init(void)
{
580245e0:	1121                	addi	sp,sp,-24
580245e2:	ca06                	sw	ra,20(sp)
580245e4:	c822                	sw	s0,16(sp)
580245e6:	c626                	sw	s1,12(sp)
    CPU_Set_MTimer_CLK(ENABLE, CPU_Get_MTimer_Source_Clock() / 1000 / 1000 - 1);
580245e8:	ca008097          	auipc	ra,0xca008
580245ec:	40e080e7          	jalr	1038(ra) # 2202c9f6 <CPU_Get_MTimer_Source_Clock>
580245f0:	000f45b7          	lui	a1,0xf4
580245f4:	24058593          	addi	a1,a1,576 # f4240 <HeapMinSize+0xf3240>
580245f8:	02b555b3          	divu	a1,a0,a1
580245fc:	4505                	li	a0,1

    bl_show_log();

    printf("lp does not use memheap due to little ram \r\n");

    printf("sig1:%08x\r\n", BL_RD_REG(GLB_BASE, GLB_UART_CFG1));
580245fe:	20000437          	lui	s0,0x20000
    CPU_Set_MTimer_CLK(ENABLE, CPU_Get_MTimer_Source_Clock() / 1000 / 1000 - 1);
58024602:	15fd                	addi	a1,a1,-1
58024604:	05c2                	slli	a1,a1,0x10
58024606:	81c1                	srli	a1,a1,0x10
58024608:	ca008097          	auipc	ra,0xca008
5802460c:	380080e7          	jalr	896(ra) # 2202c988 <CPU_Set_MTimer_CLK>
    bflb_irq_initialize();
58024610:	c7ffe0ef          	jal	ra,5802328e <bflb_irq_initialize>
    gpio = bflb_device_get_by_name("gpio");
58024614:	58025537          	lui	a0,0x58025
58024618:	81050513          	addi	a0,a0,-2032 # 58024810 <powers_of_10+0xb8>
5802461c:	c91fe0ef          	jal	ra,580232ac <bflb_device_get_by_name>
    bflb_gpio_uart_init(gpio, GPIO_PIN_18, GPIO_UART_FUNC_UART1_TX);
58024620:	4619                	li	a2,6
58024622:	45c9                	li	a1,18
    gpio = bflb_device_get_by_name("gpio");
58024624:	84aa                	mv	s1,a0
    bflb_gpio_uart_init(gpio, GPIO_PIN_18, GPIO_UART_FUNC_UART1_TX);
58024626:	9c3fe0ef          	jal	ra,58022fe8 <bflb_gpio_uart_init>
    bflb_gpio_uart_init(gpio, GPIO_PIN_19, GPIO_UART_FUNC_UART1_RX);
5802462a:	461d                	li	a2,7
5802462c:	45cd                	li	a1,19
5802462e:	8526                	mv	a0,s1
58024630:	9b9fe0ef          	jal	ra,58022fe8 <bflb_gpio_uart_init>
    cfg.baudrate = 2000000;
58024634:	001e87b7          	lui	a5,0x1e8
58024638:	48078793          	addi	a5,a5,1152 # 1e8480 <HeapMinSize+0x1e7480>
5802463c:	c03e                	sw	a5,0(sp)
    cfg.data_bits = UART_DATA_BITS_8;
5802463e:	478d                	li	a5,3
58024640:	00f102a3          	sb	a5,5(sp)
    uart0 = bflb_device_get_by_name("uart1");
58024644:	58025537          	lui	a0,0x58025
    cfg.stop_bits = UART_STOP_BITS_1;
58024648:	4785                	li	a5,1
5802464a:	00f11323          	sh	a5,6(sp)
    uart0 = bflb_device_get_by_name("uart1");
5802464e:	82050513          	addi	a0,a0,-2016 # 58024820 <powers_of_10+0xc8>
    cfg.tx_fifo_threshold = 7;
58024652:	70700793          	li	a5,1799
58024656:	00f11523          	sh	a5,10(sp)
    cfg.flow_ctrl = 0;
5802465a:	000104a3          	sb	zero,9(sp)
    uart0 = bflb_device_get_by_name("uart1");
5802465e:	c4ffe0ef          	jal	ra,580232ac <bflb_device_get_by_name>
    bflb_uart_init(uart0, &cfg);
58024662:	858a                	mv	a1,sp
    uart0 = bflb_device_get_by_name("uart1");
58024664:	05418493          	addi	s1,gp,84 # 22034854 <uart0>
58024668:	c088                	sw	a0,0(s1)
    bflb_uart_init(uart0, &cfg);
5802466a:	aeffe0ef          	jal	ra,58023158 <bflb_uart_init>
    bflb_uart_set_console(uart0);
5802466e:	4088                	lw	a0,0(s1)
58024670:	971fe0ef          	jal	ra,58022fe0 <bflb_uart_set_console>
    bl_show_log();
58024674:	3df1                	jal	58024550 <bl_show_log>
    printf("lp does not use memheap due to little ram \r\n");
58024676:	58025537          	lui	a0,0x58025
5802467a:	cf850513          	addi	a0,a0,-776 # 58024cf8 <powers_of_10+0x5a0>
5802467e:	8f9fe0ef          	jal	ra,58022f76 <printf>
    printf("sig1:%08x\r\n", BL_RD_REG(GLB_BASE, GLB_UART_CFG1));
58024682:	15442583          	lw	a1,340(s0) # 20000154 <HeapMinSize+0x1ffff154>
58024686:	58025537          	lui	a0,0x58025
5802468a:	d2850513          	addi	a0,a0,-728 # 58024d28 <powers_of_10+0x5d0>
5802468e:	8e9fe0ef          	jal	ra,58022f76 <printf>
    printf("sig2:%08x\r\n", BL_RD_REG(GLB_BASE, GLB_UART_CFG2));
58024692:	15842583          	lw	a1,344(s0)
58024696:	58025537          	lui	a0,0x58025
5802469a:	d3450513          	addi	a0,a0,-716 # 58024d34 <powers_of_10+0x5dc>
5802469e:	8d9fe0ef          	jal	ra,58022f76 <printf>
    printf("cgen1:%08x\r\n", getreg32(BFLB_GLB_CGEN1_BASE));
580246a2:	58442583          	lw	a1,1412(s0)
580246a6:	58025537          	lui	a0,0x58025
580246aa:	d4050513          	addi	a0,a0,-704 # 58024d40 <powers_of_10+0x5e8>
580246ae:	8c9fe0ef          	jal	ra,58022f76 <printf>

    log_start();
}
580246b2:	4442                	lw	s0,16(sp)
580246b4:	40d2                	lw	ra,20(sp)
580246b6:	44b2                	lw	s1,12(sp)
580246b8:	0161                	addi	sp,sp,24
    log_start();
580246ba:	92dfe06f          	j	58022fe6 <log_start>
	...

580246c0 <__fsymtab_end>:
580246c0:	5b5d465b          	0x5b5d465b
580246c4:	414d                	li	sp,19
580246c6:	4e49                	li	t3,18
580246c8:	205d                	jal	5802476e <powers_of_10+0x16>
580246ca:	6568                	flw	fa0,76(a0)
580246cc:	6c6c                	flw	fa1,92(s0)
580246ce:	6f77206f          	j	580975c4 <__etext_final+0x719d0>
580246d2:	6c72                	flw	fs8,28(sp)
580246d4:	2064                	fld	fs1,192(s0)
580246d6:	706c                	flw	fa1,100(s0)
580246d8:	0a0d                	addi	s4,s4,3
580246da:	0000                	unimp
580246dc:	5b5d455b          	0x5b5d455b
580246e0:	414d                	li	sp,19
580246e2:	4e49                	li	t3,18
580246e4:	205d                	jal	5802478a <powers_of_10+0x32>
580246e6:	6568                	flw	fa0,76(a0)
580246e8:	6c6c                	flw	fa1,92(s0)
580246ea:	6f77206f          	j	580975e0 <__etext_final+0x719ec>
580246ee:	6c72                	flw	fs8,28(sp)
580246f0:	2064                	fld	fs1,192(s0)
580246f2:	706c                	flw	fa1,100(s0)
580246f4:	0a0d                	addi	s4,s4,3
580246f6:	0000                	unimp
580246f8:	5b5d575b          	0x5b5d575b
580246fc:	414d                	li	sp,19
580246fe:	4e49                	li	t3,18
58024700:	205d                	jal	580247a6 <powers_of_10+0x4e>
58024702:	6568                	flw	fa0,76(a0)
58024704:	6c6c                	flw	fa1,92(s0)
58024706:	6f77206f          	j	580975fc <__etext_final+0x71a08>
5802470a:	6c72                	flw	fs8,28(sp)
5802470c:	2064                	fld	fs1,192(s0)
5802470e:	706c                	flw	fa1,100(s0)
58024710:	0a0d                	addi	s4,s4,3
58024712:	0000                	unimp
58024714:	5b5d495b          	0x5b5d495b
58024718:	414d                	li	sp,19
5802471a:	4e49                	li	t3,18
5802471c:	205d                	jal	580247c2 <powers_of_10+0x6a>
5802471e:	6568                	flw	fa0,76(a0)
58024720:	6c6c                	flw	fa1,92(s0)
58024722:	6f77206f          	j	58097618 <__etext_final+0x71a24>
58024726:	6c72                	flw	fs8,28(sp)
58024728:	2064                	fld	fs1,192(s0)
5802472a:	706c                	flw	fa1,100(s0)
5802472c:	0a0d                	addi	s4,s4,3
5802472e:	0000                	unimp
58024730:	6e66                	flw	ft8,88(sp)
58024732:	0069                	c.nop	26
58024734:	6e66                	flw	ft8,88(sp)
58024736:	2b69                	jal	58024cd0 <powers_of_10+0x578>
58024738:	0000                	unimp
5802473a:	0000                	unimp
5802473c:	616e                	flw	ft2,216(sp)
5802473e:	006e                	c.slli	zero,0x1b
58024740:	6e66                	flw	ft8,88(sp)
58024742:	2d69                	jal	58024ddc <__clz_tab+0x8c>
58024744:	0000                	unimp
58024746:	0000                	unimp
58024748:	6c29                	lui	s8,0xa
5802474a:	756c                	flw	fa1,108(a0)
5802474c:	286e                	fld	fa6,216(sp)
5802474e:	0000                	unimp
58024750:	6c29                	lui	s8,0xa
58024752:	6e69                	lui	t3,0x1a
58024754:	0028                	addi	a0,sp,8
	...

58024758 <powers_of_10>:
58024758:	0000 0000 0000 3ff0 0000 0000 0000 4024     .......?......$@
58024768:	0000 0000 0000 4059 0000 0000 4000 408f     ......Y@.....@.@
58024778:	0000 0000 8800 40c3 0000 0000 6a00 40f8     .......@.....j.@
58024788:	0000 0000 8480 412e 0000 0000 12d0 4163     .......A......cA
58024798:	0000 0000 d784 4197 0000 0000 cd65 41cd     .......A....e..A
580247a8:	0000 2000 a05f 4202 0000 e800 4876 4237     ... _..B....vH7B
580247b8:	0000 a200 1a94 426d 0000 e540 309c 42a2     ......mB..@..0.B
580247c8:	0000 1e90 bcc4 42d6 0000 2634 6bf5 430c     .......B..4&.k.C
580247d8:	8000 37e0 c379 4341 a000 85d8 3457 4376     ...7y.AC....W4vC
580247e8:	7269 2071 253a 2064 6e75 6572 6967 7473     irq :%d unregist
580247f8:	7265 6465 0a0d 0000 6461 0063 6164 0063     ered....adc.dac.
58024808:	6665 635f 7274 006c 7067 6f69 0000 0000     ef_ctrl.gpio....
58024818:	6175 7472 0030 0000 6175 7472 0031 0000     uart0...uart1...
58024828:	6175 7472 0032 0000 6175 7472 0033 0000     uart2...uart3...
58024838:	7073 3069 0000 0000 7770 5f6d 3276 305f     spi0....pwm_v2_0
58024848:	0000 0000 6d64 3061 635f 3068 0000 0000     ....dma0_ch0....
58024858:	6d64 3061 635f 3168 0000 0000 6d64 3061     dma0_ch1....dma0
58024868:	635f 3268 0000 0000 6d64 3061 635f 3368     _ch2....dma0_ch3
58024878:	0000 0000 6d64 3061 635f 3468 0000 0000     ....dma0_ch4....
58024888:	6d64 3061 635f 3568 0000 0000 6d64 3061     dma0_ch5....dma0
58024898:	635f 3668 0000 0000 6d64 3061 635f 3768     _ch6....dma0_ch7
580248a8:	0000 0000 3269 3063 0000 0000 6974 656d     ....i2c0....time
580248b8:	3072 0000 6974 656d 3172 0000 7472 0063     r0..timer1..rtc.
580248c8:	6561 0073 6873 0061 7274 676e 0000 0000     aes.sha.trng....
580248d8:	6b70 0061 6d65 6361 0030 0000 7269 7874     pka.emac0...irtx
580248e8:	0000 0000 7269 7872 0000 0000 6b63 0073     ....irrx....cks.
580248f8:	6a6d 6570 0067 0000 6177 6374 6468 676f     mjpeg...watchdog
58024908:	0000 0000 6163 306d 0000 0000 6163 316d     ....cam0....cam1
58024918:	0000 0000 6163 326d 0000 0000 6163 336d     ....cam2....cam3
58024928:	0000 0000 6163 346d 0000 0000 6163 356d     ....cam4....cam5
58024938:	0000 0000 6163 366d 0000 0000 6163 376d     ....cam6....cam7
58024948:	0000 0000 7363 0069 6e49 7473 7572 7463     ....csi.Instruct
58024958:	6f69 206e 6461 7264 7365 2073 696d 6173     ion address misa
58024968:	696c 6e67 6465 0000 6e49 7473 7572 7463     ligned..Instruct
58024978:	6f69 206e 6361 6563 7373 6620 7561 746c     ion access fault
58024988:	0000 0000 6c49 656c 6167 206c 6e69 7473     ....Illegal inst
58024998:	7572 7463 6f69 006e 7242 6165 706b 696f     ruction.Breakpoi
580249a8:	746e 0000 6f4c 6461 6120 6464 6572 7373     nt..Load address
580249b8:	6d20 7369 6c61 6769 656e 0064 6f4c 6461      misaligned.Load
580249c8:	6120 6363 7365 2073 6166 6c75 0074 0000      access fault...
580249d8:	7453 726f 2f65 4d41 204f 6461 7264 7365     Store/AMO addres
580249e8:	2073 696d 6173 696c 6e67 6465 0000 0000     s misaligned....
580249f8:	7453 726f 2f65 4d41 204f 6361 6563 7373     Store/AMO access
58024a08:	6620 7561 746c 0000 6e45 6976 6f72 6d6e      fault..Environm
58024a18:	6e65 2074 6163 6c6c 6620 6f72 206d 2d55     ent call from U-
58024a28:	6f6d 6564 0000 0000 6e45 6976 6f72 6d6e     mode....Environm
58024a38:	6e65 2074 6163 6c6c 6620 6f72 206d 2d53     ent call from S-
58024a48:	6f6d 6564 0000 0000 5352 4456 0000 0000     mode....RSVD....
58024a58:	6e45 6976 6f72 6d6e 6e65 2074 6163 6c6c     Environment call
58024a68:	6620 6f72 206d 2d4d 6f6d 6564 0000 0000      from M-mode....
58024a78:	6e49 7473 7572 7463 6f69 206e 6170 6567     Instruction page
58024a88:	6620 7561 746c 0000 6f4c 6461 7020 6761      fault..Load pag
58024a98:	2065 6166 6c75 0074 7453 726f 2f65 4d41     e fault.Store/AM
58024aa8:	204f 6170 6567 6620 7561 746c 0000 0000     O page fault....
58024ab8:	7865 6563 7470 6f69 5f6e 6e65 7274 0d79     exception_entry.
58024ac8:	000a 0000 636d 7561 6573 253d 3830 0d78     ....mcause=%08x.
58024ad8:	000a 0000 656d 6370 253a 3830 0d78 000a     ....mepc:%08x...
58024ae8:	746d 6176 3a6c 3025 7838 0a0d 0000 0000     mtval:%08x......
58024af8:	7325 0a0d 0000 0000 4950 5802 4970 5802     %s......PI.XpI.X
58024b08:	498c 5802 49a0 5802 49ac 5802 49c4 5802     .I.X.I.X.I.X.I.X
58024b18:	49d8 5802 49f8 5802 4a10 5802 4a30 5802     .I.X.I.X.J.X0J.X
58024b28:	4a50 5802 4a58 5802 4a78 5802 4a90 5802     PJ.XXJ.XxJ.X.J.X
58024b38:	4a50 5802 4aa0 5802 2020 5f5f 5f5f 2020     PJ.X.J.X  ____  
58024b48:	2020 2020 2020 2020 2020 2020 5f20 205f                  __ 
58024b58:	5f20 205f 2020 2020 5f20 2020 2020 2020      __      _      
58024b68:	5f20 2020 2020 2020 5f20 2020 2020 0d20      _       _     .
58024b78:	000a 0000 7c20 2020 205f 205c 2020 2020     .... |  _ \     
58024b88:	2020 2020 2020 2020 202f 7c5f 202f 7c5f             / _|/ _|
58024b98:	2020 2020 207c 207c 2020 2020 207c 207c         | |     | | 
58024ba8:	2020 2020 207c 207c 2020 0d20 000a 0000         | |    .....
58024bb8:	7c20 7c20 295f 7c20 5f20 5f5f 2020 205f      | |_) | ___  _ 
58024bc8:	2020 7c5f 7c20 7c5f 7c20 205f 5f5f 5f20       _| |_| |_ __ _
58024bd8:	207c 207c 5f5f 205f 207c 207c 5f5f 5f20     | | ___ | | __ _
58024be8:	207c 5f7c 205f 0d20 000a 0000 7c20 2020     | |__  ..... |  
58024bf8:	205f 203c 202f 205f 7c5c 7c20 7c20 7c20     _ < / _ \| | | |
58024c08:	2020 7c5f 2020 2f5f 5f20 2060 207c 2f7c       _|  _/ _` | |/
58024c18:	5f20 5c20 207c 2f7c 5f20 2060 207c 5f27      _ \| |/ _` | '_
58024c28:	5c20 0d20 000a 0000 7c20 7c20 295f 7c20      \ ..... | |_) |
58024c38:	2820 295f 7c20 7c20 7c5f 7c20 7c20 7c20      (_) | |_| | | |
58024c48:	7c20 207c 5f28 207c 207c 207c 5f28 2029      || (_| | | (_) 
58024c58:	207c 207c 5f28 207c 207c 5f7c 2029 0d7c     | | (_| | |_) |.
58024c68:	000a 0000 7c20 5f5f 5f5f 202f 5f5c 5f5f     .... |____/ \___
58024c78:	202f 5f5c 2c5f 7c5f 7c5f 7c20 7c5f 5c20     / \__,_|_| |_| \
58024c88:	5f5f 5f2c 5f7c 5c7c 5f5f 2f5f 5f7c 5c7c     __,_|_|\___/|_|\
58024c98:	5f5f 5f2c 5f7c 5f2e 2f5f 0d20 000a 0000     __,_|_.__/ .....
58024ca8:	614d 2072 3120 3220 3230 0033 3331 303a     Mar  1 2023.13:0
58024cb8:	3a31 3631 0000 0000 7542 6c69 3a64 7325     1:16....Build:%s
58024cc8:	252c 0d73 000a 0000 6f43 7970 6972 6867     ,%s.....Copyrigh
58024cd8:	2074 6328 2029 3032 3232 4220 756f 6666     t (c) 2022 Bouff
58024ce8:	6c61 6c6f 6261 7420 6165 0d6d 000a 0000     alolab team.....
58024cf8:	706c 6420 656f 2073 6f6e 2074 7375 2065     lp does not use 
58024d08:	656d 686d 6165 2070 7564 2065 6f74 6c20     memheap due to l
58024d18:	7469 6c74 2065 6172 206d 0a0d 0000 0000     ittle ram ......
58024d28:	6973 3167 253a 3830 0d78 000a 6973 3267     sig1:%08x...sig2
58024d38:	253a 3830 0d78 000a 6763 6e65 3a31 3025     :%08x...cgen1:%0
58024d48:	7838 0a0d 0000 0000                         8x......

58024d50 <__clz_tab>:
58024d50:	0100 0202 0303 0303 0404 0404 0404 0404     ................
58024d60:	0505 0505 0505 0505 0505 0505 0505 0505     ................
58024d70:	0606 0606 0606 0606 0606 0606 0606 0606     ................
58024d80:	0606 0606 0606 0606 0606 0606 0606 0606     ................
58024d90:	0707 0707 0707 0707 0707 0707 0707 0707     ................
58024da0:	0707 0707 0707 0707 0707 0707 0707 0707     ................
58024db0:	0707 0707 0707 0707 0707 0707 0707 0707     ................
58024dc0:	0707 0707 0707 0707 0707 0707 0707 0707     ................
58024dd0:	0808 0808 0808 0808 0808 0808 0808 0808     ................
58024de0:	0808 0808 0808 0808 0808 0808 0808 0808     ................
58024df0:	0808 0808 0808 0808 0808 0808 0808 0808     ................
58024e00:	0808 0808 0808 0808 0808 0808 0808 0808     ................
58024e10:	0808 0808 0808 0808 0808 0808 0808 0808     ................
58024e20:	0808 0808 0808 0808 0808 0808 0808 0808     ................
58024e30:	0808 0808 0808 0808 0808 0808 0808 0808     ................
58024e40:	0808 0808 0808 0808 0808 0808 0808 0808     ................
58024e50:	c740 ffff c740 ffff c758 ffff c73a ffff     @...@...X...:...
58024e60:	c73a ffff c7f0 ffff c758 ffff c73a ffff     :.......X...:...
58024e70:	c7f0 ffff c73a ffff c758 ffff c736 ffff     ....:...X...6...
58024e80:	c736 ffff c736 ffff c7f0 ffff 0000 0000     6...6...........
58024e90:	ffff ffff ffff ffef ffff ffff ffff 7fef     ................
58024ea0:	0000 0000 cd65 41cd 0000 0000 cd65 c1cd     ....e..A....e...
58024eb0:	0000 0000 0000 3fe0                         .......?

Disassembly of section .itcm_region:

2202c000 <bflb_uart_put>:

    return ch;
}

ATTR_TCM_SECTION int bflb_uart_put(struct bflb_device_s *dev, uint8_t *data, uint32_t len)
{
2202c000:	fdc10113          	addi	sp,sp,-36
2202c004:	d006                	sw	ra,32(sp)
2202c006:	ce22                	sw	s0,28(sp)
2202c008:	cc26                	sw	s1,24(sp)
2202c00a:	c82a                	sw	a0,16(sp)
    int ret;
    for (uint32_t i = 0; i < len; i++) {
2202c00c:	ce29                	beqz	a2,2202c066 <bflb_uart_put+0x66>
2202c00e:	00c587b3          	add	a5,a1,a2
2202c012:	c22e                	sw	a1,4(sp)
2202c014:	ca3e                	sw	a5,20(sp)
    reg_base = dev->reg_base;
2202c016:	47c2                	lw	a5,16(sp)
2202c018:	43c4                	lw	s1,4(a5)
        ret = bflb_uart_putchar(dev, data[i]);
2202c01a:	4792                	lw	a5,4(sp)
    reg_base = dev->reg_base;
2202c01c:	c626                	sw	s1,12(sp)
        ret = bflb_uart_putchar(dev, data[i]);
2202c01e:	0007c783          	lbu	a5,0(a5)
    while ((getreg32(reg_base + UART_FIFO_CONFIG_1_OFFSET) & UART_TX_FIFO_CNT_MASK) == 0) {
2202c022:	08448493          	addi	s1,s1,132
        ret = bflb_uart_putchar(dev, data[i]);
2202c026:	c43e                	sw	a5,8(sp)
    start_time = bflb_mtimer_get_time_ms();
2202c028:	28dd                	jal	2202c11e <bflb_mtimer_get_time_ms>
2202c02a:	842a                	mv	s0,a0
2202c02c:	c02e                	sw	a1,0(sp)
    while ((getreg32(reg_base + UART_FIFO_CONFIG_1_OFFSET) & UART_TX_FIFO_CNT_MASK) == 0) {
2202c02e:	a831                	j	2202c04a <bflb_uart_put+0x4a>
        if ((bflb_mtimer_get_time_ms() - start_time) > 100) {
2202c030:	20fd                	jal	2202c11e <bflb_mtimer_get_time_ms>
2202c032:	4702                	lw	a4,0(sp)
2202c034:	408507b3          	sub	a5,a0,s0
2202c038:	00f53533          	sltu	a0,a0,a5
2202c03c:	8d99                	sub	a1,a1,a4
2202c03e:	02a59b63          	bne	a1,a0,2202c074 <bflb_uart_put+0x74>
2202c042:	06400713          	li	a4,100
2202c046:	02f76763          	bltu	a4,a5,2202c074 <bflb_uart_put+0x74>
    while ((getreg32(reg_base + UART_FIFO_CONFIG_1_OFFSET) & UART_TX_FIFO_CNT_MASK) == 0) {
2202c04a:	409c                	lw	a5,0(s1)
2202c04c:	03f7f793          	andi	a5,a5,63
2202c050:	d3e5                	beqz	a5,2202c030 <bflb_uart_put+0x30>
    putreg8(ch, reg_base + UART_FIFO_WDATA_OFFSET);
2202c052:	47b2                	lw	a5,12(sp)
2202c054:	4722                	lw	a4,8(sp)
2202c056:	08e78423          	sb	a4,136(a5)
    for (uint32_t i = 0; i < len; i++) {
2202c05a:	4792                	lw	a5,4(sp)
2202c05c:	4752                	lw	a4,20(sp)
2202c05e:	0785                	addi	a5,a5,1
2202c060:	c23e                	sw	a5,4(sp)
2202c062:	fae79ae3          	bne	a5,a4,2202c016 <bflb_uart_put+0x16>
        if (ret < 0) {
            return ret;
        }
    }
    return 0;
}
2202c066:	5082                	lw	ra,32(sp)
2202c068:	4472                	lw	s0,28(sp)
2202c06a:	44e2                	lw	s1,24(sp)
    return 0;
2202c06c:	4501                	li	a0,0
}
2202c06e:	02410113          	addi	sp,sp,36
2202c072:	8082                	ret
2202c074:	5082                	lw	ra,32(sp)
2202c076:	4472                	lw	s0,28(sp)
2202c078:	44e2                	lw	s1,24(sp)
2202c07a:	f8c00513          	li	a0,-116
2202c07e:	02410113          	addi	sp,sp,36
2202c082:	8082                	ret

2202c084 <bflb_mtimer_get_time_us>:
{
    return 1 * 1000 * 1000;
}

uint64_t ATTR_TCM_SECTION bflb_mtimer_get_time_us()
{
2202c084:	fbc10113          	addi	sp,sp,-68
2202c088:	01f10793          	addi	a5,sp,31
2202c08c:	c0a2                	sw	s0,64(sp)
2202c08e:	de26                	sw	s1,60(sp)
2202c090:	9be1                	andi	a5,a5,-8
  \brief   get CORE timer counter high value
  \return          CORE timer counter value.
 */
__STATIC_INLINE uint32_t csi_coret_get_valueh(void)
{
    return (CORET->MTIME >> 32) & 0xFFFFFFFF;
2202c092:	e000c737          	lui	a4,0xe000c
2202c096:	ff872603          	lw	a2,-8(a4) # e000bff8 <__etext_final+0x87fe6404>
2202c09a:	ffc72683          	lw	a3,-4(a4)
2202c09e:	c602                	sw	zero,12(sp)
2202c0a0:	4381                	li	t2,0
2202c0a2:	c436                	sw	a3,8(sp)
        tmp_high = getreg32(CLIC_CTRL_BASE + CLIC_MTIME_OFFSET + 4);
        tmp_low = getreg32(CLIC_CTRL_BASE + CLIC_MTIME_OFFSET);
        tmp_low1 = getreg32(CLIC_CTRL_BASE + CLIC_MTIME_OFFSET);
        tmp_high1 = getreg32(CLIC_CTRL_BASE + CLIC_MTIME_OFFSET + 4);
#else
        tmp_high = (uint64_t)csi_coret_get_valueh();
2202c0a4:	4622                	lw	a2,8(sp)
2202c0a6:	46b2                	lw	a3,12(sp)
2202c0a8:	4481                	li	s1,0
2202c0aa:	cb90                	sw	a2,16(a5)
2202c0ac:	cbd4                	sw	a3,20(a5)
    return CORET->MTIME & 0xFFFFFFFF;
2202c0ae:	ff872603          	lw	a2,-8(a4)
2202c0b2:	ffc72683          	lw	a3,-4(a4)
        tmp_low = (uint64_t)csi_coret_get_value();
2202c0b6:	cf90                	sw	a2,24(a5)
2202c0b8:	0077ae23          	sw	t2,28(a5)
2202c0bc:	ff872603          	lw	a2,-8(a4)
2202c0c0:	ffc72683          	lw	a3,-4(a4)
        tmp_low1 = (uint64_t)csi_coret_get_value();
2202c0c4:	c790                	sw	a2,8(a5)
2202c0c6:	c7c4                	sw	s1,12(a5)
    return (CORET->MTIME >> 32) & 0xFFFFFFFF;
2202c0c8:	ff872603          	lw	a2,-8(a4)
2202c0cc:	ffc72683          	lw	a3,-4(a4)
2202c0d0:	c202                	sw	zero,4(sp)
2202c0d2:	c036                	sw	a3,0(sp)
        tmp_high1 = (uint64_t)csi_coret_get_valueh();
2202c0d4:	4602                	lw	a2,0(sp)
2202c0d6:	4692                	lw	a3,4(sp)
2202c0d8:	c390                	sw	a2,0(a5)
2202c0da:	c3d4                	sw	a3,4(a5)
#endif
    } while (tmp_low > tmp_low1 || tmp_high != tmp_high1);
2202c0dc:	4f90                	lw	a2,24(a5)
2202c0de:	4fd4                	lw	a3,28(a5)
2202c0e0:	4788                	lw	a0,8(a5)
2202c0e2:	47cc                	lw	a1,12(a5)
2202c0e4:	c832                	sw	a2,16(sp)
2202c0e6:	ca36                	sw	a3,20(sp)
2202c0e8:	fad5e7e3          	bltu	a1,a3,2202c096 <bflb_mtimer_get_time_us+0x12>
2202c0ec:	00b69563          	bne	a3,a1,2202c0f6 <bflb_mtimer_get_time_us+0x72>
2202c0f0:	46c2                	lw	a3,16(sp)
2202c0f2:	fad562e3          	bltu	a0,a3,2202c096 <bflb_mtimer_get_time_us+0x12>
2202c0f6:	4b90                	lw	a2,16(a5)
2202c0f8:	4bd4                	lw	a3,20(a5)
2202c0fa:	4388                	lw	a0,0(a5)
2202c0fc:	43cc                	lw	a1,4(a5)
2202c0fe:	f8c51ce3          	bne	a0,a2,2202c096 <bflb_mtimer_get_time_us+0x12>
2202c102:	f8d59ae3          	bne	a1,a3,2202c096 <bflb_mtimer_get_time_us+0x12>
#ifdef CONFIG_MTIMER_CUSTOM_FREQUENCE
    return ((uint64_t)(((tmp_high1 << 32) + tmp_low1)) * ((uint64_t)(1 * 1000 * 1000)) / bflb_mtimer_get_freq());
#else
    return (uint64_t)(((tmp_high1 << 32) + tmp_low1));
2202c106:	4390                	lw	a2,0(a5)
#endif
}
2202c108:	4406                	lw	s0,64(sp)
    return (uint64_t)(((tmp_high1 << 32) + tmp_low1));
2202c10a:	43d4                	lw	a3,4(a5)
2202c10c:	4798                	lw	a4,8(a5)
2202c10e:	47dc                	lw	a5,12(a5)
}
2202c110:	54f2                	lw	s1,60(sp)
2202c112:	853a                	mv	a0,a4
2202c114:	00f605b3          	add	a1,a2,a5
2202c118:	04410113          	addi	sp,sp,68
2202c11c:	8082                	ret

2202c11e <bflb_mtimer_get_time_ms>:
    *n = res;
    return rem;
}

uint64_t ATTR_TCM_SECTION bflb_mtimer_get_time_ms()
{
2202c11e:	1151                	addi	sp,sp,-12
2202c120:	c406                	sw	ra,8(sp)
#ifdef BFLB_BOOT2
    uint64_t ret = bflb_mtimer_get_time_us();
    __div64_32(&ret, 1000);
    return ret;
#else
    return bflb_mtimer_get_time_us() / 1000;
2202c122:	378d                	jal	2202c084 <bflb_mtimer_get_time_us>
2202c124:	3e800613          	li	a2,1000
2202c128:	4681                	li	a3,0
2202c12a:	35ff5097          	auipc	ra,0x35ff5
2202c12e:	808080e7          	jalr	-2040(ra) # 58020932 <__udivdi3>
#endif
}
2202c132:	40a2                	lw	ra,8(sp)
2202c134:	0131                	addi	sp,sp,12
2202c136:	8082                	ret

2202c138 <bflb_mtimer_delay_ms>:
    while (bflb_mtimer_get_time_us() - start_time < time) {
    }
}

void ATTR_TCM_SECTION bflb_mtimer_delay_ms(uint32_t time)
{
2202c138:	1141                	addi	sp,sp,-16
2202c13a:	c606                	sw	ra,12(sp)
2202c13c:	c422                	sw	s0,8(sp)
2202c13e:	c226                	sw	s1,4(sp)
2202c140:	c02a                	sw	a0,0(sp)
    return bflb_mtimer_get_time_us() / 1000;
2202c142:	3789                	jal	2202c084 <bflb_mtimer_get_time_us>
2202c144:	3e800613          	li	a2,1000
2202c148:	4681                	li	a3,0
2202c14a:	35ff4097          	auipc	ra,0x35ff4
2202c14e:	7e8080e7          	jalr	2024(ra) # 58020932 <__udivdi3>
2202c152:	84aa                	mv	s1,a0
2202c154:	842e                	mv	s0,a1
2202c156:	373d                	jal	2202c084 <bflb_mtimer_get_time_us>
2202c158:	3e800613          	li	a2,1000
2202c15c:	4681                	li	a3,0
2202c15e:	35ff4097          	auipc	ra,0x35ff4
2202c162:	7d4080e7          	jalr	2004(ra) # 58020932 <__udivdi3>
    uint64_t start_time = bflb_mtimer_get_time_ms();

    while (bflb_mtimer_get_time_ms() - start_time < time) {
2202c166:	409507b3          	sub	a5,a0,s1
2202c16a:	00f53533          	sltu	a0,a0,a5
2202c16e:	8d81                	sub	a1,a1,s0
2202c170:	40a58533          	sub	a0,a1,a0
2202c174:	4701                	li	a4,0
2202c176:	00a71563          	bne	a4,a0,2202c180 <bflb_mtimer_delay_ms+0x48>
2202c17a:	4702                	lw	a4,0(sp)
2202c17c:	fce7ede3          	bltu	a5,a4,2202c156 <bflb_mtimer_delay_ms+0x1e>
    }
}
2202c180:	40b2                	lw	ra,12(sp)
2202c182:	4422                	lw	s0,8(sp)
2202c184:	4492                	lw	s1,4(sp)
2202c186:	0141                	addi	sp,sp,16
2202c188:	8082                	ret

2202c18a <HBN_Get_Xtal_Type>:
*******************************************************************************/
BL_Err_Type ATTR_TCM_SECTION HBN_Get_Xtal_Type(uint8_t *xtalType)
{
    uint32_t tmpVal = 0;

    tmpVal = BL_RD_REG(HBN_BASE, HBN_RSV3);
2202c18a:	2000f7b7          	lui	a5,0x2000f
2202c18e:	10c7a703          	lw	a4,268(a5) # 2000f10c <HeapMinSize+0x2000e10c>

    if ((tmpVal & HBN_XTAL_FLAG_MASK) == HBN_XTAL_FLAG_VALUE) {
2202c192:	67c1                	lui	a5,0x10
2202c194:	f0078793          	addi	a5,a5,-256 # ff00 <HeapMinSize+0xef00>
2202c198:	6619                	lui	a2,0x6
2202c19a:	8ff9                	and	a5,a5,a4
2202c19c:	80060613          	addi	a2,a2,-2048 # 5800 <HeapMinSize+0x4800>
{
2202c1a0:	86aa                	mv	a3,a0
    if ((tmpVal & HBN_XTAL_FLAG_MASK) == HBN_XTAL_FLAG_VALUE) {
2202c1a2:	00c78763          	beq	a5,a2,2202c1b0 <HBN_Get_Xtal_Type+0x26>
        *xtalType = (tmpVal & 0xff);
        return SUCCESS;
    } else {
        *xtalType = 0;
2202c1a6:	4701                	li	a4,0
        return ERROR;
2202c1a8:	4505                	li	a0,1
2202c1aa:	00e68023          	sb	a4,0(a3)
    }
}
2202c1ae:	8082                	ret
        *xtalType = (tmpVal & 0xff);
2202c1b0:	0ff77713          	andi	a4,a4,255
        return SUCCESS;
2202c1b4:	4501                	li	a0,0
2202c1b6:	00e68023          	sb	a4,0(a3)
}
2202c1ba:	8082                	ret

2202c1bc <Clock_Get_CPU_PLL_Output>:
{
2202c1bc:	1141                	addi	sp,sp,-16
2202c1be:	c226                	sw	s1,4(sp)
    uint8_t xtalType = 0;
2202c1c0:	000101a3          	sb	zero,3(sp)
{
2202c1c4:	84aa                	mv	s1,a0
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(CCI_BASE, CCI_CPU_PLL_CFG6), CCI_CPUPLL_SDMIN);
2202c1c6:	200087b7          	lui	a5,0x20008
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
2202c1ca:	00310513          	addi	a0,sp,3
{
2202c1ce:	c422                	sw	s0,8(sp)
2202c1d0:	c606                	sw	ra,12(sp)
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(CCI_BASE, CCI_CPU_PLL_CFG6), CCI_CPUPLL_SDMIN);
2202c1d2:	7e87a403          	lw	s0,2024(a5) # 200087e8 <HeapMinSize+0x200077e8>
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
2202c1d6:	3f55                	jal	2202c18a <HBN_Get_Xtal_Type>
2202c1d8:	ed59                	bnez	a0,2202c276 <Clock_Get_CPU_PLL_Output+0xba>
        switch (xtalType) {
2202c1da:	00314703          	lbu	a4,3(sp)
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(CCI_BASE, CCI_CPU_PLL_CFG6), CCI_CPUPLL_SDMIN);
2202c1de:	0436                	slli	s0,s0,0xd
        switch (xtalType) {
2202c1e0:	4791                	li	a5,4
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(CCI_BASE, CCI_CPU_PLL_CFG6), CCI_CPUPLL_SDMIN);
2202c1e2:	8035                	srli	s0,s0,0xd
        switch (xtalType) {
2202c1e4:	10f70e63          	beq	a4,a5,2202c300 <Clock_Get_CPU_PLL_Output+0x144>
2202c1e8:	02e7e063          	bltu	a5,a4,2202c208 <Clock_Get_CPU_PLL_Output+0x4c>
2202c1ec:	4789                	li	a5,2
2202c1ee:	0cf70b63          	beq	a4,a5,2202c2c4 <Clock_Get_CPU_PLL_Output+0x108>
2202c1f2:	478d                	li	a5,3
2202c1f4:	0af70263          	beq	a4,a5,2202c298 <Clock_Get_CPU_PLL_Output+0xdc>
2202c1f8:	4785                	li	a5,1
2202c1fa:	08f70463          	beq	a4,a5,2202c282 <Clock_Get_CPU_PLL_Output+0xc6>
}
2202c1fe:	40b2                	lw	ra,12(sp)
2202c200:	4422                	lw	s0,8(sp)
2202c202:	4492                	lw	s1,4(sp)
2202c204:	0141                	addi	sp,sp,16
2202c206:	8082                	ret
        switch (xtalType) {
2202c208:	4795                	li	a5,5
2202c20a:	0af70263          	beq	a4,a5,2202c2ae <Clock_Get_CPU_PLL_Output+0xf2>
2202c20e:	4799                	li	a5,6
2202c210:	06f71363          	bne	a4,a5,2202c276 <Clock_Get_CPU_PLL_Output+0xba>
                vcoFreq = 32 * 1000 * tmpVal / calculationDiv * (1000 / 4);
2202c214:	67a1                	lui	a5,0x8
2202c216:	d0078793          	addi	a5,a5,-768 # 7d00 <HeapMinSize+0x6d00>
2202c21a:	02f40433          	mul	s0,s0,a5
2202c21e:	0fa00713          	li	a4,250
2202c222:	00b45793          	srli	a5,s0,0xb
2202c226:	02e787b3          	mul	a5,a5,a4
    if ((vcoFreq >= 475000000) && (vcoFreq <= 485000000)) {
2202c22a:	e3b01737          	lui	a4,0xe3b01
2202c22e:	34070713          	addi	a4,a4,832 # e3b01340 <__etext_final+0x8badb74c>
2202c232:	009896b7          	lui	a3,0x989
2202c236:	973e                	add	a4,a4,a5
2202c238:	68068693          	addi	a3,a3,1664 # 989680 <HeapMinSize+0x988680>
2202c23c:	08e6ff63          	bgeu	a3,a4,2202c2da <Clock_Get_CPU_PLL_Output+0x11e>
    } else if ((vcoFreq >= 395000000 && vcoFreq <= 405000000)) {
2202c240:	e874c737          	lui	a4,0xe874c
2202c244:	74070713          	addi	a4,a4,1856 # e874c740 <__etext_final+0x90726b4c>
2202c248:	973e                	add	a4,a4,a5
2202c24a:	0ae6f563          	bgeu	a3,a4,2202c2f4 <Clock_Get_CPU_PLL_Output+0x138>
    } else if ((vcoFreq >= 375000000 && vcoFreq <= 385000000)) {
2202c24e:	e9a5f737          	lui	a4,0xe9a5f
2202c252:	44070713          	addi	a4,a4,1088 # e9a5f440 <__etext_final+0x91a3984c>
2202c256:	97ba                	add	a5,a5,a4
2202c258:	00f6ef63          	bltu	a3,a5,2202c276 <Clock_Get_CPU_PLL_Output+0xba>
        return (pllOut / 100 * 95);
2202c25c:	06400513          	li	a0,100
2202c260:	02a4d533          	divu	a0,s1,a0
}
2202c264:	40b2                	lw	ra,12(sp)
2202c266:	4422                	lw	s0,8(sp)
        return (pllOut / 100 * 95);
2202c268:	05f00493          	li	s1,95
2202c26c:	02950533          	mul	a0,a0,s1
}
2202c270:	4492                	lw	s1,4(sp)
2202c272:	0141                	addi	sp,sp,16
2202c274:	8082                	ret
2202c276:	40b2                	lw	ra,12(sp)
2202c278:	4422                	lw	s0,8(sp)
2202c27a:	4492                	lw	s1,4(sp)
        return (0);
2202c27c:	4501                	li	a0,0
}
2202c27e:	0141                	addi	sp,sp,16
2202c280:	8082                	ret
                vcoFreq = 24 * 1000 * tmpVal / calculationDiv * (1000 / 2);
2202c282:	6799                	lui	a5,0x6
2202c284:	dc078793          	addi	a5,a5,-576 # 5dc0 <HeapMinSize+0x4dc0>
2202c288:	02f40433          	mul	s0,s0,a5
2202c28c:	1f400793          	li	a5,500
2202c290:	802d                	srli	s0,s0,0xb
2202c292:	02f407b3          	mul	a5,s0,a5
                break;
2202c296:	bf51                	j	2202c22a <Clock_Get_CPU_PLL_Output+0x6e>
                vcoFreq = 384 * 100 * tmpVal / calculationDiv * (1000 / 4);
2202c298:	67a5                	lui	a5,0x9
2202c29a:	60078793          	addi	a5,a5,1536 # 9600 <HeapMinSize+0x8600>
2202c29e:	02f40433          	mul	s0,s0,a5
2202c2a2:	0fa00793          	li	a5,250
2202c2a6:	802d                	srli	s0,s0,0xb
2202c2a8:	02f407b3          	mul	a5,s0,a5
                break;
2202c2ac:	bfbd                	j	2202c22a <Clock_Get_CPU_PLL_Output+0x6e>
                vcoFreq = 26 * 1000 * tmpVal / calculationDiv * (1000 / 2);
2202c2ae:	6799                	lui	a5,0x6
2202c2b0:	59078793          	addi	a5,a5,1424 # 6590 <HeapMinSize+0x5590>
2202c2b4:	02f40433          	mul	s0,s0,a5
2202c2b8:	1f400793          	li	a5,500
2202c2bc:	802d                	srli	s0,s0,0xb
2202c2be:	02f407b3          	mul	a5,s0,a5
                break;
2202c2c2:	b7a5                	j	2202c22a <Clock_Get_CPU_PLL_Output+0x6e>
                vcoFreq = 32 * 1000 * tmpVal / calculationDiv * (1000 / 4);
2202c2c4:	67a1                	lui	a5,0x8
2202c2c6:	d0078793          	addi	a5,a5,-768 # 7d00 <HeapMinSize+0x6d00>
2202c2ca:	02f40433          	mul	s0,s0,a5
2202c2ce:	0fa00793          	li	a5,250
2202c2d2:	802d                	srli	s0,s0,0xb
2202c2d4:	02f407b3          	mul	a5,s0,a5
                break;
2202c2d8:	bf89                	j	2202c22a <Clock_Get_CPU_PLL_Output+0x6e>
        return (pllOut / 100 * 120);
2202c2da:	06400513          	li	a0,100
2202c2de:	02a4d533          	divu	a0,s1,a0
}
2202c2e2:	40b2                	lw	ra,12(sp)
2202c2e4:	4422                	lw	s0,8(sp)
        return (pllOut / 100 * 120);
2202c2e6:	07800493          	li	s1,120
2202c2ea:	02950533          	mul	a0,a0,s1
}
2202c2ee:	4492                	lw	s1,4(sp)
2202c2f0:	0141                	addi	sp,sp,16
2202c2f2:	8082                	ret
2202c2f4:	40b2                	lw	ra,12(sp)
2202c2f6:	4422                	lw	s0,8(sp)
        return (pllOut);
2202c2f8:	8526                	mv	a0,s1
}
2202c2fa:	4492                	lw	s1,4(sp)
2202c2fc:	0141                	addi	sp,sp,16
2202c2fe:	8082                	ret
                vcoFreq = 40 * 1000 * tmpVal / calculationDiv * (1000 / 4);
2202c300:	67a9                	lui	a5,0xa
2202c302:	c4078793          	addi	a5,a5,-960 # 9c40 <HeapMinSize+0x8c40>
2202c306:	02f40433          	mul	s0,s0,a5
2202c30a:	0fa00793          	li	a5,250
2202c30e:	802d                	srli	s0,s0,0xb
2202c310:	02f407b3          	mul	a5,s0,a5
                break;
2202c314:	bf19                	j	2202c22a <Clock_Get_CPU_PLL_Output+0x6e>

2202c316 <Clock_Get_AUPLL_Output>:
{
2202c316:	1141                	addi	sp,sp,-16
2202c318:	c226                	sw	s1,4(sp)
    uint8_t xtalType = 0;
2202c31a:	000101a3          	sb	zero,3(sp)
{
2202c31e:	84aa                	mv	s1,a0
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(CCI_BASE, CCI_AUDIO_PLL_CFG6), CCI_AUPLL_SDMIN);
2202c320:	200087b7          	lui	a5,0x20008
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
2202c324:	00310513          	addi	a0,sp,3
{
2202c328:	c422                	sw	s0,8(sp)
2202c32a:	c606                	sw	ra,12(sp)
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(CCI_BASE, CCI_AUDIO_PLL_CFG6), CCI_AUPLL_SDMIN);
2202c32c:	7687a403          	lw	s0,1896(a5) # 20008768 <HeapMinSize+0x20007768>
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
2202c330:	3da9                	jal	2202c18a <HBN_Get_Xtal_Type>
2202c332:	ed2d                	bnez	a0,2202c3ac <Clock_Get_AUPLL_Output+0x96>
        switch (xtalType) {
2202c334:	00314783          	lbu	a5,3(sp)
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(CCI_BASE, CCI_AUDIO_PLL_CFG6), CCI_AUPLL_SDMIN);
2202c338:	0436                	slli	s0,s0,0xd
        switch (xtalType) {
2202c33a:	4711                	li	a4,4
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(CCI_BASE, CCI_AUDIO_PLL_CFG6), CCI_AUPLL_SDMIN);
2202c33c:	8035                	srli	s0,s0,0xd
        switch (xtalType) {
2202c33e:	10e78563          	beq	a5,a4,2202c448 <Clock_Get_AUPLL_Output+0x132>
2202c342:	02f76063          	bltu	a4,a5,2202c362 <Clock_Get_AUPLL_Output+0x4c>
2202c346:	4709                	li	a4,2
2202c348:	0ee78563          	beq	a5,a4,2202c432 <Clock_Get_AUPLL_Output+0x11c>
2202c34c:	470d                	li	a4,3
2202c34e:	0ae78163          	beq	a5,a4,2202c3f0 <Clock_Get_AUPLL_Output+0xda>
2202c352:	4705                	li	a4,1
2202c354:	0ae78963          	beq	a5,a4,2202c406 <Clock_Get_AUPLL_Output+0xf0>
}
2202c358:	40b2                	lw	ra,12(sp)
2202c35a:	4422                	lw	s0,8(sp)
2202c35c:	4492                	lw	s1,4(sp)
2202c35e:	0141                	addi	sp,sp,16
2202c360:	8082                	ret
        switch (xtalType) {
2202c362:	4715                	li	a4,5
2202c364:	0ae78c63          	beq	a5,a4,2202c41c <Clock_Get_AUPLL_Output+0x106>
2202c368:	4719                	li	a4,6
2202c36a:	04e79163          	bne	a5,a4,2202c3ac <Clock_Get_AUPLL_Output+0x96>
                vcoFreq = 32 * 1000 * tmpVal / calculationDiv * (1000 / 4);
2202c36e:	67a1                	lui	a5,0x8
2202c370:	d0078793          	addi	a5,a5,-768 # 7d00 <HeapMinSize+0x6d00>
2202c374:	02f407b3          	mul	a5,s0,a5
2202c378:	0fa00713          	li	a4,250
2202c37c:	83ad                	srli	a5,a5,0xb
2202c37e:	02e787b3          	mul	a5,a5,a4
    if ((vcoFreq >= 451000000) && (vcoFreq <= 452000000)) {
2202c382:	e51e5737          	lui	a4,0xe51e5
2202c386:	94070713          	addi	a4,a4,-1728 # e51e4940 <__etext_final+0x8d1bed4c>
2202c38a:	000f46b7          	lui	a3,0xf4
2202c38e:	973e                	add	a4,a4,a5
2202c390:	24068693          	addi	a3,a3,576 # f4240 <HeapMinSize+0xf3240>
2202c394:	02e6f263          	bgeu	a3,a4,2202c3b8 <Clock_Get_AUPLL_Output+0xa2>
    } else if ((vcoFreq >= 442000000) && (vcoFreq <= 443000000)) {
2202c398:	e5a7a737          	lui	a4,0xe5a7a
2202c39c:	d8070713          	addi	a4,a4,-640 # e5a79d80 <__etext_final+0x8da5418c>
2202c3a0:	97ba                	add	a5,a5,a4
2202c3a2:	00f6e563          	bltu	a3,a5,2202c3ac <Clock_Get_AUPLL_Output+0x96>
        vcoFreq = 442368000;
2202c3a6:	1a5e0537          	lui	a0,0x1a5e0
2202c3aa:	a809                	j	2202c3bc <Clock_Get_AUPLL_Output+0xa6>
}
2202c3ac:	40b2                	lw	ra,12(sp)
2202c3ae:	4422                	lw	s0,8(sp)
2202c3b0:	4492                	lw	s1,4(sp)
        return (0);
2202c3b2:	4501                	li	a0,0
}
2202c3b4:	0141                	addi	sp,sp,16
2202c3b6:	8082                	ret
        vcoFreq = 451584000;
2202c3b8:	1aeaa537          	lui	a0,0x1aeaa
    switch (clockAupllType) {
2202c3bc:	4791                	li	a5,4
2202c3be:	0af48563          	beq	s1,a5,2202c468 <Clock_Get_AUPLL_Output+0x152>
2202c3c2:	0297e063          	bltu	a5,s1,2202c3e2 <Clock_Get_AUPLL_Output+0xcc>
2202c3c6:	4789                	li	a5,2
2202c3c8:	08f48b63          	beq	s1,a5,2202c45e <Clock_Get_AUPLL_Output+0x148>
2202c3cc:	478d                	li	a5,3
2202c3ce:	00f49563          	bne	s1,a5,2202c3d8 <Clock_Get_AUPLL_Output+0xc2>
            return (vcoFreq / 5);
2202c3d2:	02955533          	divu	a0,a0,s1
2202c3d6:	b749                	j	2202c358 <Clock_Get_AUPLL_Output+0x42>
    switch (clockAupllType) {
2202c3d8:	4785                	li	a5,1
2202c3da:	f6f49fe3          	bne	s1,a5,2202c358 <Clock_Get_AUPLL_Output+0x42>
            return (vcoFreq / 2);
2202c3de:	8105                	srli	a0,a0,0x1
2202c3e0:	bfa5                	j	2202c358 <Clock_Get_AUPLL_Output+0x42>
    switch (clockAupllType) {
2202c3e2:	4795                	li	a5,5
2202c3e4:	fef487e3          	beq	s1,a5,2202c3d2 <Clock_Get_AUPLL_Output+0xbc>
            return (vcoFreq / 6);
2202c3e8:	4799                	li	a5,6
2202c3ea:	02f55533          	divu	a0,a0,a5
2202c3ee:	b7ad                	j	2202c358 <Clock_Get_AUPLL_Output+0x42>
                vcoFreq = 384 * 100 * tmpVal / calculationDiv * (1000 / 4);
2202c3f0:	67a5                	lui	a5,0x9
2202c3f2:	60078793          	addi	a5,a5,1536 # 9600 <HeapMinSize+0x8600>
2202c3f6:	02f40433          	mul	s0,s0,a5
2202c3fa:	0fa00793          	li	a5,250
2202c3fe:	802d                	srli	s0,s0,0xb
2202c400:	02f407b3          	mul	a5,s0,a5
                break;
2202c404:	bfbd                	j	2202c382 <Clock_Get_AUPLL_Output+0x6c>
                vcoFreq = 24 * 1000 * tmpVal / calculationDiv * (1000 / 2);
2202c406:	6799                	lui	a5,0x6
2202c408:	dc078793          	addi	a5,a5,-576 # 5dc0 <HeapMinSize+0x4dc0>
2202c40c:	02f40433          	mul	s0,s0,a5
2202c410:	1f400793          	li	a5,500
2202c414:	802d                	srli	s0,s0,0xb
2202c416:	02f407b3          	mul	a5,s0,a5
                break;
2202c41a:	b7a5                	j	2202c382 <Clock_Get_AUPLL_Output+0x6c>
                vcoFreq = 26 * 1000 * tmpVal / calculationDiv * (1000 / 2);
2202c41c:	6799                	lui	a5,0x6
2202c41e:	59078793          	addi	a5,a5,1424 # 6590 <HeapMinSize+0x5590>
2202c422:	02f40433          	mul	s0,s0,a5
2202c426:	1f400793          	li	a5,500
2202c42a:	802d                	srli	s0,s0,0xb
2202c42c:	02f407b3          	mul	a5,s0,a5
                break;
2202c430:	bf89                	j	2202c382 <Clock_Get_AUPLL_Output+0x6c>
                vcoFreq = 32 * 1000 * tmpVal / calculationDiv * (1000 / 4);
2202c432:	67a1                	lui	a5,0x8
2202c434:	d0078793          	addi	a5,a5,-768 # 7d00 <HeapMinSize+0x6d00>
2202c438:	02f40433          	mul	s0,s0,a5
2202c43c:	0fa00793          	li	a5,250
2202c440:	802d                	srli	s0,s0,0xb
2202c442:	02f407b3          	mul	a5,s0,a5
                break;
2202c446:	bf35                	j	2202c382 <Clock_Get_AUPLL_Output+0x6c>
                vcoFreq = 40 * 1000 * tmpVal / calculationDiv * (1000 / 4);
2202c448:	67a9                	lui	a5,0xa
2202c44a:	c4078793          	addi	a5,a5,-960 # 9c40 <HeapMinSize+0x8c40>
2202c44e:	02f40433          	mul	s0,s0,a5
2202c452:	0fa00793          	li	a5,250
2202c456:	802d                	srli	s0,s0,0xb
2202c458:	02f407b3          	mul	a5,s0,a5
                break;
2202c45c:	b71d                	j	2202c382 <Clock_Get_AUPLL_Output+0x6c>
            return (vcoFreq * 2 / 5);
2202c45e:	0506                	slli	a0,a0,0x1
2202c460:	4795                	li	a5,5
2202c462:	02f55533          	divu	a0,a0,a5
2202c466:	bdcd                	j	2202c358 <Clock_Get_AUPLL_Output+0x42>
            return (vcoFreq / 4);
2202c468:	8109                	srli	a0,a0,0x2
2202c46a:	b5fd                	j	2202c358 <Clock_Get_AUPLL_Output+0x42>

2202c46c <Clock_Get_WIFI_PLL_Output>:
{
2202c46c:	1141                	addi	sp,sp,-16
2202c46e:	c226                	sw	s1,4(sp)
    uint8_t xtalType = 0;
2202c470:	000101a3          	sb	zero,3(sp)
{
2202c474:	84aa                	mv	s1,a0
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(GLB_BASE, GLB_WIFI_PLL_CFG6), GLB_WIFIPLL_SDMIN);
2202c476:	200017b7          	lui	a5,0x20001
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
2202c47a:	00310513          	addi	a0,sp,3
{
2202c47e:	c422                	sw	s0,8(sp)
2202c480:	c606                	sw	ra,12(sp)
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(GLB_BASE, GLB_WIFI_PLL_CFG6), GLB_WIFIPLL_SDMIN);
2202c482:	8287a403          	lw	s0,-2008(a5) # 20000828 <HeapMinSize+0x1ffff828>
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
2202c486:	3311                	jal	2202c18a <HBN_Get_Xtal_Type>
2202c488:	e535                	bnez	a0,2202c4f4 <Clock_Get_WIFI_PLL_Output+0x88>
        switch (xtalType) {
2202c48a:	00314783          	lbu	a5,3(sp)
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(GLB_BASE, GLB_WIFI_PLL_CFG6), GLB_WIFIPLL_SDMIN);
2202c48e:	041a                	slli	s0,s0,0x6
        switch (xtalType) {
2202c490:	4711                	li	a4,4
    tmpVal = BL_GET_REG_BITS_VAL(BL_RD_REG(GLB_BASE, GLB_WIFI_PLL_CFG6), GLB_WIFIPLL_SDMIN);
2202c492:	8019                	srli	s0,s0,0x6
        switch (xtalType) {
2202c494:	0ae78263          	beq	a5,a4,2202c538 <Clock_Get_WIFI_PLL_Output+0xcc>
2202c498:	02f76063          	bltu	a4,a5,2202c4b8 <Clock_Get_WIFI_PLL_Output+0x4c>
2202c49c:	4709                	li	a4,2
2202c49e:	02e78363          	beq	a5,a4,2202c4c4 <Clock_Get_WIFI_PLL_Output+0x58>
2202c4a2:	470d                	li	a4,3
2202c4a4:	06e78663          	beq	a5,a4,2202c510 <Clock_Get_WIFI_PLL_Output+0xa4>
2202c4a8:	4705                	li	a4,1
2202c4aa:	04e78b63          	beq	a5,a4,2202c500 <Clock_Get_WIFI_PLL_Output+0x94>
}
2202c4ae:	40b2                	lw	ra,12(sp)
2202c4b0:	4422                	lw	s0,8(sp)
2202c4b2:	4492                	lw	s1,4(sp)
2202c4b4:	0141                	addi	sp,sp,16
2202c4b6:	8082                	ret
        switch (xtalType) {
2202c4b8:	4715                	li	a4,5
2202c4ba:	06e78363          	beq	a5,a4,2202c520 <Clock_Get_WIFI_PLL_Output+0xb4>
2202c4be:	4719                	li	a4,6
2202c4c0:	02e79a63          	bne	a5,a4,2202c4f4 <Clock_Get_WIFI_PLL_Output+0x88>
                vcoFreq = tmpVal / calculationDiv * 32 * 1000 * (1000 / 2);
2202c4c4:	00f427b7          	lui	a5,0xf42
2202c4c8:	804d                	srli	s0,s0,0x13
2202c4ca:	40078793          	addi	a5,a5,1024 # f42400 <HeapMinSize+0xf41400>
2202c4ce:	02f40433          	mul	s0,s0,a5
    if ((vcoFreq >= 955000000) && (vcoFreq <= 965000000)) {
2202c4d2:	c713e7b7          	lui	a5,0xc713e
2202c4d6:	b4078793          	addi	a5,a5,-1216 # c713db40 <__etext_final+0x6f117f4c>
2202c4da:	943e                	add	s0,s0,a5
2202c4dc:	009897b7          	lui	a5,0x989
2202c4e0:	68078793          	addi	a5,a5,1664 # 989680 <HeapMinSize+0x988680>
2202c4e4:	0087e863          	bltu	a5,s0,2202c4f4 <Clock_Get_WIFI_PLL_Output+0x88>
}
2202c4e8:	40b2                	lw	ra,12(sp)
2202c4ea:	4422                	lw	s0,8(sp)
        return (pllOut);
2202c4ec:	8526                	mv	a0,s1
}
2202c4ee:	4492                	lw	s1,4(sp)
2202c4f0:	0141                	addi	sp,sp,16
2202c4f2:	8082                	ret
2202c4f4:	40b2                	lw	ra,12(sp)
2202c4f6:	4422                	lw	s0,8(sp)
2202c4f8:	4492                	lw	s1,4(sp)
        return (0);
2202c4fa:	4501                	li	a0,0
}
2202c4fc:	0141                	addi	sp,sp,16
2202c4fe:	8082                	ret
                vcoFreq = tmpVal / calculationDiv * 24 * 1000 * 1000;
2202c500:	016e37b7          	lui	a5,0x16e3
2202c504:	804d                	srli	s0,s0,0x13
2202c506:	60078793          	addi	a5,a5,1536 # 16e3600 <HeapMinSize+0x16e2600>
2202c50a:	02f40433          	mul	s0,s0,a5
                break;
2202c50e:	b7d1                	j	2202c4d2 <Clock_Get_WIFI_PLL_Output+0x66>
                vcoFreq = tmpVal / calculationDiv * 384 * 100 * (1000 / 2);
2202c510:	012507b7          	lui	a5,0x1250
2202c514:	804d                	srli	s0,s0,0x13
2202c516:	80078793          	addi	a5,a5,-2048 # 124f800 <HeapMinSize+0x124e800>
2202c51a:	02f40433          	mul	s0,s0,a5
                break;
2202c51e:	bf55                	j	2202c4d2 <Clock_Get_WIFI_PLL_Output+0x66>
                vcoFreq = 200 * tmpVal / calculationDiv * 26 * 5000;
2202c520:	0c800793          	li	a5,200
2202c524:	02f40433          	mul	s0,s0,a5
2202c528:	000207b7          	lui	a5,0x20
2202c52c:	bd078793          	addi	a5,a5,-1072 # 1fbd0 <HeapMinSize+0x1ebd0>
2202c530:	804d                	srli	s0,s0,0x13
2202c532:	02f40433          	mul	s0,s0,a5
                break;
2202c536:	bf71                	j	2202c4d2 <Clock_Get_WIFI_PLL_Output+0x66>
                vcoFreq = tmpVal / calculationDiv * 40 * 1000 * (1000 / 2);
2202c538:	013137b7          	lui	a5,0x1313
2202c53c:	804d                	srli	s0,s0,0x13
2202c53e:	d0078793          	addi	a5,a5,-768 # 1312d00 <HeapMinSize+0x1311d00>
2202c542:	02f40433          	mul	s0,s0,a5
                break;
2202c546:	b771                	j	2202c4d2 <Clock_Get_WIFI_PLL_Output+0x66>

2202c548 <Clock_System_Clock_Get>:
{
2202c548:	1141                	addi	sp,sp,-16
2202c54a:	c606                	sw	ra,12(sp)
2202c54c:	c422                	sw	s0,8(sp)
    switch (type) {
2202c54e:	479d                	li	a5,7
2202c550:	1af50b63          	beq	a0,a5,2202c706 <Clock_System_Clock_Get+0x1be>
2202c554:	04a7ef63          	bltu	a5,a0,2202c5b2 <Clock_System_Clock_Get+0x6a>
2202c558:	4791                	li	a5,4
2202c55a:	0aa7e563          	bltu	a5,a0,2202c604 <Clock_System_Clock_Get+0xbc>
2202c55e:	4789                	li	a5,2
2202c560:	1ea7e063          	bltu	a5,a0,2202c740 <Clock_System_Clock_Get+0x1f8>
2202c564:	4705                	li	a4,1
2202c566:	1ee50a63          	beq	a0,a4,2202c75a <Clock_System_Clock_Get+0x212>
2202c56a:	08f51663          	bne	a0,a5,2202c5f6 <Clock_System_Clock_Get+0xae>
    tmpVal = BL_RD_REG(HBN_BASE, HBN_GLB);
2202c56e:	2000f7b7          	lui	a5,0x2000f
2202c572:	5b80                	lw	s0,48(a5)
    return ((tmpVal >> 1) & 0x1);
2202c574:	8005                	srli	s0,s0,0x1
2202c576:	8805                	andi	s0,s0,1
    if (sel == 0) {
2202c578:	22040263          	beqz	s0,2202c79c <Clock_System_Clock_Get+0x254>
        tmpVal = BL_RD_REG(PDS_BASE, PDS_CPU_CORE_CFG1);
2202c57c:	2000e7b7          	lui	a5,0x2000e
2202c580:	1147a783          	lw	a5,276(a5) # 2000e114 <HeapMinSize+0x2000d114>
        sel = BL_GET_REG_BITS_VAL(tmpVal, PDS_REG_PLL_SEL);
2202c584:	8391                	srli	a5,a5,0x4
2202c586:	8b8d                	andi	a5,a5,3
    if (sel == 0) {
2202c588:	3a078063          	beqz	a5,2202c928 <Clock_System_Clock_Get+0x3e0>
    } else if (sel == 1) {
2202c58c:	3ae78f63          	beq	a5,a4,2202c94a <Clock_System_Clock_Get+0x402>
    } else if (sel == 2) {
2202c590:	3ca78b63          	beq	a5,a0,2202c966 <Clock_System_Clock_Get+0x41e>
        return Clock_Get_WIFI_PLL_Output(320 * 1000 * 1000);
2202c594:	1312d537          	lui	a0,0x1312d
2202c598:	3dd1                	jal	2202c46c <Clock_Get_WIFI_PLL_Output>
2202c59a:	842a                	mv	s0,a0
    tmpVal = BL_RD_REG(GLB_BASE, GLB_SYS_CFG0);
2202c59c:	200007b7          	lui	a5,0x20000
2202c5a0:	0907a503          	lw	a0,144(a5) # 20000090 <HeapMinSize+0x1ffff090>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_HCLK_DIV);
2202c5a4:	8121                	srli	a0,a0,0x8
            return clock / (div + 1);
2202c5a6:	0ff57513          	andi	a0,a0,255
2202c5aa:	0505                	addi	a0,a0,1
2202c5ac:	02a45433          	divu	s0,s0,a0
2202c5b0:	a835                	j	2202c5ec <Clock_System_Clock_Get+0xa4>
    switch (type) {
2202c5b2:	47a9                	li	a5,10
2202c5b4:	12f50163          	beq	a0,a5,2202c6d6 <Clock_System_Clock_Get+0x18e>
2202c5b8:	08a7f063          	bgeu	a5,a0,2202c638 <Clock_System_Clock_Get+0xf0>
2202c5bc:	47ad                	li	a5,11
2202c5be:	0cf50863          	beq	a0,a5,2202c68e <Clock_System_Clock_Get+0x146>
2202c5c2:	47b1                	li	a5,12
2202c5c4:	0af51f63          	bne	a0,a5,2202c682 <Clock_System_Clock_Get+0x13a>
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
2202c5c8:	00310513          	addi	a0,sp,3
    uint8_t xtalType = 0;
2202c5cc:	000101a3          	sb	zero,3(sp)
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
2202c5d0:	3e6d                	jal	2202c18a <HBN_Get_Xtal_Type>
2202c5d2:	e15d                	bnez	a0,2202c678 <Clock_System_Clock_Get+0x130>
        switch (xtalType) {
2202c5d4:	00314783          	lbu	a5,3(sp)
2202c5d8:	4719                	li	a4,6
2202c5da:	0af76463          	bltu	a4,a5,2202c682 <Clock_System_Clock_Get+0x13a>
2202c5de:	2202d737          	lui	a4,0x2202d
2202c5e2:	078a                	slli	a5,a5,0x2
2202c5e4:	a9070713          	addi	a4,a4,-1392 # 2202ca90 <CSWTCH.123>
2202c5e8:	97ba                	add	a5,a5,a4
2202c5ea:	4380                	lw	s0,0(a5)
}
2202c5ec:	40b2                	lw	ra,12(sp)
2202c5ee:	8522                	mv	a0,s0
2202c5f0:	4422                	lw	s0,8(sp)
2202c5f2:	0141                	addi	sp,sp,16
2202c5f4:	8082                	ret
    switch (type) {
2202c5f6:	e551                	bnez	a0,2202c682 <Clock_System_Clock_Get+0x13a>
    tmpVal = BL_RD_REG(HBN_BASE, HBN_GLB);
2202c5f8:	2000f7b7          	lui	a5,0x2000f
2202c5fc:	5b9c                	lw	a5,48(a5)
    if (sel == 0) {
2202c5fe:	8b85                	andi	a5,a5,1
2202c600:	f7e1                	bnez	a5,2202c5c8 <Clock_System_Clock_Get+0x80>
2202c602:	aad1                	j	2202c7d6 <Clock_System_Clock_Get+0x28e>
    switch (type) {
2202c604:	4795                	li	a5,5
2202c606:	18f50363          	beq	a0,a5,2202c78c <Clock_System_Clock_Get+0x244>
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CTRL_CPU);
2202c60a:	30007737          	lui	a4,0x30007
2202c60e:	431c                	lw	a5,0(a4)
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_CPU_ROOT_CLK_SEL);
2202c610:	83ad                	srli	a5,a5,0xb
    if (sel == 0) {
2202c612:	8b85                	andi	a5,a5,1
2202c614:	1a078c63          	beqz	a5,2202c7cc <Clock_System_Clock_Get+0x284>
        tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CTRL_CPU);
2202c618:	431c                	lw	a5,0(a4)
        sel = BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_CPU_CLK_SEL);
2202c61a:	83a1                	srli	a5,a5,0x8
2202c61c:	8b8d                	andi	a5,a5,3
    if (sel == 0) {
2202c61e:	2e078963          	beqz	a5,2202c910 <Clock_System_Clock_Get+0x3c8>
    } else if (sel == 1) {
2202c622:	4705                	li	a4,1
2202c624:	30e78963          	beq	a5,a4,2202c936 <Clock_System_Clock_Get+0x3ee>
}
2202c628:	4422                	lw	s0,8(sp)
2202c62a:	40b2                	lw	ra,12(sp)
        return Clock_Get_CPU_PLL_Output(400 * 1000 * 1000);
2202c62c:	17d78537          	lui	a0,0x17d78
2202c630:	40050513          	addi	a0,a0,1024 # 17d78400 <HeapMinSize+0x17d77400>
}
2202c634:	0141                	addi	sp,sp,16
        return Clock_Get_CPU_PLL_Output(400 * 1000 * 1000);
2202c636:	b659                	j	2202c1bc <Clock_Get_CPU_PLL_Output>
    switch (type) {
2202c638:	47a1                	li	a5,8
2202c63a:	0af50a63          	beq	a0,a5,2202c6ee <Clock_System_Clock_Get+0x1a6>
2202c63e:	47a5                	li	a5,9
2202c640:	04f51163          	bne	a0,a5,2202c682 <Clock_System_Clock_Get+0x13a>
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CTRL_CPU);
2202c644:	30007737          	lui	a4,0x30007
2202c648:	431c                	lw	a5,0(a4)
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_BCLK1X_SEL);
2202c64a:	83b5                	srli	a5,a5,0xd
    if (sel == 0 || sel == 1) {
2202c64c:	0027f693          	andi	a3,a5,2
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_BCLK1X_SEL);
2202c650:	0ff7f793          	andi	a5,a5,255
    if (sel == 0 || sel == 1) {
2202c654:	18068663          	beqz	a3,2202c7e0 <Clock_System_Clock_Get+0x298>
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_BCLK1X_SEL);
2202c658:	8b8d                	andi	a5,a5,3
    } else if (sel == 2) {
2202c65a:	4709                	li	a4,2
2202c65c:	24e78a63          	beq	a5,a4,2202c8b0 <Clock_System_Clock_Get+0x368>
    } else if (sel == 3) {
2202c660:	470d                	li	a4,3
2202c662:	1ae78863          	beq	a5,a4,2202c812 <Clock_System_Clock_Get+0x2ca>
        return 0;
2202c666:	4501                	li	a0,0
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CPU);
2202c668:	300077b7          	lui	a5,0x30007
2202c66c:	43c0                	lw	s0,4(a5)
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_BCLK1X_DIV);
2202c66e:	8061                	srli	s0,s0,0x18
            return clock / (div + 1);
2202c670:	0405                	addi	s0,s0,1
2202c672:	02855433          	divu	s0,a0,s0
2202c676:	bf9d                	j	2202c5ec <Clock_System_Clock_Get+0xa4>
        return 40 * 1000 * 1000;
2202c678:	02626437          	lui	s0,0x2626
2202c67c:	a0040413          	addi	s0,s0,-1536 # 2625a00 <HeapMinSize+0x2624a00>
2202c680:	b7b5                	j	2202c5ec <Clock_System_Clock_Get+0xa4>
        switch (xtalType) {
2202c682:	4401                	li	s0,0
}
2202c684:	40b2                	lw	ra,12(sp)
2202c686:	8522                	mv	a0,s0
2202c688:	4422                	lw	s0,8(sp)
2202c68a:	0141                	addi	sp,sp,16
2202c68c:	8082                	ret
    tmpVal = BL_RD_REG(HBN_BASE, HBN_GLB);
2202c68e:	2000f7b7          	lui	a5,0x2000f
2202c692:	5b9c                	lw	a5,48(a5)
    tmpVal = BL_RD_REG(GLB_BASE, GLB_DIG_CLK_CFG0);
2202c694:	20000737          	lui	a4,0x20000
2202c698:	25072403          	lw	s0,592(a4) # 20000250 <HeapMinSize+0x1ffff250>
    return BL_GET_REG_BITS_VAL(tmpVal, HBN_F32K_SEL);
2202c69c:	838d                	srli	a5,a5,0x3
    if (sel == 0) {
2202c69e:	8b89                	andi	a5,a5,2
2202c6a0:	20078263          	beqz	a5,2202c8a4 <Clock_System_Clock_Get+0x35c>
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
2202c6a4:	00310513          	addi	a0,sp,3
    uint8_t xtalType = 0;
2202c6a8:	000101a3          	sb	zero,3(sp)
    div = BL_GET_REG_BITS_VAL(tmpVal, GLB_DIG_32K_DIV);
2202c6ac:	7ff47413          	andi	s0,s0,2047
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
2202c6b0:	3ce9                	jal	2202c18a <HBN_Get_Xtal_Type>
        return Clock_Xtal_Output() / (div + 1);
2202c6b2:	0405                	addi	s0,s0,1
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
2202c6b4:	16051a63          	bnez	a0,2202c828 <Clock_System_Clock_Get+0x2e0>
        switch (xtalType) {
2202c6b8:	00314783          	lbu	a5,3(sp)
2202c6bc:	4719                	li	a4,6
2202c6be:	fcf762e3          	bltu	a4,a5,2202c682 <Clock_System_Clock_Get+0x13a>
        return Clock_Xtal_Output() / (div + 1);
2202c6c2:	2202d737          	lui	a4,0x2202d
2202c6c6:	078a                	slli	a5,a5,0x2
2202c6c8:	a9070713          	addi	a4,a4,-1392 # 2202ca90 <CSWTCH.123>
2202c6cc:	97ba                	add	a5,a5,a4
2202c6ce:	439c                	lw	a5,0(a5)
2202c6d0:	0287d433          	divu	s0,a5,s0
2202c6d4:	bf21                	j	2202c5ec <Clock_System_Clock_Get+0xa4>
            clock = Clock_System_Clock_Get(BL_SYSTEM_CLOCK_MCU_PBCLK);
2202c6d6:	4511                	li	a0,4
2202c6d8:	3d85                	jal	2202c548 <Clock_System_Clock_Get>
    tmpVal = BL_RD_REG(PDS_BASE, PDS_CPU_CORE_CFG7);
2202c6da:	2000e7b7          	lui	a5,0x2000e
2202c6de:	12c7a403          	lw	s0,300(a5) # 2000e12c <HeapMinSize+0x2000d12c>
            return clock / (div + 1);
2202c6e2:	0ff47413          	andi	s0,s0,255
2202c6e6:	0405                	addi	s0,s0,1
2202c6e8:	02855433          	divu	s0,a0,s0
2202c6ec:	b701                	j	2202c5ec <Clock_System_Clock_Get+0xa4>
            clock = Clock_System_Clock_Get(BL_SYSTEM_CLOCK_DSP_CLK);
2202c6ee:	451d                	li	a0,7
2202c6f0:	3da1                	jal	2202c548 <Clock_System_Clock_Get>
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CPU);
2202c6f2:	300077b7          	lui	a5,0x30007
2202c6f6:	43c0                	lw	s0,4(a5)
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_BCLK2X_DIV);
2202c6f8:	8041                	srli	s0,s0,0x10
            return clock / (div + 1);
2202c6fa:	0ff47413          	andi	s0,s0,255
2202c6fe:	0405                	addi	s0,s0,1
2202c700:	02855433          	divu	s0,a0,s0
2202c704:	b5e5                	j	2202c5ec <Clock_System_Clock_Get+0xa4>
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CTRL_CPU);
2202c706:	30007737          	lui	a4,0x30007
2202c70a:	431c                	lw	a5,0(a4)
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_CPU_ROOT_CLK_SEL);
2202c70c:	83ad                	srli	a5,a5,0xb
    if (sel == 0) {
2202c70e:	8b85                	andi	a5,a5,1
2202c710:	14078363          	beqz	a5,2202c856 <Clock_System_Clock_Get+0x30e>
        tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CTRL_CPU);
2202c714:	431c                	lw	a5,0(a4)
        sel = BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_CPU_CLK_SEL);
2202c716:	83a1                	srli	a5,a5,0x8
2202c718:	8b8d                	andi	a5,a5,3
    if (sel == 0) {
2202c71a:	10078e63          	beqz	a5,2202c836 <Clock_System_Clock_Get+0x2ee>
    } else if (sel == 1) {
2202c71e:	4705                	li	a4,1
2202c720:	22e78963          	beq	a5,a4,2202c952 <Clock_System_Clock_Get+0x40a>
        return Clock_Get_CPU_PLL_Output(400 * 1000 * 1000);
2202c724:	17d78537          	lui	a0,0x17d78
2202c728:	40050513          	addi	a0,a0,1024 # 17d78400 <HeapMinSize+0x17d77400>
2202c72c:	3c41                	jal	2202c1bc <Clock_Get_CPU_PLL_Output>
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CPU);
2202c72e:	300077b7          	lui	a5,0x30007
2202c732:	43c0                	lw	s0,4(a5)
            return clock / (div + 1);
2202c734:	0ff47413          	andi	s0,s0,255
2202c738:	0405                	addi	s0,s0,1
2202c73a:	02855433          	divu	s0,a0,s0
2202c73e:	b57d                	j	2202c5ec <Clock_System_Clock_Get+0xa4>
            clock = Clock_System_Clock_Get(BL_SYSTEM_CLOCK_MCU_CLK);
2202c740:	4509                	li	a0,2
2202c742:	3519                	jal	2202c548 <Clock_System_Clock_Get>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_SYS_CFG0);
2202c744:	200007b7          	lui	a5,0x20000
2202c748:	0907a403          	lw	s0,144(a5) # 20000090 <HeapMinSize+0x1ffff090>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_BCLK_DIV);
2202c74c:	8041                	srli	s0,s0,0x10
            return clock / (div + 1);
2202c74e:	0ff47413          	andi	s0,s0,255
2202c752:	0405                	addi	s0,s0,1
2202c754:	02855433          	divu	s0,a0,s0
2202c758:	bd51                	j	2202c5ec <Clock_System_Clock_Get+0xa4>
    tmpVal = BL_RD_REG(HBN_BASE, HBN_GLB);
2202c75a:	2000f737          	lui	a4,0x2000f
2202c75e:	5b00                	lw	s0,48(a4)
    return ((tmpVal >> 1) & 0x1);
2202c760:	8005                	srli	s0,s0,0x1
2202c762:	8805                	andi	s0,s0,1
    if (sel == 0) {
2202c764:	12040063          	beqz	s0,2202c884 <Clock_System_Clock_Get+0x33c>
        tmpVal = BL_RD_REG(PDS_BASE, PDS_CPU_CORE_CFG1);
2202c768:	2000e737          	lui	a4,0x2000e
2202c76c:	11472703          	lw	a4,276(a4) # 2000e114 <HeapMinSize+0x2000d114>
        sel = BL_GET_REG_BITS_VAL(tmpVal, PDS_REG_PLL_SEL);
2202c770:	8311                	srli	a4,a4,0x4
2202c772:	8b0d                	andi	a4,a4,3
    if (sel == 0) {
2202c774:	ea070ae3          	beqz	a4,2202c628 <Clock_System_Clock_Get+0xe0>
    } else if (sel == 1) {
2202c778:	1ca70763          	beq	a4,a0,2202c946 <Clock_System_Clock_Get+0x3fe>
    } else if (sel == 2) {
2202c77c:	0cf70863          	beq	a4,a5,2202c84c <Clock_System_Clock_Get+0x304>
        return Clock_Get_WIFI_PLL_Output(320 * 1000 * 1000);
2202c780:	1312d537          	lui	a0,0x1312d
}
2202c784:	4422                	lw	s0,8(sp)
2202c786:	40b2                	lw	ra,12(sp)
2202c788:	0141                	addi	sp,sp,16
        return Clock_Get_WIFI_PLL_Output(320 * 1000 * 1000);
2202c78a:	b1cd                	j	2202c46c <Clock_Get_WIFI_PLL_Output>
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CTRL_CPU);
2202c78c:	300077b7          	lui	a5,0x30007
2202c790:	439c                	lw	a5,0(a5)
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_XCLK_CLK_SEL);
2202c792:	83a9                	srli	a5,a5,0xa
    if (sel == 0) {
2202c794:	8b85                	andi	a5,a5,1
2202c796:	e20799e3          	bnez	a5,2202c5c8 <Clock_System_Clock_Get+0x80>
2202c79a:	a835                	j	2202c7d6 <Clock_System_Clock_Get+0x28e>
    tmpVal = BL_RD_REG(HBN_BASE, HBN_GLB);
2202c79c:	5b9c                	lw	a5,48(a5)
    if (sel == 0) {
2202c79e:	8b85                	andi	a5,a5,1
2202c7a0:	12078963          	beqz	a5,2202c8d2 <Clock_System_Clock_Get+0x38a>
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
2202c7a4:	00310513          	addi	a0,sp,3
    uint8_t xtalType = 0;
2202c7a8:	000101a3          	sb	zero,3(sp)
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
2202c7ac:	3af9                	jal	2202c18a <HBN_Get_Xtal_Type>
2202c7ae:	14051163          	bnez	a0,2202c8f0 <Clock_System_Clock_Get+0x3a8>
        switch (xtalType) {
2202c7b2:	00314783          	lbu	a5,3(sp)
2202c7b6:	4719                	li	a4,6
2202c7b8:	def762e3          	bltu	a4,a5,2202c59c <Clock_System_Clock_Get+0x54>
2202c7bc:	2202d737          	lui	a4,0x2202d
2202c7c0:	078a                	slli	a5,a5,0x2
2202c7c2:	a9070713          	addi	a4,a4,-1392 # 2202ca90 <CSWTCH.123>
2202c7c6:	97ba                	add	a5,a5,a4
2202c7c8:	4380                	lw	s0,0(a5)
2202c7ca:	bbc9                	j	2202c59c <Clock_System_Clock_Get+0x54>
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CTRL_CPU);
2202c7cc:	431c                	lw	a5,0(a4)
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_XCLK_CLK_SEL);
2202c7ce:	83a9                	srli	a5,a5,0xa
    if (sel == 0) {
2202c7d0:	8b85                	andi	a5,a5,1
2202c7d2:	de079be3          	bnez	a5,2202c5c8 <Clock_System_Clock_Get+0x80>
        return (32 * 1000 * 1000);
2202c7d6:	01e85437          	lui	s0,0x1e85
2202c7da:	80040413          	addi	s0,s0,-2048 # 1e84800 <HeapMinSize+0x1e83800>
2202c7de:	b539                	j	2202c5ec <Clock_System_Clock_Get+0xa4>
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CTRL_CPU);
2202c7e0:	431c                	lw	a5,0(a4)
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_XCLK_CLK_SEL);
2202c7e2:	83a9                	srli	a5,a5,0xa
    if (sel == 0) {
2202c7e4:	8b85                	andi	a5,a5,1
2202c7e6:	0e078b63          	beqz	a5,2202c8dc <Clock_System_Clock_Get+0x394>
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
2202c7ea:	00310513          	addi	a0,sp,3
    uint8_t xtalType = 0;
2202c7ee:	000101a3          	sb	zero,3(sp)
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
2202c7f2:	3a61                	jal	2202c18a <HBN_Get_Xtal_Type>
2202c7f4:	10051363          	bnez	a0,2202c8fa <Clock_System_Clock_Get+0x3b2>
        switch (xtalType) {
2202c7f8:	00314783          	lbu	a5,3(sp)
2202c7fc:	4719                	li	a4,6
2202c7fe:	e6f764e3          	bltu	a4,a5,2202c666 <Clock_System_Clock_Get+0x11e>
2202c802:	2202d737          	lui	a4,0x2202d
2202c806:	078a                	slli	a5,a5,0x2
2202c808:	a9070713          	addi	a4,a4,-1392 # 2202ca90 <CSWTCH.123>
2202c80c:	97ba                	add	a5,a5,a4
2202c80e:	4388                	lw	a0,0(a5)
2202c810:	bda1                	j	2202c668 <Clock_System_Clock_Get+0x120>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_DIG_CLK_CFG1);
2202c812:	200007b7          	lui	a5,0x20000
2202c816:	2547a783          	lw	a5,596(a5) # 20000254 <HeapMinSize+0x1ffff254>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_MM_MUXPLL_240M_SEL);
2202c81a:	8385                	srli	a5,a5,0x1
    if (sel == 0) {
2202c81c:	8b85                	andi	a5,a5,1
2202c81e:	0e078363          	beqz	a5,2202c904 <Clock_System_Clock_Get+0x3bc>
        return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV2);
2202c822:	4505                	li	a0,1
2202c824:	3ccd                	jal	2202c316 <Clock_Get_AUPLL_Output>
2202c826:	b589                	j	2202c668 <Clock_System_Clock_Get+0x120>
        return Clock_Xtal_Output() / (div + 1);
2202c828:	026267b7          	lui	a5,0x2626
2202c82c:	a0078793          	addi	a5,a5,-1536 # 2625a00 <HeapMinSize+0x2624a00>
2202c830:	0287d433          	divu	s0,a5,s0
2202c834:	bb65                	j	2202c5ec <Clock_System_Clock_Get+0xa4>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_DIG_CLK_CFG1);
2202c836:	200007b7          	lui	a5,0x20000
2202c83a:	2547a783          	lw	a5,596(a5) # 20000254 <HeapMinSize+0x1ffff254>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_MM_MUXPLL_240M_SEL);
2202c83e:	8385                	srli	a5,a5,0x1
    if (sel == 0) {
2202c840:	8b85                	andi	a5,a5,1
2202c842:	12078963          	beqz	a5,2202c974 <Clock_System_Clock_Get+0x42c>
        return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV2);
2202c846:	4505                	li	a0,1
2202c848:	34f9                	jal	2202c316 <Clock_Get_AUPLL_Output>
2202c84a:	b5d5                	j	2202c72e <Clock_System_Clock_Get+0x1e6>
        return Clock_Get_WIFI_PLL_Output(240 * 1000 * 1000);
2202c84c:	0e4e2537          	lui	a0,0xe4e2
2202c850:	c0050513          	addi	a0,a0,-1024 # e4e1c00 <HeapMinSize+0xe4e0c00>
2202c854:	bf05                	j	2202c784 <Clock_System_Clock_Get+0x23c>
    tmpVal = BL_RD_REG(MM_GLB_BASE, MM_GLB_MM_CLK_CTRL_CPU);
2202c856:	431c                	lw	a5,0(a4)
    return BL_GET_REG_BITS_VAL(tmpVal, MM_GLB_REG_XCLK_CLK_SEL);
2202c858:	83a9                	srli	a5,a5,0xa
    if (sel == 0) {
2202c85a:	8b85                	andi	a5,a5,1
2202c85c:	c7b5                	beqz	a5,2202c8c8 <Clock_System_Clock_Get+0x380>
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
2202c85e:	00310513          	addi	a0,sp,3
    uint8_t xtalType = 0;
2202c862:	000101a3          	sb	zero,3(sp)
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
2202c866:	3215                	jal	2202c18a <HBN_Get_Xtal_Type>
2202c868:	ed3d                	bnez	a0,2202c8e6 <Clock_System_Clock_Get+0x39e>
        switch (xtalType) {
2202c86a:	00314783          	lbu	a5,3(sp)
2202c86e:	4719                	li	a4,6
2202c870:	02f76e63          	bltu	a4,a5,2202c8ac <Clock_System_Clock_Get+0x364>
2202c874:	2202d737          	lui	a4,0x2202d
2202c878:	078a                	slli	a5,a5,0x2
2202c87a:	a9070713          	addi	a4,a4,-1392 # 2202ca90 <CSWTCH.123>
2202c87e:	97ba                	add	a5,a5,a4
2202c880:	4388                	lw	a0,0(a5)
2202c882:	b575                	j	2202c72e <Clock_System_Clock_Get+0x1e6>
    tmpVal = BL_RD_REG(HBN_BASE, HBN_GLB);
2202c884:	5b1c                	lw	a5,48(a4)
    if (sel == 0) {
2202c886:	8b85                	andi	a5,a5,1
2202c888:	d7b9                	beqz	a5,2202c7d6 <Clock_System_Clock_Get+0x28e>
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
2202c88a:	00310513          	addi	a0,sp,3
    uint8_t xtalType = 0;
2202c88e:	000101a3          	sb	zero,3(sp)
    if (HBN_Get_Xtal_Type(&xtalType) == SUCCESS) {
2202c892:	38e5                	jal	2202c18a <HBN_Get_Xtal_Type>
2202c894:	de0512e3          	bnez	a0,2202c678 <Clock_System_Clock_Get+0x130>
        switch (xtalType) {
2202c898:	00314783          	lbu	a5,3(sp)
2202c89c:	4719                	li	a4,6
2202c89e:	d4f767e3          	bltu	a4,a5,2202c5ec <Clock_System_Clock_Get+0xa4>
2202c8a2:	bb35                	j	2202c5de <Clock_System_Clock_Get+0x96>
        return (32 * 1000);
2202c8a4:	6421                	lui	s0,0x8
2202c8a6:	d0040413          	addi	s0,s0,-768 # 7d00 <HeapMinSize+0x6d00>
2202c8aa:	b389                	j	2202c5ec <Clock_System_Clock_Get+0xa4>
        switch (xtalType) {
2202c8ac:	4501                	li	a0,0
        return Clock_Xtal_Output();
2202c8ae:	b541                	j	2202c72e <Clock_System_Clock_Get+0x1e6>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_DIG_CLK_CFG1);
2202c8b0:	200007b7          	lui	a5,0x20000
2202c8b4:	2547a783          	lw	a5,596(a5) # 20000254 <HeapMinSize+0x1ffff254>
    return Clock_Get_WIFI_PLL_Output(pllOut);
2202c8b8:	09897537          	lui	a0,0x9897
2202c8bc:	80050513          	addi	a0,a0,-2048 # 9896800 <HeapMinSize+0x9895800>
    if (sel == 0) {
2202c8c0:	8b85                	andi	a5,a5,1
2202c8c2:	c7a9                	beqz	a5,2202c90c <Clock_System_Clock_Get+0x3c4>
        return Clock_Get_CPU_PLL_Output(160 * 1000 * 1000);
2202c8c4:	38e5                	jal	2202c1bc <Clock_Get_CPU_PLL_Output>
2202c8c6:	b34d                	j	2202c668 <Clock_System_Clock_Get+0x120>
        return (32 * 1000 * 1000);
2202c8c8:	01e85537          	lui	a0,0x1e85
2202c8cc:	80050513          	addi	a0,a0,-2048 # 1e84800 <HeapMinSize+0x1e83800>
2202c8d0:	bdb9                	j	2202c72e <Clock_System_Clock_Get+0x1e6>
        return (32 * 1000 * 1000);
2202c8d2:	01e85437          	lui	s0,0x1e85
2202c8d6:	80040413          	addi	s0,s0,-2048 # 1e84800 <HeapMinSize+0x1e83800>
2202c8da:	b1c9                	j	2202c59c <Clock_System_Clock_Get+0x54>
        return (32 * 1000 * 1000);
2202c8dc:	01e85537          	lui	a0,0x1e85
2202c8e0:	80050513          	addi	a0,a0,-2048 # 1e84800 <HeapMinSize+0x1e83800>
2202c8e4:	b351                	j	2202c668 <Clock_System_Clock_Get+0x120>
        return 40 * 1000 * 1000;
2202c8e6:	02626537          	lui	a0,0x2626
2202c8ea:	a0050513          	addi	a0,a0,-1536 # 2625a00 <HeapMinSize+0x2624a00>
2202c8ee:	b581                	j	2202c72e <Clock_System_Clock_Get+0x1e6>
2202c8f0:	02626437          	lui	s0,0x2626
2202c8f4:	a0040413          	addi	s0,s0,-1536 # 2625a00 <HeapMinSize+0x2624a00>
        return Clock_Xtal_Output();
2202c8f8:	b155                	j	2202c59c <Clock_System_Clock_Get+0x54>
        return 40 * 1000 * 1000;
2202c8fa:	02626537          	lui	a0,0x2626
2202c8fe:	a0050513          	addi	a0,a0,-1536 # 2625a00 <HeapMinSize+0x2624a00>
2202c902:	b39d                	j	2202c668 <Clock_System_Clock_Get+0x120>
    return Clock_Get_WIFI_PLL_Output(pllOut);
2202c904:	0e4e2537          	lui	a0,0xe4e2
2202c908:	c0050513          	addi	a0,a0,-1024 # e4e1c00 <HeapMinSize+0xe4e0c00>
2202c90c:	3685                	jal	2202c46c <Clock_Get_WIFI_PLL_Output>
        return Clock_DSP_Get_WIFI_PLL_Output(240 * 1000 * 1000);
2202c90e:	bba9                	j	2202c668 <Clock_System_Clock_Get+0x120>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_DIG_CLK_CFG1);
2202c910:	200007b7          	lui	a5,0x20000
2202c914:	2547a783          	lw	a5,596(a5) # 20000254 <HeapMinSize+0x1ffff254>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_MM_MUXPLL_240M_SEL);
2202c918:	8385                	srli	a5,a5,0x1
    if (sel == 0) {
2202c91a:	8b85                	andi	a5,a5,1
2202c91c:	db85                	beqz	a5,2202c84c <Clock_System_Clock_Get+0x304>
        return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV2);
2202c91e:	4505                	li	a0,1
}
2202c920:	4422                	lw	s0,8(sp)
2202c922:	40b2                	lw	ra,12(sp)
2202c924:	0141                	addi	sp,sp,16
        return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV2);
2202c926:	bac5                	j	2202c316 <Clock_Get_AUPLL_Output>
        return Clock_Get_CPU_PLL_Output(400 * 1000 * 1000);
2202c928:	17d78537          	lui	a0,0x17d78
2202c92c:	40050513          	addi	a0,a0,1024 # 17d78400 <HeapMinSize+0x17d77400>
2202c930:	3071                	jal	2202c1bc <Clock_Get_CPU_PLL_Output>
2202c932:	842a                	mv	s0,a0
2202c934:	b1a5                	j	2202c59c <Clock_System_Clock_Get+0x54>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_DIG_CLK_CFG1);
2202c936:	200007b7          	lui	a5,0x20000
2202c93a:	2547a783          	lw	a5,596(a5) # 20000254 <HeapMinSize+0x1ffff254>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_MM_MUXPLL_320M_SEL);
2202c93e:	8389                	srli	a5,a5,0x2
    if (sel == 0) {
2202c940:	8b85                	andi	a5,a5,1
2202c942:	e2078fe3          	beqz	a5,2202c780 <Clock_System_Clock_Get+0x238>
        return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV1);
2202c946:	4501                	li	a0,0
2202c948:	bfe1                	j	2202c920 <Clock_System_Clock_Get+0x3d8>
2202c94a:	4501                	li	a0,0
2202c94c:	32e9                	jal	2202c316 <Clock_Get_AUPLL_Output>
2202c94e:	842a                	mv	s0,a0
2202c950:	b1b1                	j	2202c59c <Clock_System_Clock_Get+0x54>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_DIG_CLK_CFG1);
2202c952:	200007b7          	lui	a5,0x20000
2202c956:	2547a783          	lw	a5,596(a5) # 20000254 <HeapMinSize+0x1ffff254>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_MM_MUXPLL_320M_SEL);
2202c95a:	8389                	srli	a5,a5,0x2
    if (sel == 0) {
2202c95c:	8b85                	andi	a5,a5,1
2202c95e:	c38d                	beqz	a5,2202c980 <Clock_System_Clock_Get+0x438>
        return Clock_Get_AUPLL_Output(CLOCK_AUPLL_DIV1);
2202c960:	4501                	li	a0,0
2202c962:	3a55                	jal	2202c316 <Clock_Get_AUPLL_Output>
2202c964:	b3e9                	j	2202c72e <Clock_System_Clock_Get+0x1e6>
        return Clock_Get_WIFI_PLL_Output(240 * 1000 * 1000);
2202c966:	0e4e2537          	lui	a0,0xe4e2
2202c96a:	c0050513          	addi	a0,a0,-1024 # e4e1c00 <HeapMinSize+0xe4e0c00>
2202c96e:	3cfd                	jal	2202c46c <Clock_Get_WIFI_PLL_Output>
2202c970:	842a                	mv	s0,a0
2202c972:	b12d                	j	2202c59c <Clock_System_Clock_Get+0x54>
    return Clock_Get_WIFI_PLL_Output(pllOut);
2202c974:	0e4e2537          	lui	a0,0xe4e2
2202c978:	c0050513          	addi	a0,a0,-1024 # e4e1c00 <HeapMinSize+0xe4e0c00>
2202c97c:	3cc5                	jal	2202c46c <Clock_Get_WIFI_PLL_Output>
        return Clock_DSP_Get_WIFI_PLL_Output(240 * 1000 * 1000);
2202c97e:	bb45                	j	2202c72e <Clock_System_Clock_Get+0x1e6>
    return Clock_Get_WIFI_PLL_Output(pllOut);
2202c980:	1312d537          	lui	a0,0x1312d
2202c984:	34e5                	jal	2202c46c <Clock_Get_WIFI_PLL_Output>
        return Clock_DSP_Get_WIFI_PLL_Output(320 * 1000 * 1000);
2202c986:	b365                	j	2202c72e <Clock_System_Clock_Get+0x1e6>

2202c988 <CPU_Set_MTimer_CLK>:
 *
 * @return SUCCESS or ERROR
 *
*******************************************************************************/
BL_Err_Type ATTR_CLOCK_SECTION CPU_Set_MTimer_CLK(uint8_t enable, uint16_t div)
{
2202c988:	1151                	addi	sp,sp,-12
2202c98a:	c222                	sw	s0,4(sp)
2202c98c:	c026                	sw	s1,0(sp)
2202c98e:	c406                	sw	ra,8(sp)
2202c990:	84aa                	mv	s1,a0
2202c992:	842e                	mv	s0,a1
    uint32_t tmpVal = 0;
    uint32_t address = 0;

    CHECK_PARAM((div <= 0x3FF));

    switch (GLB_Get_Core_Type()) {
2202c994:	20d9                	jal	2202ca5a <GLB_Get_Core_Type>
2202c996:	4785                	li	a5,1
2202c998:	04f50b63          	beq	a0,a5,2202c9ee <CPU_Set_MTimer_CLK+0x66>
2202c99c:	4789                	li	a5,2
2202c99e:	02f51c63          	bne	a0,a5,2202c9d6 <CPU_Set_MTimer_CLK+0x4e>
2202c9a2:	2000e7b7          	lui	a5,0x2000e
2202c9a6:	13078793          	addi	a5,a5,304 # 2000e130 <HeapMinSize+0x2000d130>

    /* disable rtc first */
    /* MCU RTC_EN is [31] */
    /* DSP RTC_EN is [31] */
    /* LP  RTC_EN is [31] */
    tmpVal = BL_RD_WORD(address);
2202c9aa:	4394                	lw	a3,0(a5)
    tmpVal = BL_CLR_REG_BIT(tmpVal, MCU_MISC_REG_MCU_RTC_EN);
2202c9ac:	80000537          	lui	a0,0x80000
2202c9b0:	fff54613          	not	a2,a0
2202c9b4:	8ef1                	and	a3,a3,a2
    BL_WR_WORD(address, tmpVal);
2202c9b6:	c394                	sw	a3,0(a5)

    /* set div */
    /* MCU RTC_DIV is [9:0] */
    /* DSP RTC_DIV is [9:0] */
    /* LP  RTC_DIV is [9:0] */
    tmpVal = BL_RD_WORD(address);
2202c9b8:	438c                	lw	a1,0(a5)
    tmpVal = BL_SET_REG_BITS_VAL(tmpVal, MCU_MISC_REG_MCU_RTC_DIV, div);
2202c9ba:	c005f593          	andi	a1,a1,-1024
2202c9be:	8c4d                	or	s0,s0,a1
    BL_WR_WORD(address, tmpVal);
2202c9c0:	c380                	sw	s0,0(a5)

    /* enable or not */
    /* MCU RTC_EN is [31] */
    /* DSP RTC_EN is [31] */
    /* LP  RTC_EN is [31] */
    tmpVal = BL_RD_WORD(address);
2202c9c2:	4398                	lw	a4,0(a5)
    if (enable) {
2202c9c4:	cc89                	beqz	s1,2202c9de <CPU_Set_MTimer_CLK+0x56>
        tmpVal = BL_CLR_REG_BIT(tmpVal, MCU_MISC_REG_MCU_RTC_EN);
    }
    BL_WR_WORD(address, tmpVal);

    return SUCCESS;
}
2202c9c6:	40a2                	lw	ra,8(sp)
2202c9c8:	4412                	lw	s0,4(sp)
        tmpVal = BL_SET_REG_BIT(tmpVal, MCU_MISC_REG_MCU_RTC_EN);
2202c9ca:	8f49                	or	a4,a4,a0
    BL_WR_WORD(address, tmpVal);
2202c9cc:	c398                	sw	a4,0(a5)
}
2202c9ce:	4482                	lw	s1,0(sp)
2202c9d0:	4501                	li	a0,0
2202c9d2:	0131                	addi	sp,sp,12
2202c9d4:	8082                	ret
    switch (GLB_Get_Core_Type()) {
2202c9d6:	200097b7          	lui	a5,0x20009
2202c9da:	07d1                	addi	a5,a5,20
2202c9dc:	b7f9                	j	2202c9aa <CPU_Set_MTimer_CLK+0x22>
}
2202c9de:	40a2                	lw	ra,8(sp)
2202c9e0:	4412                	lw	s0,4(sp)
        tmpVal = BL_CLR_REG_BIT(tmpVal, MCU_MISC_REG_MCU_RTC_EN);
2202c9e2:	8f71                	and	a4,a4,a2
    BL_WR_WORD(address, tmpVal);
2202c9e4:	c398                	sw	a4,0(a5)
}
2202c9e6:	4482                	lw	s1,0(sp)
2202c9e8:	4501                	li	a0,0
2202c9ea:	0131                	addi	sp,sp,12
2202c9ec:	8082                	ret
    switch (GLB_Get_Core_Type()) {
2202c9ee:	300007b7          	lui	a5,0x30000
2202c9f2:	07e1                	addi	a5,a5,24
2202c9f4:	bf5d                	j	2202c9aa <CPU_Set_MTimer_CLK+0x22>

2202c9f6 <CPU_Get_MTimer_Source_Clock>:
 *
 * @return cpu rtc source clock
 *
*******************************************************************************/
uint32_t ATTR_CLOCK_SECTION CPU_Get_MTimer_Source_Clock(void)
{
2202c9f6:	1151                	addi	sp,sp,-12
2202c9f8:	c406                	sw	ra,8(sp)
    uint32_t coreFreq = 0;

    /* get cpu core clock */
    switch (GLB_Get_Core_Type()) {
2202c9fa:	2085                	jal	2202ca5a <GLB_Get_Core_Type>
2202c9fc:	4705                	li	a4,1
2202c9fe:	00e50e63          	beq	a0,a4,2202ca1a <CPU_Get_MTimer_Source_Clock+0x24>
2202ca02:	4709                	li	a4,2
2202ca04:	02e50563          	beq	a0,a4,2202ca2e <CPU_Get_MTimer_Source_Clock+0x38>
2202ca08:	00050f63          	beqz	a0,2202ca26 <CPU_Get_MTimer_Source_Clock+0x30>
            break;
    }
    coreFreq = coreFreq ? coreFreq : (32 * 1000 * 1000);

    return coreFreq;
}
2202ca0c:	40a2                	lw	ra,8(sp)
    switch (GLB_Get_Core_Type()) {
2202ca0e:	01e85537          	lui	a0,0x1e85
2202ca12:	80050513          	addi	a0,a0,-2048 # 1e84800 <HeapMinSize+0x1e83800>
}
2202ca16:	0131                	addi	sp,sp,12
2202ca18:	8082                	ret
            coreFreq = Clock_System_Clock_Get(BL_SYSTEM_CLOCK_DSP_CLK);
2202ca1a:	451d                	li	a0,7
2202ca1c:	3635                	jal	2202c548 <Clock_System_Clock_Get>
    coreFreq = coreFreq ? coreFreq : (32 * 1000 * 1000);
2202ca1e:	d57d                	beqz	a0,2202ca0c <CPU_Get_MTimer_Source_Clock+0x16>
}
2202ca20:	40a2                	lw	ra,8(sp)
2202ca22:	0131                	addi	sp,sp,12
2202ca24:	8082                	ret
            coreFreq = Clock_System_Clock_Get(BL_SYSTEM_CLOCK_MCU_CLK);
2202ca26:	4509                	li	a0,2
2202ca28:	3605                	jal	2202c548 <Clock_System_Clock_Get>
    coreFreq = coreFreq ? coreFreq : (32 * 1000 * 1000);
2202ca2a:	f97d                	bnez	a0,2202ca20 <CPU_Get_MTimer_Source_Clock+0x2a>
2202ca2c:	b7c5                	j	2202ca0c <CPU_Get_MTimer_Source_Clock+0x16>
            clock = Clock_System_Clock_Get(BL_SYSTEM_CLOCK_MCU_CLK);
2202ca2e:	3e29                	jal	2202c548 <Clock_System_Clock_Get>
    tmpVal = BL_RD_REG(GLB_BASE, GLB_SYS_CFG0);
2202ca30:	200007b7          	lui	a5,0x20000
2202ca34:	0907a783          	lw	a5,144(a5) # 20000090 <HeapMinSize+0x1ffff090>
    tmpVal = BL_RD_REG(PDS_BASE, PDS_CPU_CORE_CFG7);
2202ca38:	2000e737          	lui	a4,0x2000e
2202ca3c:	12c72703          	lw	a4,300(a4) # 2000e12c <HeapMinSize+0x2000d12c>
    return BL_GET_REG_BITS_VAL(tmpVal, GLB_REG_BCLK_DIV);
2202ca40:	83c1                	srli	a5,a5,0x10
            return clock / (div + 1);
2202ca42:	0ff7f793          	andi	a5,a5,255
2202ca46:	0785                	addi	a5,a5,1
2202ca48:	02f55533          	divu	a0,a0,a5
            return clock / (div + 1);
2202ca4c:	0ff77713          	andi	a4,a4,255
2202ca50:	0705                	addi	a4,a4,1
2202ca52:	02e55533          	divu	a0,a0,a4
    coreFreq = coreFreq ? coreFreq : (32 * 1000 * 1000);
2202ca56:	f569                	bnez	a0,2202ca20 <CPU_Get_MTimer_Source_Clock+0x2a>
2202ca58:	bf55                	j	2202ca0c <CPU_Get_MTimer_Source_Clock+0x16>

2202ca5a <GLB_Get_Core_Type>:
*******************************************************************************/
GLB_CORE_ID_Type ATTR_CLOCK_SECTION GLB_Get_Core_Type(void)
{
    uint32_t tmpVal = 0;

    tmpVal = BL_RD_WORD(CORE_ID_ADDRESS);
2202ca5a:	f00007b7          	lui	a5,0xf0000
2202ca5e:	4398                	lw	a4,0(a5)

    switch (tmpVal) {
2202ca60:	deadf7b7          	lui	a5,0xdeadf
2202ca64:	90278793          	addi	a5,a5,-1790 # deade902 <__etext_final+0x86ab8d0e>
2202ca68:	02f70263          	beq	a4,a5,2202ca8c <GLB_Get_Core_Type+0x32>
2202ca6c:	e90707b7          	lui	a5,0xe9070
2202ca70:	00f70a63          	beq	a4,a5,2202ca84 <GLB_Get_Core_Type+0x2a>
2202ca74:	dead57b7          	lui	a5,0xdead5
2202ca78:	50078793          	addi	a5,a5,1280 # dead5500 <__etext_final+0x86aaf90c>
2202ca7c:	00f70663          	beq	a4,a5,2202ca88 <GLB_Get_Core_Type+0x2e>
        case CORE_ID_D0:
            return GLB_CORE_ID_D0;
        case CORE_ID_LP:
            return GLB_CORE_ID_LP;
        default:
            return GLB_CORE_ID_INVALID;
2202ca80:	4511                	li	a0,4
    }

    return GLB_CORE_ID_INVALID;
}
2202ca82:	8082                	ret
            return GLB_CORE_ID_M0;
2202ca84:	4501                	li	a0,0
2202ca86:	8082                	ret
    switch (tmpVal) {
2202ca88:	4505                	li	a0,1
2202ca8a:	8082                	ret
            return GLB_CORE_ID_LP;
2202ca8c:	4509                	li	a0,2
2202ca8e:	8082                	ret

2202ca90 <CSWTCH.123>:
2202ca90:	0000 0000 3600 016e 4800 01e8 f000 0249     .....6n..H....I.
2202caa0:	5a00 0262 ba80 018c 4800 01e8               .Zb......H..
