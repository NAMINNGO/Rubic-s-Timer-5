//
//  TutorialViewController.swift
//  Rubic's Timer-4
//
//  Created by 小柳　直秀 on 2021/09/05.
//

import UIKit

class TutorialViewController: UIViewController {
    
    var Count: Int = 0
    
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate.saveCount.register(defaults: ["Cpunt": 0])
        Count = appDelegate.saveCount.integer(forKey: "Count")
        if Count == 0{
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.performSegue(withIdentifier: "toTutorial1", sender: nil)
            }
            
            Count += 1
            appDelegate.saveCount.set(Count, forKey: "Count")
        }else{
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.performSegue(withIdentifier: "toHome", sender: nil)
            }
            
            Count += 1
            appDelegate.saveCount.set(Count, forKey: "Count")
        }

        // Do any additional setup after loading the view.
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
