#include <iostream>
#include <cmath>

using namespace std;

long int largestPrimeFactor(long int n) 
{
    long int maxPrime = -1;

    while (n % 2 == 0) {
        maxPrime = 2;
        n /= 2;
    }

    for (long int i = 3; i <= sqrt(n); i += 2) 
    {
        while (n % i == 0) 
        {
            maxPrime = i;
            n /= i;
        }
    }

    if (n > 2)
    {
        maxPrime = n;
    }

    return maxPrime;
}

long long sumDiagonals(int size)
 {
    long long sum = 1;
    long long current = 1;

    for (int layer = 1; layer <= (size / 2); layer++) 
    {
        for (int corner = 0; corner < 4; corner++) 
        {
            current += layer * 2;
            sum += current;
        }
    }

    return sum;
}

int main() 
{
    const long int n = 600851475143;

    const int size = 1001;

    cout << largestPrimeFactor(n) << endl;
    cout << sumDiagonals(size) << endl;

    return 0;
}