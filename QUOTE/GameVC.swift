//
//  GameVC.swift
//  QUOTE
//
//  Created by Никита Зюзин on 16.11.2022.
//

import UIKit

class GameVC: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationItem.title = "Guess the hero!"
//        self.timeLeftProgress.setProgress(1, animated: true)
        
            }
    
    
    @IBOutlet weak var timeLeftProgress: UIProgressView!
    
    @IBOutlet weak var heroQuoteLabel: UILabel!
    
    let allHeroes = [Hero(name: "axe", quotes: ["Kiss piss", "Axe is back", "Culling"]),
                     Hero(name: "obsidian_destroyer", quotes: ["Destroy", "You awful", "Catch if you can"]),
                     Hero(name: "dark_willow", quotes: ["willow", "pillow", "sealow"]),
                     Hero(name: "alchemist", quotes: ["Alachemy!", "My friend!", "Gold!"])]
    
    let centaurWarrunerQuotes = ["Колбаса не пахнет","Беги со всех ног","Отсоси потом проси"]
    let pugnaQuotes = ["Красный наш зеленый общий","Давай побеспределим","Поехали пагораду ежже"]
    let outworldDestroyerQuotes = ["Я дестройер!","Заключу тебя в тюрьму","Убегай глупец!"]
    let kunkkaQuotes = ["Сила морей!", "Сокрушу тебя водой", "Океан на моей стороне"]
//    
    let heroPictures = ["pugnaPic", "centaurWarrunerPic", "outworldDestroyerPic", "kunkkaPic"]
    
    func createQuiz() {
        
        var fourHeroPics = [heroPictures.randomElement()]
        
        
        while fourHeroPics.count != 4 {
            fourHeroPics.append(heroPictures.randomElement())
        }
        
        
    }
//    
//    let text = "Колбаса не пахнет"
    
    var items = 4
    let itemsPerRow: CGFloat = 2
    let sectionInesrts = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    
//    func checkAnswer() -> Bool {
//
//        let allQuotes = [centaurWarrunerQuotes, pugnaQuotes]
//
//        allQuotes.contains(text) {
//        if centaurWarrunerQuotes.contains(text) {
//            print("Фраза кентавра")
//            return true
//        }   else {print("Фраза пугны") }
//        return false
//    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "heroCell", for: indexPath) as! HeroCell
        
        
//        cell.heroImageView.bounds = cell.contentView.bounds
//        cell.heroImageView.frame = cell.contentView.frame
//        cell.heroImageView.contentMode = .scaleToFill
        
        
        DispatchQueue.main.async {
            
        cell.heroImageView.frame = cell.contentView.frame
        cell.heroImageView.contentMode = .scaleToFill
            
        guard self.allHeroes.last?.heroImage != nil else {return}
        let heroes = self.allHeroes[indexPath.item]
        let image = heroes.heroImage
        

        cell.heroImageView.image = image
       
        
        }
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        collectionView.layer.position = CGPoint(x: view.center.x, y: view.center.y)
//        collectionView.frame.size.width = view.bounds.width - 85
//        collectionView.frame.size.height = view.bounds.height / 2 - 25
        
        let paddingWidth = sectionInesrts.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        let heightPerItem = widthPerItem - 35
        
        collectionView.frame.size.width = paddingWidth + availableWidth
        collectionView.frame.size.height = paddingWidth + availableWidth - 70
        
       return CGSize(width: widthPerItem, height: heightPerItem)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInesrts
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInesrts.left
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInesrts.left
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        
        
        _ = Timer.scheduledTimer(withTimeInterval: 0.09, repeats: true) { timer in
            print("timer fired!")

//            guard [indexPath] != [] else { timer.invalidate()
//                                                    return }

            guard self.items != 0 else { timer.invalidate()
                                                    return }

            self.items -= 1
            let theIndex = IndexPath(row: 0, section: 0)
                    collectionView.deleteItems(at: [theIndex]) // Удаляет всегда одну и ту же ячейку до конца
//            collectionView.deleteItems(at: [indexPath()]) // Удаляет выбранный элемент
    
        }
    }
}
