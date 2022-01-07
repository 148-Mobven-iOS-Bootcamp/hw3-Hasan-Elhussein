//
//  ViewController.swift
//  PrettyDate
//
//  Created by Hasan Elhussein on 7.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // IBOutlets
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var prettyDateLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    // MARK: - IBActions
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        // Set the labels to the date taken from UIDatePicker
        prettyDateLabel.text = sender.date.prettyDate
        dayLabel.text = sender.date.day
        monthLabel.text = sender.date.month
        yearLabel.text = sender.date.year
    }
    
}

