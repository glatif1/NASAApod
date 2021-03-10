//
//  ApodViewModel.swift
//  NASAapod
//
//  Created by Ghufran Latif  on 3/2/21.
//

import Foundation

let Api_Key = "xRh0MrWddDS73pc5sndvlgZEAF9FCVDKrV8bwWhq"
let Api_url = "https://api.nasa.gov/planetary/apod?api_key="

class ApodViewModel{
    var apodVMHandler: (()-> Void)?
    private var error: Error?
    var data: ApodModel?

    
    func getDataFromProvider(url: URL, apodVMHandler:  (()-> Void)?){
        //get data here
        self.apodVMHandler = apodVMHandler
        DataProvider.sharedInstance.getApodData(url: url, type: ApodModel.self) {
            (data, error) in
            self.error = error
            self.data = data as? ApodModel
            self.apodVMHandler?()
        }

    }
    
    func numOfItems() -> Int {
        return 1
    }
    
    func getImageUrl() -> URL? {
        return URL(string: data?.url ?? "")
    }
    
    func getDetails() -> String? {
        return self.data?.explanation ?? ""
    }
    
    func getTitle() -> String? {
        return self.data?.title ?? ""
    }
    func getDate() -> String? {
        return self.data?.date ?? ""
    }
    
}
