.data
	matrix:.space 1600
	nmatrix:.space 1600
	m:.space 4	
	n:.space 4	
	p:.space 4
	k:.space 4	
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
	formatPrintf:.asciz "%d "
	formatScanf:.asciz "%d"
	newLine:.asciz "\n"
	
.text

.global main

main:
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
		cmp %ecx,newm
		je etexit
		
		movl $0,columnIndex
			
		ulforcolumns:
			movl columnIndex,%ecx
			cmp %ecx,newn
			je cont7
			
			movl lineIndex,%eax
			xorl %edx,%edx
			mull n
			addl columnIndex,%eax
			addl n,%eax
			incl %eax
			
			movl (%edi,%eax,4),%ebx
			
			pusha
			pushl %ebx
			pushl $formatPrintf
			call printf
			popl %ebx
			popl %ebx
			popa
			
			pusha
			pushl $0
			call fflush
			popl %ebx
			popa
			
			incl columnIndex
			jmp ulforcolumns
			
	cont7:
	movl $4,%eax
	movl $1,%ebx
	movl $newLine,%ecx
	movl $2,%edx
	int $0x80
		incl lineIndex
		jmp ulforlines
	

etexit:
	pushl $0
	call fflush
	popl %ebx
	
	movl $1,%eax
	xorl %ebx,%ebx
	int $0x80
