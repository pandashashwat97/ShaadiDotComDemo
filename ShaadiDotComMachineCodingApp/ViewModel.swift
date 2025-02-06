//
//  ViewModel.swift
//  ShaadiDotComMachineCodingApp
//
//  Created by Shashwat Panda on 05/02/25.
//

import Foundation
import SwiftData

class ViewModel {
    
    func apiCall(modelContext: ModelContext) {
        if let url = URL(string: Constants.Url.value) {
            let task = URLSession.shared.dataTask(with: url) { data,_,_  in
                if let safeData = data {
                    let decoder = JSONDecoder()
                    do {
                        let profileObject = try decoder.decode(Profile.self, from: safeData)
                        for object in profileObject.results {
                            let dataToStore = Profiles(item: object)
                            modelContext.insert(dataToStore)
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
}

