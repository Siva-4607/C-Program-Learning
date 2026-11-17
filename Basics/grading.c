#include <stdio.h>

int main()
{
    int age;
    char grade;
    char name[30];

    // Getting input name form the user

    printf("Enter your name: ");
    scanf("%s", &name);

    // Getting input age form the user
    
    printf("Enter your age: ");
    scanf("%d", &age);
    
    // Getting input grade from the user

    printf("Enter your grade(A/B/C): ");
    scanf(" %c", &grade);
    
    // Printing all those values into the output
    
    printf("Name: %s\n", name);
    printf("Age: %d \n", age);
    printf("Grade: %c \n", grade);
    
    return 0;
}