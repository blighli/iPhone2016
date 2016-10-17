cal: Month.m MonthPrintManager.m main.m
	clang -fno-objc-arc -framework foundation Month.m MonthPrintManager.m main.m -o cal
test: cal
	./cal && ./cal 10 2016 && ./cal 2016 
run: cal
	./cal
clean:
	rm 	cal
