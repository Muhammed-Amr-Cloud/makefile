vpath %.c ./src
vpath %.h ./inc

CC = gcc_S
SRC_PATH = ./src/
LINK_TARGET = app.exe
INCLUDE_PATH = ./inc/
SRCS = main.c LCD.c DIO.c code.c
OBJ = main.o LCD.o DIO.o code.o
CLEAN_TARGET = $(LINK_TARGET) $(OBJ)

%.o : %.c
	@$(MAKEDEPEND)
	$(COMPILE.c) -o $@ $<

include $(wildcard $(SRCS:.c=.d))


all: $(LINK_TARGET)
	echo Building done !
$(LINK_TARGET): $(OBJ)

	$(CC) $(OBJ) -o $@
	echo Linking done !
	
%.o:%.c
	$(CC) -c -I$(INCLUDE_PATH) $< -o $@
	
%.asm:%.c	
	$(CC) -S -I$(INCLUDE_PATH) $< -o $@
	
%.i:%.c
	$(CC) -E -I$(INCLUDE_PATH) $< -o $@
	
%.d:%.c
	$(CC) -MM -I$(INCLUDE_PATH) $< -o $@
		
.PHONY: clean	
clean:
	-rm -rf *.o *.d $(CLEAN_TARGET)
	echo Cleaning done !