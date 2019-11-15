vpath %.c ./src
vpath %.h ./inc

CC = gcc_S
SRC_PATH = ./src/
LINK_TARGET = app.exe
INCLUDE_PATH = ./inc/
OBJ = main.o LCD.o DIO.o code.o
CLEAN_TARGET = $(LINK_TARGET) $(OBJ)



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
	-rm -rf *.o $(CLEAN_TARGET)
	echo Cleaning done !