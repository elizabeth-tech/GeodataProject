//
//  ViewController.swift
//  GeodataProject
//
//  Created by Elizaveta on 24.11.2020.
//

import UIKit
import CoreLocation

class LocationVC: UIViewController, CLLocationManagerDelegate
{
    let locationMng = CLLocationManager()
    //var curentLocation : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)

    @IBOutlet weak var dataLon: UILabel!
    @IBOutlet weak var dataLat: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        checkAuthorization()
    }
    
    // Разрешение на использование служб определения местоположения
    func checkAuthorization()
    {
        switch CLLocationManager.authorizationStatus()
        {
            // Варианты authorizationStatus
            // Только когда приложение используется
            case .authorizedWhenInUse:
                locationMng.delegate = self
                locationMng.desiredAccuracy = kCLLocationAccuracyBest // Точность определения местоположения
                locationMng.startUpdatingLocation() // Начинаем старт определения местоположения
                //print("Error")
                
            // Пользователь не решил, может ли приложение использовать
            // службы определения местоположения
            case .notDetermined:
                locationMng.requestWhenInUseAuthorization()
            default:
                break
        }
        
        
    }
    
    // Проверяем координаты устройства и отображаем в Label (Большой Брат бдит)
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        if let location = locations.last?.coordinate
        {
            dataLat.text = String(location.latitude)
            dataLon.text = String(location.longitude)
            locationMng.stopUpdatingLocation()
        }

    }

}
