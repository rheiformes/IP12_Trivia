//
//  ViewController.swift
//  IP12_Trivia
//
//  Created by Rai, Rhea on 2/13/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet var userCategoryPicker: UIPickerView!
    
    
    var userNumQuestions: Int = 0
    var userCategory: String = ""

    var doublePicker: [[String]] = []
    //var chosenCategory: String = ""
    //var chosenNumQuestions: Int = 1
    @IBOutlet var chosenCatNumDisplayLbl: UILabel!
    /* MUST RUN AT THE BEGGINING */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //picker
        try! setPickerInitial()
        self.userCategoryPicker.delegate = self
        self.userCategoryPicker.dataSource = self
        //self.userCategoryPicker
    }

    
    /* SET UP THE PICKERS */
    
    //DONE: make this a double picker
    //DONE: figure out how to dynamically change the # based on cat chosen in picker
    //DONE: fix the main storyboard so it just has 1 double picker:
    
    //note - using this for example: https://codewithchris.com/uipickerview-example/

    func setPickerInitial()  throws {
        Trivia.chosenCategory = Trivia.getCategories()[0] //temp: start at 1st cat
        Trivia.chosenNumQuestions = 1
        self.doublePicker = [Trivia.getCategories(),
                             makeNumberedStringArray(count: try Trivia.getQuestionCountofCategory(categoryName: Trivia.chosenCategory))]
        self.userCategoryPicker.selectRow(0, inComponent: 0, animated: true)
        updateUI()
    }
    
    func makeNumberedStringArray(count: Int) -> [String] {
        var numberedStringArray: [String] = [""]
        for i in 1...count {
            numberedStringArray.insert(String(i), at: i-1)
        }
        return numberedStringArray
    }
    
    
    //number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2 //for the 2 options: category and num
    }
    
    //number of roaws of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //print ("PV 1 called")
        return doublePicker[component].count
        
    }
    
    
    // data that's returned
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?  {
        //print("called PV")
        //print ( "PV 2 called" )
        return doublePicker[component][row]
    }
    
    //detect what the user enters. triggered any time the picker is changed
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
        //TODO: figure out why this doesn't work
        //print(self.doublePicker)
        print ( "component: \(component), row: \(row)")
        
        if component == 0 {
            let selectedCategory: String = Trivia.getCategories()[row]
            print(selectedCategory)
            if selectedCategory != Trivia.chosenCategory {
                Trivia.chosenCategory = selectedCategory
                
                self.doublePicker = [Trivia.getCategories(),
                                     makeNumberedStringArray(count:   try! Trivia.getQuestionCountofCategory(categoryName: Trivia.chosenCategory))]
                
            }
        }
        else if component == 1 {
            Trivia.chosenNumQuestions = row + 1 //since it's indexed from 0
            if Trivia.chosenNumQuestions >  (try! Trivia.getQuestionCountofCategory(categoryName: Trivia.chosenCategory)) {
                Trivia.chosenNumQuestions =  try! Trivia.getQuestionCountofCategory(categoryName: Trivia.chosenCategory)
            }
            else if Trivia.chosenNumQuestions < 1 {
                Trivia.chosenNumQuestions = 1
            }
                
        }
        
        print ("category: \(Trivia.chosenCategory), with questions: \(Trivia.chosenNumQuestions)")
        updateUI()
        
        /*
        
     */
    }
    
    func updateUI() {
        var tempString = "\(Trivia.chosenCategory) with \(String (Trivia.chosenNumQuestions)) question"
        if (Trivia.chosenNumQuestions > 1) {
            tempString.append("s")
        }
        chosenCatNumDisplayLbl.text = tempString
        
        
    }
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}

