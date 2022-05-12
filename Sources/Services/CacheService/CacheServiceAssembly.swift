//
//  File.swift
//  
//
//  Created by Арман Чархчян on 26.04.2022.
//

import Foundation
import Swinject

public typealias ChatsAndRequestsCacheServiceProtocol = ChatsCacheServiceProtocol & RequestsCacheServiceProtocol

public typealias CommunicationCacheServiceProtocol = AccountCacheServiceProtocol & ChatsAndRequestsCacheServiceProtocol

public final class CacheServiceAssembly: Assembly {

    public init() { }
    
    public func assemble(container: Container) {
        container.register(AccountCacheServiceProtocol.self) { r in
            guard let coreDataService = r.resolve(CoreDataServiceProtocol.self),
                  let keychainService = r.resolve(KeychainServiceProtocol.self),
                  case .success(let data) = keychainService.getData(for: .userID),
                  let userID = String(data: data, encoding: .utf8)
            else {
                fatalError(ErrorMessage.dependency.localizedDescription)
            }
            return CacheService(coreDataService: coreDataService, accountID: userID)
        }.implements(CommunicationCacheServiceProtocol.self)
    }
}

enum ErrorMessage: LocalizedError {
    case dependency
}
