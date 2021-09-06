//
//  Tut4ViewController.swift
//  Rubic's Timer-4
//
//  Created by 小柳　直秀 on 2021/09/05.
//

import UIKit

class Tut4ViewController: UIViewController {
    
    @IBOutlet var Image: UIImageView!
    @IBOutlet var Image_2: UIImageView!
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
            label.font = .systemFont(ofSize: 50, weight: .medium)
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.Image.isHidden = true
        self.Image_2.isHidden = true
        self.button_next.isHidden = true
        
        self.button_next.layer.cornerRadius = 10.0
        
        //label_1
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.view.addSubview(self.label_1)
            //Auto Layout
            self.label_1.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 100.0).isActive = true
            self.label_1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100.0).isActive = true
            self.label_1.text = "リスト"
            
            self.Image.isHidden = false
            self.animateView(self.Image)
        }
        
        //label_2
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.view.addSubview(self.label_2)
            //Auto Layout
            self.label_2.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 50.0).isActive = true
            self.label_2.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 170.0).isActive = true
            self.label_2.text = "計測したタイムを見ることができます"
        }
        
        //label_3
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.view.addSubview(self.label_3)
            //Auto Layout
            self.label_3.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 100.0).isActive = true
            self.label_3.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 430.0).isActive = true
            self.label_3.text = "Best Time"
            
            self.Image_2.isHidden = false
            self.animateView(self.Image_2)
        }
        
        //label_4
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            self.view.addSubview(self.label_4)
            //Auto Layout
            self.label_4.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 50.0).isActive = true
            self.label_4.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 500.0).isActive = true
            self.label_4.text = "追加したタイムを見ることができます"
            
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
        self.performSegue(withIdentifier: "toNext", sender: nil)
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
