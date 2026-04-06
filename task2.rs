use std::io::{self, Write};
use std::collections::HashSet;

fn main() {
    let mut input = String::new();
    print!("строкa с кольцами: ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut input).unwrap();
    let rings = input.trim();

    /*
    use std::fs::File;
    use std::io::BufRead;
    let fin = File::open("input.txt").unwrap();
    let reader = io::BufReader::new(fin);
    let rings = reader.lines().next().unwrap().unwrap();
    let mut fout = File::create("output.txt").unwrap();
    */

    let mut sterchen: [HashSet<char>; 10] = Default::default();
    let chars: Vec<char> = rings.chars().collect();
    for i in (0..chars.len()).step_by(2) {
        let color = chars[i];
        let sterchen_num = chars[i+1].to_digit(10).unwrap() as usize;
        sterchen[sterchen_num].insert(color);
    }

    let mut result = Vec::new();
    for i in 0..10 {
        if sterchen[i].contains(&'R') && sterchen[i].contains(&'G') && sterchen[i].contains(&'B') {
            result.push(i);
        }
    }

    print!("{}", result.len());
    for x in &result {
        print!(" {}", x);
    }
    println!();

    /*
    use std::io::Write;
    write!(fout, "{}", result.len()).unwrap();
    for x in &result {
        write!(fout, " {}", x).unwrap();
    }
    writeln!(fout).unwrap();
    */
}
