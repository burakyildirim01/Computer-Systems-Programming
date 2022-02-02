
exe1:     file format elf32-i386


Disassembly of section .init:

0804830c <_init>:
 804830c:	53                   	push   %ebx
 804830d:	83 ec 08             	sub    $0x8,%esp
 8048310:	e8 ab 00 00 00       	call   80483c0 <__x86.get_pc_thunk.bx>
 8048315:	81 c3 eb 1c 00 00    	add    $0x1ceb,%ebx
 804831b:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 8048321:	85 c0                	test   %eax,%eax
 8048323:	74 05                	je     804832a <_init+0x1e>
 8048325:	e8 56 00 00 00       	call   8048380 <.plt.got>
 804832a:	83 c4 08             	add    $0x8,%esp
 804832d:	5b                   	pop    %ebx
 804832e:	c3                   	ret    

Disassembly of section .plt:

08048330 <.plt>:
 8048330:	ff 35 04 a0 04 08    	pushl  0x804a004
 8048336:	ff 25 08 a0 04 08    	jmp    *0x804a008
 804833c:	00 00                	add    %al,(%eax)
	...

08048340 <printf@plt>:
 8048340:	ff 25 0c a0 04 08    	jmp    *0x804a00c
 8048346:	68 00 00 00 00       	push   $0x0
 804834b:	e9 e0 ff ff ff       	jmp    8048330 <.plt>

08048350 <puts@plt>:
 8048350:	ff 25 10 a0 04 08    	jmp    *0x804a010
 8048356:	68 08 00 00 00       	push   $0x8
 804835b:	e9 d0 ff ff ff       	jmp    8048330 <.plt>

08048360 <__libc_start_main@plt>:
 8048360:	ff 25 14 a0 04 08    	jmp    *0x804a014
 8048366:	68 10 00 00 00       	push   $0x10
 804836b:	e9 c0 ff ff ff       	jmp    8048330 <.plt>

08048370 <__isoc99_scanf@plt>:
 8048370:	ff 25 18 a0 04 08    	jmp    *0x804a018
 8048376:	68 18 00 00 00       	push   $0x18
 804837b:	e9 b0 ff ff ff       	jmp    8048330 <.plt>

Disassembly of section .plt.got:

08048380 <.plt.got>:
 8048380:	ff 25 fc 9f 04 08    	jmp    *0x8049ffc
 8048386:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

08048390 <_start>:
 8048390:	31 ed                	xor    %ebp,%ebp
 8048392:	5e                   	pop    %esi
 8048393:	89 e1                	mov    %esp,%ecx
 8048395:	83 e4 f0             	and    $0xfffffff0,%esp
 8048398:	50                   	push   %eax
 8048399:	54                   	push   %esp
 804839a:	52                   	push   %edx
 804839b:	68 b0 85 04 08       	push   $0x80485b0
 80483a0:	68 40 85 04 08       	push   $0x8048540
 80483a5:	51                   	push   %ecx
 80483a6:	56                   	push   %esi
 80483a7:	68 28 85 04 08       	push   $0x8048528
 80483ac:	e8 af ff ff ff       	call   8048360 <__libc_start_main@plt>
 80483b1:	f4                   	hlt    
 80483b2:	66 90                	xchg   %ax,%ax
 80483b4:	66 90                	xchg   %ax,%ax
 80483b6:	66 90                	xchg   %ax,%ax
 80483b8:	66 90                	xchg   %ax,%ax
 80483ba:	66 90                	xchg   %ax,%ax
 80483bc:	66 90                	xchg   %ax,%ax
 80483be:	66 90                	xchg   %ax,%ax

080483c0 <__x86.get_pc_thunk.bx>:
 80483c0:	8b 1c 24             	mov    (%esp),%ebx
 80483c3:	c3                   	ret    
 80483c4:	66 90                	xchg   %ax,%ax
 80483c6:	66 90                	xchg   %ax,%ax
 80483c8:	66 90                	xchg   %ax,%ax
 80483ca:	66 90                	xchg   %ax,%ax
 80483cc:	66 90                	xchg   %ax,%ax
 80483ce:	66 90                	xchg   %ax,%ax

080483d0 <deregister_tm_clones>:
 80483d0:	b8 27 a0 04 08       	mov    $0x804a027,%eax
 80483d5:	2d 24 a0 04 08       	sub    $0x804a024,%eax
 80483da:	83 f8 06             	cmp    $0x6,%eax
 80483dd:	77 01                	ja     80483e0 <deregister_tm_clones+0x10>
 80483df:	c3                   	ret    
 80483e0:	b8 00 00 00 00       	mov    $0x0,%eax
 80483e5:	85 c0                	test   %eax,%eax
 80483e7:	74 f6                	je     80483df <deregister_tm_clones+0xf>
 80483e9:	55                   	push   %ebp
 80483ea:	89 e5                	mov    %esp,%ebp
 80483ec:	83 ec 18             	sub    $0x18,%esp
 80483ef:	c7 04 24 24 a0 04 08 	movl   $0x804a024,(%esp)
 80483f6:	ff d0                	call   *%eax
 80483f8:	c9                   	leave  
 80483f9:	c3                   	ret    
 80483fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

08048400 <register_tm_clones>:
 8048400:	b8 24 a0 04 08       	mov    $0x804a024,%eax
 8048405:	2d 24 a0 04 08       	sub    $0x804a024,%eax
 804840a:	c1 f8 02             	sar    $0x2,%eax
 804840d:	89 c2                	mov    %eax,%edx
 804840f:	c1 ea 1f             	shr    $0x1f,%edx
 8048412:	01 d0                	add    %edx,%eax
 8048414:	d1 f8                	sar    %eax
 8048416:	75 01                	jne    8048419 <register_tm_clones+0x19>
 8048418:	c3                   	ret    
 8048419:	ba 00 00 00 00       	mov    $0x0,%edx
 804841e:	85 d2                	test   %edx,%edx
 8048420:	74 f6                	je     8048418 <register_tm_clones+0x18>
 8048422:	55                   	push   %ebp
 8048423:	89 e5                	mov    %esp,%ebp
 8048425:	83 ec 18             	sub    $0x18,%esp
 8048428:	89 44 24 04          	mov    %eax,0x4(%esp)
 804842c:	c7 04 24 24 a0 04 08 	movl   $0x804a024,(%esp)
 8048433:	ff d2                	call   *%edx
 8048435:	c9                   	leave  
 8048436:	c3                   	ret    
 8048437:	89 f6                	mov    %esi,%esi
 8048439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048440 <__do_global_dtors_aux>:
 8048440:	80 3d 24 a0 04 08 00 	cmpb   $0x0,0x804a024
 8048447:	75 13                	jne    804845c <__do_global_dtors_aux+0x1c>
 8048449:	55                   	push   %ebp
 804844a:	89 e5                	mov    %esp,%ebp
 804844c:	83 ec 08             	sub    $0x8,%esp
 804844f:	e8 7c ff ff ff       	call   80483d0 <deregister_tm_clones>
 8048454:	c6 05 24 a0 04 08 01 	movb   $0x1,0x804a024
 804845b:	c9                   	leave  
 804845c:	f3 c3                	repz ret 
 804845e:	66 90                	xchg   %ax,%ax

08048460 <frame_dummy>:
 8048460:	a1 10 9f 04 08       	mov    0x8049f10,%eax
 8048465:	85 c0                	test   %eax,%eax
 8048467:	74 1f                	je     8048488 <frame_dummy+0x28>
 8048469:	b8 00 00 00 00       	mov    $0x0,%eax
 804846e:	85 c0                	test   %eax,%eax
 8048470:	74 16                	je     8048488 <frame_dummy+0x28>
 8048472:	55                   	push   %ebp
 8048473:	89 e5                	mov    %esp,%ebp
 8048475:	83 ec 18             	sub    $0x18,%esp
 8048478:	c7 04 24 10 9f 04 08 	movl   $0x8049f10,(%esp)
 804847f:	ff d0                	call   *%eax
 8048481:	c9                   	leave  
 8048482:	e9 79 ff ff ff       	jmp    8048400 <register_tm_clones>
 8048487:	90                   	nop
 8048488:	e9 73 ff ff ff       	jmp    8048400 <register_tm_clones>

0804848d <transfer_money>:
 804848d:	55                   	push   %ebp
 804848e:	89 e5                	mov    %esp,%ebp
 8048490:	83 ec 18             	sub    $0x18,%esp
 8048493:	c7 04 24 d4 85 04 08 	movl   $0x80485d4,(%esp)
 804849a:	e8 b1 fe ff ff       	call   8048350 <puts@plt>
 804849f:	c9                   	leave  
 80484a0:	c3                   	ret    

080484a1 <check_password>:
 80484a1:	55                   	push   %ebp
 80484a2:	89 e5                	mov    %esp,%ebp
 80484a4:	81 ec 88 00 00 00    	sub    $0x88,%esp
 80484aa:	c7 04 24 fb 85 04 08 	movl   $0x80485fb,(%esp)
 80484b1:	e8 9a fe ff ff       	call   8048350 <puts@plt>
 80484b6:	8d 45 94             	lea    -0x6c(%ebp),%eax
 80484b9:	89 44 24 04          	mov    %eax,0x4(%esp)
 80484bd:	c7 04 24 0b 86 04 08 	movl   $0x804860b,(%esp)
 80484c4:	e8 a7 fe ff ff       	call   8048370 <__isoc99_scanf@plt>
 80484c9:	8d 45 94             	lea    -0x6c(%ebp),%eax
 80484cc:	89 44 24 04          	mov    %eax,0x4(%esp)
 80484d0:	c7 04 24 0e 86 04 08 	movl   $0x804860e,(%esp)
 80484d7:	e8 64 fe ff ff       	call   8048340 <printf@plt>
 80484dc:	c7 04 24 25 86 04 08 	movl   $0x8048625,(%esp)
 80484e3:	e8 68 fe ff ff       	call   8048350 <puts@plt>
 80484e8:	8d 45 90             	lea    -0x70(%ebp),%eax
 80484eb:	89 44 24 04          	mov    %eax,0x4(%esp)
 80484ef:	c7 04 24 30 86 04 08 	movl   $0x8048630,(%esp)
 80484f6:	e8 75 fe ff ff       	call   8048370 <__isoc99_scanf@plt>
 80484fb:	8b 55 90             	mov    -0x70(%ebp),%edx
 80484fe:	a1 20 a0 04 08       	mov    0x804a020,%eax
 8048503:	39 c2                	cmp    %eax,%edx
 8048505:	75 13                	jne    804851a <check_password+0x79>
 8048507:	c7 04 24 33 86 04 08 	movl   $0x8048633,(%esp)
 804850e:	e8 3d fe ff ff       	call   8048350 <puts@plt>
 8048513:	e8 75 ff ff ff       	call   804848d <transfer_money>
 8048518:	eb 0c                	jmp    8048526 <check_password+0x85>
 804851a:	c7 04 24 4e 86 04 08 	movl   $0x804864e,(%esp)
 8048521:	e8 2a fe ff ff       	call   8048350 <puts@plt>
 8048526:	c9                   	leave  
 8048527:	c3                   	ret    

08048528 <main>:
 8048528:	55                   	push   %ebp
 8048529:	89 e5                	mov    %esp,%ebp
 804852b:	83 e4 f0             	and    $0xfffffff0,%esp
 804852e:	e8 6e ff ff ff       	call   80484a1 <check_password>
 8048533:	b8 00 00 00 00       	mov    $0x0,%eax
 8048538:	c9                   	leave  
 8048539:	c3                   	ret    
 804853a:	66 90                	xchg   %ax,%ax
 804853c:	66 90                	xchg   %ax,%ax
 804853e:	66 90                	xchg   %ax,%ax

08048540 <__libc_csu_init>:
 8048540:	55                   	push   %ebp
 8048541:	57                   	push   %edi
 8048542:	31 ff                	xor    %edi,%edi
 8048544:	56                   	push   %esi
 8048545:	53                   	push   %ebx
 8048546:	e8 75 fe ff ff       	call   80483c0 <__x86.get_pc_thunk.bx>
 804854b:	81 c3 b5 1a 00 00    	add    $0x1ab5,%ebx
 8048551:	83 ec 1c             	sub    $0x1c,%esp
 8048554:	8b 6c 24 30          	mov    0x30(%esp),%ebp
 8048558:	8d b3 0c ff ff ff    	lea    -0xf4(%ebx),%esi
 804855e:	e8 a9 fd ff ff       	call   804830c <_init>
 8048563:	8d 83 08 ff ff ff    	lea    -0xf8(%ebx),%eax
 8048569:	29 c6                	sub    %eax,%esi
 804856b:	c1 fe 02             	sar    $0x2,%esi
 804856e:	85 f6                	test   %esi,%esi
 8048570:	74 27                	je     8048599 <__libc_csu_init+0x59>
 8048572:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048578:	8b 44 24 38          	mov    0x38(%esp),%eax
 804857c:	89 2c 24             	mov    %ebp,(%esp)
 804857f:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048583:	8b 44 24 34          	mov    0x34(%esp),%eax
 8048587:	89 44 24 04          	mov    %eax,0x4(%esp)
 804858b:	ff 94 bb 08 ff ff ff 	call   *-0xf8(%ebx,%edi,4)
 8048592:	83 c7 01             	add    $0x1,%edi
 8048595:	39 f7                	cmp    %esi,%edi
 8048597:	75 df                	jne    8048578 <__libc_csu_init+0x38>
 8048599:	83 c4 1c             	add    $0x1c,%esp
 804859c:	5b                   	pop    %ebx
 804859d:	5e                   	pop    %esi
 804859e:	5f                   	pop    %edi
 804859f:	5d                   	pop    %ebp
 80485a0:	c3                   	ret    
 80485a1:	eb 0d                	jmp    80485b0 <__libc_csu_fini>
 80485a3:	90                   	nop
 80485a4:	90                   	nop
 80485a5:	90                   	nop
 80485a6:	90                   	nop
 80485a7:	90                   	nop
 80485a8:	90                   	nop
 80485a9:	90                   	nop
 80485aa:	90                   	nop
 80485ab:	90                   	nop
 80485ac:	90                   	nop
 80485ad:	90                   	nop
 80485ae:	90                   	nop
 80485af:	90                   	nop

080485b0 <__libc_csu_fini>:
 80485b0:	f3 c3                	repz ret 

Disassembly of section .fini:

080485b4 <_fini>:
 80485b4:	53                   	push   %ebx
 80485b5:	83 ec 08             	sub    $0x8,%esp
 80485b8:	e8 03 fe ff ff       	call   80483c0 <__x86.get_pc_thunk.bx>
 80485bd:	81 c3 43 1a 00 00    	add    $0x1a43,%ebx
 80485c3:	83 c4 08             	add    $0x8,%esp
 80485c6:	5b                   	pop    %ebx
 80485c7:	c3                   	ret    
