//
//  TriviaView.swift
//  IP12_Trivia
//
//  Created by Rai, Rhea on 2/15/23.
//

import UIKit

class TriviaView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resetRound()
    }
    
    func resetRound() {
        
    }
    
    func loadNewQuestion() {
        
    }
    
    func timerRunner(){
        
    }
    
    func increaseScore(){
        
    }
    
    func increaseProgress() {
        
        
        adjustProgressView()
        
        if (hasReachedLastQuestion()) {
            endRound()
        }
        else {
            loadNewQuestion()
        }
    }
    
    func adjustProgressView() {
        
    }
    
    func hasReachedLastQuestion() -> Bool {
     
        
        
        return false
    }
    
    func endRound() {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
