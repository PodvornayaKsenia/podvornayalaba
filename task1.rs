use std::io::{self, Write};

fn isPrime(x: u64) -> bool {
    if x < 2 {
        return false;
    }
    for d in 2..=(x as f64).sqrt() as u64 {
        if x % d == 0 {
            return false;
        }
    }
    true
}

fn sumPrime(n: u64) -> u64 {
    let mut sum = 0;
    let limit = (n as f64).sqrt() as u64;
    for d in 2..=limit {
        if n % d == 0 {
            if isPrime(d) {
                sum += d;
            }
            let other = n / d;
            if other != d && isPrime(other) {
                sum += other;
            }
        }
    }
    if sum == 0 {
        n
    } else {
        sum
    }
}

fn main() {
    /*
    use std::fs::File;
    use std::io::{BufRead, BufReader, Write};
    let fin = File::open("input.txt").unwrap();
    let reader = BufReader::new(fin);
    let n: u64 = reader.lines().next().unwrap().unwrap().trim().parse().unwrap();
    let mut fout = File::create("output.txt").unwrap();
    writeln!(fout, "{}", sumPrime(n)).unwrap();
    */

    let mut input = String::new();
    print!("Введите число: ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input).unwrap();
    let n: u64 = input.trim().parse().unwrap();
    println!("Сумма простых делителей: {}", sumPrime(n));
}
