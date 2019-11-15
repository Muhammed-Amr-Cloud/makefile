vpath %.c ./src
vpath %.h ./inc
CC = gcc
SRC_PATH = ./src/
LINK_TARGET = app.exe
INCLUDE_PATH = ./inc/
OBJ = main.o LCD.o DIO.o
CLEAN_TARGET = $(LINK_TARGET) $(OBJ)
all:$(LINK_TARGET)
	echo Building done !
clean:
	-rm $(CLEAN_TARGET)
	echo Cleaning done !
$(LINK_TARGET): $(OBJ) quiz.o
# name of the specified object file should be explicitly added here
	$(CC) $(OBJ) quiz.o -o $@
# and here also
	echo Linking done !
#%.o: %.c
main.o : main.c main.h LCD.h DIO.h code.h
	$(CC) -c -I$(INCLUDE_PATH) $< -o $@
LCD.o : LCD.c LCD.h DIO.h code.h 
	$(CC) -c -I$(INCLUDE_PATH) $< -o $@
DIO.o : DIO.c DIO.h code.h
	$(CC) -c -I$(INCLUDE_PATH) $< -o $@