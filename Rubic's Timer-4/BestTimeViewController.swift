//
//  BestTimeViewController.swift
//  Rubic's Timer-4
//
//  Created by 小柳　直秀 on 2021/08/28.
//

import UIKit

class BestTimeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var time: UITableView!
    
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        
        time.dataSource = self
        time.delegate = self

        // Do any additional setup after loading the view.
    }
    
    //仮　本当は、Best Timeの前ページで押されたものによって表示を変えなければならない
    func tableView(_ tableView: UITableView, numberOfRowsInSection selection: Int) -> Int {
     return appDelegate.timeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")

        appDelegate.BestFile = appDelegate.saveBestFile.stringArray(forKey: "Best")!
        cell?.textLabel?.text = appDelegate.saveBestFile.stringArray(forKey: "Best")![indexPath.row]
        return cell!
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
