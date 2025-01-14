# Makefile for rpl

all: rpl.1

check:
	./rpl --version && \
	( cp lorem.orig.txt lorem.txt; ./rpl Lorem L-O-R-E-M lorem.txt; egrep L-O-R-E-M lorem.txt && rm lorem.txt || exit 1 ) && \
	( cp lorem.orig.txt lorem.txt; ./rpl -iva Lorem L-O-R-E-M lorem.txt; egrep L-O-R-E-M lorem.txt && rm lorem.txt || exit 1 )

clean:
	rm -f rpl.1

rpl.1: Makefile rpl man-include.1
	help2man --locale=C.UTF-8 --no-info --name="replace strings in files" --include man-include.1 ./rpl > rpl.1
