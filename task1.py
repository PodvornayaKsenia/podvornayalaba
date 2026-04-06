def isPrime(x):
    if x < 2:
        return False
    for d in range(2, int(x ** 0.5) + 1):
        if x % d == 0:
            return False
    return True

def sumPrime(n):
    total = 0
    for d in range(2, int(n ** 0.5) + 1):
        if n % d == 0:
            if isPrime(d):
                total += d
            other = n // d
            if other != d and isPrime(other):
                total += other
    if total == 0:
        return n
    return total

N = int(input("Введите число: "))
print(f"Сумма простых делителей: {sumPrime(N)}")

"""
with open("input.txt", "r") as fin:
    N = int(fin.readline().strip())
with open("output.txt", "w") as fout:
    fout.write(str(sumPrime(N)) + "\n")
"""
