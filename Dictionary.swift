import Foundation

extension Dictionary {
  func hasKey(_ key: Key) -> Bool {
    return self.keys.contains(key)
  }
}
