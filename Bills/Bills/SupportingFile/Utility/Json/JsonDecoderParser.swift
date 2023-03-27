//
//  JsonDecoderParser.swift
//  Bills
//
//  Created by Zaven Madoyan on 27.03.23.
//

import Foundation
import RxSwift

struct JsonDecoderParser: Parsing {
    func parse<T: Decodable>(data: Data) -> Single<T> {
        return Single.create { single in
            do {
                let data = try JSONDecoder().decode(T.self, from: data)

                single(.success(data))
             } catch {
                single(.failure(CustomError.ParsingError.decodingFailed))
             }

            return Disposables.create()
        }
    }
}
