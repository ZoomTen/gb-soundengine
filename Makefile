ASM ?= rgbasm
LINK ?= rgblink
FIX ?= rgbfix
DD ?= dd

all: rom gbs

rom: soundtest.gb
gbs: gbstest.gbs

.PHONY: rom gbs clean tidy

clean: tidy
	rm -v *.gb *.gbs

tidy:
	rm -v *.sym

%.gb: %.o
	$(LINK) -n $*.sym -o $@ $^
	$(FIX) -v $@

%.gbs: %.gbs.header %.gbs.data
	cat $^ > $@

%.gbs.header: %.gbs.raw
	dd if=$< of=$@ bs=1 count=112

%.gbs.data: %.gbs.raw
	dd if=$< of=$@ skip=1136 bs=1

%.gbs.raw: %.o
	$(LINK) -o $@ $^

%.o: %.asm
	$(ASM) -o $@ $^
