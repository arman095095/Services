//
//  File.swift
//  
//
//  Created by Арман Чархчян on 09.05.2022.
//

import Foundation
import ModelInterfaces
import NetworkServices

public final class ChatModel: ChatModelProtocol {
    public var friend: ProfileModelProtocol
    public var friendID: String
    public var typing: Bool
    public var lastMessage: MessageModelProtocol?
    public var newMessagesCount: Int
    public var notSendedMessages: [MessageModelProtocol]
    
    public init(friend: ProfileNetworkModelProtocol) {
        self.friend = ProfileModel(profile: friend)
        self.friendID = friend.id
        self.typing = false
        self.lastMessage = nil
        self.notSendedMessages = []
        self.newMessagesCount = 0
    }
    
    public init(friend: ProfileModelProtocol) {
        self.friend = friend
        self.friendID = friend.id
        self.typing = false
        self.lastMessage = nil
        self.notSendedMessages = []
        self.newMessagesCount = 0
    }
    
    public init?(chat: Chat?) {
        guard let chat = chat,
              let friendID = chat.friendID,
              let friend = chat.friend,
              let profile = ProfileModel(profile: friend) else { return nil }
        self.friendID = friendID
        self.friend = profile
        self.typing = false
        if let message = chat.messages?.allObjects.last as? Message {
           self.lastMessage = MessageModel(message: message)
        }
        self.notSendedMessages = chat.notSendedMessages?.compactMap { MessageModel(message: $0 as? Message) } ?? []
        self.newMessagesCount = chat.newMessages?.count ?? 0
    }
}
