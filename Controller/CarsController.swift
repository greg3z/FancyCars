//
//  CarsController.swift
//  FancyCars
//
//  Created by Grégoire Lhotellier on 17/05/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

final class CarsController: UIViewController {
    
    let cars: Book<Car>
    
    init(cars: Book<Car>) {
        self.cars = cars
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(cars: Page<Car>) {
        self.init(cars: Book(pages: [cars]))
    }
    
    convenience init(cars: [Car]) {
        self.init(cars: Book(cars))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let listController = ListsView(elements: cars)
        listController.configureCell = {
            car, cell, _, _ in
            cell.selectionStyle = .None
            cell.textLabel?.text = car.model
            cell.imageView?.image = UIImage(named: car.image)
        }
        addChildViewController(listController)
        listController.view.frame = view.bounds
        view.addSubview(listController.view)
    }
    
}
