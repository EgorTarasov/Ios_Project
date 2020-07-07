//
//  ViewController.swift
//  About App
//
//  Created by Егор Тарасов on 07.07.2020.
//  Copyright © 2020 Егор Тарасов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    struct object {
        let Name : String
        let Description : String
        init (_ name : String, description : String){
            self.Name = name
            self.Description = description
        }
    }
    
    func clearLabels (_ Labels : [UILabel]){
        for label in Labels{
            label.text = " "
        }
    }
    
    func refreshData(_ Labels : [UILabel], data : [object]){
        for (index, object) in data.enumerated(){
            Labels[index].text = object.Name
        }
    }
    
    func showAlert(tittle : String, message : String){
        let alert = UIAlertController(title: tittle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    var Goals = [
        object("Найти команду", description: "Одному запретили делать проект"),
        object("Найти интересную идею", description: "То что уже есть странно делать"),
        object("Научиться нормально делать приложения", description: "Как все знают обучение в хорошей компании более продуктивно")
    ]
    
    var goal = ["Найти команду", "Найти интересную идею"]
    //, "Научиться нормально делать приложения"

    var Ideas : Set = [" "]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var IdeaInput: UITextField!
   
    @IBOutlet var Labels: [UILabel]!
    
    @IBAction func MainSwitch(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            //print("Ideas count \(Ideas.count)")
            //print(Labels.count)
            clearLabels(Labels)
            if Ideas.count == 0{
                Labels[0].text = "No Ideas"
            }
            else{
                print("!!!")
                for (index, string) in Ideas.enumerated(){
                    Labels[index].text = string
                }
            }
            
        default:
            //print("Goals count \(Goals.count)")
            //print(Labels.count)
            clearLabels(Labels)
            
        }
        
    }
    
    
    @IBAction func AddButton(_ sender: UIButton) {
        let new_idea = IdeaInput.text
        
        if let str_idea = new_idea {
            if Ideas.contains(str_idea){
                showAlert(tittle: "Already exsisting", message: " ")
            }
            else{
                Ideas.insert(str_idea)
            }
            
        }
    }
    

}

