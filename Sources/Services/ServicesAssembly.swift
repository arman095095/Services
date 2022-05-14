//
//  File.swift
//  
//
//  Created by Арман Чархчян on 10.05.2022.
//

import Foundation
import Swinject

public final class ServicesAssembly: Assembly {
    
    public init() { }
    
    public func assemble(container: Container) {
        KeychainServiceAssembly().assemble(container: container)
        UserDefaultsServiceAssembly().assemble(container: container)
        CoreDataServiceAssembly().assemble(container: container)
        AccountCacheServiceAssembly().assemble(container: container)
    }
}
