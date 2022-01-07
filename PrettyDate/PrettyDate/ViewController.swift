//
//  ViewController.swift
//  PrettyDate
//
//  Created by Hasan Elhussein on 7.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // IBOutlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // Variables
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    // MARK: - IBActions
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        // Set dateLabel to the date taken from UIDatePicker
        dateLabel.text = sender.date.prettyDate
        
    }
    
}

