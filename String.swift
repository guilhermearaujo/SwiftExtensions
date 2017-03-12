import Foundation
import UIKit

extension String {
  init? (base64: String) {
    let base64Padded = base64 + "=".repeat(base64.length % 4)

    guard let decodedData = Data(base64Encoded: base64Padded, options: .ignoreUnknownCharacters),
      let decodedString = String(data: decodedData, encoding: .utf8) else {
        return nil
    }

    self.init(decodedString)
  }

  var base64: String {
    return data(using: .utf8)!.base64EncodedString()
  }

  var length: Int {
    return self.characters.count
  }

  func `repeat`(_ n: Int) -> String {
    precondition(n >= 0, "n can't be a negative integer")

    return (0..<n).reduce("") { $0.0 + self }
  }

  var reversed: String {
    return String(self.characters.reversed())
  }

  subscript(pos: Int) -> String? {
    get {
      return self[pos...pos]
    }
  }

  subscript(range: CountableRange<Int>) -> String? {
    get {
      return self[range.lowerBound...(range.upperBound - 1)]
    }
  }

  subscript(range: CountableClosedRange<Int>) -> String? {
    get {
      let start: Index?
      if range.lowerBound < 0 {
        start = index(endIndex,
                      offsetBy: range.lowerBound,
                      limitedBy: startIndex)
      } else {
        start = index(startIndex,
                      offsetBy: range.lowerBound,
                      limitedBy: endIndex)
      }

      if start == nil { return nil }

      let end: Index?
      if range.upperBound < 0 {
        end = index(endIndex,
                    offsetBy: range.upperBound + 1,
                    limitedBy: startIndex)
      } else {
        end = index(startIndex,
                    offsetBy: range.upperBound + 1,
                    limitedBy: endIndex)
      }

      if end == nil { return nil }

      return self[start!..<end!]
    }
  }
}
