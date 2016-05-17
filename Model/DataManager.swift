//
//  DataManager.swift
//  FancyCars
//
//  Created by Grégoire Lhotellier on 14/05/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import Foundation

let car1 = Car(brand: "Porsche", model: "911", image: "911.jpg")
let car2 = Car(brand: "Mercedes", model: "AMG GT", image: "GT.jpg")
let car3 = Car(brand: "Porsche", model: "Cayman", image: "Cayman.jpg")
let car4 = Car(brand: "BMW", model: "M4", image: "M4.jpg")
let car5 = Car(brand: "Audi", model: "R8", image: "R8.jpg")
let car6 = Car(brand: "Ferrari", model: "California", image: "California.jpg")
let car7 = Car(brand: "Lamborghini", model: "Huracan", image: "Huracan.jpg")
let car8 = Car(brand: "Maserati", model: "GranTurismo", image: "GranTurismo.jpg")
let car9 = Car(brand: "Lamborghini", model: "Aventador", image: "Aventador.jpg")

let sectionPorsche = Section(title: "Porsche", elements: [car1, car3])
let sectionMercedes = Section(title: "Mercedes", elements: [car2])
let sectionBMW = Section(title: "BMW", elements: [car4])
let sectionAudi = Section(title: "Audi", elements: [car5])
let sectionFerrari = Section(title: "Ferrari", elements: [car6])
let sectionLamborghini = Section(title: "Lamborghini", elements: [car7, car9])
let sectionMaserati = Section(title: "Maserati", elements: [car8])

func carArray() -> [Car] {
    return [car1, car2, car3, car4, car5, car6, car7, car8, car9]
}

func carPage() -> Page<Car> {
    return Page(sections: [sectionAudi, sectionBMW, sectionFerrari, sectionLamborghini, sectionMaserati, sectionMercedes, sectionPorsche])
}

func carBook() -> Book<Car> {
    let germanySection = Section<Car>(title: "Germany", elements: [])
    let germanPage = Page(sections: [germanySection, sectionAudi, sectionBMW, sectionMercedes, sectionPorsche])
    let italianSection = Section<Car>(title: "Italy", elements: [])
    let italianPage = Page(sections: [italianSection, sectionFerrari, sectionLamborghini, sectionMaserati])
    return Book(pages: [germanPage, italianPage])
}

func asyncCall(callback: Void -> Void) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
        sleep(1)
        dispatch_async(dispatch_get_main_queue()) {
            callback()
        }
    }
}

func asyncCarArray(callback: [Car] -> Void) {
    asyncCall {
        callback(carArray())
    }
}

func asyncCarPage(callback: Page<Car> -> Void) {
    asyncCall {
        callback(carPage())
    }
}

func asyncCarBook(callback: Book<Car> -> Void) {
    asyncCall {
        callback(carBook())
    }
}
