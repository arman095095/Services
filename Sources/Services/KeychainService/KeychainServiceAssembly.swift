//
//  KeychainServiceAssembly.swift
//  
//
//  Created by Арман Чархчян on 29.04.2022.
//

import Foundation
import Swinject

final class KeychainServiceAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(KeychainServiceProtocol.self) { r in
            KeychainService(configuration: KeychainConfiguration(account: "test"))
        }
    }
}
