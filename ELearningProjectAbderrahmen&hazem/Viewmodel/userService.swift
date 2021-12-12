//
//  userService.swift
//  ELearningProjectAbderrahmen&hazem
//
//  Created by Mac-Mini-2021 on 28/11/2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserService{
    
    static let shareinstance = UserService()
    
    func login(email: String, motdepass: String,completionHandler:@escaping (Bool)->()){
        let headers: HTTPHeaders = [.contentType("application/json")]
        AF.request("http://localhost:3000/api/login", method: .post, parameters: ["username":email, "password":motdepass],encoder: JSONParameterEncoder.default, headers: headers ).response{ response in debugPrint(response)
            switch response.result{
            case .success(let data):
                do {
                    let json  = try JSONSerialization.jsonObject(with: data!, options: [])
                    print(json)
                    if response.response?.statusCode == 200{
                        
                        let jsonData = JSON(response.data!)
                        print (jsonData)
                        UserDefaults.standard.set(jsonData["id"].stringValue, forKey: "userID")
                        UserDefaults.standard.set(jsonData["token"].stringValue, forKey: "token")
                        UserDefaults.standard.setValue(jsonData["name"].stringValue  , forKey: "name")
                        UserDefaults.standard.set(jsonData["email"].stringValue, forKey: "email")
                        UserDefaults.standard.set(jsonData["role"].stringValue, forKey: "role")
                        UserDefaults.standard.set(jsonData["password"].stringValue, forKey: "password")
                        UserDefaults.standard.set(jsonData["date"].stringValue, forKey: "date")
                        UserDefaults.standard.set(jsonData["niveau"].stringValue, forKey: "niveau")
                        UserDefaults.standard.set(jsonData["langue"].stringValue, forKey: "langue")
                        UserDefaults.standard.set(jsonData["nbrvie"].stringValue, forKey: "vie")
                        
                        let date = UserDefaults.standard.string(forKey: "date")!
                        print(date)
                        
                        
                        
                        //print("userdefautls")
                        
                        
                        
                        completionHandler(true)
                    }else{
                        completionHandler(false)
                    }
                    
                } catch  {
                    print(error.localizedDescription)
                    completionHandler(false)
                    
                    
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    
    func register(user : userModel,completionHandler:@escaping (Bool)->()){
        let headers: HTTPHeaders = [.contentType("application/json")]
        AF.request("http://localhost:3000/api/register", method: .post, parameters: user,encoder: JSONParameterEncoder.default, headers: headers ).response{ response in debugPrint(response)
            switch response.result{
            case .success(let data):
                do {
                    let json  = try JSONSerialization.jsonObject(with: data!, options: [])
                    print(json)
                    if response.response?.statusCode == 200{
                        completionHandler(true)
                    }else{
                        completionHandler(false)
                    }
                    
                } catch  {
                    print(error.localizedDescription)
                    completionHandler(false)
                    
                    
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    
    func getProfile(name:String,completionHandler:@escaping (Bool,userModel?)->()){
        let headers: HTTPHeaders = [.contentType("application/json"),.authorization(bearerToken:(UserDefaults.standard.string(forKey: "token")!)) ]
        AF.request("http://localhost:3000/api/user/checkuser", method: .get,parameters:[ "userID":UserDefaults.standard.value(forKey: "userID")!] , headers: headers ).response{ response in
            switch response.result{
            case .success(let data):
                do {
                    let json  = try JSONSerialization.jsonObject(with: data!, options: [])
                    print(json)
                    if response.response?.statusCode == 200{
                        let jsonData = JSON(response.data!)
                        let user = self.makeItem(jsonItem: jsonData)
                        completionHandler(true,user)
                        
                        print(user)
                    }else{
                        completionHandler(false,nil)
                    }
                    
                } catch  {
                    print(error.localizedDescription)
                    completionHandler(false,nil)
                    
                    
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func updateProfile(userId:String,name:String,email:String,password:String,completionHandler:@escaping (Bool)->()){
        let headers: HTTPHeaders = [.contentType("application/x-www-form-urlencoded"),.authorization(bearerToken:(UserDefaults.standard.string(forKey: "token")!)) ]
        AF.request("http://localhost:3000/api/user/update", method:   .post ,parameters:[ "userID":userId,"name":name,"email":email,"password":password], headers: headers ).response{ response in
            switch response.result{
            case .success(let data):
                do {
                    let json  = try JSONSerialization.jsonObject(with: data!, options: [])
                    print(json)
                    if response.response?.statusCode == 200{
                        //let jsonData = JSON(response.data!)
                        //let user = self.makeItem(jsonItem: jsonData)
                        completionHandler(true)
                        
                        //print(user)
                    }else{
                        completionHandler(false)
                    }
                    
                } catch  {
                    print(error.localizedDescription)
                    completionHandler(false)
                    
                    
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    
    func makeItem(jsonItem: JSON) -> userModel {
        //let isoDate = jsonItem["dateNaissance"]
        userModel(
            name: jsonItem["name"].stringValue,
            email: jsonItem["email"].stringValue,
            role: jsonItem["role"].stringValue,
            password: jsonItem["password"].stringValue,
            date: jsonItem["date"].stringValue,
            niveau: jsonItem["niveau"].stringValue,
            langue: jsonItem["langue"].stringValue,
            avatar: jsonItem["avatar"].stringValue,
            token: jsonItem["token"].stringValue,
            userID: jsonItem["userID"].stringValue,
            vie:    jsonItem["vie"].stringValue
        )
    }
    
    func access ()->String
    {
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        var value : String!
        
        var semaphore = DispatchSemaphore (value: 0)
        
        let parameters = ""
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/access")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")
        request.httpMethod = "GET"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
            print(String(data: data, encoding: .utf8)!)
            value = (String(data: data, encoding: .utf8)!)
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        return value;
    }
    func change()
    {
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        var semaphore = DispatchSemaphore (value: 0)
        
        let parameters = ""
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/change")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")
        
        request.httpMethod = "GET"
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
    
    
    func logoutsignout()
    {
        
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        var semaphore = DispatchSemaphore (value: 0)
        
        let parameters = ""
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/logout")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Email=; JWT=; Role=; UserID=; langue=; token=", forHTTPHeaderField: "Cookie")
        
        
        request.httpMethod = "GET"
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
    func getniveau()->String
    {
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        
        var value:String!
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/niveau")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
            print(String(data: data, encoding: .utf8)!)
            value = (String(data: data, encoding: .utf8)!)
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        return value;
        
    }
    
    struct Response: Codable { // or Decodable
        let Where: Int
    }
    
    func getwhere()->String
    {
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        
        var value:String!
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/where")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
            
            do {
                let res = try JSONDecoder().decode(Response.self, from: data)
                value = String(res.Where)
            } catch let error {
                print(error)
            }
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
        return value;
        
    }
    
    
    
    func where2()
    {
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/changedw2")!,timeoutInterval: Double.infinity)
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")
        
        request.httpMethod = "POST"
        
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
    
    
    func where3()
    {
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/changedw3")!,timeoutInterval: Double.infinity)
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")
        
        request.httpMethod = "POST"
        
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
    func where4()
    {
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/changedw4")!,timeoutInterval: Double.infinity)
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")
        
        request.httpMethod = "POST"
        
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
    
    func where5()
    {
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/changedw5")!,timeoutInterval: Double.infinity)
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")
        
        request.httpMethod = "POST"
        
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
    
    func where6()
    {
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/changedw6")!,timeoutInterval: Double.infinity)
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")
        
        request.httpMethod = "POST"
        
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
    
    func where7()
    {
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/changedw7")!,timeoutInterval: Double.infinity)
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")
        
        request.httpMethod = "POST"
        
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
    
    func where8()
    {
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/changedw8")!,timeoutInterval: Double.infinity)
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")
        
        request.httpMethod = "POST"
        
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
    
    func where9() {
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        var semaphore = DispatchSemaphore (value: 0)
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/changedw9")!,timeoutInterval: Double.infinity)
        request.addValue("JWT=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoicHBwIiwiaWF0IjoxNjM5MzA5MjU2LCJleHAiOjE2MzkzMTI4NTZ9.LKEaOfusuLnxJ6CvaOAnt8vEzCTwdCp2U02oY85iSMs; Role=Student; UserID=61b5dfa45a4568f915f6e5dd; langue=it", forHTTPHeaderField: "Cookie")

        request.httpMethod = "POST"

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
    
    func progress()->String
    {
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        var value:String!
        
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/progress")!,timeoutInterval: Double.infinity)
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
            print(String(data: data, encoding: .utf8)!)
            value = (String(data: data, encoding: .utf8)!)
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        return value;
    }
    func changepro2()
    {
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/changep2")!,timeoutInterval: Double.infinity)
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")
        
        
        request.httpMethod = "POST"
        
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
    func changepro3()
    {
        
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/changep3")!,timeoutInterval: Double.infinity)
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")
        
        
        request.httpMethod = "POST"
        
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
    func changepro4()
    {
        
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/changep4")!,timeoutInterval: Double.infinity)
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")
        
        
        request.httpMethod = "POST"
        
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
    
    func changepro5()
    {
        
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/changep5")!,timeoutInterval: Double.infinity)
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")
        
        
        request.httpMethod = "POST"
        
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
    
    func changepro6()
    {
        
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/changep6")!,timeoutInterval: Double.infinity)
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")
        
        
        request.httpMethod = "POST"
        
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
    func changepro7()
    {
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/changep7")!,timeoutInterval: Double.infinity)
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")
        
        
        request.httpMethod = "POST"
        
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
    func changepro8()
    {
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/changep8")!,timeoutInterval: Double.infinity)
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")
        
        
        request.httpMethod = "POST"
        
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
    func changepro9()
    {
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        var semaphore = DispatchSemaphore (value: 0)

        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/changep9")!,timeoutInterval: Double.infinity)
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")


        request.httpMethod = "POST"

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
    
    struct ResponseVie: Codable { // or Decodable
        let Vie: Int
    }
    
    func getvie()->String
    {
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        var value:String!
        var semaphore = DispatchSemaphore (value: 0)
        
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/vie")!,timeoutInterval: Double.infinity)
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
            print(String(data: data, encoding: .utf8)!)
            //value = (String(data: data, encoding: .utf8)!)
            
            do {
                let res = try JSONDecoder().decode(ResponseVie.self, from: data)
                value = String(res.Vie)
            } catch let error {
                print(error)
            }
            
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        return value;
    }
    
    
    func changevie10()
    {
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/changevie10")!,timeoutInterval: Double.infinity)
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")
        
        request.httpMethod = "POST"
        
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
    
    
    func changevie100()
    {
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/changevie100")!,timeoutInterval: Double.infinity)
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")
        
        request.httpMethod = "POST"
        
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
    func changevie1000()
    {
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/changevie1000")!,timeoutInterval: Double.infinity)
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")
        request.httpMethod = "POST"
        
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
    func changevieminus()
    { let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/changevieminus")!,timeoutInterval: Double.infinity)
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")
        request.httpMethod = "POST"
        
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
    func changevieplus()
    {
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/changevieplus")!,timeoutInterval: Double.infinity)
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")
        
        
        request.httpMethod = "POST"
        
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
    
    
    func viedate()
    {
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/changeviedate")!,timeoutInterval: Double.infinity)
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")
        
        request.httpMethod = "POST"
        
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
    func vie0()->String{
        let token = UserDefaults.standard.string(forKey: "token")!
        let userid = UserDefaults.standard.string(forKey: "userID")!
        let role = UserDefaults.standard.string(forKey: "role")!
        let langue = UserDefaults.standard.string(forKey: "langue")!
        var value:String!
        
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/user/vie0")!,timeoutInterval: Double.infinity)
        request.addValue("Email=; JWT="+token+"; Role="+role+"; UserID="+userid+"; langue="+langue+"; token=", forHTTPHeaderField: "Cookie")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
            print(String(data: data, encoding: .utf8)!)
            value = (String(data: data, encoding: .utf8)!)
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        return value;
        
    }
    
}
