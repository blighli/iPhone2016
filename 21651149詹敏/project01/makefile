cal: main.m zmcal.h zmcal.m
	 clang -fobjc-arc -framework Foundation main.m zmcal.m -o cal

test: cal
	  ./cal && ./cal 10 2016 && ./cal 2016
clean:
	rm cal