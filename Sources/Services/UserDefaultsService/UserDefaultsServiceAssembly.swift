//
//  UserDefaultsServiceAssembly.swift
//  
//
//  Created by Арман Чархчян on 29.04.2022.
//

import Foundation
import Swinject

final class UserDefaultsServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(UserDefaultsServiceProtocol.self) { r in
            UserDefaultsService()
        }
    }
}
