//
//  Tut3ViewController.swift
//  Rubic's Timer-4
//
//  Created by 小柳　直秀 on 2021/09/05.
//

import UIKit

class Tut3ViewController: UIViewController {
    
    @IBOutlet var tap_1: UIImageView!
    @IBOutlet var tap_2: UIImageView!
    @IBOutlet var tap_3: UIImageView!
    @IBOutlet var yazirusi_1: UIImageView!
    @IBOutlet var yazirusi_2: UIImageView!
    @IBOutlet var yazirusi_3: UIImageView!
    @IBOutlet var button_next: UIButton!
    
    //label_1
    private lazy var label_1: CLTypingLabel = {
            let label = CLTypingLabel()
            label.font = .systemFont(ofSize: 50, weight: .medium)
            label.charInterval = 0.08
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    //label_2
    private lazy var label_2: CLTypingLabel = {
            let label = CLTypingLabel()
            label.font = .systemFont(ofSize: 20, weight: .medium)
            label.charInterval = 0.08
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    //label_3
    private lazy var label_3: CLTypingLabel = {
            let label = CLTypingLabel()
            label.font = .systemFont(ofSize: 20, weight: .medium)
            label.charInterval = 0.08
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    //label_4
    private lazy var label_4: CLTypingLabel = {
            let label = CLTypingLabel()
            label.font = .systemFont(ofSize: 20, weight: .medium)
            label.charInterval = 0.08
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    //label_5
    private lazy var label_5: CLTypingLabel = {
            let label = CLTypingLabel()
            label.font = .systemFont(ofSize: 20, weight: .medium)
            label.charInterval = 0.08
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tap_1.isHidden = true
        self.tap_2.isHidden = true
        self.tap_3.isHidden = true
        self.yazirusi_1.isHidden = true
        self.yazirusi_2.isHidden = true
        self.yazirusi_3.isHidden = true
        self.button_next.isHidden = true
        
        self.button_next.layer.cornerRadius = 10.0
        
        //label_1
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.view.addSubview(self.label_1)
            //Auto Layout
            self.label_1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.label_1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100.0).isActive = true
            self.label_1.text = "計測しよう！"
        }
        
        //label_2
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.view.addSubview(self.label_2)
            //Auto Layout
            self.label_2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.label_2.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 230.0).isActive = true
            self.label_2.text = "タップして進む"
            
            self.tap_1.isHidden = false
            self.yazirusi_1.isHidden = false
            self.animateView(self.tap_1)
            self.animateView(self.yazirusi_1)
        }
        
        //label_3
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.view.addSubview(self.label_3)
            //Auto Layout
            self.label_3.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.label_3.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 420.0).isActive = true
            self.label_3.text = "カウントダウン15秒（見る）"
            
            self.tap_2.isHidden = false
            self.yazirusi_2.isHidden = false
            self.animateView(self.tap_2)
            self.animateView(self.yazirusi_2)
        }
        
        //label_4
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
            self.view.addSubview(self.label_4)
            //Auto Layout
            self.label_4.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.label_4.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 600.0).isActive = true
            self.label_4.text = "タイムを計測(解く)"
            
            self.tap_3.isHidden = false
            self.yazirusi_3.isHidden = false
            self.animateView(self.tap_3)
            self.animateView(self.yazirusi_3)
        }
        
        //label_5
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.8) {
            self.view.addSubview(self.label_5)
            //Auto Layout
            self.label_5.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.label_5.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 750.0).isActive = true
            self.label_5.text = "ストップ（計測終了）"
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.3) {
        
            self.button_next.isHidden = false
            self.animateView(self.button_next)
        }


        // Do any additional setup after loading the view.
    }
    
    @IBAction func next() {
        let transition = CATransition()
           transition.duration = 0.25
           transition.type = CATransitionType.push
           transition.subtype = CATransitionSubtype.fromRight
           view.window!.layer.add(transition, forKey: kCATransition)
        self.performSegue(withIdentifier: "toTutorial3", sender: nil)
    }
    
    //フェードインのアニメーション
    func animateView(_ viewAnimate: UIView) {
        UIView.animate(withDuration: 0.8, delay: 0.2, options: .curveEaseIn) {
                        viewAnimate.alpha = 1
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
