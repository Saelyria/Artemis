import Foundation

/**
An object used when adding arguments to a field selection that builds a string of values for a given 'input' object.

This object is specialized with the type of an 'input' object being used as the value for an argument. It is passed into
the closure on that argument, where it is called with the keypaths of the wrapped 'input' type with the input's values.
*/
@dynamicMemberLookup
public class _InputBuilder<I: Input> {
	internal var addedInputFields: [String] = []
	
	/**
	Adds the given property value to the input object.
	*/
	public subscript<X, V: Scalar, T>(dynamicMember keyPath: KeyPath<I.SubSchema, Field<X, V, T>>) -> (V) -> Void {
		return { value in
			let key = I.SubSchema()[keyPath: keyPath].key
			self.addedInputFields.append("\(key):\(value.render())")
		}
	}
	
	/**
	Adds the given property input object value to the input object.
	*/
	public subscript<X, V, T>(dynamicMember keyPath: KeyPath<I.SubSchema, Field<X, V, T>>) -> ( (_InputBuilder<V>) -> Void ) -> Void where V: Input {
		return { inputBuilder in
			let b = _InputBuilder<V>()
			inputBuilder(b)
			let key = I.SubSchema()[keyPath: keyPath].key
			let value = "{\(b.addedInputFields.joined(separator: ","))}"
			self.addedInputFields.append("\(key):\(value)")
		}
	}
}