use std::io::{self, Write};

fn proverka(mut x: u64) -> bool {
    let mut sum = 0;
    let mut proizv = 1;
    while x > 0 {
        let d = x % 10;
        sum += d;
        proizv *= d;
        x /= 10;
    }
    proizv > sum
}

fn main() {
    let mut input = String::new();
    print!("введите N: ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input).unwrap();
    let n: usize = input.trim().parse().unwrap();

    let mut ans = Vec::new();
    println!("введите N чисел:", n);
    for _ in 0..n {
        input.clear();
        io::stdin().read_line(&mut input).unwrap();
        let x: u64 = input.trim().parse().unwrap();
        if proverka(x) {
            ans.push(x);
        }
    }

    if ans.is_empty() {
        println!("не найдено");
    } else {
        for x in ans {
            print!("{} ", x);
        }
        println!();
    }

    /*
    use std::fs::File;
    use std::io::BufRead;
    let fin = File::open("input.txt").unwrap();
    let reader = io::BufReader::new(fin);
    let mut lines = reader.lines();
    let n: usize = lines.next().unwrap().unwrap().trim().parse().unwrap();
    let mut ans = Vec::new();
    for _ in 0..n {
        let x: u64 = lines.next().unwrap().unwrap().trim().parse().unwrap();
        if proverka(x) {
            ans.push(x);
        }
    }
    let mut fout = File::create("output.txt").unwrap();
    if ans.is_empty() {
        writeln!(fout, "не найдено").unwrap();
    } else {
        for x in ans {
            write!(fout, "{} ", x).unwrap();
        }
        writeln!(fout).unwrap();
    }
    */
}
