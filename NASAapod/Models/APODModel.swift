//
//  APODModel.swift
//  NASAapod
//
//  Created by Ghufran Latif  on 3/1/21.
//

import Foundation

struct ApodModel: Codable {
    let date: String
    let explanation: String
    let hdurl: String
    let media_type: String
    let service_version: String
    let title: String
    let url: String
}
