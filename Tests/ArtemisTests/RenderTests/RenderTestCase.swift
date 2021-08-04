import Foundation

protocol RenderTestCase {
    // The type the render test is testing that we can select (e.g. Int, Float, TestObject)
    associatedtype SelectionType
    // The type the render test is selecting on (e.g. Interface1, TestObject)
    associatedtype SelectionBase
}
