//
//  ApiError.swift
//  Jamii
//
//  Created by Godwin Olorunshola on 27/10/2019.
//  Copyright © 2019 Godwin Olorunshola. All rights reserved.
//

import Foundation

enum APIError: Error{
    case badURL, requestFailed, jsonConversionFailure, invalidData, responseUnsuccessful
    
}
