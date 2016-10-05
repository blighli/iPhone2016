cal: main.m MYCalendarMonthView.h MYCalendarMonthView.m MYCalendarYearView.h MYCalendarYearView.m Utils.h Utils.m
	clang -framework foundation main.m MYCalendarMonthView.m MYCalendarYearView.m Utils.m -o cal

test: cal
	./cal && ./cal 10 2016 && ./cal 2016
