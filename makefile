# If your application is in a file named myapp.cpp or myapp.c
# this is the line you will need to build the binary.

.PHONY = all clean

CC = gcc

LINKERFLAG = `pkg-config --cflags --libs libpjproject`

SRC_DIR = src
BIN_DIR = bin
WARNFLAGS = -Wall

#SRCS := $(SRC_DIR)/$(wildcard *.c)
SRCS := $(SRC_DIR)/*.c

#BINS := $(BIN_DIR)/$(SRCS:%.c=%)
BINS := $(BIN_DIR)/pj_caller

#DEPS := $(SRC_DIR)/$(wildcard *.h)
DEPS := $(SRC_DIR)/*.h

all: ${BINS}
#all: bin/pj_caller

#%: %.c $(DEPS) test.tmp
bin/pj_caller: ${SRCS} ${DEPS} test.tmp
	@echo "Checking.."
	${CC} -D PJ_AUTOCONF=1 ${CFLAGS} -o $@ $< ${LINKERFLAG}

#%.o: %.c
##pj_caller.o: pj_caller.c
#	@echo "Creating object.."
#	${CC} -c $<

clean:
	rm -rvf *.o ${BINS}
