//
//  GithubUserRequest.swift
//  TodoAppSwifUI
//
//  Created by Nguyễn Trường Thịnh on 07/12/2022.
//

import Foundation

/// A `FetchUsers` class type that conform to `ObservableObject` protocol
class FetchUsers :ObservableObject {
    @Published var items = [GithubUser]()

    func getUser() {
        let url = URL(string: APIConstants.host)!

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            do {
                if let data = data {
                    let decodedData = try JSONDecoder().decode(Result.self, from: data)

                    DispatchQueue.main.async {
                        self.items = decodedData.items
                    }
                } else {
                    print("No data")
                    return
                }
            } catch {
                fatalError("Error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
