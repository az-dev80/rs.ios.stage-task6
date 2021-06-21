//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {

    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        if players.isEmpty || players.count == 1 {
            return nil
        }
        var trumpsArray: [Int] = []
        for player in players {
            for card in player.hand! {
                if card.isTrump {
                    trumpsArray.append(card.value.rawValue)
                }
            }
        }
        let dueCard = trumpsArray.min()
        var res: Player?
        for player in players {
            for card in player.hand! {
                if card.isTrump && card.value.rawValue == dueCard {
                    res = player
                }
            }
        }
        return res
    }
}
