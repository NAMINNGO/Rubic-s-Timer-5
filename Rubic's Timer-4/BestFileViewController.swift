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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        file.dataSource = self
        file.delegate = self
        
        appDelegate.saveBestFile.register(defaults: ["Best": ["下の＋で追加、スワイプで削除できます"]])
        
        file.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
            file.reloadData()
        }
     
    //セルにタイムを表示させる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")

        appDelegate.BestFile = appDelegate.saveBestFile.stringArray(forKey: "Best")!
        cell?.textLabel?.text = appDelegate.saveBestFile.stringArray(forKey: "Best")![indexPath.row]
        return cell!
    }
    //セルの数を設定
           func tableView(_ tableView: UITableView, numberOfRowsInSection selection: Int) -> Int {
            appDelegate.BestFile = appDelegate.saveBestFile.stringArray(forKey: "Best")!
            return appDelegate.BestFile.count
           }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
        {
            return true
        }
     
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == UITableViewCell.EditingStyle.delete {
                
                let alert:UIAlertController = UIAlertController(title: "削除しますか？", message: "ファイルを削除すると『\(appDelegate.BestFile[indexPath.row])』に含まれるデータも削除されます", preferredStyle: .alert)
                alert.addAction(
                    UIAlertAction(
                        title: "削除",
                        style: .destructive,
                        handler: { action in
                            let alert:UIAlertController = UIAlertController(title: "確認", message: "本当に削除しますか？ファイルを削除すると『\(self.appDelegate.BestFile[indexPath.row])』に含まれるデータも削除されます", preferredStyle: .alert)
                            alert.addAction(
                                UIAlertAction(
                                    title: "削除",
                                    style: .destructive,
                                    handler: { action in
                                        self.appDelegate.BestFile.remove(at: indexPath.row)
                                        self.appDelegate.saveBestFile.set(self.appDelegate.BestFile, forKey: "Best")
                                        tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
                                    }))
                            alert.addAction(
                                UIAlertAction(
                                    title: "キャンセル",
                                    style: .default,
                                    handler: { action in
                                    }) )
                            self.present(alert, animated: true, completion: nil)
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
     
            // セルの選択を解除
            tableView.deselectRow(at: indexPath, animated: true)
     
            // 別の画面に遷移
            performSegue(withIdentifier: "toBestTime", sender: nil)
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
