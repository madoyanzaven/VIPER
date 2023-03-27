//
//  ServiceProvider.swift
//  Bills
//
//  Created by Zaven Madoyan on 27.03.23.
//

import Foundation
import Swinject

enum ServiceProvider {
    static var bill: BillsServicing {
        let assemblies: [Assembly] = [
            BillServiceAssemby()
        ]
        let assembler = Assembler(assemblies)
        return assembler.resolver.resolve(BillsServicing.self)!
    }
}
