NAME = libbasti
BUILDDIR = ./build
DISTDIR = ./bin
CFLAGS = -O2 -Wall -Wextra
CFLAGS_GLIB2 = $(CFLAGS) $(shell pkg-config --cflags glib-2.0)
LIBS = -lglib-2.0

all: main test

clean:
	rm -rf $(BUILDDIR)
	rm -rf $(DISTDIR)
	rm -f *.stackdump

makedirs:
	mkdir -p $(BUILDDIR)
	mkdir -p $(DISTDIR)

rebuild: clean all

compile-lib: makedirs
	$(CC) $(CFLAGS_GLIB2) -c $(NAME).c -o $(BUILDDIR)/$(NAME).o

compile-test: makedirs
	$(CC) $(CFLAGS_GLIB2) -c test.c -o $(BUILDDIR)/test.o

compile-main: makedirs
	$(CC) $(CFLAGS_GLIB2) -c main.c -o $(BUILDDIR)/main.o

test: compile-lib compile-test
	$(CC) $(CFLAGS) $(LIBS) -o $(DISTDIR)/$(NAME)-test \
	$(BUILDDIR)/$(NAME).o $(BUILDDIR)/test.o

main: compile-lib compile-main
	$(CC) $(CFLAGS) $(LIBS) -o $(DISTDIR)/$(NAME)-main \
	$(BUILDDIR)/$(NAME).o $(BUILDDIR)/main.o
