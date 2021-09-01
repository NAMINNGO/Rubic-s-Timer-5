//
//  BestFileViewController.swift
//  Rubic's Timer-4
//
//  Created by 小柳　直秀 on 2021/08/25.
//

import UIKit

class BestFileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var file: UITableView!
    
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var selectkey:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        file.dataSource = self
        file.delegate = self
        
        
        //初期値を設定
        appDelegate.saveBestFileDic.register(defaults: ["BestDic": ["＋でファイルを追加、スワイプで削除": []]])
        appDelegate.BestFileDic = appDelegate.saveBestFileDic.dictionary(forKey: "BestDic")!
        
        file.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
            file.reloadData()
        }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        //appDelegate.BestFileDic = appDelegate.saveBestFileDic.dictionary(forKey: "BestDic")!
        //BestFileDicのkeyのみをTableViewに表示
        cell?.textLabel?.text = [String](appDelegate.BestFileDic.keys)[indexPath.row]
        return cell!
    }
           func tableView(_ tableView: UITableView, numberOfRowsInSection selection: Int) -> Int {
            //appDelegate.BestFileDic = appDelegate.saveBestFileDic.dictionary(forKey: "BestDic")!
            return appDelegate.BestFileDic.keys.count
           }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
        {
            return true
        }
     
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == UITableViewCell.EditingStyle.delete {
                
                let alert:UIAlertController = UIAlertController(title: "削除しますか？", message: "ファイルを削除すると『\([String](appDelegate.BestFileDic.keys)[indexPath.row])』に含まれるデータも削除されます", preferredStyle: .alert)
                alert.addAction(
                    UIAlertAction(
                        title: "削除",
                        style: .destructive,
                        handler: { action in
                            self.appDelegate.BestFileDic["\([String](self.appDelegate.BestFileDic.keys)[indexPath.row])"] = nil
                            self.appDelegate.saveBestFileDic.set(self.appDelegate.BestFileDic, forKey: "BestDic")
                            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
                        }))
                alert.addAction(
                    UIAlertAction(
                        title: "キャンセル",
                        style: .default,
                        handler: { action in
                        }) )
                present(alert, animated: true, completion: nil)
            }
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //selectkeyに選択されているkeyを入れて、BesttimeViewControllerに受け渡す
        selectkey = "\([String](appDelegate.BestFileDic.keys)[indexPath.row])"
            // セルの選択を解除
            tableView.deselectRow(at: indexPath, animated: true)
            // BestTimeViewControllerに遷移
            performSegue(withIdentifier: "toBestTime", sender: nil)
        }
    
    //セグエを準備するときに呼ばれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toBestTime" {
            //値の受け渡しをするコード
            let BestTimeViewController = segue.destination as! BestTimeViewController
            BestTimeViewController.selectkey = self.selectkey
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
