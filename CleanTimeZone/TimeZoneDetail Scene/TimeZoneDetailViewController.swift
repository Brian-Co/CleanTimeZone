//
//  TimeZoneDetailViewController.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 20/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import UIKit

protocol TimeZoneDetailViewControllerInput: class {
    func viewModelUpdated(_ viewModel: TimeZoneDetailViewModel.Content)
}

final class TimeZoneDetailViewController: UIViewController {

    var interactor: TimeZoneDetailInteractorInput?
    var viewModel: TimeZoneDetailViewModel.Content?
    
    @IBOutlet weak var timeZoneDetailLabel: UILabel!
    
    var apiLink: String?

    func initScene() {
        interactor = TimeZoneDetailInteractor(presenter: TimeZoneDetailPresenter(viewController: self))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initScene()
        interactor?.loadContent(apiLink)
    }

}

extension TimeZoneDetailViewController: TimeZoneDetailViewControllerInput {
    func viewModelUpdated(_ viewModel: TimeZoneDetailViewModel.Content) {
        self.viewModel = viewModel
        timeZoneDetailLabel.text = viewModel.detailText
    }
}
