#include <stdio.h>

int main()
{
    int age;
    char grade;
    char name[30];
    printf("Enter your name: ");
    scanf("%s", &name);
    printf("Enter your age: ");
    scanf("%d", &age);
    printf("Enter your grade(A/B/C): ");
    scanf(" %c", &grade);
    printf("Name: %s\n", name);
    printf("Age: %d \n", age);
    printf("Grade: %c \n", grade);
    
    return 0;
}