cc=clang
cflags=-fno-objc-arc 
objects=main.o Calendar.o ErrorMsg.o

cal : $(objects)
	$(cc)  $(cflags) -framework foundation $(objects) -o cal

main.o : main.m
	$(cc) $(cflags) -c main.m

Calendar.o : Calendar.m
	$(cc) $(cflags) -c Calendar.m

ErrorMsg.o : ErrorMsg.m
	$(cc) $(cflags) -c ErrorMsg.m 

run:
	./cal

clean:
	rm cal

cleanall:
	rm *.o cal