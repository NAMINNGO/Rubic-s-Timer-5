//
//  SelectTabBarViewController.swift
//  Rubic's Timer-4
//
//  Created by 小柳　直秀 on 2021/09/04.
//

import UIKit

class SelectTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = 0
        
        UITabBar.appearance().barTintColor = UIColor {_ in return #colorLiteral(red: 0.05765397102, green: 0.06810028106, blue: 0.1971357465, alpha: 1)}

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
