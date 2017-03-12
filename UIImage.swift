import Foundation
import UIKit

extension UIImage {
  convenience init(fromColor color: UIColor, rect: CGRect) {
    UIGraphicsBeginImageContextWithOptions(rect.size, true, 1.0)

    color.setFill()
    UIRectFill(rect)

    self.init(cgImage: UIGraphicsGetImageFromCurrentImageContext()!.cgImage!)

    UIGraphicsEndImageContext()
  }
}
