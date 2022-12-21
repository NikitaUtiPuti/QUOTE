//
//  Quiz.swift
//  QUOTE
//
//  Created by Никита Зюзин on 13.12.2022.
//

import Foundation
import UIKit

struct Quiz {
    
    var score = 0
    var quizHeroes = [Hero]()
    
    let allHeroes = [
        Hero(name: "abaddon", quotes: ["Тот, кто крещён в купели Аверно видит смерть иначе.", "Завеса жизни и смерти теперь не столь                      таинственна.", "Узрите продолжателя династии Аверно и трепещите!"]),
        Hero(name: "alchemist", quotes: ["Если битва - это цепная реакция, то я ее катализатор!", "Не тряси, а то взорвёмся!", "Коктейля не желаете?"]),
        Hero(name: "ancient_apparition", quotes: ["Ancient chill!", "Cold save us!", "You'll grow colder but no older."]),
        Hero(name: "antimage", quotes: ["Время магии сочтено.", "Магии не знать победы.", "Колдовское отродье."]),
        Hero(name: "arc_warden", quotes: ["Материя отделилась от своей задуманной формы, надо соединить их вновь.", "Зет – это Самость, а Самость – это Зет.", "Жизнь - тюрьма. Встречай свободу."]),
        Hero(name: "axe", quotes: ["Taste my blade!", "You get nothing. Good day, sir!", "Axe grows stronger!"]),
        Hero(name: "bane", quotes: ["I bring nightmares.", "See you in your dreams.", "Rainada har rainada har rainada har seyada ha…"]),
        Hero(name: "batrider", quotes: ["Тебя подвезти?", "Я прилетел из преисподней — выучил пару новых трюков!", "Эй, мышка! Лети!"]),
        Hero(name: "beastmaster", quotes: ["Nature, red in tooth and talon.", "My beasts and I hunt our prey.", "Unleash the beasts of war."]),
        Hero(name: "bloodseeker", quotes: ["Я проливаю кровь во имя Бескожих Близнецов.", "Кровь крови рознь!", "Подставляй вены..."]),
        Hero(name: "bounty_hunter", quotes: ["Преступник не уйдет от законного возмездия.", "За их головы назначена награда.", "Я беру этот контракт."]),
        Hero(name: "brewmaster", quotes: [" Raise em high, friends!", "What kind of pub is this?", "What's wrong? Can't hold your liquor? . . Hello?"])]
    
    func getScore() -> Int {
        return score
    }
    
    func getQuote() -> String {
        return (quizHeroes.randomElement()?.heroQuotes.randomElement())!
    }
    
    mutating func removeHeroes() {
        quizHeroes.removeAll()     //Test func
    }
    
    mutating func getHeroes() -> [Hero] {
        
        while quizHeroes.count < 4 {
            quizHeroes.append(allHeroes.randomElement()!)
            let unique = Array(Set(quizHeroes))            //Создание уникального массива (преобразуя в сет)
            quizHeroes = unique
        }
        return quizHeroes
    }
    
    mutating func checkAnswer(input: [String], quote: String) -> Bool {
        if(input.contains(quote)) {
               score += 1
               return true
           }
           else {
               return false
           }
       }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

//extension Array where Element: Equatable {
//    func withoutDuplicates() -> [Element] {
//        return self.reduce([], { (objects, object) -> [Element] in
//            var objects = objects
//            if !objects.contains(object) {
//                objects.append(object)
//            }
//            return objects
//        })
//    }
//}
//extension Array where Element: Equatable {
//    func removingDuplicates() -> Array {
//        return reduce(into: []) { result, element in
//            if !result.contains(element) {
//                result.append(element)
//            }
//        }
//    }
//}
//extension Sequence where Element: Hashable {
//    func uniqued() -> [Element] {
//        var set = Set<Element>()
//        return filter { set.insert($0).inserted }
//    }
//}
//extension Sequence where Element: Hashable {
//    func unique() -> [Element] {
//        NSOrderedSet(array: self as! [Any]).array as! [Element]
//    }
//}
