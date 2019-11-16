vpath %.c ./src
vpath %.h ./inc
vpath %.d ./depend
CC = gcc_S
SRC_PATH = ./src/
LINK_TARGET = app.exe
INCLUDE_PATH = ./inc/
dep = main.d LCD.d DIO.d code.d
SRCS = main.c LCD.c DIO.c code.c
OBJ = main.o LCD.o DIO.o code.o
dependancy = ./depend/

CLEAN_TARGET = $(LINK_TARGET) $(OBJ)



all: $(LINK_TARGET)
	echo Building done !
$(LINK_TARGET): $(OBJ) $(dep)
	$(CC) -MM -I$(INCLUDE_PATH) $< -o $(dependancy)$@
	$(CC) $(OBJ) -o  $@ 
	echo Linking done !


%.d:%.c
	$(CC) -MM -I$(INCLUDE_PATH) $< -o $(dependancy)$@ 
	
	
DDEPFILES := $(SRCS:.c=.d)
$(DEPFILES):
include $(wildcard $(DEPFILES))
	
%.o:%.c
	$(CC) -c -I$(INCLUDE_PATH) $< -o $@
	
%.asm:%.c	
	$(CC) -S -I$(INCLUDE_PATH) $< -o $@
	
%.i:%.c
	$(CC) -E -I$(INCLUDE_PATH) $< -o $@
	
		
.PHONY: clean	
clean:
	-rm -rf *.o $(CLEAN_TARGET)
	-rm $(dependancy)*.d
	echo Cleaning done !