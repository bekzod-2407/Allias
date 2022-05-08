//
//  JokeManager.swift
//  Allias
//
//  Created by user on 08/05/22.
//

import Foundation

//protocol JokeManagerDelegate {
//    func didUpdateJoke(setup: String)
//    func didFailWithError(error: Error)
//}

//struct JokeManager {
//    let urlString = "https://joke.deno.dev/"
//
//    var delegate: JokeManagerDelegate?
//
//    func performRequest(urlString: String){
//        let urlString = "https://joke.deno.dev/"
//
//        if let url = URL(string: urlString) {
//
//            let session = URLSession(configuration: .default)
//
//            let task = session.dataTask(with: url) { data, response, error in
//                if error != nil {
//                    self.delegate?.didFailWithError(error: error!)
//                    return
//                }
//                if let safeData = data {
//                    self.parseJSON(jokeData: safeData)
//
//                }
//            }
//            task.resume()
//        }
//    }
//    func parseJSON(jokeData: Data) -> [String]? {
//        let decoder = JSONDecoder()
//        do {
//            let decodedData = try decoder.decode(JokeData.self, from: jokeData)
//            let jokeA = decodedData.setup
//            let jokeB = decodedData.punchline
//            let jokeArr = [jokeA, jokeB]
//            self.delegate?.didUpdateJoke(setup: jokeA)
//            print("\(jokeB)joooooookeeeeeeeeeee\(jokeA)")
//            return jokeArr
//        } catch {
//            print(error)
//            return nil
//        }
//    }
//
//}


final class NewApi {
    
    static let shared = NewApi()
    
    let urlString = "https://joke.deno.dev/"
    
    func dataTask(urlStr url: String, complation: @escaping (JokeData?) -> Void ) {
        
        guard let url = URL(string: url) else {
            print("not supporter Url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                print(#function, error?.localizedDescription)
                complation(nil)
                return
            }

            guard
                let response = response as? HTTPURLResponse,
                    response.statusCode >= 200,
                    response.statusCode <= 300
            else {
                print("Response Code Error: \((response as? HTTPURLResponse)?.statusCode)")
                complation(nil)
                return
            }

            guard let data = data else {
                print("Has not Data")
                complation(nil)
                return
            }

            do {
                // Data parse 
                
                let data = try JSONDecoder().decode(JokeData.self, from: data)
                
                print("Data: \(data)")
                
                complation(data)
                
            } catch {
                print("Data cannot parse")
            }
            
        }.resume()
    }

}
