// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of TestEnum and [TestEnum] render as expected

extension TestInterface2_TestEnum_RenderTests {
    func testSingleRender() {
        let query: _Operation<Query, TestEnum.Result> = .query {
            $0.i2_testEnum 
        }
        XCTAssertEqual(query.render(), "{i2_testEnum}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Query, TestEnum.Result> = .query {
            $0.i2_testEnumArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i2_testEnumArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Query, [TestEnum.Result]> = .query {
            $0.i2_testEnums 
        }
        XCTAssertEqual(query.render(), "{i2_testEnums}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Query, [TestEnum.Result]> = .query {
            $0.i2_testEnumsArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i2_testEnumsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure single selections of TestEnum and [TestEnum] with aliases render as expected

extension TestInterface2_TestEnum_RenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Query, TestEnum.Result> = .query {
            $0.i2_testEnum(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:i2_testEnum}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Query, TestEnum.Result> = .query {
            $0.i2_testEnumArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:i2_testEnumArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Query, [TestEnum.Result]> = .query {
            $0.i2_testEnums(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:i2_testEnums}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Query, [TestEnum.Result]> = .query {
            $0.i2_testEnumsArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:i2_testEnumsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure multiple sibling selections of TestEnum and [TestEnum] render as expected

extension TestInterface2_TestEnum_RenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Query, (TestEnum.Result, TestEnum.Result)> = .query {
            $0.i2_testEnum 
            $0.i2_testEnum 
        }
        XCTAssertEqual(query.render(), "{i2_testEnum,i2_testEnum}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Query, (TestEnum.Result, TestEnum.Result)> = .query {
            $0.i2_testEnumArgs(arguments: .testDefault) 
            $0.i2_testEnumArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i2_testEnumArgs\(testArgs),i2_testEnumArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Query, ([TestEnum.Result], [TestEnum.Result])> = .query {
            $0.i2_testEnums 
            $0.i2_testEnums 
        }
        XCTAssertEqual(query.render(), "{i2_testEnums,i2_testEnums}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Query, ([TestEnum.Result], [TestEnum.Result])> = .query {
            $0.i2_testEnumsArgs(arguments: .testDefault) 
            $0.i2_testEnumsArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i2_testEnumsArgs\(testArgs),i2_testEnumsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure selections render as expected on selections of TestEnum and [TestEnum]

extension TestInterface2_TestEnum_RenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_testEnum 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i2_testEnum}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_testEnumArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i2_testEnumArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_testEnums 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i2_testEnums}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_testEnumsArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i2_testEnumsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure aliases render as expected on sub-selections of TestEnum and [TestEnum]

extension TestInterface2_TestEnum_RenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_testEnum(alias: "alias") 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{alias:i2_testEnum}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_testEnumArgs(alias: "alias", arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{alias:i2_testEnumArgs\(testArgs)}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_testEnums(alias: "alias") 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{alias:i2_testEnums}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_testEnumsArgs(alias: "alias", arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{alias:i2_testEnumsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure TestEnum and [TestEnum] can be selected on a sub-selection of Object

extension TestInterface2_TestEnum_RenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_testEnum 
                $0.i2_testEnum 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i2_testEnum,i2_testEnum}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_testEnumArgs(arguments: .testDefault) 
                $0.i2_testEnumArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i2_testEnumArgs\(testArgs),i2_testEnumArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_testEnums 
                $0.i2_testEnums 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i2_testEnums,i2_testEnums}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_testEnumsArgs(arguments: .testDefault) 
                $0.i2_testEnumsArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i2_testEnumsArgs\(testArgs),i2_testEnumsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure fragments on Query selecting TestEnum and [TestEnum] can be used at the top level of an operation

extension TestInterface2_TestEnum_RenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_testEnum 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_testEnum}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_testEnumArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_testEnumArgs\(testArgs)}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_testEnums 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_testEnums}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_testEnumsArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_testEnumsArgs\(testArgs)}")
    }
}
