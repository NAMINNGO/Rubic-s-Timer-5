//
//  ViewController.swift
//  Rubic's Timer-4
//
//  Created by 小柳　直秀 on 2021/08/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    //ラベルの宣言
    @IBOutlet var label_Ready: UILabel!
    @IBOutlet var label_Timer: UILabel!
    @IBOutlet var label_Count: UILabel!
    @IBOutlet var label_average: UILabel!
    @IBOutlet var button_reset: UIButton!
    @IBOutlet var label_var: UILabel!
    @IBOutlet var label_var_label: UILabel!
    @IBOutlet var label_Average_label: UILabel!
    @IBOutlet var label_kaisuu: UILabel!
    @IBOutlet var label_Best_label: UILabel!
    @IBOutlet var label_bestTime: UILabel!
    @IBOutlet var label_scramble: UILabel!
    @IBOutlet var button_next: UIButton!
    @IBOutlet var button_addBest: UIButton!
    
    //変数の宣言
    //main
    var main_count: Float = 0.0
    var main_timer: Timer = Timer()
    //countdown
    var countdown_count: Int = 0
    var countdown_timer: Timer = Timer()
    //average系
    var total:Float = 0.0
    var average:Float = 0.0
    var times:Float = 0.0
    var times_2:Float = 0.0
    
    var now: Int = 0
    var fontsise:Float = 0.0
    var fontsise_2:CGFloat = 0.0
    var count_sishagonyu:Float = 0.0
    var BestTime: Float = 0.0
    var ikkaime: Int = 0
    var tapNumber: Int = 0
    //scramble
    var scrambleArray_1: [String] = []
    var scrambleArray_2: [String] = []
    var scramble_3: String = ""
    var scramble_count: Int = 0
    var scramble_5: String = ""
    
    
    
    var kaburi: Int = 6
    var random: Int = 6
    
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let SoundPlayer_1 = try! AVAudioPlayer(data: NSDataAsset(name: "警告音1")!.data)
    let SoundPlayer_2 = try! AVAudioPlayer(data: NSDataAsset(name: "警告音2")!.data)
       
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
        self.button_reset.layer.cornerRadius = 45.00
        self.button_next.layer.cornerRadius = 10.00
        self.button_addBest.layer.cornerRadius = 10.00
        
        button_addBest.isHidden = true
    
        
        ikkaime = 0
        
        scramble()        
    }
    

    @IBAction func TouchDown() {
        
        if tapNumber ==  2{
            
            main_timer.invalidate()
            
            label_Timer.textColor = UIColor.black
            
            count_sishagonyu = round(main_count * 1000) / 1000
            
            //ListViewContrillerへ
            //記録
            appDelegate.timeArray.insert(String(count_sishagonyu), at:0)
            //日付
            let date = Date()
            let dateFormatter = DateFormatter()
            // DateFormatter を使用して書式とロケールを指定する
            dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "y/M/d", options: 0, locale: Locale(identifier: "ja_JP"))
            appDelegate.dateArray.insert((dateFormatter.string(from: date)), at:0)
            
            
        }else if tapNumber == 1 {
            now = 2
            label_Count.text = ""
            label_Ready.text = "Ready?"
            label_Ready.textColor = UIColor.red
            
                button_reset.isHidden = true
                label_Average_label.isHidden = true
                label_kaisuu.isHidden = true
                label_average.isHidden = true
                label_Best_label.isHidden = true
                label_bestTime.isHidden = true
                label_var.isHidden = true
                label_var_label.isHidden = true
                button_next.isHidden = true
            
            label_scramble.text = ""
            main_count = 0.00
        }else if tapNumber == 0 {
            now = 0
        }
        
    }
    
    @IBAction func TouchUpInside() {
        if tapNumber == 1 {
            label_Ready.text = "Go!!"
            label_Ready.textColor = UIColor.cyan
            
            main_timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true
                                         )
            countdown_timer.invalidate()
            countdown_count = 0
            
            appDelegate.scrambleArray.insert(String(scramble_5), at:0)
            
            //0.5秒後に消す
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.label_Ready.text = String("")
            }
            tapNumber = 2
        }else if tapNumber == 2{
                
                label_Timer.textColor = UIColor.white
                times = times + 1
                total = total + main_count
                average = total / times
                label_average.text = String(format: "%.3f", average)
                label_var.text = String(format: "%.0f", times)
            appDelegate.Best_ikkaime = 0
 
            while fontsise >= 10{
                fontsise = fontsise / 10
                fontsise_2 = fontsise_2 + 1.0
            }
            label_Timer.font = UIFont.italicSystemFont(ofSize: 340.0 / fontsise_2)
            
            if ikkaime == 0 {
                ikkaime = 1
                BestTime = main_count
            }else{
                if BestTime > main_count {
                    BestTime = main_count
                }
            }
            label_bestTime.text = String(format: "%.3f", BestTime)
            
                button_reset.isHidden = false
                label_Average_label.isHidden = false
                label_kaisuu.isHidden = false
                label_average.isHidden = false
                label_Best_label.isHidden = false
                label_bestTime.isHidden = false
                label_var.isHidden = false
                label_var_label.isHidden = false
                button_next.isHidden = false
                button_addBest.isHidden = false
            
            scramble()
                
                    tapNumber = 0
        }else if tapNumber == 0{
                
                countdown_timer = Timer.scheduledTimer(timeInterval: 1,
                                             target: self,
                                             selector: #selector(self.down),
                                             userInfo: nil,
                                             repeats: true
                                             )
                
                label_Timer.text = ""
                self.label_Ready.text = ""
            button_addBest.isHidden = true
            tapNumber = 1
            }
            
        
    }
    @objc func up() {
        //countを0.01足す
        main_count = main_count + 0.01
        
        //ラベルに小数点以下2桁まで表示
        label_Timer.textColor = UIColor.white
                fontsise = main_count
                fontsise_2 = 3.0
        

            self.label_Timer.text = String(format: "%.3f", main_count)
            while fontsise >= 10{
                fontsise = fontsise / 10
                fontsise_2 = fontsise_2 + 1.0
            }
            label_Timer.font = UIFont.italicSystemFont(ofSize: 340.0 / fontsise_2)
    }
    
    @objc func down() {
        //count_2を1足す
        if now < 2{
            if countdown_count <= 15{
        countdown_count += 1
        self.label_Count.text = String(16 - countdown_count)
        if countdown_count >= 13 {
        label_Count.textColor = UIColor.orange
            SoundPlayer_1.currentTime = 0
            SoundPlayer_1.play()
        }else{
            label_Count.textColor = UIColor.green
        }
            }else{
                self.label_Count.text = String("!?!")
                label_Count.textColor = UIColor.red
                
                SoundPlayer_2.currentTime = 0
                SoundPlayer_2.play()
                now = now + 1
            }
        }
    }
    
    @IBAction func reset(){
        times = 0
            total = 0
            label_average.text = String("------")
        label_var.text = String("-")
        label_bestTime.text = String("------")
        ikkaime = 0
    }
    
    func scramble() {
        scrambleArray_1 = ["U", "F", "R", "D", "B", "L"]
        scrambleArray_2 = ["  ", "'  ", "2  ", "w  "]
        scramble_count = 0
        scramble_5 = ""
        
        while scramble_count <= 17{
            while random == kaburi{
            random = Int.random(in: 0...5)
                }
            kaburi = random
            let scrambleArray_1Index = random
            let scrambleArray_2Index = Int.random(in: 0...3)
            scramble_3 = ("\(scrambleArray_1[scrambleArray_1Index])\(scrambleArray_2[scrambleArray_2Index])")
            scramble_count += 1
            scramble_5 = ("\(scramble_5)\(scramble_3)")
    }
        label_scramble.text = ("\(scramble_5)")
        label_scramble.textColor = UIColor.white
    }
    
    @IBAction func next_scramble() {
        if tapNumber == 0{
            scramble()
        }
    }
    
    @IBAction func addBestTime() {
        //appDelegate.bestTime333Array.insert(String(format: "%.3f", main_count), at:0)
        //appDelegate.bestTime333Array.sort{$0 < $1}
        if appDelegate.Best_ikkaime == 0 {
            self.performSegue(withIdentifier: "toAddBest", sender: nil)
        }else{
            let alert:UIAlertController = UIAlertController(title: "登録済みです！", message: "このタイムはすでにBest Timeに追加されました", preferredStyle: .alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: .default,
                    handler: { action in
                    }) )
            present(alert, animated: true, completion: nil)
        }
        
    }
}
