//
//  AddBestViewController.swift
//  Rubic's Timer-4
//
//  Created by 小柳　直秀 on 2021/08/24.
//

import UIKit

class AddBestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet var hitokoto: UITextView!
    @IBOutlet var button_add: UIButton!
    @IBOutlet var SelectFile: UITableView!
    
    var timeArray = [String]()
    var sentaku:Int = 0
    var count:Float = 0.00
    var selectArray = [String]()
    var kosuu:Int = 0
    var index: Int = 0
    
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hitokoto.layer.cornerRadius = 10.00
        self.button_add.layer.cornerRadius = 10.00
        hitokoto.clipsToBounds = true
        
        SelectFile.dataSource = self
        SelectFile.delegate = self
        
        sentaku = 0
        //初期値を設定
        appDelegate.saveBestFileDic.register(defaults: ["BestDic": ["＋でファイルを追加、スワイプで削除": []]])
        appDelegate.BestFileDic = appDelegate.saveBestFileDic.dictionary(forKey: "BestDic")!
        
        SelectFile.allowsMultipleSelection = true
        
        SelectFile.reloadData()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (self.hitokoto.isFirstResponder) {
            self.hitokoto.resignFirstResponder()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection selection: Int) -> Int {
     return appDelegate.BestFileDic.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "file")
        cell?.textLabel?.text = [String](appDelegate.BestFileDic.keys)[indexPath.row]
        
               //自分で色を設定したい場合は、タップ時の色を指定したUIViewを代入
               let selectionView = UIView()
               //タップすると赤色になる
               selectionView.backgroundColor = UIColor.yellow
               selectionView.tintColor = UIColor.blue
               cell?.selectedBackgroundView = selectionView

        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            sentaku = 1
            let cell = tableView.cellForRow(at:indexPath)
            //チェックマークをつける
            cell?.accessoryType = .checkmark
        selectArray.append("\([String](appDelegate.BestFileDic.keys)[indexPath.row])")
            
        }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
            let cell = tableView.cellForRow(at:indexPath)
        
        selectArray.removeAll(where: {$0 == "\([String](appDelegate.BestFileDic.keys)[indexPath.row])"})
            // チェックマークを外す
            cell?.accessoryType = .none
        }
    
    @IBAction func added() {
        if sentaku == 1{
            print("selectArray : \(selectArray)")
            kosuu = selectArray.count
            index = 0
            while kosuu > 0{
                
                timeArray = appDelegate.BestFileDic["\(selectArray[index])"] as! [String]
                print("timeArray前 : \(timeArray)")
                timeArray.append(String(format: "%.3f", count))
                timeArray.sort{$0 < $1}
                appDelegate.BestFileDic["\(selectArray[index])"] = timeArray
                print("timeArray後 : \(timeArray)")
                index += 1
                kosuu -= 1
            }
            
            appDelegate.saveBestFileDic.set(appDelegate.BestFileDic, forKey: "BestDic")
            
        let alert:UIAlertController = UIAlertController(title: "追加しました！", message: "タイムをBest Timeに追加しました", preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { action in
                    self.dismiss(animated: true, completion: nil)
                }) )
        present(alert, animated: true, completion: nil)
            
        appDelegate.Best_ikkaime = 1
        }else{
            let alert:UIAlertController = UIAlertController(title: "ファイルを選択してください", message: "追加するファイルが選択されていません", preferredStyle: .alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: .default,
                    handler: { action in
                        self.dismiss(animated: true, completion: nil)
                    }) )
            present(alert, animated: true, completion: nil)
        }
}
    @IBAction func cancel() {
        self.dismiss(animated: true, completion: nil)
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
