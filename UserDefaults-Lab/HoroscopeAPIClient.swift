//
//  HoroscopeAPIClient.swift
//  UserDefaults-Lab
//
//  Created by Mr Wonderful on 9/24/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import Foundation

struct HoroscopeAPIClient{
    
    static let shared = HoroscopeAPIClient()
    
    func getData(horoscope:String, completionHandler:@escaping (Result<Horoscope,AppError>)->()){
       
        let horoscopeURL = "http://sandipbgt.com/theastrologer/api/horoscope/\(horoscope)/today"
        
        guard let url = URL(string: horoscopeURL) else {
            completionHandler(.failure(.badUrl))
            return
        }
        
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
            switch result{
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data ):
                
                do {
                    let horoscopeData = try JSONDecoder().decode(Horoscope.self, from: data)
                    completionHandler(.success(horoscopeData))
                }catch{
                    completionHandler(.failure(.badJSONError))
                }
            }
        }
    }
}
