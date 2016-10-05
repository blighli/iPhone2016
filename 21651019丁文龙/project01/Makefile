.PHONY: all clean

CC=gcc
OBJ_DIR=./obj
HEADERS=-I.
DEBUG=-g -ggdb
WALL=-Wall -W
CFLAGS=$(WALL) $(DEBUG)
L_CC=$(CC) $(CFLAGS) $(HEADERS)

C_SRC=${wildcard *.c}
C_OBJ=$(patsubst %.c, $(OBJ_DIR)/%.o, $(C_SRC)) #目标文件
C_EXE=cal

all:prepare $(C_EXE)

prepare:
	@if [ ! -d $(OBJ_DIR)  ];then mkdir $(OBJ_DIR); fi

$(C_EXE):$(C_OBJ)
	$(L_CC) $^ -o $@

$(OBJ_DIR)/%.o:%.c
	$(L_CC) -c $< -o $@

clean:
	@-rm -f $(C_EXE)
	@-rm -rf $(OBJ_DIR)
