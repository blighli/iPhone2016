cal: main.m SLCal.h SLCal.m
	 clang -fobjc-arc -framework Foundation main.m SLCal.m -o cal

test: cal
	  ./cal && ./cal 10 2016 && ./cal 2016
clean:
	rm cal
