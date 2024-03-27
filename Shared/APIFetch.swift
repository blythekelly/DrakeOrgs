//
//  APIFetch.swift
//  DrakeOrgs
//
//  Created by Blythe Kelly on 3/20/24.
//

import Foundation


func fetchOrganizationData(orgName: String, completion: @escaping (Result<Data, Error>) -> Void) {
    // Construct the URL
    let orgNameEncoded = orgName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    let urlString = "https://d4kfv1hyq7.execute-api.us-east-1.amazonaws.com/DrakeOrgs-API/get?org-name=\(orgNameEncoded)"
    guard let url = URL(string: urlString) else {
        let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        completion(.failure(error))
        return
    }
    
    // Create the URLSession
    let session = URLSession.shared
    
    // Create the data task
    let task = session.dataTask(with: url) { (data, response, error) in
        if let error = error {
            completion(.failure(error))
            return
        }
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            _ = (response as? HTTPURLResponse)?.statusCode ?? -1
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid HTTP response status code: \((response as? HTTPURLResponse)?.statusCode ?? -1)"])
            completion(.failure(error))
            return
        }
        
        guard let data = data else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])
            completion(.failure(error))
            return
        }
        
        // Call completion handler with the received data
        completion(.success(data))
    }
    
    // Start the task
    task.resume()
}
