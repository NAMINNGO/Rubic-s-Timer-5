//
//  AddBestViewController.swift
//  Rubic's Timer-4
//
//  Created by 小柳　直秀 on 2021/08/24.
//

import UIKit

class AddBestViewController: UIViewController {
    
    @IBOutlet var hitokoto: UITextView!
    
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hitokoto.layer.cornerRadius = 10.00
        hitokoto.clipsToBounds = true
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func added() {
        let alert:UIAlertController = UIAlertController(title: "おめでとうございます！", message: "タイムをBest Timeに追加しました", preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { action in
                    self.dismiss(animated: true, completion: nil)
                }) )
        present(alert, animated: true, completion: nil)
        
        appDelegate.Best_ikkaime = 1
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (self.hitokoto.isFirstResponder) {
            self.hitokoto.resignFirstResponder()
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
