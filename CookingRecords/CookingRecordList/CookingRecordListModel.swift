//
//  CookingRecordListModel.swift
//  CookingRecords
//
//  Created by 住山大誠 on 2022/05/12.
//

import Foundation
class CookingRecordListModel {
    func jsonDecode() throws -> ResponseData {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(.formatter)
        guard let decodedData: ResponseData = try? decoder.decode(ResponseData.self, from: MOCK!) else {
            throw CookingRecordError.DecodeError
        }
        return decodedData
    }
}

