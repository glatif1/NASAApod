//
//  DataProvider.swift
//  NASAapod
//
//  Created by Ghufran Latif  on 3/1/21.
//

import Foundation

class DataProvider {
    
    var closureFunction: ((Any?, Error?) -> Void)?
    static let sharedInstance = DataProvider.init()
    private init(){}

    func getApodData<T: Codable>(url: URL, type: T.Type, completionHandler: ((Any?, Error?) -> Void)?){
        closureFunction = completionHandler
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if (error == nil) && (data != nil){
            let model = try? JSONDecoder().decode(T.self, from: data!)
                self.closureFunction?(model, error)
            }
        }.resume()
    }
}
