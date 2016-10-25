cal: main.m Calender.m Calender.h
	clang -framework foundation main.m Calender.m -o cal

test: cal
	./cal && ./cal 10 2016 && ./cal 2016

run:
	./cal

clean:
	rm cal
