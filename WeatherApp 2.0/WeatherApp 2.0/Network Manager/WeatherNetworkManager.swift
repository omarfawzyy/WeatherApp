//
//  WeatherNetworkManager.swift
//  WeatherApp
//
//  Created by mis on 22/08/202.
//

import Foundation
class WeatherNetworkManager : NetworkManagerProtocol {
    func fetchCurrentWeather(lon: Float,lat: Float, completion: @escaping (WeatherModel) -> ()) {
        let API_URL = "https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=3811367ec440451eec34595bc5c2490a&units=metric"
        guard let url = URL(string: API_URL) else {
            fatalError()
        }
                     
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
        guard let data = data else { return }

            do {
                let currentWeather = try JSONDecoder().decode(WeatherModel.self, from: data)
                completion(currentWeather)
            } catch {
                 print(error)
            }

        }.resume()
            }
    
    
    
  //3 protocol methods will appear here
  
}


struct Weather:Codable{
    let id: Int
    let main: String
    let description: String
    let icon: String
}
struct Sys:Codable{
    let country: String
    let sunrise: Int
    let sunset: Int
}
struct Wind:Codable{
    let speed: Float
    let deg: Int
}
struct Clouds:Codable{
    let all: Int
}
struct Main:Codable{
      let temp: Float
      let feels_like: Float
      let pressure: Int
      let humidity: Int
      
    }
struct WeatherModel:Codable{
    let weather: [Weather]
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let sys: Sys
    
    
}
