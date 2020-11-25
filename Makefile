TOPDIR	?=	$(dir $(abspath $(firstword $(MAKEFILE_LIST))))

MD2HTML		:= ruby $(TOPDIR)/md2html/md2html.rb
MD2HTML_FLAGS	:= \
		-t $(TOPDIR)/template.html

RM		:= rm -rf

SOURCES		:= $(wildcard *.md)
TARGETS		:= $(patsubst %.md, %.html, $(SOURCES))

SUBDIRS		:= $(wildcard */)

#
.PHONY: all
all: $(TARGETS) all.recursive

#
.PHONY: clean
clean: clean.recursive
	$(RM) $(TARGETS)

#
%.html: %.md
	$(MD2HTML) $(MD2HTML_FLAGS) -o $@ $<

#
%.recursive:
	@for dir in $(SUBDIRS); do \
		$(MAKE) \
			-f $(TOPDIR)/Makefile \
			-C $$dir \
			$*; \
	done
