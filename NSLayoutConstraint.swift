import Foundation
import UIKit

extension NSLayoutConstraint {
  convenience init(item: Any, height: Int) {
    self.init(item: item,
              attribute: NSLayoutAttribute.height,
              relatedBy: NSLayoutRelation.equal,
              toItem: nil,
              attribute: NSLayoutAttribute.notAnAttribute,
              multiplier: 1.0,
              constant: CGFloat(height))
  }

  convenience init(item: Any, width: Int) {
    self.init(item: item,
              attribute: NSLayoutAttribute.width,
              relatedBy: NSLayoutRelation.equal,
              toItem: nil,
              attribute: NSLayoutAttribute.notAnAttribute,
              multiplier: 1.0,
              constant: CGFloat(width))
  }
}
