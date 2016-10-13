cal: main.m YearCalendar.h YearCalendar.m MonthCalendar.h MonthCalendar.m
	clang -framework foundation main.m YearCalendar.m MonthCalendar.m -o cal
run:
	./cal

clean:
	rm cal

test:
	./cal && ./cal 10 2016 && ./cal 2016