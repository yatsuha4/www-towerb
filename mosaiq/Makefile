include ../Makefile.def

CURDIR		:= $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

SOURCES	:= $(shell find $(CURDIR) -name '*.md')
TARGETS	:= $(patsubst %.md, %.html, $(SOURCES))

.PHONY: all
all: $(TARGETS)

.PHONY: clean
clean:
	$(RM) $(TARGETS)
