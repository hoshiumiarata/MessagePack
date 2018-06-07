import Foundation

enum MessagePackError: Error {
    case invalidArgument
    case unknownSignature
    case unsupportedType
}
