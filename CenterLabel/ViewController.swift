//
//  ViewController.swift
//  CenterLabel
//
//  Created by Vitaly Khryapin on 22.10.2021.
//

import UIKit
struct ChemicalElement {
    let symbol: String
    let name: String
    let atomicWeight: Int
    let imageName: String
}
class ViewController: UIViewController {
    var elementList: [ChemicalElement] = []
    var currentElementIndex = 0
    let elementImageName = ["1"]
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateItems()
        elementList.shuffle()
        updateElement()
    }
    func generateItems () {
        let element1  = ChemicalElement(symbol: "Ca", name: "Carbon", atomicWeight: 6, imageName: "Carbon")
        elementList.append(element1)
        let element2 = ChemicalElement(symbol: "Au", name: "Gold", atomicWeight: 3, imageName: "Gold")
        elementList.append(element2)
        let element3 = ChemicalElement(symbol: "Ch", name: "Chlorine", atomicWeight: 5, imageName: "Chlorine")
        elementList.append(element3)
        let element4 = ChemicalElement(symbol: "Sd", name: "Sodium", atomicWeight: 7, imageName: "Sodium")
        elementList.append(element4)
        
    }
    func updateElement(){
        answerLabel.text = "???"
        let item  = elementList[currentElementIndex]
        let image = UIImage(named: item.name)
        imageView.image = image
    }
    
    @IBAction func showAnswerButtonPressed(_ sender: Any) {
        answerLabel.text = " \(elementList[currentElementIndex].name)"
    }
    
    @IBAction func nextElementDidPressed(_ sender: Any) {
        currentElementIndex += 1
        if currentElementIndex >= elementList.count {
            currentElementIndex = 0
        }
        updateElement()
    }
}

