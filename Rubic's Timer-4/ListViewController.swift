//
//  ListViewController.swift
//  Rubic's Timer-4
//
//  Created by 小柳　直秀 on 2021/08/21.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    var timeArray_2 = [String]()
    var dateArray_2 = [String]()
    var scrambleArray_2 = [String]()
    
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        


        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
            table.reloadData()
        }
    
    //セルにタイムを表示させる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        tableView.rowHeight = 90
        
        timeArray_2 = appDelegate.timeArray
        dateArray_2 = appDelegate.dateArray
        scrambleArray_2 = appDelegate.scrambleArray
        
        let label_date = cell.viewWithTag(2) as! UILabel
        label_date.text = dateArray_2[indexPath.row]
        
        let label_time = cell.viewWithTag(1) as! UILabel
        label_time.text = timeArray_2[indexPath.row]
        
        let label_scramble = cell.viewWithTag(3) as! UILabel
        label_scramble.text = scrambleArray_2[indexPath.row]

        return cell
    }
    //セルの数を設定
           func tableView(_ tableView: UITableView, numberOfRowsInSection selection: Int) -> Int {
            return appDelegate.timeArray.count
           }
    
    @IBAction func resetList() {
        let alert:UIAlertController = UIAlertController(title: "削除しますか？", message: "リストの全てを削除しますか？", preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(
                title: "削除",
                style: .destructive,
                handler: { action in
                    self.timeArray_2 = []
                    self.appDelegate.timeArray = []
                    self.appDelegate.dateArray = []
                    self.appDelegate.scrambleArray = []
                    self.table.reloadData()
                }) )
        alert.addAction(
            UIAlertAction(
                title: "キャンセル",
                style: .default,
                handler: { action in
                }) )
        present(alert, animated: true, completion: nil)
        
    }
        
    //セルの編集許可
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }

    //スワイプしたセルを削除　
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            appDelegate.timeArray.remove(at: indexPath.row)
            timeArray_2 = appDelegate.timeArray
            dateArray_2.remove(at: indexPath.row)
            dateArray_2 = appDelegate.dateArray
            scrambleArray_2.remove(at: indexPath.row)
            scrambleArray_2 = appDelegate.scrambleArray
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
        }
        table.reloadData()
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
