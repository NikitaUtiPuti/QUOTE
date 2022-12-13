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
    
    let allHeroes = [Hero(name: "abaddon", quotes: ["Тот, кто крещён в купели Аверно видит смерть иначе.", "Завеса жизни и смерти теперь не столь                      таинственна.", "Узрите продолжателя династии Аверно и трепещите!"]),
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
                     Hero(name: "brewmaster", quotes: [" Raise em high, friends!", "What kind of pub is this?", "What's wrong? Can't hold your liquor? . . Hello?"])
                     
                                                                                                
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    ]
    
    var items = 4
    let itemsPerRow: CGFloat = 2
    let sectionInesrts = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "heroCell", for: indexPath) as! HeroCell
        
        DispatchQueue.main.async {
        
        cell.heroImageView.frame = cell.contentView.frame
        cell.heroImageView.contentMode = .scaleToFill
    
        let heroes = self.allHeroes[indexPath.item]
        let image = heroes.heroImage
            
        cell.heroImageView.image = image
            if cell.heroImageView.image == UIImage() {
                cell.isHidden = true
                collectionView.reloadData()
            } else { cell.isHidden = false }
        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        collectionView.layer.position = CGPoint(x: view.center.x, y: view.center.y)
        
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
