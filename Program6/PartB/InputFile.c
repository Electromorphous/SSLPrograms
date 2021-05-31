/* This is a C program to add 2 numbers */
// we take 2 numbers as input and we expect the sum of those two numbers

#include <stdio.h>

int main() {
    int a, b, sum;                          // declaring variables
    printf("Enter 2 integers \n");          // display prompt
    scanf("%d%d", &a, &b);                  // take input
    sum = a + b;                            // calculate sum
    printf("The sum is %d \n", sum);        // display the sum
    return 0;
}
