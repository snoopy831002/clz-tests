CC ?= gcc
CFLAG_common ?= -Wall -std=gnu99
SRC_common =$(filter-out src/main.c,$(wildcard src/*))
EXEC:=$(addprefix bin/,$(basename $(notdir $(SRC_common))))
all: bin $(EXEC)


bin:
	mkdir bin
bin/clz_iteration:
	$(CC) $(CFLAG_common) -DFUNC='"iteration"' -o $@ src/main.c src/clz_iteration.c
bin/clz_binarySearch:
	$(CC) $(CFLAG_common) -DFUNC='"binarySearch"' -o $@ src/main.c src/clz_binarySearch.c
bin/clz_byteShift:
	$(CC) $(CFLAG_common) -DFUNC='"byteShift"' -o $@ src/main.c src/clz_byteShift.c
bin/clz_Harley:
	$(CC) $(CFLAG_common) -DFUNC='"Harley"' -o $@ src/main.c src/clz_Harley.c
bin/clz_recursive:
	$(CC) $(CFLAG_common) -DFUNC='"recursive"' -o $@ src/main.c src/clz_recursive.c

run:
	mkdir output
	./bin/clz_iteration
	./bin/clz_binarySearch
	./bin/clz_byteShift
	./bin/clz_Harley
	./bin/clz_recursive

clean:
	rm -rf bin
	rm runtime.png
	rm -rf output

plot:
	gnuplot script/runtime.gp
	eog runtime.png


