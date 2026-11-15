#include <stdio.h>
int main()
{
	int age = 25;
	float price = 19.99;
	double pi = 3.145926535;
	char currency = '$';
	char name[] = "Sivapiriyan";
	
	printf("%d \n", age);
	printf("%f \n", price);
	printf("%lf \n", pi);
	printf("%c \n", currency);
	printf("%s \n", name);
}

/* They are special tokens that begin with the symbol % symbol, 
followed by a character that specifies the data type and 
optional modifiers (width, precision, flags). 
They control how data is displayed or interpreted.
*/