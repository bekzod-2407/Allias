//
//  JokeManager.swift
//  Allias
//
//  Created by user on 08/05/22.
//

import Foundation

protocol JokeManagerDelegate {
    func didUpdateJoke(setup: String)
    func didFailWithError(error: Error)
}

struct JokeManager {
    let urlString = "https://joke.deno.dev/"
    
    var delegate: JokeManagerDelegate?
    
    func performRequest(urlString: String){
        let urlString = "https://joke.deno.dev/"
        
        if let url =  URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(jokeData: safeData)
                    
                }
            }
            task.resume()
        }
    }
    func parseJSON(jokeData: Data) -> [String]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(JokeData.self, from: jokeData)
            let jokeA = decodedData.setup
            let jokeB = decodedData.punchline
            let jokeArr = [jokeA, jokeB]
            self.delegate?.didUpdateJoke(setup: jokeA)
            print("\(jokeB)joooooookeeeeeeeeeee\(jokeA)")
            return jokeArr
        }catch {
            print(error)
            return nil
        }
    }

}

//
//
//extension GameViewController : JokeManagerDelegate{
//    func didUpdateJoke(setup: String) {
//        DispatchQueue.main.async {
//            self.test_Api.text = setup
//            }
//
//    }
//    func didFailWithError(error: Error) {
//            print(error)
//        }
//}
