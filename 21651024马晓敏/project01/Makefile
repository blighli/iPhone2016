myCal: myCal.m main.m
	clang -fno-objc-arc -framework foundation myCal.m main.m -o myCal

test:
	./myCal && ./myCal 10 2016 && ./myCal 2016

run:
	./myCal

clean:
	rm myCal
