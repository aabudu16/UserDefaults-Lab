//
//  ViewController.swift
//  UserDefaults-Lab
//
//  Created by Mr Wonderful on 9/24/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet var datePickerOutlet: UIDatePicker!
    @IBOutlet var dateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }


    @IBAction func datePicker(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.long
        let date = dateFormatter.string(from: datePickerOutlet.date)
        dateLabel.text = date
    }
    
    @IBAction func setButtonPressed(_ sender: UIButton) {
    }
    
}


