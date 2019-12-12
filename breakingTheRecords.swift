import Foundation

// Complete the breakingRecords function below.
func breakingRecords(scores: [Int]) -> [Int] {
    var highestScore = scores[0],lowestScore = scores[0]
    var highCounter = 0 , lowCounter = 0
    var resultArray : [Int] = []
    for index in 0...scores.count - 1 {
        if scores[index] < lowestScore {
            lowestScore = scores[index]
            lowCounter += 1
        }else if scores[index] > highestScore {
            highestScore = scores[index]
            highCounter += 1
        }
    }
    resultArray.append(highCounter)
    resultArray.append(lowCounter)

    return resultArray
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let scoresTemp = readLine() else { fatalError("Bad input") }
let scores: [Int] = scoresTemp.split(separator: " ").map {
    if let scoresItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return scoresItem
    } else { fatalError("Bad input") }
}

guard scores.count == n else { fatalError("Bad input") }

let result = breakingRecords(scores: scores)

fileHandle.write(result.map{ String($0) }.joined(separator: " ").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
