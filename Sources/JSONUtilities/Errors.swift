//
//  Errors.swift
//  JSONUtilities
//
//  Created by Luciano Marisi on 05/03/2016.
//  Copyright © 2016 Luciano Marisi All rights reserved.
//

import Foundation

/**
 Decoding error for mandatory keys
 
 - Mandatory: The key that failed the decoding
 */
public enum DecodingError: Error, CustomStringConvertible {
  case mandatoryKeyNotFound(key: StringProtocol)
  case mandatoryRawRepresentableHasIncorrectValue(rawRepresentable:Any, rawValue:JSONRawType)
  case incorrectType(expected: Any.Type, found: Any)
  case incorrectTypeForKey(key: StringProtocol, expected: Any.Type, found: Any)

  public var description: String {
    switch self {
    case .mandatoryKeyNotFound(let key):
      return "mandatoryKeyNotFound: \(key)"
    case .mandatoryRawRepresentableHasIncorrectValue(let rawRepresentable, let rawValue):
      return "mandatoryRawRepresentableHasIncorrectValue: \(rawRepresentable): \(rawValue)"
    case .incorrectType(let expected, let found):
      return "incorrectType: expected \(expected), found \(found)"
    case .incorrectTypeForKey(let key, let expected, let found):
      return "incorrectTypeForKey: key \(key), expected \(expected), found \(found)"
    }
  }

}

/**
 Error used when a json value fails to be transformed
 
 - couldNotTransformJSONValue: The value that failed to be transformed
 */
public enum JSONPrimitiveConvertibleError<ValueType: JSONRawType>: Error, CustomStringConvertible {
  case couldNotTransformJSONValue(value: ValueType)

  public var description: String {
    switch self {
    case .couldNotTransformJSONValue(let value):
      return "couldNotTransformJSONValue: \(value)"
    }
  }

}
