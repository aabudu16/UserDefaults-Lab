//
//  ViewController.swift
//  UserDefaults-Lab
//
//  Created by Mr Wonderful on 9/24/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    
    // MARK: Outlets
    @IBOutlet var userName: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var datePickerOutlet: UIDatePicker!
    @IBOutlet var dateLabel: UILabel!
    
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveUserDefaultValue()
    }
    
    func retrieveUserDefaultValue(){
        textField.delegate = self
        dateLabel.text = UserDefaultWrapper.shared.getDate()
        userName.text = "Welcome \(UserDefaultWrapper.shared.getName()!)"
        
    }
    
    
    // MARK: Actions
    @IBAction func datePicker(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.long
        let date = dateFormatter.string(from: datePickerOutlet.date)
        dateLabel.text = date
        UserDefaultWrapper.shared.store(date: date)
        
    }
    
    @IBAction func setButtonPressed(_ sender: UIButton) {
        
        guard let horoscopeVC = storyboard?.instantiateViewController(withIdentifier: "horoscopeVC") as? HoroscopeViewController else {return}
        
        self.navigationController?.pushViewController(horoscopeVC, animated: true)
    }
    
}

// MARK: Extensions
extension DatePickerViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let name = textField.text{
            userName.text = "Welcome \(name)"
            UserDefaultWrapper.shared.store(name: name)
        }
        return true
    }
}


