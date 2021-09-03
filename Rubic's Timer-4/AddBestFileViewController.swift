//
//  AddBestFileViewController.swift
//  Rubic's Timer-4
//
//  Created by 小柳　直秀 on 2021/08/25.
//

import UIKit

class AddBestFileViewController: UIViewController {
    
    @IBOutlet var button_addedFile: UIButton!
    @IBOutlet var FileName: UITextField!
    
    var newFileName = ""
    
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.button_addedFile.layer.cornerRadius = 10.00
        appDelegate.BestFileDic = appDelegate.saveBestFileDic.dictionary(forKey: "BestDic")!

        //Do any additional setup after loading the view.
    }
        
    
    @IBAction func addedFile() {
        
        if FileName.text == ""{
            let alert:UIAlertController = UIAlertController(title: "ファイル名を入力してください", message: "ファイル名が入力されていません", preferredStyle: .alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: .default,
                    handler: { action in
                    }))
            present(alert, animated: true, completion: nil)
        }else if appDelegate.BestFileDic.keys.contains(FileName.text!) == false{
            newFileName = FileName.text!
            appDelegate.BestFileDic["\(newFileName)"] = []
            appDelegate.saveBestFileDic.set(appDelegate.BestFileDic, forKey: "BestDic")
            
            let alert:UIAlertController = UIAlertController(title: "ファイルを追加しました", message: "ファイル名は『\(newFileName)』です", preferredStyle: .alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: .default,
                    handler: { action in
                        self.dismiss(animated: true, completion: nil)
                    }) )
            present(alert, animated: true, completion: nil)
            
            
        }else{
            let alert:UIAlertController = UIAlertController(title: "ファイル名を変更してください", message: "同じ名前のファイルがすでに存在しています。名前を変えてください。", preferredStyle: .alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: .default,
                    handler: { action in
                    }))
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func cancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (self.FileName.isFirstResponder) {
            self.FileName.resignFirstResponder()
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
