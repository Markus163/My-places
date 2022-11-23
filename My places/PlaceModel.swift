//
//  PlaceModel.swift
//  My places
//
//  Created by Марк Михайлов on 22.11.2022.
//

import Foundation

struct Place {
    
    var name: String
    var location: String
    var type: String
    var image: String
    
    static let restaurantNames = [
        "Cafe47", "Левингстон", "Вилка-Ложка", "Хокку", "Ваще огонь",
        "Джонни Ву", "Аль-Халяль", "Тандыр", "Перчини", "Альфред",
        "Кухмистерская", "Лепрекон", "Кантина Мука", "То самое тесто", "Meat Club"
    ]
    
    static func getPlaces() -> [Place] {
        var places = [Place]()
        
        for place in restaurantNames {
            places.append(Place(name: place, location: "Самара", type: "Ресторан", image: place))
        }
        
        
        return places
    }
}
