NAME = libbasti
BUILDDIR = ./build
DISTDIR = ./bin
CFLAGS = -O2 -Wall -Wextra
LIBS =

all: main test

clean:
	rm -rf $(BUILDDIR)
	rm -rf $(DISTDIR)

makedirs:
	mkdir -p $(BUILDDIR)
	mkdir -p $(DISTDIR)

rebuild: clean all

compile-lib: makedirs
	$(CC) $(CFLAGS) -c $(NAME).c -o $(BUILDDIR)/$(NAME).o

compile-test: makedirs
	$(CC) $(CFLAGS) -c test.c -o $(BUILDDIR)/test.o

compile-main: makedirs
	$(CC) $(CFLAGS) -c main.c -o $(BUILDDIR)/main.o

test: compile-lib compile-test
	$(CC) $(CFLAGS) $(LIBS) -o $(DISTDIR)/$(NAME)-test \
	$(BUILDDIR)/$(NAME).o $(BUILDDIR)/test.o

main: compile-lib compile-main
	$(CC) $(CFLAGS) $(LIBS) -o $(DISTDIR)/$(NAME)-main \
	$(BUILDDIR)/$(NAME).o $(BUILDDIR)/main.o
