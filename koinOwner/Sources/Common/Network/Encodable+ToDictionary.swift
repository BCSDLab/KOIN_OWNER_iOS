//
//  Encodable+ToDictionary.swift
//  koinOwner
//
//  Created by 김나훈 on 8/20/24.
//

import Foundation

extension Encodable {
    func toDictionary() -> [String: Any] {
        do {
            let jsonEncoder = JSONEncoder()
            let encodedData = try jsonEncoder.encode(self)

            let dictionaryData = try JSONSerialization.jsonObject(
                with: encodedData,
                options: .fragmentsAllowed
            ) as? [String: Any]
            return dictionaryData ?? [:]
        } catch {
            return [:]
        }
    }

    func toStringDictionary() -> [String: String] {
        do {
            let jsonEncoder = JSONEncoder()
            let encodedData = try jsonEncoder.encode(self)

            let dictionaryData = try JSONSerialization.jsonObject(
                with: encodedData,
                options: .fragmentsAllowed
            ) as? [String: String]
            return dictionaryData ?? [:]
        } catch {
            return [:]
        }
    }
}
