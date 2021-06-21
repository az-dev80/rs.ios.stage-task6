//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        for i in hand! {
            if i.value == card.value {
                return true
            }
        }
        return false
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        for i in hand! {
            for (j, k) in table {
                if i.value == j.value || i.value == k.value {
                    return true
                }
            }
        }
        return false
    }
}
