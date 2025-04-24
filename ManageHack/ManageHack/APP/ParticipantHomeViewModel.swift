import Foundation

@Observable
public class ParticipantHomeViewModel {
    private var participant: Participant
    // private var currentEvent: Event?
    // private var pastEvents: [Event]?
    private var nilEvent = Event(name: "No Events", isActive: false)

//    init() {
//        // Placeholder init?
//        // Fetch with API
//        //participant = Participant(name: "Angela", email: "ange@gmail.com", points: 4, password: "1234")
//        participant.pastEvents = [Event(name: "HackNC2024"), Event(name: "CDC2023"), Event(name: "PearlHacks2022")]
//        participant.currentEvent = Event(name: "HackNC2025", isActive: true)
//    }
    init(participant: Participant) {
        self.participant = participant
    }

    func getParticipant() -> Participant {
        return self.participant
    }

    func getEvents() -> [Event] {
        return self.participant.Events ?? [self.nilEvent]
    }

    func addEvent(_ event: Event) {
        self.participant.Events?.append(event)
    }

    func removeEvent(_ event: Event, participant: Participant) {
        if let index = participant.Events?.firstIndex(of: event) {
            self.participant.Events?.remove(at: index)
        }
    }

    func getItems() -> [Item] {
        return self.participant.items!
    }

    func itemStatus() {
        guard var items = participant.items else { return }

        for i in 0..<items.count {
            if participant.points >= items[i].cost {
                items[i].obtainable = true
            }
        }

        participant.items = items  // write the mutated list back
    }
    

}
