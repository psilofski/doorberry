# If your application is in a file named myapp.cpp or myapp.c
# this is the line you will need to build the binary.
CC = gcc
INC_DIR = StdCUtil
SRC_DIR = src
OBJ_DIR = Object
CFLAGS = -Wall
SRCS = $(SRC_DIR)/simple_pjsua.c
OBJS = $(OBJ_DIR)/simple_pjsua.o
DEPS = $(INC_DIR)/simple_pjsua.h

all: $(OBJS)

%.o: %.c $(DEPS)
	gcc -D SYSTEM_H="simple_pjsua.h" -D PJ_AUTOCONF=1 -o $@ $< `pkg-config $(CFLAGS) --libs libpjproject`

clean:
	rm -f *o all
