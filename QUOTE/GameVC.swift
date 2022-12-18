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
        quizUpdate()
        navigationItem.hidesBackButton = true
        navigationItem.title = "Guess the hero!"
//        self.timeLeftProgress.setProgress(1, animated: true)
            }
    
    @IBOutlet weak var timeLeftProgress: UIProgressView!
    @IBOutlet weak var heroQuoteLabel: UILabel!
    
    var quiz = Quiz()
    var quizHeroes = [Hero]()

//    var items = 4
    
    let itemsPerRow: CGFloat = 2
    let sectionInesrts = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    
    func quizUpdate() {
        let heroes = quiz.getHeroes()
        quizHeroes = heroes
        heroQuoteLabel.text = quiz.getQuote()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quizHeroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "heroCell", for: indexPath) as! HeroCell
        
        cell.layer.cornerRadius = 15
        cell.layer.borderWidth = 3                                                    //Кастом ячейки
        cell.layer.borderColor = UIColor(red: 1.00, green: 0.79, blue: 0.28, alpha: 1.00).cgColor
        
        DispatchQueue.main.async {
        
        cell.heroImageView.frame = cell.contentView.frame
        cell.heroImageView.contentMode = .scaleToFill
    
        let heroes = self.quizHeroes[indexPath.item]          //Vremenno
        let image = heroes.heroImage
            
        cell.heroImageView.image = image
            
            if cell.heroImageView.image == UIImage() {
                cell.isHidden = true
                collectionView.reloadData()                  //В случае невозможности загрузки
            } else { cell.isHidden = false }
        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        collectionView.backgroundColor = .clear
        
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
        
        _ = Timer.scheduledTimer(withTimeInterval: 0.09, repeats: true) { [self] timer in
            print("timer fired!")

            guard quizHeroes.count != 0 else {  timer.invalidate()
                quiz.removeHeroes()
                quizUpdate()
                collectionView.reloadData()
                                                return }
            

//            guard self.items != 0 else { timer.invalidate()
//                                                    return }
//            self.items -= 1
            
            quizHeroes.removeFirst()
            
            let theIndex = IndexPath(row: 0, section: 0)
            collectionView.deleteItems(at: [theIndex])          // Удаляет всегда одну и ту же ячейку до конца
//          collectionView.deleteItems(at: [indexPath])         // Удаляет выбранный элемент
        }
    }
}
