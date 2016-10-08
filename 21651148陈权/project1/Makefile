cal : main.m cal.m
	clang -fno-objc-arc -framework foundation main.m cal.m -o cal

run : cal
	./cal

test : cal
	./cal 10 2016 && \
	./cal 2016 && \
	./cal

clean :
	rm cal
