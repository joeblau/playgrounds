// Key Obfuscation in Swift

// This project demonstrates how to obfuscate a key so that it's not easily visible by someone trying to decompiling or disassembling the binary

import Foundation

let clear: [UInt8] = [UInt8]("0e4f14a937fdba4de4279c72a3dc5344".data(using: .utf8)!)
let random: [UInt8] = (0..<clear.count).map { _ in UInt8(arc4random_uniform(256)) }
let obfuscatedRandom: [UInt8] = zip(clear, random).map(^)
print(obfuscatedRandom + random)

let obfuscated: [UInt8] = [6, 63, 192, 203, 122, 135, 237, 54, 174, 11, 206, 219, 162, 157, 253, 243, 53, 232, 59, 161, 175, 186, 240, 166, 105, 234, 53, 86, 181, 36, 42, 222, 54, 90, 244, 173, 75, 179, 140, 15, 157, 60, 168, 191, 192, 252, 201, 151, 80, 220, 9, 150, 150, 217, 199, 148, 8, 217, 81, 53, 128, 23, 30, 234]

extension Array where Element == UInt8 {
    var deobfuscate: [UInt8] {
        let a = prefix(count / 2)
        let b = suffix(count / 2)
        return zip(a, b).map(^)
    }
}

print(String(bytes: obfuscated.deobfuscate, encoding: .utf8)!)
