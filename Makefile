##Simple make file for the appilication
 
CC := g++ # This is the main compiler
SRCDIR := src
BUILDDIR := build
TARGET := bin/grit
 
SRCEXT := cpp
SOURCES := $(shell find $(SRCDIR) -type f -name *.$(SRCEXT))
OBJECTS := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.o))
CFLAGS := -g # -Wall
LIB :=
INC :=
PREFIX := /usr/local
DESTDIR :=
$(TARGET): $(OBJECTS)
	@echo " Linking..."
	@echo " $(CC) $^ -o $(TARGET) $(LIB)"; $(CC) $^ -o $(TARGET) $(LIB)

$(BUILDDIR)/%.o: $(SRCDIR)/%.$(SRCEXT)
	@mkdir -p $(BUILDDIR)
	@echo " $(CC) $(CFLAGS) $(INC) -c -o $@ $<"; $(CC) $(CFLAGS) $(INC) -c -o $@ $<

clean:
	@echo " Cleaning..."
	@echo " $(RM) -r $(BUILDDIR) $(TARGET)"; $(RM) -r $(BUILDDIR) $(TARGET)

uninstall:
	@echo "uninstalling..."
	@echo "rm -f $(DESTDIR)$(PREFIX)/$(TARGET)"; rm -f $(DESTDIR)$(PREFIX)/$(TARGET)

install: $(TARGET)
	@echo "installing..."
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp $< $(DESTDIR)$(PREFIX)/bin/

.PHONY: clean
.PHONY: install
.PHONY: uninstall

