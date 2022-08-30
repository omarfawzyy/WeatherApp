

import Foundation
protocol NetworkManagerProtocol {
    func fetchCurrentWeather(lon: Float,lat: Float, completion: @escaping (WeatherModel) -> ())
    
}
