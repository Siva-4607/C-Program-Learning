# C programming basics 

Freely available documentation of C: https://manual.cs50.io/ (simplified manual for C other than the original documentation)

## Header files:

Header files are the bunch of files who’s names end with “.h”. They contain the code that other people wrote that we can use in our own programs.

These header files gives access to generally what is termed in computing is called as a library.

<aside>
💡

A library is a code that someone else wrote that we can use

</aside>

For example,

Even if printf is a feature of C, in order to use it we have to include that library by telling the program to include the header file that defines the function, thus we write it as:

```python
#include<stdio.h> // Tells the compiler to include the library that defines the standard input output functions and thus we can use them in the code
```

stdio.h → Staandard input/output

```python
#include<stdio.h>
int main()
{
	printf("Hello world");
	return 0;
}
```

The statement return 0;  means that the main function is executed and the value 0 is returned the operating system.

0 indicates the successful execution of the code i.e the program is completed without reporting any error.

Therefore a non - zero value indicates some kind of problem or error.

In the older versions of C such as the C89/90 omitting the statement will lead to some kind of unidentified behavior. But later standards such as in C99 and later, the statement can be omitted but it is a good practice to include the statement for backward compatability.
