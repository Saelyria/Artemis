import Foundation

/**
An object that wraps values related to a wrapped type.

When using GraphQL, we often don't fetch full representations of model objects - instead, we get 'partial' instances
that only contain some properties. This object is used to be this 'partial' representation of a model object - `Partial`
instances are specialized with a type to represent, and are returned as the result of a GraphQL operation.

`Partial` instances can be queried for properties related to their underlying represented type with the same property
names as the represented type in a type-safe way using `KeyPath` objects.
*/
@dynamicMemberLookup
public struct Partial<T: SelectionOutput> {
	let values: [String: Any]
	
	init(values: [String: Any]) {
		self.values = values
	}
}

public extension Partial where T: Object {
	subscript<F: AnyField>(dynamicMember keyPath: KeyPath<T.Schema, F>) -> F.Value? where F.Value: Scalar {
		let keyString = T.Schema()[keyPath: keyPath].key
		return self.values[keyString] as? F.Value
	}
	
	//	subscript<F: AnyField, V>(dynamicMember keyPath: KeyPath<T.Schema, F>) -> F.Value where F.Value == Optional<V>, V: Scalar {
	//        let keyString = T.Schema()[keyPath: keyPath].key
	//		return self.values[keyString] as? V
	//    }
	
	subscript<F: AnyField>(dynamicMember keyPath: KeyPath<T.Schema, F>) -> F.Value? where F.Value: Collection & Scalar {
		let keyString = T.Schema()[keyPath: keyPath].key
		return self.values[keyString] as? F.Value
	}
	
	//	subscript<F: AnyField, V>(dynamicMember keyPath: KeyPath<T.Schema, F>) -> F.Value
	//		where F.Value == Optional<V>, V: Collection & Scalar
	//	{
	//        let keyString = T.Schema()[keyPath: keyPath].key
	//        return self.values[keyString] as? V
	//    }
	
	subscript<F: AnyField>(dynamicMember keyPath: KeyPath<T.Schema, F>) -> Partial<F.Value>? where F.Value: Object {
		let keyString = T.Schema()[keyPath: keyPath].key
		guard let valueDict = self.values[keyString] as? [String: Any] else { return nil }
		return Partial<F.Value>(values: valueDict)
	}
	
	subscript<F: AnyField>(dynamicMember keyPath: KeyPath<T.Schema, F>) -> [Partial<F.Value.Element>]? where F.Value: Collection & Object {
		let keyString = T.Schema()[keyPath: keyPath].key
		guard let valuesArray = self.values[keyString] as? [[String: Any]] else { return nil }
		return valuesArray.map { Partial<F.Value.Element>(values: $0) }
	}
	
	/**
	Gets the given property under the given alias.
	
	- parameter keyPath: The keypath of the property as it was originally named on the object.
	- parameter alias: The aliased name of the property as in the request.
	*/
	func get<F: AnyField>(_ keyPath: KeyPath<T.Schema, F>, alias: String) -> F.Value? where F.Value: Scalar {
		return self.values[alias] as? F.Value
	}
	
	/**
	Gets the given property under the given alias.
	
	- parameter keyPath: The keypath of the property as it was originally named on the object.
	- parameter alias: The aliased name of the property as in the request.
	*/
	func get<F: AnyField>(_ keyPath: KeyPath<T.Schema, F>, alias: String) -> F.Value? where F.Value: Collection & Scalar {
		return self.values[alias] as? F.Value
	}
	
	/**
	Gets the given property under the given alias.
	
	- parameter keyPath: The keypath of the property as it was originally named on the object.
	- parameter alias: The aliased name of the property as in the request.
	*/
	func get<F: AnyField>(_ keyPath: KeyPath<T.Schema, F>, alias: String) -> Partial<F.Value>? where F.Value: Object {
		guard let valueDict = self.values[alias] as? [String: Any] else { return nil }
		return Partial<F.Value>(values: valueDict)
	}
	
	/**
	Gets the given property under the given alias.
	
	- parameter keyPath: The keypath of the property as it was originally named on the object.
	- parameter alias: The aliased name of the property as in the request.
	*/
	func get<F: AnyField>(_ keyPath: KeyPath<T.Schema, F>, alias: String) -> [Partial<F.Value.Element>]? where F.Value: Collection & Object {
		guard let valuesArray = self.values[alias] as? [[String: Any]] else { return nil }
		return valuesArray.map { Partial<F.Value.Element>(values: $0) }
	}
}

extension Partial: CustomStringConvertible {
	public var description: String {
		var desc = "Partial<\(String(describing: T.self).split(separator: ".").last!)>("
		let values = self.values.map { (pair) -> String in
			let (key, value) = pair
			var valueDesc: String = "nil"
			if let value = value as? CustomStringConvertible {
				valueDesc = value.description
			}
			return "\(key): \(valueDesc)"
		}.joined(separator: ", ")
		desc.append("\(values))")
		
		return desc
	}
}

public enum GraphQLError: Error {
	case invalidOperation
	case malformattedResponse(reason: String)
	case singleItemParseFailure(operation: String)
	case arrayParseFailure(operation: String)
	/// The type of the associated value of an argument enum case wasn't convertible to a string.
	case argumentValueNotConvertible
	case invalidRequest(reasons: [String])
	case other(Error)
}
