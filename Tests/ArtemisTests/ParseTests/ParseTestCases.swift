import Foundation
import XCTest

protocol ParseTestCase {
    // The type the render test is testing that we can select (e.g. Int, Float, TestObject)
    associatedtype SelectionType
    // The type the render test is selecting on (e.g. Interface1, TestObject)
    associatedtype SelectionBase
}

// MARK: - On TestObject

final class TestObject_String_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestObject
    typealias SelectionType = String
}

final class TestObject_Int_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestObject
    typealias SelectionType = Int
}

final class TestObject_Bool_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestObject
    typealias SelectionType = Bool
}

final class TestObject_Float_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestObject
    typealias SelectionType = Float
}

final class TestObject_Double_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestObject
    typealias SelectionType = Double
}

final class TestObject_TestObject_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestObject
    typealias SelectionType = TestObject
}

final class TestObject_TestEnum_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestObject
    typealias SelectionType = TestEnum
}

// MARK: - On TestInterface1

final class TestInterface1_String_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface1
    typealias SelectionType = String
}

final class TestInterface1_Int_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface1
    typealias SelectionType = Int
}

final class TestInterface1_Bool_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface1
    typealias SelectionType = Bool
}

final class TestInterface1_Float_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface1
    typealias SelectionType = Float
}

final class TestInterface1_Double_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface1
    typealias SelectionType = Double
}

final class TestInterface1_TestObject_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface1
    typealias SelectionType = TestObject
}

final class TestInterface1_TestEnum_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface1
    typealias SelectionType = TestEnum
}

// MARK: - On TestInterface2

final class TestInterface2_String_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface2
    typealias SelectionType = String
}

final class TestInterface2_Int_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface2
    typealias SelectionType = Int
}

final class TestInterface2_Bool_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface2
    typealias SelectionType = Bool
}

final class TestInterface2_Float_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface2
    typealias SelectionType = Float
}

final class TestInterface2_Double_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface2
    typealias SelectionType = Double
}

final class TestInterface2_TestObject_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface2
    typealias SelectionType = TestObject
}

final class TestInterface2_TestEnum_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface2
    typealias SelectionType = TestEnum
}

// MARK: - On TestInterface3

final class TestInterface3_String_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface3
    typealias SelectionType = String
}

final class TestInterface3_Int_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface3
    typealias SelectionType = Int
}

final class TestInterface3_Bool_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface3
    typealias SelectionType = Bool
}

final class TestInterface3_Float_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface3
    typealias SelectionType = Float
}

final class TestInterface3_Double_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface3
    typealias SelectionType = Double
}

final class TestInterface3_TestObject_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface3
    typealias SelectionType = TestObject
}

final class TestInterface3_TestEnum_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface3
    typealias SelectionType = TestEnum
}

// MARK: - On TestInterface4

final class TestInterface4_String_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface4
    typealias SelectionType = String
}

final class TestInterface4_Int_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface4
    typealias SelectionType = Int
}

final class TestInterface4_Bool_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface4
    typealias SelectionType = Bool
}

final class TestInterface4_Float_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface4
    typealias SelectionType = Float
}

final class TestInterface4_Double_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface4
    typealias SelectionType = Double
}

final class TestInterface4_TestObject_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface4
    typealias SelectionType = TestObject
}

final class TestInterface4_TestEnum_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface4
    typealias SelectionType = TestEnum
}

// MARK: - On TestInterface5

final class TestInterface5_String_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface5
    typealias SelectionType = String
}

final class TestInterface5_Int_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface5
    typealias SelectionType = Int
}

final class TestInterface5_Bool_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface5
    typealias SelectionType = Bool
}

final class TestInterface5_Float_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface5
    typealias SelectionType = Float
}

final class TestInterface5_Double_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface5
    typealias SelectionType = Double
}

final class TestInterface5_TestObject_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface5
    typealias SelectionType = TestObject
}

final class TestInterface5_TestEnum_ParseTests: XCTestCase, ParseTestCase {
    typealias SelectionBase = TestInterface5
    typealias SelectionType = TestEnum
}
