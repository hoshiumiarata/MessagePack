import Foundation

public protocol MessagePackable {
    var messagePackFormat: MessagePackFormat { get }
}

extension Int8: MessagePackable {
    public var messagePackFormat: MessagePackFormat {
        switch self {
        case -32..<0: return MessagePackNegativeFixint.shared
        default: return MessagePackInt8.shared
        }
    }
}

extension Int16: MessagePackable {
    public var messagePackFormat: MessagePackFormat {
        return MessagePackInt16.shared
    }
}

extension Int32: MessagePackable {
    public var messagePackFormat: MessagePackFormat {
        return MessagePackInt32.shared
    }
}

extension Int64: MessagePackable {
    public var messagePackFormat: MessagePackFormat {
        return MessagePackInt64.shared
    }
}

extension UInt8: MessagePackable {
    public var messagePackFormat: MessagePackFormat {
        switch self {
        case 0..<128: return MessagePackPositiveFixint.shared
        default: return MessagePackUInt8.shared
        }
    }
}

extension UInt16: MessagePackable {
    public var messagePackFormat: MessagePackFormat {
        return MessagePackUInt16.shared
    }
}

extension UInt32: MessagePackable {
    public var messagePackFormat: MessagePackFormat {
        return MessagePackUInt32.shared
    }
}

extension UInt64: MessagePackable {
    public var messagePackFormat: MessagePackFormat {
        return MessagePackUInt64.shared
    }
}

extension Float32: MessagePackable {
    public var messagePackFormat: MessagePackFormat {
        return MessagePackFloat32.shared
    }
}

extension Float64: MessagePackable {
    public var messagePackFormat: MessagePackFormat {
        return MessagePackFloat64.shared
    }
}

extension Bool: MessagePackable {
    public var messagePackFormat: MessagePackFormat {
        return self ? MessagePackTrue.shared : MessagePackFalse.shared
    }
}

extension Array: MessagePackable {
    public var messagePackFormat: MessagePackFormat {
        switch count {
        case 0..<16: return MessagePackFixArray.shared
        case 16..<65536: return MessagePackArray16.shared
        default: return MessagePackArray32.shared
        }
    }
}

extension Data: MessagePackable {
    public var messagePackFormat: MessagePackFormat {
        switch count {
        case 0..<256: return MessagePackBin8.shared
        case 256..<65536: return MessagePackBin16.shared
        default: return MessagePackBin32.shared
        }
    }
}

extension Dictionary: MessagePackable {
    public var messagePackFormat: MessagePackFormat {
        switch count {
        case 0..<16: return MessagePackFixMap.shared
        case 16..<65536: return MessagePackMap16.shared
        default: return MessagePackMap32.shared
        }
    }
}

extension String: MessagePackable {
    public var messagePackFormat: MessagePackFormat {
        switch self.data(using: .utf8)!.count {
        case 0..<32: return MessagePackFixString.shared
        case 32..<256: return MessagePackString8.shared
        case 256..<65536: return MessagePackString16.shared
        default: return MessagePackString32.shared
        }
    }
}
