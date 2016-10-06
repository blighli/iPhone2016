#Makefile
#make -f Makefile hello : -f指定执行的脚本文件名
#make -f Makefile : 默认执行脚本中第一个目标。

cal : calendar.m main.m
	clang -fno-objc-arc -framework foundation calendar.m main.m -o cal

#快捷执行指令
run :
	./cal
	
clean :
	rm cal