//
//  BillResponse.swift
//  Bills
//
//  Created by Zaven Madoyan on 24.01.23.
//

struct BillResponse: Decodable {
    let id: Int
    let billType: BillType
    let description: String
    let amount: Double

    enum BillType: String, Codable, Equatable {
        case mobile
        case fixed
    }

    enum CodingKeys: String, CodingKey {
        case id, description, amount
        case billType = "bill_type"
    }
}
