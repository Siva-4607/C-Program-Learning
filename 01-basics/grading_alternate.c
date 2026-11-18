#include <stdio.h>
#include <string.h> // provides functions related to string operations

int main()
{
    int age;
    char grade;
    char name[30];

    // Getting input name form the user

    printf("Enter your name: ");
    fgets(name, sizeof(name), stdin);
    name [strlen(name) - 1] = "\0"; 
    
    /*
    Prevents the input buffer of the newline character and turns it into a null terminator
    and therefore the newline character is not carried to the next input value.
    thee above strlen is from a set of functions that can be accessed from string.h header function
    */

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
/* 
Some of the problem with using the scanf() function in getting the user value are:
- Input buffer where a newline character might be passed on to the next input statement
- The scanf function cannot or will not read any value after a blank space therefore we won't be able to enter values such
  as a string with a blank space in between "Siva Piriyan", here the function will only take value upto Siva and will leave everything out
Thus we use the fgets() statement to remove these problems.
fgets(name_of _variable, size, stdin/stdio)
getchar() function will deal with clearing newline character while using fgets.
*/