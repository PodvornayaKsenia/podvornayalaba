#include <iostream>
#include <fstream>
using namespace std;

bool isPrime(int x) {
    if (x < 2) return false;
    for (int d = 2; d * d <= x; d++) {
        if (x % d == 0) return false;
    }
    return true;
}

int sumPrime(int n) {
    int sum = 0;
    for (int d = 2; d * d <= n; d++) {
        if (n % d == 0) {
            if (isPrime(d)) sum += d;
            int other = n / d;
            if (other != d && isPrime(other)) sum += other;
        }
    }
    
    if (sum == 0) return n;  
    else return sum;           
}
       

int main() {
    /*
    ifstream fin("input.txt");
    ofstream fout("output.txt");
    int N;
    fin >> N;
    fout << sumPrime(N) << endl;
    fin.close();
    fout.close();
    */
    
    int N;
    cout << "Введите число: ";
    cin >> N;
    cout << "Сумма простых делителей: " << sumPrime(N) << endl;
    
    return 0;
}
