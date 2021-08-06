// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of TestObject and [TestObject] render as expected

extension TestInterface3_TestObject_RenderTests {
    func testSingleRender() {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i3_testObject { $0.int }
        }
        XCTAssertEqual(query.render(), "{i3_testObject{int}}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i3_testObjectArgs(arguments: .testDefault) { $0.int }
        }
        XCTAssertEqual(query.render(), "{i3_testObjectArgs\(testArgs){int}}")
    }

    func testArrayRender() {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i3_testObjects { $0.int }
        }
        XCTAssertEqual(query.render(), "{i3_testObjects{int}}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i3_testObjectsArgs(arguments: .testDefault) { $0.int }
        }
        XCTAssertEqual(query.render(), "{i3_testObjectsArgs\(testArgs){int}}")
    }
}

// MARK: - Tests to ensure single selections of TestObject and [TestObject] with aliases render as expected

extension TestInterface3_TestObject_RenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i3_testObject(alias: "alias") { $0.int }
        }
        XCTAssertEqual(query.render(), "{alias:i3_testObject{int}}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i3_testObjectArgs(alias: "alias", arguments: .testDefault) { $0.int }
        }
        XCTAssertEqual(query.render(), "{alias:i3_testObjectArgs\(testArgs){int}}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i3_testObjects(alias: "alias") { $0.int }
        }
        XCTAssertEqual(query.render(), "{alias:i3_testObjects{int}}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i3_testObjectsArgs(alias: "alias", arguments: .testDefault) { $0.int }
        }
        XCTAssertEqual(query.render(), "{alias:i3_testObjectsArgs\(testArgs){int}}")
    }
}

// MARK: - Tests to ensure multiple sibling selections of TestObject and [TestObject] render as expected

extension TestInterface3_TestObject_RenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Query, (SelectionType.Result, SelectionType.Result)> = .query {
            $0.i3_testObject { $0.int }
            $0.i3_testObject { $0.int }
        }
        XCTAssertEqual(query.render(), "{i3_testObject{int},i3_testObject{int}}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Query, (SelectionType.Result, SelectionType.Result)> = .query {
            $0.i3_testObjectArgs(arguments: .testDefault) { $0.int }
            $0.i3_testObjectArgs(arguments: .testDefault) { $0.int }
        }
        XCTAssertEqual(query.render(), "{i3_testObjectArgs\(testArgs){int},i3_testObjectArgs\(testArgs){int}}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Query, ([SelectionType.Result], [SelectionType.Result])> = .query {
            $0.i3_testObjects { $0.int }
            $0.i3_testObjects { $0.int }
        }
        XCTAssertEqual(query.render(), "{i3_testObjects{int},i3_testObjects{int}}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Query, ([SelectionType.Result], [SelectionType.Result])> = .query {
            $0.i3_testObjectsArgs(arguments: .testDefault) { $0.int }
            $0.i3_testObjectsArgs(arguments: .testDefault) { $0.int }
        }
        XCTAssertEqual(query.render(), "{i3_testObjectsArgs\(testArgs){int},i3_testObjectsArgs\(testArgs){int}}")
    }
}

// MARK: - Tests to ensure selections render as expected on selections of TestObject and [TestObject]

extension TestInterface3_TestObject_RenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_testObject { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i3_testObject{int}}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_testObjectArgs(arguments: .testDefault) { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i3_testObjectArgs\(testArgs){int}}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_testObjects { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i3_testObjects{int}}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_testObjectsArgs(arguments: .testDefault) { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i3_testObjectsArgs\(testArgs){int}}}")
    }
}

// MARK: - Tests to ensure TestObject and [TestObject] can be selected on a sub-selection of Object

extension TestInterface3_TestObject_RenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_testObject { $0.int }
                $0.i3_testObject { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i3_testObject{int},i3_testObject{int}}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_testObjectArgs(arguments: .testDefault) { $0.int }
                $0.i3_testObjectArgs(arguments: .testDefault) { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i3_testObjectArgs\(testArgs){int},i3_testObjectArgs\(testArgs){int}}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_testObjects { $0.int }
                $0.i3_testObjects { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i3_testObjects{int},i3_testObjects{int}}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_testObjectsArgs(arguments: .testDefault) { $0.int }
                $0.i3_testObjectsArgs(arguments: .testDefault) { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i3_testObjectsArgs\(testArgs){int},i3_testObjectsArgs\(testArgs){int}}}")
    }
}

// MARK: - Tests to ensure fragments on Query selecting TestObject and [TestObject] can be used at the top level of an operation

extension TestInterface3_TestObject_RenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_testObject { $0.int }
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i3_testObject{int}}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_testObjectArgs(arguments: .testDefault) { $0.int }
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i3_testObjectArgs\(testArgs){int}}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_testObjects { $0.int }
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i3_testObjects{int}}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_testObjectsArgs(arguments: .testDefault) { $0.int }
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i3_testObjectsArgs\(testArgs){int}}")
    }
}

// MARK: - Tests to ensure fragments on TestObject can be used on selections of TestObject or [TestObject]

extension TestInterface3_TestObject_RenderTests {
    func testSingleOnObjectFragmentRender() {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.int
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i3_testObject {
                fragment
            }
        }
        XCTAssertEqual(query.render(), "{i3_testObject{...fragName}},fragment fragName on TestObject{int}")
    }

    func testSingleArgsOnObjectFragmentRender() {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.int
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i3_testObjects {
                fragment
            }
        }
        XCTAssertEqual(query.render(), "{i3_testObjects{...fragName}},fragment fragName on TestObject{int}")
    }

    func testArrayOnObjectFragmentRender() {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.int
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i3_testObjectArgs(arguments: .testDefault) {
                fragment
            }
        }
        XCTAssertEqual(query.render(), "{i3_testObjectArgs\(testArgs){...fragName}},fragment fragName on TestObject{int}")
    }

    func testArrayArgsOnObjectFragmentRender() {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.int
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i3_testObjectsArgs(arguments: .testDefault) {
                fragment
            }
        }
        XCTAssertEqual(query.render(), "{i3_testObjectsArgs\(testArgs){...fragName}},fragment fragName on TestObject{int}")
    }
}
