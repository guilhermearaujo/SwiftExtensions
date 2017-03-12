import Foundation

// Power
infix operator **
func **(lhs: CGFloat, rhs: CGFloat) -> CGFloat {
  return pow(lhs, rhs)
}

// Regex match
infix operator =~ : ComparisonPrecedence
func =~ (string: String, pattern: String) -> Bool {
  return string.range(of: pattern, options: .regularExpression) != nil
}

// Assign if nil
infix operator ||=
func ||=<T>(lhs: inout T?, rhs: T?) -> T? {
  lhs = lhs ?? rhs
  return lhs
}

// Degrees to Radians
postfix operator °
postfix func °(lhs: Decimal) -> Decimal {
  return lhs * Decimal.pi / 180
}
