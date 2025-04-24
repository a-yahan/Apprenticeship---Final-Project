//
//  Auth.swift
//  ManageHack
//
//  Created by Yahan Yang on 4/22/25.
//

import Foundation

@Observable
public class Auth {
    // Use a dictionary for fast username-based lookups
    private var participantList: [String: Participant]
    var sampleParticipant: Participant
    
    init() {
        let participant = Participant(
            name: "Angela",
            email: "ange@gmail.com",
            points: 3,
            Events: [Event(name: "AppTeam Gala!", isActive: true)],
            password: "1234"
        )
        self.sampleParticipant = participant
        self.participantList = ["Angela": participant]
    }


    // Check if the username exists in the dictionary
    func userExist(username: String) -> Bool {
        return participantList[username] != nil
    }
    
    func getUser(username: String) -> Participant{
        return participantList[username]!
    }

    // Check if the password is correct (this requires that Participant has a password property)
    func passwordCorrect(username: String, password: String) -> Bool {
        guard let participant = participantList[username] else { return false }
        return participant.password == password // Make sure `Participant` has a `password` property
    }

    // Register a new user
    func registerUser(username: String, participant: Participant) -> Bool {
        guard participantList[username] == nil else { return false } // Prevent overwriting
        participantList[username] = participant
        return true
    }
}
