import Foundation
import UIKit

extension UIColor {
  convenience init(hexString: String, alpha: CGFloat = 1.0) {
    let string = hexString.hasPrefix("#") ? String(hexString.characters.dropFirst()) : hexString

    var color: UInt32 = 0
    Scanner(string: string).scanHexInt32(&color)

    self.init(hex: Int(color), alpha: alpha)
  }

  convenience init(hex: Int, alpha: CGFloat = 1.0) {
    let red   = CGFloat((hex & 0xFF0000) >> 16) / 255.0
    let green = CGFloat((hex & 0x00FF00) >>  8) / 255.0
    let blue  = CGFloat( hex & 0x0000FF)        / 255.0

    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }

  func darken(percentage: CGFloat = 0.8) -> UIColor {
    var hue: CGFloat = 0
    var sat: CGFloat = 0
    var bri: CGFloat = 0
    var alpha: CGFloat = 0

    getHue(&hue, saturation: &sat, brightness: &bri, alpha: &alpha)

    return UIColor(hue: hue,
                   saturation: sat,
                   brightness: (bri * percentage).clamped(to: 0...1),
                   alpha: alpha)
  }

  func lighten(percentage: CGFloat = 0.2) -> UIColor {
    return darken(percentage: 1.0 + percentage)
  }
}
