//
//  lvl1Service.swift
//  ELearningProjectAbderrahmen&hazem
//
//  Created by Mac-Mini-2021 on 29/11/2021.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
class lvl3Service {
    static let shareinstance = lvl3Service()
    
    func question()-> String
    {
        let token = UserDefaults.standard.string(forKey: "token")!
                let userid = UserDefaults.standard.string(forKey: "userID")!
                let role = UserDefaults.standard.string(forKey: "role")!
                let langue = UserDefaults.standard.string(forKey: "langue")!
        var value : String!
        var semaphore = DispatchSemaphore (value: 0)

        var request = URLRequest(url: URL(string: "http://localhost:3000/api/lvl3/question")!,timeoutInterval: Double.infinity)
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
          print(String(data: data, encoding: .utf8)!)
             value = String(data: data, encoding: .utf8)

          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
        return value;
        
    }
    func answer(Lvl3 : lvl3Model)
    {
        let token = UserDefaults.standard.string(forKey: "token")!
                let userid = UserDefaults.standard.string(forKey: "userID")!
                let role = UserDefaults.standard.string(forKey: "role")!
                let langue = UserDefaults.standard.string(forKey: "langue")!

        var semaphore = DispatchSemaphore (value: 0)
        let parameters = "{\n\"useranswer\":\""+Lvl3.answer1+"\"}"
        let postData =  parameters.data(using: .utf8)
 

        var request = URLRequest(url: URL(string: "http://localhost:3000/api/lvl3/answer")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
          print(String(data: data, encoding: .utf8)!)

          semaphore.signal()
        }

        task.resume()
        semaphore.wait()

      
}
    func  score()-> String {
        let token = UserDefaults.standard.string(forKey: "token")!
                let userid = UserDefaults.standard.string(forKey: "userID")!
                let role = UserDefaults.standard.string(forKey: "role")!
                let langue = UserDefaults.standard.string(forKey: "langue")!
        var value : String!

        
        
        var semaphore = DispatchSemaphore (value: 0)

        var request = URLRequest(url: URL(string: "http://localhost:3000/api/lvl3/score")!,timeoutInterval: Double.infinity)
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))

            semaphore.signal()
            return
          }
          print(String(data: data, encoding: .utf8)!)
            value = String(data: data, encoding: .utf8)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
        return value;
        
    }
    func pass()->String
    {
        let token = UserDefaults.standard.string(forKey: "token")!
                let userid = UserDefaults.standard.string(forKey: "userID")!
                let role = UserDefaults.standard.string(forKey: "role")!
                let langue = UserDefaults.standard.string(forKey: "langue")!
        var value : String!

        var semaphore = DispatchSemaphore (value: 0)

        var request = URLRequest(url: URL(string: "http://localhost:3000/api/lvl3/pass")!,timeoutInterval: Double.infinity)
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
          print(String(data: data, encoding: .utf8)!)
            value=(String(data: data, encoding: .utf8)!)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
        return value;
    }
    
    
    
    
}

