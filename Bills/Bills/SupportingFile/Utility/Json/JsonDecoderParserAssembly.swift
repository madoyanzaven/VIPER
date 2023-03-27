//
//  JsonDecoderParserAssembly.swift
//  Bills
//
//  Created by Zaven Madoyan on 27.03.23.
//

import Foundation
import Swinject

struct JsonDecoderParserAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Parsing.self) { _ in JsonDecoderParser() }
    }
}
