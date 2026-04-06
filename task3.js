const fs = require('fs');
const readline = require('readline');

function proverka(x) {
    let sum = 0, proizv = 1;
    let n = Math.abs(x);
    while (n > 0) {
        let d = n % 10;
        sum += d;
        proizv *= d;
        n = Math.floor(n / 10);
    }
    return proizv > sum;
}

function main() {
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });
    let lines = [];
    rl.on('line', line => lines.push(line.trim()));
    rl.on('close', () => {
        const N = parseInt(lines[0]);
        const numbers = lines.slice(1, 1 + N).map(Number);
        const ans = numbers.filter(x => proverka(x));
        if (ans.length === 0) {
            console.log("не найдено");
        } else {
            console.log(ans.join(' '));
        }
    });

    /*
    const input = fs.readFileSync('input.txt', 'utf8').trim().split(/\s+/);
    const N = parseInt(input[0]);
    const numbers = input.slice(1, 1 + N).map(Number);
    const ans = numbers.filter(x => proverka(x));
    const output = ans.length === 0 ? 'не найдено' : ans.join(' ');
    fs.writeFileSync('output.txt', output + '\n');
    */
}

main();
