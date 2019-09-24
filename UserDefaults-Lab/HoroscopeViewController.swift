//
//  HoroscopeViewController.swift
//  UserDefaults-Lab
//
//  Created by Mr Wonderful on 9/24/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class HoroscopeViewController: UIViewController {
    @IBOutlet var horoscopeSign: UILabel!
    @IBOutlet var horoscopeDate: UILabel!
    @IBOutlet var horsocopeDetail: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func getData(){
        HoroscopeAPIClient.shared.getData(horoscope: <#T##String#>, completionHandler: <#T##(Result<Horoscope, AppError>) -> ()#>)
    }
 

}
