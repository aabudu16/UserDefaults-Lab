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
    @IBOutlet var signPicker: UIPickerView!
    @IBOutlet var signLabel: UILabel!
    
    var horoscope = HoroscopeSign.picker
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveUserDefaultValue()
        signPicker.delegate = self
        signPicker.dataSource = self
    }
    
    func retrieveUserDefaultValue(){
        textField.delegate = self
        dateLabel.text = UserDefaultWrapper.shared.getDate()
        userName.text = "Welcome \(UserDefaultWrapper.shared.getName()!)"
        signLabel.text = UserDefaultWrapper.shared.getHorsocope() ?? "Pick Your Sign"
        
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
        
        horoscopeVC.horoscopeSigns = signLabel.text
        self.navigationController?.pushViewController(horoscopeVC, animated: true)
    }
    
}
// MARK: Extensions
extension DatePickerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return horoscope.count
    }
    
}
extension DatePickerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return horoscope[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        signLabel.text = horoscope[row]
        UserDefaultWrapper.shared.store(horsocope: horoscope[row])
    }
}

extension DatePickerViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let name = textField.text{
            userName.text = "Welcome \(name)"
            UserDefaultWrapper.shared.store(name: name)
            textField.text = ""
        }
        return true
    }
}


