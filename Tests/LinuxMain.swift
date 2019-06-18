import XCTest

import GraphQLTests

var tests = [XCTestCaseEntry]()
tests += QueryRenderingTests.allTests()
XCTMain(tests)
