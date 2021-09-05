//
//  TabBarViewController.swift
//  Rubic's Timer-4
//
//  Created by 小柳　直秀 on 2021/09/03.
//

import UIKit

class TabBarViewController: UIViewController {
    
    @IBOutlet var tabBar: UITabBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().barTintColor = UIColor.blue

        // Do any additional setup after loading the view.
    }
    
    class CustomTabBar: UITabBar {
     
        override func sizeThatFits(_ size: CGSize) -> CGSize {
            var sizeThatFits = super.sizeThatFits(size)
            sizeThatFits.height = 95
            return sizeThatFits;
        }
     
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
