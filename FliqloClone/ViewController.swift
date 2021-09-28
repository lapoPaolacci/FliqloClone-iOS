//
//  ViewController.swift
//  FliqloClone
//
//  Created by Lapo Paolacci on 25/09/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hourTensLabel: FlippingLabel!
    @IBOutlet weak var hourUnitsLabel: FlippingLabel!
    @IBOutlet weak var minuteTensLabel: FlippingLabel!
    @IBOutlet weak var minuteUnitsLabel: FlippingLabel!
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let labels = [hourTensLabel, hourUnitsLabel, minuteUnitsLabel, minuteTensLabel]
        labels.forEach { label in
            label?.backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
            label?.layer.cornerRadius = 10
        }
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.updateCounting(true)
        })
        updateCounting(false)
    }
    
    func updateCounting(_ animated: Bool){
        let date = Date()
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        let dateString: String = dateFormatter.string(from: date)
        let units: [String] = dateString.components(separatedBy: ":")
        
        if(animated){
            hourTensLabel.updateWithText(String(units[0].prefix(1)) == "0" ? "" : String(units[0].prefix(1)))
            hourUnitsLabel.updateWithText(String(units[0].suffix(1)))
            minuteTensLabel.updateWithText(String(units[1].prefix(1)))
            minuteUnitsLabel.updateWithText(String(units[1].suffix(1)))
        }else{
            hourTensLabel.text = "C"
            hourUnitsLabel.text = "I"
            minuteTensLabel.text = "A"
            minuteUnitsLabel.text = "O"
        }
    }
}

