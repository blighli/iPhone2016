cc=clang
cflags=-fno-objc-arc 
objects=main.o Days.o JudgeNumberRegex.o PrintYearAndMonth.o YearAndMonthNow.o 

cal : $(objects)
	$(cc)  $(cflags) -framework foundation $(objects) -o cal

main.o : main.m
	$(cc) $(cflags) -c main.m

Days.o : Days.h Days.m
	$(cc) $(cflags) -c Days.m

JudgeNumberRegex.o : JudgeNumberRegex.h JudgeNumberRegex.m
	$(cc) $(cflags) -c JudgeNumberRegex.m

PrintYearAndMonth.o : PrintYearAndMonth.h PrintYearAndMonth.m
	$(cc) $(cflags) -c PrintYearAndMonth.m
YearAndMonthNow.o : YearAndMonthNow.h YearAndMonthNow.m
	$(cc) $(cflags) -c YearAndMonthNow.m
run:
	./cal

clean:
	rm cal

cleanall:
	rm *.o cal
