RM=/bin/rm

compile:
	ldc2 -of=dhex main.d

run:
	./main testfile.txt

install:
	test -d /usr/local/bin || mkdir -p /usr/local/bin
	install -pm 755 dhex /usr/local/bin

remove:
	$(RM) /usr/local/bin/dhex

clean:
	rm dhex.o dhex
