
//
//  lvl3Service.swift
//  ELearningProjectAbderrahmen&hazem
//
//  Created by Mac-Mini-2021 on 5/12/2021.
//


import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
class testMService {
    static let shareinstance = testMService()
    
    func question()-> String
    {
        var value : String!
        var semaphore = DispatchSemaphore (value: 0)

        var request = URLRequest(url: URL(string: "http://localhost:3000/api/testM/question")!,timeoutInterval: Double.infinity)
        request.addValue("JWT=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiaGF6ZW0iLCJpYXQiOjE2MzgxOTAxNDUsImV4cCI6MTYzODE5Mzc0NX0.kmB95NP1POKGm58p20uylGNABtTUJLKwn0q-5gcUvCg; Role=admin; UserID=619fc854e49b1eda99c9979c; langue=it", forHTTPHeaderField: "Cookie")

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
    func answer(testM : testMModel)
    {

        var semaphore = DispatchSemaphore (value: 0)
        let parameters = "{\n\"useranswer\":\""+testM.answer1+"\"}"
        let postData =  parameters.data(using: .utf8)
 

        var request = URLRequest(url: URL(string: "http://localhost:3000/api/testD/answer")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("JWT=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiaGF6ZW0iLCJpYXQiOjE2Mzg1NDg3MTksImV4cCI6MTYzODU1MjMxOX0.x2gYETOmDxPY7cvcPWRQel2qaIyrnJTCOdABovtz78Q; Role=admin; UserID=61aa44dd36bf528c4d922e97; langue=it", forHTTPHeaderField: "Cookie")

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
    func  evaluation()-> String {
        var value : String!

        
        
        var semaphore = DispatchSemaphore (value: 0)

        var request = URLRequest(url: URL(string: "http://localhost:3000/api/testM/evaluation")!,timeoutInterval: Double.infinity)
        request.addValue("JWT=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiaGF6ZW0iLCJpYXQiOjE2Mzg1NDg3MTksImV4cCI6MTYzODU1MjMxOX0.x2gYETOmDxPY7cvcPWRQel2qaIyrnJTCOdABovtz78Q; Role=admin; UserID=61aa44dd36bf528c4d922e97; langue=it", forHTTPHeaderField: "Cookie")

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

    func score ()->String{
        var value : String!

        
        var semaphore = DispatchSemaphore (value: 0)

        var request = URLRequest(url: URL(string: "http://localhost:3000/api/testM/score")!,timeoutInterval: Double.infinity)
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



func pass ()-> String{
    var value : String!

    var semaphore = DispatchSemaphore (value: 0)

    var request = URLRequest(url: URL(string: "http://localhost:3000/api/testM/pass")!,timeoutInterval: Double.infinity)
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

}




