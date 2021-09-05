//
//  TutorialViewController.swift
//  Rubic's Timer-4
//
//  Created by 小柳　直秀 on 2021/09/05.
//

import UIKit

class TutorialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.performSegue(withIdentifier: "toTutorial1", sender: nil)
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
