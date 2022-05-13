//
//  File.swift
//  
//
//  Created by Арман Чархчян on 14.05.2022.
//

import ModelInterfaces

public final class MessangerChatModel: MessangerChatModelProtocol {
    public var friend: ProfileModelProtocol
    public var friendID: String
    public var typing: Bool
    public var messages: [MessageModelProtocol]
    public var newMessages: [MessageModelProtocol]
    public var notSendedMessages: [MessageModelProtocol]
    public var notLookedMessages: [MessageModelProtocol]
    
    public init?(chat: Chat?) {
        guard let chat = chat,
              let friendID = chat.friendID,
              let friend = chat.friend,
              let profile = ProfileModel(profile: friend) else { return nil }
        self.friendID = friendID
        self.friend = profile
        self.typing = false
        self.messages = chat.messages?.compactMap { MessageModel(message: $0 as? Message) } ?? []
        self.notLookedMessages = chat.notLookedMessages?.compactMap { MessageModel(message: $0 as? Message) } ?? []
        self.notSendedMessages = chat.notSendedMessages?.compactMap { MessageModel(message: $0 as? Message) } ?? []
        self.newMessages = chat.newMessages?.compactMap { MessageModel(message: $0 as? Message) } ?? []
    }
}
