import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {

    //MARK: - Properties

    var cards = [Card]()
    var type: DeckType
    var trump: Suit?

    var total:Int {
        return type.rawValue
    }
}

extension Deck {

    init(with type: DeckType) {
        self.type = type
        cards = createDeck(suits: Suit.allCases, values: Value.allCases)
    }

    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        var cards = [Card]()
        for suit in suits {
            for value in values {
                cards.append(Card(suit: suit, value: value))
            }
        }
        return cards
    }

    public mutating func shuffle() {
        cards.shuffle()
    }
    
    public mutating func defineTrump() {
        trump = cards.last?.suit
        for (i, card) in cards.enumerated() {
            if card.suit == trump {
                cards[i].isTrump = true
            }
        }
    }
    
    public mutating func initialCardsDealForPlayers(players: [Player]) {
        for player in players {
            if cards.count >= 6 {
                player.hand = cards.suffix(6)
                cards.removeLast(6)
            }
        }
    }
    
//    public mutating func setTrumpCards(for suit:Suit) {
//        for (i, card) in cards.enumerated() {
//            if card.suit == suit {
//                cards[i].isTrump = true
//            }
//        }
//    }
}

