cal: main.m JKCalendar.h JKCalendar.m
	clang -fobjc-arc -framework Foundation main.m JKCalendar.m -o cal

test: cal
	./cal && ./cal 10 2016 && ./cal 2016