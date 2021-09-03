//
//  BestTimeViewController.swift
//  Rubic's Timer-4
//
//  Created by 小柳　直秀 on 2021/08/28.
//

import UIKit

class BestTimeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var time: UITableView!
    
    var selectkey:String = ""
    var timeArray = [String]()
    
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        time.dataSource = self
        time.delegate = self
        
        timeArray = appDelegate.BestFileDic["\(selectkey)"] as! [String]

        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection selection: Int) -> Int {
        return timeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")

        cell?.textLabel?.text = timeArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == UITableViewCell.EditingStyle.delete {
                
                let alert:UIAlertController = UIAlertController(title: "削除しますか？", message: "タイムをBestTimeから削除しますか？", preferredStyle: .alert)
                alert.addAction(
                    UIAlertAction(
                        title: "削除",
                        style: .destructive,
                        handler: { action in
                            self.timeArray.remove(at: indexPath.row)
                            self.appDelegate.BestFileDic["\([String](self.appDelegate.BestFileDic.keys)[indexPath.row])"] = self.timeArray
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
    
    
    @IBAction func back() {
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
