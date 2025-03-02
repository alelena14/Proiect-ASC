.data
	matrix:.space 1600
	nmatrix:.space 1600
	m:.space 4	
	n:.space 4	
	p:.space 4
	k:.space 4
	o:.space 4	
	lineIndex:.space 4
	columnIndex:.space 4
	lineIndex3:.space 4
	columnIndex3:.space 4
	index:.space 4
	i:.space 4
	j:.space 4
	c:.space 4
	aux:.space 4
	newn:.space 4
	newm:.space 4
	st:.space 4
	dr:.space 4
	lungime_cheie:.space 4
	binar:.space 80
	cript:.space 80
	aux1:.space 8
	c1:.space 4
	lungime_cod:.space 4
	cod:.space 4
	mesaj:.space 22
	suma:.space 4
	formatPrintf:.asciz "%d "
	formatScanf:.asciz "%d"
	newLine:.asciz "\n"
	formatScanfsir:.asciz "%s"
	afis0:.asciz "0"
	afisx:.asciz "x"
	formathex:.asciz "%X"
	formatchar:.asciz "%c"
	
	
.text

.global main

main:

	movl $0,lungime_cheie
	
	pushl $m
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	pushl $n
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	pushl $p
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	movl $0,index
	
addl $2,m
addl $2,n 

et_citirepuncte:

	movl index,%ecx
	cmp %ecx,p
	je ett
	
	pushl $st
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	pushl $dr
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	movl st, %eax
	xorl %edx, %edx
	mull n
	addl dr, %eax
	addl n, %eax
	incl %eax
	
	lea matrix,%edi
	movl $1,(%edi,%eax,4)
	
	
	incl index
	jmp et_citirepuncte	
ett:
	pusha
	pushl $k
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	popa
	
	movl m,%edx
	movl %edx,newm
	subl $2,newm
	movl n,%edx
	movl %edx,newn
	subl $2,newn
	
et_afisare:
	movl $0,index
	movl $0,lineIndex
	
	forlines:
		movl lineIndex,%ecx
		cmp %ecx, m
		je et_modif
		movl $0,columnIndex
		
		forcolumns:
			movl columnIndex,%ecx
			cmp n, %ecx
			je cont
			
			movl lineIndex, %eax
			xorl %edx,%edx
			mull n
			addl columnIndex, %eax
			
			lea matrix,%edi
			movl (%edi,%eax,4),%ebx
			
			incl columnIndex
			jmp forcolumns
		
		
	cont:
		incl lineIndex
		jmp forlines
	

et_modif:
	movl index, %ecx
	cmp %ecx, k
	je et_afisare_finala
	movl $0,lineIndex
	
	forlines2: 
		movl lineIndex,%ecx
		cmp %ecx, m
		je et_aux
		movl $0,columnIndex
		
		forcolumns2:
			movl columnIndex, %ecx
			cmp %ecx,n
			je cont2
			
			movl lineIndex, %eax
			xorl %edx, %edx
			mull n
			addl columnIndex, %eax
			
			lea nmatrix,%esi
			movl (%edi,%eax,4),%edx
			movl %edx,(%esi,%eax,4)
			
			incl columnIndex
			jmp forcolumns2
			
	cont2:
		incl lineIndex
		jmp forlines2
		
	et_aux:
		movl $0,lineIndex3
		jmp forlines3
	
	
	forlines3: 
		movl lineIndex3,%ecx
		cmp %ecx, newm
		je cont5
		movl $0,columnIndex3
		
		
		forcolumns3:
			movl columnIndex3, %ecx
			cmp %ecx,newn
			je cont3
			
			movl $0,i
			movl $0,c

			fori:
				movl i,%ecx
				movl $3,aux
				cmp %ecx, aux
				je cazuri
				movl $0,j
			
				forj:
					movl j,%ecx
					movl $3,aux
					cmp %ecx,aux
					je cont4
					
					movl lineIndex3,%eax
					xorl %edx,%edx
					mull n
					addl columnIndex3,%eax
					addl n,%eax
					incl %eax
					
					movl i,%ebx
					movl $0,aux
					cmp %ebx,aux
					je sus
					movl $1,aux
					cmp %ebx,aux
					je mij
					movl $2,aux
					cmp %ebx,aux
					je jos
					
					sus: 
						subl n, %eax
						addl j, %eax
						decl %eax
						jmp vecini
						
					mij: 
						addl j, %eax
						decl %eax
						jmp vecini
					
					jos:
						addl n,%eax
						addl j,%eax
						decl %eax
						jmp vecini
						
					vecini:
						movl $1,aux
						movl (%esi,%eax,4),%edx
						cmp %edx,aux
						je numarare
						incl j
						jmp forj
						
					numarare:
						incl c
						incl j
						jmp forj
				
				cont4:
					incl i
					jmp fori
					
			cazuri:
				movl lineIndex3,%eax
				xorl %edx,%edx
				mull n
				addl columnIndex3,%eax
				addl n,%eax
				incl %eax
				
				movl $1,aux
				movl (%esi,%eax,4),%edx
				cmp %edx,aux
				je caz1
				jmp caz2
				
				caz1:
					mov $3,%edx
					cmp c,%edx
					jg dev0
					
					mov $4,%edx
					cmp c,%edx
					jl dev0
					jmp cont6
					
				caz2:
					mov $3,%edx
					cmp c,%edx
					je dev1
					jmp cont6
						
				dev0:
					movl $0,(%edi,%eax,4)
					jmp cont6
					
				dev1:
					movl $1,(%edi,%eax,4)
					jmp cont6
					
					
			
	cont3:
		incl lineIndex3
		jmp forlines3
		
	cont5:
		incl index
		jmp et_modif
		
	cont6:
		incl columnIndex3
		jmp forcolumns3
		
		
		

et_afisare_finala:

	movl $0,lineIndex	
	ulforlines:
		movl lineIndex,%ecx
		cmp %ecx,m
		je cript_decript
		
		movl lungime_cheie,%ecx
		addl n,%ecx
		movl %ecx,lungime_cheie
		
		movl $0,columnIndex
			
		ulforcolumns:
			movl columnIndex,%ecx
			cmp %ecx,n
			je cont7
			
			movl lineIndex,%eax
			xorl %edx,%edx
			mull n
			addl columnIndex,%eax
			
			
			movl (%edi,%eax,4),%ebx
			
			incl columnIndex
			jmp ulforcolumns
			
	cont7:		
		incl lineIndex
		jmp ulforlines
	
	
	
cript_decript:
	pusha
	pushl $o
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	popa
	
	movl $0,%ecx
	cmp %ecx,o
	je Criptare
	jmp Decriptare

	
Criptare:
	pusha
	pushl $mesaj
	pushl $formatScanfsir
	call scanf
	popl %ebx
	popl %ebx
	popa

	xorl %edx,%edx
	xorl %ebx,%ebx
	xorl %eax,%eax
	lea binar,%edi
	lea mesaj,%esi
	movl $0,lungime_cod


	for:
		movb (%esi,%edx,1),%al
		movb %al,cod
		movl $0,%eax
		movl %eax,c1
		cmp %eax,cod
		je et_egalare
		
		addl $8,lungime_cod
		movl $1,aux1
		shll $7,aux1
		movl $8,index
		
		conv:
			movl index,%ecx
			cmp %ecx,c1
			je contfor
			
			movl cod,%eax
			sub aux1,%eax
			cmp %eax,c1
			jg adunare
			
			movb $1,(%edi,%ebx,1)
			movl %eax,cod
			movl (%edi,%ebx,1),%eax
			incl %ebx

			jmp cont10
			
		
			adunare:
				add aux1,%eax
				movl %eax,cod
				movb $0,(%edi,%ebx,1)
				movl (%edi,%ebx,1),%eax
		
				incl %ebx
				
		cont10:
			shrl $1,aux1
			decl index
			jmp conv
		
		contfor:
			incl %edx
			jmp for
			
			
et_egalare:
	movl lungime_cod,%eax
	cmp %eax,lungime_cheie
	
	jl cheie_mica
	jmp criptare

cheie_mica:

	lea matrix,%edi
	xorl %ecx,%ecx
	xorl %ebx,%ebx
	xorl %eax,%eax
	
	movl lungime_cod,%ecx
	subl lungime_cheie,%ecx    
	incl %edx
	xorl %eax,%eax
	movl $0,c1
	movl %eax,%edx
	addl lungime_cheie,%edx
	movl lungime_cheie,%ebx
		
	foradaugare:
		cmp c1,%ecx
		je criptare
		
		movl (%edi,%eax,4),%ebx
		movl %ebx,(%edi,%edx,4)
		addl $4,%eax
		addl $4,%edx
		incl c1
		
		jmp foradaugare
		


criptare:

		xorl %eax,%eax
		xorl %ebx,%ebx
		xorl %ecx,%ecx
		movl $0,index
		lea binar,%esi
		
		forxor:
			movl index,%ecx
			cmp %ecx,lungime_cod
			je afiscript
			
			lea matrix,%edi
			movl (%edi,%eax,4),%edx
			movb (%esi,%ebx,1),%cl
			xorb %cl,%dl
			lea cript,%edi
			movb %dl,(%edi,%ebx,1)
			incl %eax
			incl %ebx
			
			incl index
			jmp forxor
		
		afiscript:
			lea cript,%edi
			movl $0,%ecx
			movl $0,%eax
			
			altfor:
				cmp %ecx,lungime_cod
				je transhex
				movb (%edi,%eax,1),%bl
				incl %eax
				incl %ecx
				jmp altfor
			
		transhex:
			lea cript,%edi
		
			movl $4,%eax
			movl $1,%ebx
			movl $afis0,%ecx
			movl $2,%edx
			int $0x80
			movl $4,%eax
			movl $1,%ebx
			movl $afisx,%ecx
			movl $2,%edx
			int $0x80
			
			movl $0,c
			movl $1,aux
			shll $3,aux
			movl $0,index
			xorl %ebx,%ebx
			xorl %edx,%edx
			
			forhex:
				movl index,%ecx
				cmp %ecx,lungime_cod
				jl et_exit
				
				movl $4,%ecx
				cmp %ecx,c
				je cmodif
				
				et_cont:
					movb (%edi,%edx,1),%bl
					movb $1,%al
					cmp %bl,%al
					je ad
					jmp cont11
				
				ad:
					movl suma,%ecx
					addl aux,%ecx
					movl %ecx,suma
					
					jmp cont11
				
				cont11:
					shrl $1,aux
					incl index
					incl c
					incl %edx
					jmp forhex
					
				cmodif:
					pusha
					pushl suma
					pushl $formathex
					call printf
					popl %ebx
					popl %ebx
					popa
					
					pusha
					pushl $0
					call fflush
					popl %ebx
					popa
					
					movl $0,suma
					movl $0,c
					movl $1,aux
					shll $3,aux
					jmp et_cont
					
					
				
				
Decriptare:
	pusha
	pushl $mesaj
	pushl $formatScanfsir
	call scanf
	popl %ebx
	popl %ebx
	popa
	
	movl $2,%edx
	xorl %ebx,%ebx
	xorl %eax,%eax
	lea binar,%edi
	lea mesaj,%esi
	movl $0,lungime_cod


	ford:
		movb (%esi,%edx,1),%al
		movb %al,cod
		movl $0,%eax
		movl $0,c1
		cmp %eax,cod
		je et_egalared
		
		movl cod,%ecx
		movl $65,aux1
		cmp %ecx,aux1
		jle sc55
		jmp sc48
		
		sc48:
		subl $48,%ecx
		jmp coont
		
		sc55:
		subl $55,%ecx
		jmp coont
		
		
		coont:
		movl %ecx,cod
		addl $4,lungime_cod
		movl $1,aux1
		shll $3,aux1
		movl $4,index
		
		convd:
			movl index,%ecx
			cmp %ecx,c1
			je contford
			
			movl cod,%eax
			sub aux1,%eax
			cmp %eax,c1
			jg adunared
			
			movb $1,(%edi,%ebx,1)
			movl %eax,cod
			xorl %eax,%eax
			movb (%edi,%ebx,1),%al
			incl %ebx
			
			jmp contd
			
		
			adunared:
			
				add aux1,%eax
				movl %eax,cod
				movb $0,(%edi,%ebx,1)
				movb (%edi,%ebx,1),%al
				
				incl %ebx
				
		contd:
			shrl $1,aux1
			decl index
			jmp convd
		
		contford:
			incl %edx
			jmp ford
			
	
et_egalared:
	movl lungime_cod,%eax
	cmp %eax,lungime_cheie
	
	jl cheie_micad
	jmp decriptare

cheie_micad:

	lea matrix,%edi
	xorl %ecx,%ecx
	xorl %ebx,%ebx
	xorl %eax,%eax
	
	movl lungime_cod,%ecx
	subl lungime_cheie,%ecx    
	incl %edx
	xorl %eax,%eax
	movl $0,c1
	movl %eax,%edx
	addl lungime_cheie,%edx
	movl lungime_cheie,%ebx
	foradaugared:
		cmp c1,%ecx
		je decriptare
		
		movl (%edi,%eax,4),%ebx
		movl %ebx,(%edi,%edx,4)
		addl $4,%eax
		addl $4,%edx
		incl c1
		
		jmp foradaugared
	
decriptare:
		xorl %eax,%eax
		xorl %ebx,%ebx
		xorl %ecx,%ecx
		movl $0,index
		lea binar,%esi
		
		forxord:
			movl index,%ecx
			cmp %ecx,lungime_cod
			je transparola
			
			lea matrix,%edi
			movl (%edi,%eax,4),%edx
			movb (%esi,%ebx,1),%cl
			xorb %cl,%dl
			lea cript,%edi
			movb %dl,(%edi,%ebx,1)
			incl %eax
			incl %ebx
			
			
			incl index
			jmp forxord
		
		
	
	transparola:
			lea cript,%edi
		
			movl $0,c
			movl $1,aux
			shll $7,aux
			movl $0,index
			xorl %ebx,%ebx
			xorl %edx,%edx
			movl $0,suma
			
			forhexd:
				movl index,%ecx
				cmp %ecx,lungime_cod
				jl et_exit
				
				movl $8,%ecx
				cmp %ecx,c
				je cmodifd
				
				et_contd:
					movb (%edi,%edx,1),%bl
					movb $1,%al
					cmp %bl,%al
					je add
					jmp cont11d
				
				add:
					movl suma,%ecx
					addl aux,%ecx
					movl %ecx,suma
					
					jmp cont11d
				
				cont11d:
					shrl $1,aux
					incl index
					incl c
					incl %edx
					jmp forhexd
					
				cmodifd:
					pusha
					pushl suma
					pushl $formatchar
					call printf
					popl %ebx
					popl %ebx
					popa
					
					pusha
					pushl $0
					call fflush
					popl %ebx
					popa
					
					movl $0,suma
					movl $0,c
					movl $1,aux
					shll $7,aux
					jmp et_contd
	
					
		
et_exit:	
	movl $4,%eax
	movl $1,%ebx
	movl $newLine,%ecx
	movl $2,%edx
	int $0x80
	
	pushl $0
	call fflush
	popl %ebx
		
	movl $1,%eax
	xorl %ebx,%ebx
	int $0x80
