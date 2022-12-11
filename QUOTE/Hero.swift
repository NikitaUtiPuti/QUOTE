//
//  Hero.swift
//  QUOTE
//
//  Created by Никита Зюзин on 26.11.2022.
//

import Foundation
import UIKit

class Hero {

    var heroName = ""
    var heroQuotes = [String]()
    var heroImage = UIImage()
//    var heroImageUrl = URL(string: "")

  
//    func fetch() -> UIImage {
//        let image = heroImage
//        return image
//    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) -> UIImage {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            // always update the UI from the main thread
            DispatchQueue.main.async() { [weak self] in
                self!.heroImage = UIImage(data: data)!
            }
        }
        return heroImage
    }
    
    convenience init(name: String, quotes: [String]) {
        self.init()
        self.heroName = name
        self.heroQuotes = quotes
//        self.heroImage = image
        self.heroImage = downloadImage(from: URL(string: "https://cdn.cloudflare.steamstatic.com/apps/dota2/images/dota_react/heroes/\(heroName).png")!)
        
//        heroImage = fetch()
        
        
    }
    
//    func fetchImage() {
//        let image = heroImage
//    }
}

//let allHeroes = [Hero(name: "axe", quotes: ["Kiss piss", "Axe is back", "Culling"]),
//                 Hero(name: "obsidian_destroyer", quotes: ["Destroy", "You awful", "Catch if you can"]),
//                 Hero(name: "dark_willow", quotes: ["willow", "pillow", "sealow"]),
//                 Hero(name: "alchemist", quotes: ["Alachemy!", "My friend!", "Gold!"])]





//class Place: Object {
//
//  @objc dynamic var name = ""
//  @objc dynamic var location: String?
//  @objc dynamic var type: String?
//  @objc dynamic var imageData: Data?
//  @objc dynamic var date = Date()
//    @objc dynamic var rating = 0.0
//
//    convenience init(name: String, location: String?, type: String?, imageData: Data?, rating: Double) {
//        self.init()
//        self.name = name
//        self.location = location
//        self.type = type
//        self.imageData = imageData
//        self.rating = rating
//    }
//}























//import Foundation
//import UIKit
//
//class Hero {
//
//    var heroName = ""
//    var heroQuotes = [String]()
//    var heroImage = UIImage()
//    var heroImageUrl = URL(string: "")
//
//
////    func fetch() -> UIImage {
////        let image = heroImage
////        return image
////    }
//
//    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
//        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
//    }
//
//    func downloadImage(from url: URL) -> UIImage {
//        print("Download Started")
//        getData(from: url) { data, response, error in
//            guard let data = data, error == nil else { return }
//            print(response?.suggestedFilename ?? url.lastPathComponent)
//            print("Download Finished")
//            // always update the UI from the main thread
//            DispatchQueue.main.async() { [weak self] in
//                self!.heroImage = UIImage(data: data)!
//            }
//        }
//        return heroImage
//    }
//
//    convenience init(name: String, quotes: [String], image: UIImage) {
//        self.init()
//        self.heroName = name
//        self.heroQuotes = quotes
////        self.heroImage = image
//        self.heroImage = downloadImage(from: URL(string: "https://cdn.cloudflare.steamstatic.com/apps/dota2/images/dota_react/heroes/\(heroName).png")!)
//
////        heroImage = fetch()
//
//
//    }
//
////    func fetchImage() {
////        let image = heroImage
////    }
//}
//
//let allHeroes = [Hero]()
//
//
//
//
////class Place: Object {
////
////  @objc dynamic var name = ""
////  @objc dynamic var location: String?
////  @objc dynamic var type: String?
////  @objc dynamic var imageData: Data?
////  @objc dynamic var date = Date()
////    @objc dynamic var rating = 0.0
////
////    convenience init(name: String, location: String?, type: String?, imageData: Data?, rating: Double) {
////        self.init()
////        self.name = name
////        self.location = location
////        self.type = type
////        self.imageData = imageData
////        self.rating = rating
////    }
////}
