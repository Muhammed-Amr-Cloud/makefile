#include "code.h"

#define ZERO 0
#define ONE 1
#define TRUE 1
#define FALSE 0
#define ARRAY_SIZE  7

typedef signed char sint8;

static sint8 CompareWords(sint8* firstWord , sint8* secondWord){
    sint8 returnValue=FALSE;
    if(*firstWord == *secondWord){
        returnValue=TRUE;
    }
    return returnValue;
}

void printMessage(void){
    sint8 counter=ZERO;
    sint8 arr[ARRAY_SIZE];
    sint8* Word="amazon";

    printf("            ===============================================================\n");
    printf("            |                        GuessTheWord                         |\n");
    printf("            |                            Game                             |\n");
    printf("            ===============================================================\n\n");

    printf("Description : the wanted word consists of 6 letters. Its' the name of one of the longest rivers in the world\n");

    while(ONE){
        printf("please Enter the Wanted Word : ");
        scanf("%s" , arr);
        getchar();
        while(counter<6){
            if(!CompareWords(&arr[counter] ,&Word[counter])){
                break;
            }
            counter++;
        }
        if(counter==6){
            printf("\nCorrect ... CONGRATULATION!!\n");
            break;
        }else{
            printf("\nWrong answer ... Try again!!\n");
        }
    }
    while(1){

    }
}
