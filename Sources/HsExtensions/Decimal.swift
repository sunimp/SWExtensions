import Foundation

extension Decimal: IHsExtension {}

public extension HsExtension where Base == Decimal {

    var integerDigitCount: Int {
        var value = abs(base)
        var count = 1
        while value >= 10 {
            value /= 10
            count += 1
        }
        return count
    }

    var decimalCount: Int {
        max(-base.exponent, 0)
    }

    func significandDigits(fractionDigits: Int) -> Int {
        let integerDigits = base.significand.description.count + base.exponent
        return integerDigits + fractionDigits
    }

}
