//
//  CookingRecordListModel.swift
//  CookingRecords
//
//  Created by 住山大誠 on 2022/05/12.
//

import Foundation
final class CookingRecordListModel {
    
    private init() {}
    public static let shared = CookingRecordListModel()
    
    func httpGet() async throws -> ResponseData {
        let url = URL(string: "https://cooking-records.herokuapp.com/cooking_records?offset=1&limit=100")!
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        do {
            let data = try jsonDecode(json: data)
            return data
        } catch let error {
            throw error
        }
    }

    func jsonDecode(json: Data) throws -> ResponseData {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(.formatter)
        guard let decodedData: ResponseData = try? decoder.decode(ResponseData.self, from: json) else {
            throw CookingRecordError.DecodeError
        }
        return decodedData
    }
}

