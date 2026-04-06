import java.io.*;
import java.util.*;

public class Task1 {
    public static boolean isPrime(int x) {
        if (x < 2) return false;
        for (int d = 2; d * d <= x; d++) {
            if (x % d == 0) return false;
        }
        return true;
    }

    public static int sumPrime(int n) {
        int sum = 0;
        for (int d = 2; d * d <= n; d++) {
            if (n % d == 0) {
                if (isPrime(d)) sum += d;
                int other = n / d;
                if (other != d && isPrime(other)) sum += other;
            }
        }
        if (sum == 0) return n;
        return sum;
    }

    public static void main(String[] args) throws IOException {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Введите число: ");
        int N = scanner.nextInt();
        System.out.println("Сумма простых делителей: " + sumPrime(N));
        scanner.close();

        /*
        BufferedReader fin = new BufferedReader(new FileReader("input.txt"));
        PrintWriter fout = new PrintWriter(new FileWriter("output.txt"));
        int N = Integer.parseInt(fin.readLine().trim());
        fout.println(sumPrime(N));
        fin.close();
        fout.close();
        */
    }
}
