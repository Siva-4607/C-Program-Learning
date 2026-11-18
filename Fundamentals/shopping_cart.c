/*
Design a progam that askes the user about:
    1. Name of the item
    2. Price of the item
    3. Quantity of purchase
Using these parameters the program will determine the total cost of purchase of that item.
*/

#include <stdio.h>
#include <string.h>

int main()
{
    float price, total_price;
    int qty;
    char name[30];

    // Getting item name from the user

    printf("Enter the name of the item: ");
    fgets(name, sizeof(name), stdin); // This function is used instead of scanf so that blank spaces can be included
    name [strlen(name) - 1] = '\0'; // We subtract the newline character from the string and assign it as the null terminator so that the code knows that the string ends here.

    // Getting the item price from the user

    printf("Enter the price of the item purchased: ");
    scanf("%f", &price);

    // Getting the quantity of the item purchased from the user

    printf("Enter the quantity of the item that you would like to purchase: ");
    scanf("%d", &qty);

    // Calculating the total price of the item purchased

    total_price = qty * price;

    // Displaying the results
    printf("You bought %d %s/s \n", qty, name);
    printf("The total price is: $%.2f", total_price);
}
/*
Null terminator: In C, a string is not a separate built-in data type. 
It is an array of characters that ends with a special character called the null terminator (\0).
Without \0, C wouldn't know where the string ends when functions such as printf("%s", name) process it.
There will be null terminator to mark the end of the string in every string but it is not counted.
*/