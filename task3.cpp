#include <iostream> 
#include <fstream>
#include <vector>

using namespace std;

bool proverka(int x) {
    int sum = 0, proizv = 1;
    int n = x;
    while (n > 0) {
        int d = n % 10;
        sum += d;
        proizv *= d;
        n /= 10;
    }
    return proizv > sum;
}

int main() {
    int N;
    cout << "введите N: ";
    cin >> N;
    vector<int> ans;
    cout << "введите " << N << " чисел: ";
    for (int i = 0; i < N; ++i) {
        int x;
        cin >> x;
        if (proverka(x)) {
            ans.push_back(x);
        }
    }

    if (ans.empty()) {
        cout << "не найдено" << endl;
    } else {
        for (size_t i = 0; i < ans.size(); ++i) {
            cout << ans[i] << " ";
        }
        cout << endl;
    }

    /*
    ifstream fin("input.txt");
    ofstream fout("output.txt");
    int N;
    fin >> N;
    vector<int> ans;
    for (int i = 0; i < N; ++i) {
        int x;
        fin >> x;
        if (proverka(x)) ans.push_back(x);
    }
    if (ans.empty()) fout << "не найдено" << endl;
    else {
        for (int x : ans) fout << x << " ";
        fout << endl;
    }
    fin.close();
    fout.close();
    */

    return 0;
}
