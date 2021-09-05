//
//  Tut2ViewController.swift
//  Rubic's Timer-4
//
//  Created by 小柳　直秀 on 2021/09/05.
//

import UIKit

class Tut2ViewController: UIViewController {
    
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
            label.font = .systemFont(ofSize: 40, weight: .medium)
            label.charInterval = 0.08
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    //label_3
    private lazy var label_3: CLTypingLabel = {
            let label = CLTypingLabel()
            label.font = .systemFont(ofSize: 40, weight: .medium)
            label.charInterval = 0.08
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    //label_4
    private lazy var label_4: CLTypingLabel = {
            let label = CLTypingLabel()
            label.font = .systemFont(ofSize: 40, weight: .medium)
            label.charInterval = 0.08
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    //label_5
    private lazy var label_5: CLTypingLabel = {
            let label = CLTypingLabel()
            label.font = .systemFont(ofSize: 40, weight: .medium)
            label.charInterval = 0.08
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    //label_6
    private lazy var label_6: CLTypingLabel = {
            let label = CLTypingLabel()
            label.font = .systemFont(ofSize: 20, weight: .medium)
            label.charInterval = 0.08
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    @IBOutlet var button_Start: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.button_Start.layer.cornerRadius = 75.0
        
        //label_1
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.view.addSubview(self.label_1)
            //Auto Layout
            self.label_1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.label_1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 250.0).isActive = true
        
            self.label_1.text = "Rubic's Timer"
            
        }
        
        //label_2
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            self.view.addSubview(self.label_2)
            //Auto Layout
            self.label_2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.label_2.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 300.0).isActive = true
        
            self.label_2.text = "であなたの"
        }
        
        //label_3
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) {
            self.view.addSubview(self.label_3)
            //Auto Layout
            self.label_3.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.label_3.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 350.0).isActive = true
        
            self.label_3.text = "Cube Lifeを"
        }
        
        //label_4
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
            self.view.addSubview(self.label_4)
            //Auto Layout
            self.label_4.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.label_4.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 400.0).isActive = true
        
            self.label_4.text = "よりスムーズに"
        }
        
        //label_5
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.view.addSubview(self.label_5)
            //Auto Layout
            self.label_5.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.label_5.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 450.0).isActive = true
        
            self.label_5.text = "より楽しく"
        }
        
        //label_6
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.8) {
            self.view.addSubview(self.label_6)
            //Auto Layout
            self.label_6.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.label_6.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 550.0).isActive = true
        
            self.label_6.text = "ボタンをタップしてはじめる"
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func next() {
        let transition = CATransition()
           transition.duration = 0.25
           transition.type = CATransitionType.push
           transition.subtype = CATransitionSubtype.fromRight
           view.window!.layer.add(transition, forKey: kCATransition)
        self.performSegue(withIdentifier: "toTutorial2", sender: nil)
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
//文字出現のアニメーション
import UIKit

/*
 Set text at runtime to trigger type animation;
 
 Set charInterval property for interval time between each character, default is 0.1;
 
 Call pauseTyping() to pause animation;
 
 Call continueTyping() to restart a paused animation;
 */


@IBDesignable open class CLTypingLabel: UILabel {
    /*
     Set interval time between each characters
     */
    @IBInspectable open var charInterval: Double = 0.1

    /*
     Optional handler which fires when typing animation is finished
     */
    open var onTypingAnimationFinished: (() -> Void)?
    
    /*
     If text is always centered during typing
     */
    @IBInspectable open var centerText: Bool = true
    
    private var typingStopped: Bool = false
    private var typingOver: Bool = true
    private var stoppedSubstring: String?
    private var attributes: [NSAttributedString.Key: Any]?
    private var currentDispatchID: Int = 320
    private let dispatchSerialQ = DispatchQueue(label: "CLTypingLableQueue")
    /*
     Setting the text will trigger animation automatically
     */
    override open var text: String! {
        get {
            return super.text
        }
        
        set {
            if charInterval < 0 {
                charInterval = -charInterval
            }
            
            currentDispatchID += 1
            typingStopped = false
            typingOver = false
            stoppedSubstring = nil
            
            attributes = nil
            setTextWithTypingAnimation(newValue, attributes,charInterval, true, currentDispatchID)
        }
    }
    
    /*
     Setting attributed text will trigger animation automatically
     */
    override open var attributedText: NSAttributedString! {
        get {
            return super.attributedText
        }
        
        set {
            if charInterval < 0 {
                charInterval = -charInterval
            }
            
            currentDispatchID += 1
            typingStopped = false
            typingOver = false
            stoppedSubstring = nil
            
            attributes = newValue.attributes(at: 0, effectiveRange: nil)
            setTextWithTypingAnimation(newValue.string, attributes,charInterval, true, currentDispatchID)
        }
    }
    
    // MARK: -
    // MARK: Stop Typing Animation
    
    open func pauseTyping() {
        if typingOver == false {
            typingStopped = true
        }
    }
    
    
    // MARK: -
    // MARK: Continue Typing Animation
    
    open func continueTyping() {
        
        guard typingOver == false else {
            print("CLTypingLabel: Animation is already over")
            return
        }
        
        guard typingStopped == true else {
            print("CLTypingLabel: Animation is not stopped")
            return
        }
        guard let stoppedSubstring = stoppedSubstring else {
            return
        }
        
        typingStopped = false
        setTextWithTypingAnimation(stoppedSubstring, attributes ,charInterval, false, currentDispatchID)
    }
    
    // MARK: -
    // MARK: Set Text Typing Recursive Loop
    
    private func setTextWithTypingAnimation(_ typedText: String, _ attributes: Dictionary<NSAttributedString.Key, Any>?, _ charInterval: TimeInterval, _ initial: Bool, _ dispatchID: Int) {
        
        guard !typedText.isEmpty && currentDispatchID == dispatchID else {
            typingOver = true
            typingStopped = false
            if let nonNilBlock = onTypingAnimationFinished {
                DispatchQueue.main.async(execute: nonNilBlock)
            }
            return
        }
        
        guard typingStopped == false else {
            stoppedSubstring = typedText
            return
        }
        
        if initial == true {
            super.text = ""
        }
        
        let firstCharIndex = typedText.index(typedText.startIndex, offsetBy: 1)
        
        DispatchQueue.main.async {
            if let attributes = attributes {
                super.attributedText = NSAttributedString(string: super.attributedText!.string +  String(typedText[..<firstCharIndex]),
                                                          attributes: attributes)
            } else {
                super.text = super.text! + String(typedText[..<firstCharIndex])
            }
            
            if self.centerText == true {
                self.sizeToFit()
            }
            self.dispatchSerialQ.asyncAfter(deadline: .now() + charInterval) { [weak self] in
                let nextString = String(typedText[firstCharIndex...])
                
                self?.setTextWithTypingAnimation(nextString, attributes, charInterval, false, dispatchID)
            }
        }
        
    }
    
}
