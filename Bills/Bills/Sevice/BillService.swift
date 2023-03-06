//
//  BillService.swift
//  Bills
//
//  Created by Zaven Madoyan on 24.01.23.
//

import RxSwift
import Foundation

// MARK: - BillsServicing
protocol BillsServicing {
    func loadBills(routing: BillParameter) -> Observable<[BillResponse]>
}

class BillService: BillsServicing {
    private var session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func loadBills(routing: BillParameter) -> Observable<[BillResponse]> {
        return Single.create { single in
            let dataTask = self.session.dataTask(with: routing.urlRequest) { (data, response, error) in
                if let error = error {
                    single(.failure(error))
                }
                
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    if let response = try? jsonDecoder.decode(
                        [BillResponse].self,
                        from: data) {
                        single(.success(response))
                    } else {
                        single(.failure(ParsingError.format))
                    }
                }
            }
            
            dataTask.resume()
            return Disposables.create {
                dataTask.cancel()
            }
        }.asObservable()
    }
}
