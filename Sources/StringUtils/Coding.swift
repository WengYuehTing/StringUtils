//
//  Coding.swift
//  
//
//  Created by YueTing Weng on 2022/3/8.
//

import Foundation
import CryptoKit

extension String {
    
    /// Returns a base64 encoded string.
    ///
    /// If encoding fails, return self.
    public func base64Encoded() -> String {
        return data(using: .utf8)?.base64EncodedString() ?? self
    }
    
    /// Returns a base64 decoded string which was encoded previously in base64.
    ///
    /// If decoding fails, return self.
    public func base64Decoded() -> String {
        guard let data = Data(base64Encoded: self), let string = String(data: data, encoding: .utf8) else {
            return self
        }
        
        return string
    }
    
    /// Returns an url encoded string.
    ///
    /// If encoding fails, return self.
    ///
    /// - Parameter cset: The character set to allow in encoding.
    ///
    /// - Important: This method easily leads to wrong results in encoding some special symbols,
    ///   make sure to test the default character set and modify it if needs.
    public func urlEncoded(_ cset: CharacterSet = .alphanumerics.union(.init(charactersIn: "-._~"))) -> String {
        return addingPercentEncoding(withAllowedCharacters: cset) ?? self
    }
    
    /// Returns a url decoded string which was encoded previously in url.
    ///
    /// If decoding fails, return self.
    public func urlDecoded() -> String {
        return removingPercentEncoding ?? self
    }
    
    /// Returns a md5 crypted string.
    ///
    /// If crypting fails, return self.
    @available(iOS 13.0, macOS 10.15, *)
    public func md5() -> String {
        guard let data = self.data(using: .utf8) else {
            return self
        }
        
        let digest = Insecure.MD5.hash(data: data)
        return digest.map { String(format: "%02hhx", $0) }.joined()
    }
}
