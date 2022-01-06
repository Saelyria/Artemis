import XCTest
@testable import Artemis

class MiscellaneousTests: XCTestCase {
    func testOperationNameRender() {
        let query: _Operation<TestSchema, Int> = .query(name: "OperationName") {
            $0.int
        }

        XCTAssertEqual(query.render(), "query OperationName{int}")
    }

    func testClientWithDelegate() {
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "int": 123,
                    "bool": true
                }
            }
        }
        """.utf8)
        let delegate = MockNetworkDelegate(result: .success(response))
        let client = Client<TestSchema>(networkDelegate: delegate)

        var result: Result<Partial<TestObject>, GraphQLError>?

        client.perform(.query {
            $0.testObject {
                $0.int
                $0.bool
            }
        }) { res in
            result = res
        }

        guard let value = try? result?.get() else {
            XCTFail()
            return
        }
        XCTAssertEqual(value.values.count, 2)
        XCTAssertEqual(value.int, 123)
        XCTAssertEqual(value.bool, true)
    }

    func testClientWithMock() {
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "int": 123,
                    "bool": true
                }
            }
        }
        """.utf8)
        let client = Client<TestSchema>(endpoint: URL(string: "fake.com")!)

        var result: Result<Partial<TestObject>, GraphQLError>?

        client.perform(.query {
            $0.testObject {
                $0.int
                $0.bool
            }
        }, mock: response) { res in
            result = res
        }

        guard let value = try? result?.get() else {
            XCTFail()
            return
        }
        XCTAssertEqual(value.values.count, 2)
        XCTAssertEqual(value.int, 123)
        XCTAssertEqual(value.bool, true)
    }

    func testClientWithError() {
        let response = Data("""
        {
            "errors": [
                {
                    "message": "This is an error"
                }
            ]
        }
        """.utf8)
        let client = Client<TestSchema>(endpoint: URL(string: "fake.com")!)

        var result: Result<Partial<TestObject>, GraphQLError>?

        client.perform(.query {
            $0.testObject {
                $0.int
                $0.bool
            }
        }, mock: response) { res in
            result = res
        }

        switch result {
        case .success, .none:
            XCTFail("Should have failed")
        case .failure(let error):
            switch error {
            case .invalidRequest(let reasons):
                XCTAssertEqual(reasons.count, 1)
                XCTAssertEqual(reasons.first, "This is an error")
            default:
                XCTFail("Should have failed with 'invalidRequest'")
            }
        }
    }

    func testClientWithInvalidJSON() {
        let response = Data("""
        ajdf{df..]
        """.utf8)
        let client = Client<TestSchema>(endpoint: URL(string: "fake.com")!)

        var result: Result<Partial<TestObject>, GraphQLError>?

        client.perform(.query {
            $0.testObject {
                $0.int
                $0.bool
            }
        }, mock: response) { res in
            result = res
        }

        switch result {
        case .success, .none:
            XCTFail("Should have failed")
        case .failure(let error):
            switch error {
            case .malformattedResponse: break
            default:
                XCTFail("Should have failed with 'malformattedResponse'")
            }
        }
    }
}

private class MockNetworkDelegate: NetworkDelegate {
    var result: Result<Data, Error>

    init(result: Result<Data, Error>) {
        self.result = result
    }

    func send(document: String, completion: @escaping (Result<Data, Error>) -> Void) {
        completion(self.result)
    }
}
