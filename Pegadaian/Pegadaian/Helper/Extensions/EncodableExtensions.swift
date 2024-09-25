//
//  EncodableExtensions.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 25/09/24.
//

import Foundation

extension Encodable {
    func toJSON() -> [String : Any]? {
        do {
            let data = try JSONEncoder().encode(self)
            guard let dictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String : Any] else {
                return nil
            }
            return dictionary
        } catch {
            return nil
        }
    }
}
