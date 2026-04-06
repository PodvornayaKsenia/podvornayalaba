#include <iostream>
#include <fstream>
#include <string>
#include <set>
#include <vector>

using namespace std;

int main() {
    string rings;
    cout << "строка с кольцами: ";
    cin >> rings;

    /*
    ifstream fin("input.txt");
    ofstream fout("output.txt");
    string rings;
    fin >> rings;
    */

    vector<set<char>> sterchen(10);

    for (size_t i = 0; i < rings.length(); i += 2) {
        char color = rings[i];
        int sterchen_num = rings[i+1] - '0';
        sterchen[sterchen_num].insert(color);
    }

    vector<int> result;
    for (int i = 0; i < 10; ++i) {
        if (sterchen[i].count('R') && sterchen[i].count('G') && sterchen[i].count('B')) {
            result.push_back(i);
        }
    }
    cout << result.size();
    for (int x : result) cout << " " << x;
    cout << endl;

    /*
    fout << result.size();
    for (int x : result) fout << " " << x;
    fout << endl;
    fin.close();
    fout.close();
    */

    return 0;
}
