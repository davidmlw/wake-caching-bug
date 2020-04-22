file := $(shell find . -name in2.txt)
out.txt: $(file)
	cp $(file) $@ || true
