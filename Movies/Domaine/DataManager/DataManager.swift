//
//  DataManager.swift
//  Movies
//
//  Created by Fatma Fitouri on 17/5/2022.
//

import Alamofire
import Foundation
import SwiftyJSON

class DataManager {

    static let instance = DataManager()

    func sendAPIRequest(path: String, method: HTTPMethod, parameters: Parameters? = nil, encoding: ParameterEncoding = JSONEncoding.default, completion: @escaping (_ json: JSON?, _ error: String?) -> Void) {
        AF.request(path, method: method, parameters: parameters, encoding: encoding).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let asJSON = try JSONSerialization.jsonObject(with: data)
                    completion(JSON(asJSON), response.error?.localizedDescription)
                } catch {
                    completion(nil, response.error?.localizedDescription)
                }
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}
