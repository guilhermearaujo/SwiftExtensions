import Foundation

extension EnumeratedSequence {
  typealias NextPartial<T> = (T, Int, Base.Iterator.Element) -> T

  func reduceWithIndex<Result>(_ initialResult: Result, nextPartialResult: NextPartial<Result>) -> Result {
    return reduce(initialResult, { (result, item: (index: Int, element: Base.Iterator.Element)) in
      nextPartialResult(result, item.index, item.element)
    })
  }
}
