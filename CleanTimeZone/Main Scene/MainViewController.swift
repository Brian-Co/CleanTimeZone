//
//  MainViewController.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 17/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import UIKit

protocol MainViewControllerInput: class {
    func viewModelUpdated(_ viewModel: MainViewModel.Content, _ changedContent: MainViewModel.ChangedContent)
}

final class MainViewController: UIViewController {

    var interactor: MainInteractorInput?
    var viewModel: MainViewModel.Content?
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var changeBackgroundColorButton: UIButton!
    @IBOutlet weak var checkTimeZonesButton: UIButton!
    
    func initScene() {
        interactor = MainInteractor(presenter: MainPresenter(viewController: self))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        initScene()
        interactor?.loadContent()
    }
    
    func configureUI() {
        changeBackgroundColorButton.layer.cornerRadius = 15
        checkTimeZonesButton.layer.cornerRadius = 15
    }
    
    func updateBackgroundColor() {
        let color = viewModel?.backgroundColor?.color
        view.backgroundColor = color ?? .white
        mainLabel.textColor = color == UIColor.black ? UIColor.white : UIColor.label
    }
    
    @IBAction func changeBackgroundColor(_ sender: Any) {
        interactor?.changeBackgroundColor()
    }
    
    @IBAction func checkTimeZones(_ sender: Any) {
        performSegue(withIdentifier: "TimeZonesViewController", sender: self)
    }
    
}

extension MainViewController: MainViewControllerInput {
    
    func viewModelUpdated(_ viewModel: MainViewModel.Content, _ changedContent: MainViewModel.ChangedContent) {
        self.viewModel = viewModel
        switch changedContent {
        case .mainText:
            mainLabel.text = viewModel.mainText
        case .color:
            updateBackgroundColor()
        }
    }
    
}
    
extension MainViewModel.MainBackgroundColor {
    var color: UIColor {
        switch self {
        case .white:
            return .white
        case .black:
            return .black
        case .green:
            return .green
        }
    }
}
