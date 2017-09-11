//
//  ViewController.swift
//  Dumb Generosity
//
//  Created by Olivier Butler on 11/09/2017.
//  Copyright © 2017 Olivier Butler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bigNumber: UILabel!
    var realBigNum:Double?
    var dpVirgin = true
    @IBOutlet weak var outputStack: UIStackView!
    @IBOutlet weak var inputStacks: UIStackView!
    
    func cleverLabel(newVal:String){
        // Checks if we've set a number yet
        let buildNewNum:String!
        if let currentNum:Double = realBigNum {
            if dpVirgin{
                buildNewNum = "\(Int(currentNum))\(newVal)"
            } else {
                buildNewNum = "\(currentNum)\(newVal)"
            }
        } else {
            buildNewNum = newVal
        }
        print (buildNewNum)
        if let newBigNum = Double(buildNewNum) {
            realBigNum = newBigNum
            bigNumber.text = buildNewNum
        } else {
            print("Cannot convert \(buildNewNum) to a number double.")
        }
        
    }
    
    @IBAction func buttonClicked(sender:UIButton){
        cleverLabel(newVal:sender.currentTitle!)
    }
    @IBAction func otherClicked(sender:UIButton){
        switch sender.currentTitle!{
        case "c":
            realBigNum = nil
            bigNumber.text = "0"
            dpVirgin = true
        case ".":
            print("You decimaled my point")
            dpVirgin = false
        default:
            print ("You pressed the impossible button. Rock on.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bigNumber.text = "0"
        for colButtons in inputStacks.arrangedSubviews{
            for subview in colButtons.subviews{
                if subview is UIButton {
                    let button = subview as! UIButton
                    let value:String! = button.currentTitle
                    if let _ = Int(value){
                        button.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
                    } else {
                        button.addTarget(self, action: #selector(otherClicked), for: .touchUpInside)
                    }
                }
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
        //
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

