import UIKit



let palindromeStr = "bab"
func test(value: String) -> String {
    for i in 0..<value.count {
        let index = value.index(value.startIndex, offsetBy: i)
        if value[index] != "a" {
            let startIndex = value.index(value.startIndex, offsetBy: i)
            let endIndex = value.index(value.endIndex, offsetBy: i)
            
            let prefix = value[startIndex...]
            let suffix = value.suffix(i+1)
            let result = prefix + "a" + suffix
            return String(result)
        }
    }
    return value
}

test(value: palindromeStr)
