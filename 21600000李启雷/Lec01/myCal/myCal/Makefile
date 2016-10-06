cal: main.m MYMonthView.h MYMonthView.m MYYearView.h MYYearView.m MYViewBuffer.h MYViewBuffer.m
	clang -framework foundation main.m MYMonthView.m MYYearView.m MYViewBuffer.m -o cal

test: cal
	./cal && ./cal 10 2016 && ./cal 2016
