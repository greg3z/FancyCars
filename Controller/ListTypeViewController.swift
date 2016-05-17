//
//  ViewController.swift
//  FancyCars
//
//  Created by Grégoire Lhotellier on 14/05/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

class ListTypeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "🏁"
        let lists: [ListType] = [.Array, .Page, .Book, .AsyncArray, .AsyncPage, .AsyncBook]
        let listController = ListsView(elements: lists)
        listController.configureCell = {
            list, cell, _, _ in
            cell.accessoryType = .DisclosureIndicator
            cell.textLabel?.text = list.rawValue
        }
        listController.elementTouched = {
            list, _ in
            let viewController: UIViewController
            switch list {
            case .Array: viewController = CarsViewController(cars: carArray())
            case .Page: viewController = CarsViewController(cars: carPage())
            case .Book: viewController = CarsViewController(cars: carBook())
            case .AsyncArray:
                let statesViewController = StatesView()
                asyncCarArray { statesViewController.setChildViewController(CarsViewController(cars: $0)) }
                viewController = statesViewController
            case .AsyncPage:
                let statesViewController = StatesView()
                asyncCarPage { statesViewController.setChildViewController(CarsViewController(cars: $0)) }
                viewController = statesViewController
            case .AsyncBook:
                let statesViewController = StatesView()
                asyncCarBook { statesViewController.setChildViewController(CarsViewController(cars: $0)) }
                viewController = statesViewController
            }
            viewController.title = "🚗 Fancy Cars 🚗"
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        addChildViewController(listController)
        listController.view.frame = view.bounds
        view.addSubview(listController.view)
    }

}
