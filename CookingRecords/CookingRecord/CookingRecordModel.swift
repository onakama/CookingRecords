//
//  CookingRecordModel.swift
//  CookingRecords
//
//  Created by 住山大誠 on 2022/05/12.
//

import Foundation

struct ResponseData: Codable {
    let pagination: Pagination
    let cookingRecordList: [CookingRecord]
    
    enum CodingKeys: String, CodingKey {
        case pagination
        case cookingRecordList = "cookingRecords"
      }
}

struct Pagination: Codable {
    let total: Int
    let offset: Int
    let limit: Int
}

struct CookingRecord: Hashable, Codable {
    let imageUrl: String
    let comment: String
    let recipeType: RecipeType
    let recordedAt: String
    
    enum RecipeType: String, Codable {
        case mainDish = "main_dish"
        case soup = "soup"
        case sideDish = "side_dish"
    }

    func recipeTypeStr() -> String{
        switch recipeType {
        case .mainDish:
            return "mainDish"
        case .sideDish:
            return "sideDish"
        case .soup:
            return "soup"
        }
    }
}

let MOCK = """
{
  "pagination": {
    "total": 100,
    "offset": 50,
    "limit": 5
  },
  "cooking_records": [
    {
      "image_url": "https://cooking-records.herokuapp.com/images/1.jpg",
      "comment": "パンチのきいた辛味が印象的です。",
      "recipe_type": "main_dish",
      "recorded_at": "2018-04-21 14:04:22"
    },
    {
      "image_url": "https://cooking-records.herokuapp.com/images/2.jpg",
      "comment": "ごまのコクと酸味がさわやかなタレを添えて。",
      "recipe_type": "main_dish",
      "recorded_at": "2018-04-20 14:04:42"
    },
    {
      "image_url": "https://cooking-records.herokuapp.com/images/3.jpg",
      "comment": "新鮮なとうもろこしのおいしさ。",
      "recipe_type": "soup",
      "recorded_at": "2018-04-19 14:05:41"
    },
    {
      "image_url": "https://cooking-records.herokuapp.com/images/4.jpg",
      "comment": "しょうゆとオイスターソースで味付けた具がたっぷり。",
      "recipe_type": "main_dish",
      "recorded_at": "2018-04-18 14:06:12"
    },
    {
      "image_url": "https://cooking-records.herokuapp.com/images/5.jpg",
      "comment": "豚バラ肉とゴーヤーで、夏バテも吹き飛びそうです。",
      "recipe_type": "main_dish",
      "recorded_at": "2018-04-17 14:07:40"
    }
  ]
}
"""
.data(using: .utf8)
