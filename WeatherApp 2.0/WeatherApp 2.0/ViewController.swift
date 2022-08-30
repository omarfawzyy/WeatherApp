//
//  ViewController.swift
//  WeatherApp 2.0
//
//  Created by mis on 26/08/2022.
//

//
//  ViewController.swift
//  WeatherApp
//
//  Created by mis on 22/08/2022.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    var locationManager : CLLocationManager!
    let networkManager = WeatherNetworkManager()
    let currentWeather: UILabel = {
           let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "...Loading weather"
            label.textAlignment = .left
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
            return label
        }()
    let pressure: UILabel = {
           let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "...Loading pressure"
            label.textAlignment = .center
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
            return label
        }()
    let visibility: UILabel = {
           let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "...Loading visibility"
            label.textAlignment = .center
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
            return label
        }()
    let humidity: UILabel = {
           let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "...Loading humidity"
            label.textAlignment = .center
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
            return label
        }()
    let windspeed: UILabel = {
           let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "...Loading windspeed"
            label.textAlignment = .center
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
            return label
        }()
    let sunset: UILabel = {
           let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "...Loading sunset time"
            label.textAlignment = .center
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
            return label
        }()
    let sunrise: UILabel = {
           let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "...Loading sunrise time"
            label.textAlignment = .center
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
            return label
        }()
    let cloud: UILabel = {
           let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "...Loading cloud"
            label.textAlignment = .center
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
            return label
        }()
    let winddegree: UILabel = {
           let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "...Loading wind degree"
            label.textAlignment = .center
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
            return label
        }()
    override func viewDidLoad() {
        super.viewDidLoad()
        if (CLLocationManager.locationServicesEnabled())
                {
                    locationManager = CLLocationManager()
                    locationManager.desiredAccuracy = kCLLocationAccuracyBest
                    locationManager.delegate = self
                    locationManager.requestAlwaysAuthorization()
                    locationManager.requestWhenInUseAuthorization()
                    locationManager.startUpdatingLocation()
                    print("location updated")
                }
        view.backgroundColor = .white
        self.view.addSubview(self.currentWeather)
        self.view.addSubview(self.pressure)
        self.view.addSubview(self.humidity)
        self.view.addSubview(self.windspeed)
        self.view.addSubview(self.sunset)
        self.view.addSubview(self.sunrise)
        self.view.addSubview(self.cloud)
        self.view.addSubview(self.winddegree)
        self.view.addSubview(self.visibility)

        visibility.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 340).isActive = true
        visibility.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        visibility.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18).isActive = true
        visibility.heightAnchor.constraint(equalToConstant: 70).isActive = true
        cloud.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300).isActive = true
        cloud.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        cloud.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18).isActive = true
        cloud.heightAnchor.constraint(equalToConstant: 70).isActive = true
        winddegree.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 260).isActive = true
        winddegree.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        winddegree.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18).isActive = true
        winddegree.heightAnchor.constraint(equalToConstant: 70).isActive = true
        sunset.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 220).isActive = true
        sunset.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        sunset.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18).isActive = true
        sunset.heightAnchor.constraint(equalToConstant: 70).isActive = true
        sunrise.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 180).isActive = true
        sunrise.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        sunrise.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18).isActive = true
        sunrise.heightAnchor.constraint(equalToConstant: 70).isActive = true
        windspeed.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 140).isActive = true
        windspeed.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        windspeed.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18).isActive = true
        windspeed.heightAnchor.constraint(equalToConstant: 70).isActive = true
        currentWeather.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        currentWeather.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        currentWeather.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18).isActive = true
        currentWeather.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        pressure.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        pressure.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        pressure.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18).isActive = true
        pressure.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        humidity.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        humidity.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        humidity.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18).isActive = true
        humidity.heightAnchor.constraint(equalToConstant: 70).isActive = true}
    
    
    
    //var location:CLLocation
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
        {

            let location = locations.last! as CLLocation
            let longtitude = location.coordinate.longitude
            let latitude = location.coordinate.latitude
            print("lon: \(longtitude)  lat: \(latitude)")
            networkManager.fetchCurrentWeather(lon:Float(longtitude), lat:Float(latitude)){(weather) in
                DispatchQueue.main.async {
                    self.currentWeather.text = weather.weather[0].description
                    self.pressure.text = "pressure: "+String(weather.main.pressure)
                    self.humidity.text = "humidity: "+String(weather.main.humidity)
                    self.windspeed.text = "windspeed: "+String(weather.wind.speed)
                    self.sunset.text = "sunset time:: "+String(weather.sys.sunset)
                    self.sunrise.text = "sunrise time: : "+String(weather.sys.sunrise)
                    self.cloud.text = "clouds: "+String(weather.clouds.all)
                    self.visibility.text = "visibility: "+String(weather.visibility)
                    self.winddegree.text = "wind degree: "+String(weather.wind.deg)

                }
                
                    
                
                        }        }
    }

    

