import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        self.indices.contains(index) ? self[index] : nil
    }
}
