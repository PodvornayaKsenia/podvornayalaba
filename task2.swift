import Foundation

print("строкa с кольцами: ", terminator: "")
let rings = readLine() ?? ""

/*
let input = try! String(contentsOfFile: "input.txt", encoding: .utf8).trimmingCharacters(in: .whitespacesAndNewlines)
let rings = input
let output = FileHandle(forWritingAtPath: "output.txt")!
*/

var sterchen = Array(repeating: Set<Character>(), count: 10)
let chars = Array(rings)

for i in stride(from: 0, to: chars.count, by: 2) {
    let color = chars[i]
    let sterchen_num = Int(String(chars[i+1]))!
    sterchen[sterchen_num].insert(color)
}

var result = [Int]()
for i in 0..<10 {
    if sterchen[i].contains("R") && sterchen[i].contains("G") && sterchen[i].contains("B") {
        result.append(i)
    }
}

let outputStr = "\(result.count)" + result.map { " \($0)" }.joined()
print(outputStr)

/*
output.write((outputStr + "\n").data(using: .utf8)!)
*/
