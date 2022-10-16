//
//  NetworkManager.swift
//  ithaca sustainability
//
//  Created by Dylan McCreesh on 10/15/22.
//

import Alamofire
import Foundation

class NetworkManager {
    /*
    static func getAllPosts(completion: @escaping ([Post]) -> Void) {
        let endpoint = "\(host)/posts/all/"
        //let params: [String:String] = [
          //  "key": "value"
        //]
        AF.request(endpoint, method: .get).validate().responseData { response in
            //process response
            switch(response.result) {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode([Post].self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed Decoding")
                }
                print(data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
     */
    typealias APIResponse = ((_ response: Any?, _ error: Error?) -> Void)
    
    static func getIthacaNewsArticles(completion: @escaping APIResponse, finished: @escaping ()->()){
        //let endpoint = "https://newsapi.org/v2/everything?q=sustainability%20ithaca&apiKey=06871c6b394f4c9198bfc4629a14b9ff"
        let endpoint = "http://34.123.70.93/news/ithaca"
        AF.request(endpoint, method: .get).validate().responseData { response in
            //process response
            switch(response.result) {
            case .success(let data):
                //let jsonDecoder = JSONDecoder()
                if let userResponse = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    completion(userResponse, nil)
                    finished()
                } else {
                    print("Failed")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getGlobalNewsArticles(completion: @escaping APIResponse, finished: @escaping ()->()){
        //let endpoint = "https://newsapi.org/v2/everything?q=sustainability&apiKey=06871c6b394f4c9198bfc4629a14b9ff"
        let endpoint = "http://34.123.70.93/news/global"
        AF.request(endpoint, method: .get).validate().responseData { response in
            //process response
            switch(response.result) {
            case .success(let data):
                //let jsonDecoder = JSONDecoder()
                if let userResponse = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    completion(userResponse, nil)
                    finished()
                } else {
                    print("Failed")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func postResourceSuggestion(params: [String:String]){
        //let endpoint = "https://newsapi.org/v2/everything?q=sustainability&apiKey=06871c6b394f4c9198bfc4629a14b9ff"
        let endpoint = "http://34.123.70.93/resources/category/"
        AF.request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default)
    }

}


