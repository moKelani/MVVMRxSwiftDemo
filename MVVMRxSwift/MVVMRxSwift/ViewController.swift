//
//  ViewController.swift
//  MVVMRxSwift
//
//  Created by Mohamed Kelany on 10/25/20.
//  Copyright © 2020 Mohamed Kelany. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    private var viewModel: RestaurantListViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    static func instantiate(viewModel: RestaurantListViewModel) -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.tableFooterView = UIView()
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.contentInsetAdjustmentBehavior = .never
        viewModel.fetchRestaurantViewModels().observeOn(MainScheduler.instance).bind(to: tableView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in
            cell.textLabel?.text = viewModel.displayText
        }.disposed(by: disposeBag)
        
    }


}

