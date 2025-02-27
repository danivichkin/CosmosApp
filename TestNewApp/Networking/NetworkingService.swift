//
//  NetworkingService.swift
//  TestNewApp
//
//  Created by Marina Svistkova on 28.05.2021.
//

import Foundation
import Alamofire

struct APINetworkingService {

    func getResults(completed: @escaping (APIData) -> Void) {
        let urlString = "https://swapi.dev/api"
        AF.request(urlString).responseDecodable(of: APIData.self) { response in
            switch response.result {
            case .success(let results):
                let resultsModel = APIData(people: results.people, planets: results.planets, films: results.films, species: results.species, vehicles: results.vehicles, starships: results.starships)
                completed(resultsModel)
            case .failure(_):
                print("Networking Failed")
            }
        }
    }
}

