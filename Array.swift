import Foundation

extension Array {
  func any(_ f: (Element) -> Bool) -> Bool {
    for e in self {
      if f(e) { return true }
    }
    return false
  }

  func all(_ f: (Element) -> Bool) -> Bool {
    for e in self {
      if !f(e) { return false }
    }
    return true
  }

  func last(where f: (Element) -> Bool) -> Element? {
    return reversed().first(where: f)
  }

  func count(_ f: @escaping (Element) -> Bool) -> Int {
    return reduce(0) { r, e in f(e) ? r + 1 : r }
  }

  mutating func appendAll(_ items: [Element]) {
    items.forEach { append($0) }
  }
}

extension Array where Element: Equatable {
  func contains(_ e: Element) -> Bool {
    return any { $0 == e }
  }

  func unique() -> [Element] {
    return reduce([]) { (a, item) in
      a.contains(item) ? a : a + [item]
    }
  }
}
