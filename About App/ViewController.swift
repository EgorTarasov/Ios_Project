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
    
    func refreshDataObjects(_ Labels : [UILabel], data : [object]){
        for (index, object) in data.enumerated(){
            Labels[index].text = object.Name
        }
    }
    
    func refreshDataSet(_ Labels : [UILabel], data : Set<String>){
        for (index, string) in data.enumerated(){
            Labels[index].text = string
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

    var Ideas : Set<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshDataSet(Labels, data : Ideas)
        clearLabels(Labels)

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
                //print(Ideas.count)
                //print(Ideas)
                refreshDataSet(Labels, data : Ideas)
                //for (index, string) in Ideas.enumerated(){
                //    Labels[index].text = string
                //}
            }
            
        default:
            //print("Goals count \(Goals.count)")
            //print(Labels.count)
            clearLabels(Labels)
            refreshDataObjects(Labels, data : Goals)
            
            
        }
        
    }
    
    
    @IBAction func AddButton(_ sender: UIButton) {
        
        let new_idea = IdeaInput.text
        
        if let str_idea = new_idea {
            if Ideas.count + 1 == Labels.count{
                showAlert(tittle: "Maximum number of Ideas", message: "")
            }
            else if str_idea == ""{
                showAlert(tittle: "Text field is empty", message: " ")
            }
            else if Ideas.contains(str_idea){
                showAlert(tittle: "Already exsisting Idea", message: " ")
            }
            else{
                Ideas.insert(str_idea)
                clearLabels(Labels)
                refreshDataSet(Labels, data : Ideas)    
            }
            
        }
        else{
            showAlert(tittle: "New idea error", message: "Не знаю как и почему видимо Optional не обработался ")
        }
    }
    
    @IBAction func ReserIdeas(_ sender: UIButton) {
        Ideas = []
        clearLabels(Labels)
        Labels[0].text = "No Ideas"
    }
    

}

