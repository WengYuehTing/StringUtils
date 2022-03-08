//
//  extension.swift
//  
//
//  Created by YueTing Weng on 2022/3/8.
//

import Foundation
import CryptoKit

extension String {
    
    public func base64Encoded() -> String? {
        return data(using: .utf8)?.base64EncodedString()
    }
    
    public func base64Decoded() -> String? {
        guard let data = Data(base64Encoded: self), let string = String(data: data, encoding: .utf8) else {
            return nil
        }
        
        return string
    }
    
    public func urlEncoded(_ cset: CharacterSet = .alphanumerics.union(.init(charactersIn: "-._~"))) -> String? {
        return addingPercentEncoding(withAllowedCharacters: cset)
    }
    
    public func urlDecoded() -> String? {
        return removingPercentEncoding
    }
    
    @available(iOS 13.0, macOS 10.15, *)
    public func md5() -> String? {
        guard let data = self.data(using: .utf8) else {
            return nil
        }
        
        let digest = Insecure.MD5.hash(data: data)
        return digest.map { String(format: "%02hhx", $0) }.joined()
    }
}
