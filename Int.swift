import Foundation

extension Int {
  var factorial: Int {
    precondition(self >= 0, "number can't be negative")
    return self > 0 ? self * (self - 1).factorial : 1
  }

  func sumDigits() -> Int {
    var n = abs(self)
    var sum = 0

    while (n > 0) {
      sum += n % 10
      n = n / 10
    }

    return sum
  }

  func times(_ f: () -> Void) {
    precondition(self >= 0, "number can't be negative")
    for _ in 0..<self { f() }
  }
}
