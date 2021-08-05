// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of TestEnum and [TestEnum] render as expected

extension TestObject_TestEnum_RenderTests {
    func testSingleRender() {
        let query: _Operation<Query, TestEnum.Result> = .query {
            $0.testEnum 
        }
        XCTAssertEqual(query.render(), "{testEnum}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Query, TestEnum.Result> = .query {
            $0.testEnumArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{testEnumArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Query, [TestEnum.Result]> = .query {
            $0.testEnums 
        }
        XCTAssertEqual(query.render(), "{testEnums}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Query, [TestEnum.Result]> = .query {
            $0.testEnumsArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{testEnumsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure single selections of TestEnum and [TestEnum] with aliases render as expected

extension TestObject_TestEnum_RenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Query, TestEnum.Result> = .query {
            $0.testEnum(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:testEnum}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Query, TestEnum.Result> = .query {
            $0.testEnumArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:testEnumArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Query, [TestEnum.Result]> = .query {
            $0.testEnums(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:testEnums}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Query, [TestEnum.Result]> = .query {
            $0.testEnumsArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:testEnumsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure multiple sibling selections of TestEnum and [TestEnum] render as expected

extension TestObject_TestEnum_RenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Query, (TestEnum.Result, TestEnum.Result)> = .query {
            $0.testEnum 
            $0.testEnum 
        }
        XCTAssertEqual(query.render(), "{testEnum,testEnum}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Query, (TestEnum.Result, TestEnum.Result)> = .query {
            $0.testEnumArgs(arguments: .testDefault) 
            $0.testEnumArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{testEnumArgs\(testArgs),testEnumArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Query, ([TestEnum.Result], [TestEnum.Result])> = .query {
            $0.testEnums 
            $0.testEnums 
        }
        XCTAssertEqual(query.render(), "{testEnums,testEnums}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Query, ([TestEnum.Result], [TestEnum.Result])> = .query {
            $0.testEnumsArgs(arguments: .testDefault) 
            $0.testEnumsArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{testEnumsArgs\(testArgs),testEnumsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure selections render as expected on selections of TestEnum and [TestEnum]

extension TestObject_TestEnum_RenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.testEnum 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{testEnum}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.testEnumArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{testEnumArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.testEnums 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{testEnums}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.testEnumsArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{testEnumsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure aliases render as expected on sub-selections of TestEnum and [TestEnum]

extension TestObject_TestEnum_RenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.testEnum(alias: "alias") 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{alias:testEnum}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.testEnumArgs(alias: "alias", arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{alias:testEnumArgs\(testArgs)}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.testEnums(alias: "alias") 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{alias:testEnums}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.testEnumsArgs(alias: "alias", arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{alias:testEnumsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure TestEnum and [TestEnum] can be selected on a sub-selection of Object

extension TestObject_TestEnum_RenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.testEnum 
                $0.testEnum 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{testEnum,testEnum}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.testEnumArgs(arguments: .testDefault) 
                $0.testEnumArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{testEnumArgs\(testArgs),testEnumArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.testEnums 
                $0.testEnums 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{testEnums,testEnums}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.testEnumsArgs(arguments: .testDefault) 
                $0.testEnumsArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{testEnumsArgs\(testArgs),testEnumsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure fragments on Query selecting TestEnum and [TestEnum] can be used at the top level of an operation

extension TestObject_TestEnum_RenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.testEnum 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{testEnum}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.testEnumArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{testEnumArgs\(testArgs)}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.testEnums 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{testEnums}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.testEnumsArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{testEnumsArgs\(testArgs)}")
    }
}
