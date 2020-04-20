//
//  MainPresenter.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 17/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import Foundation

protocol MainPresenterInput: class {
    func modelUpdated(_ timesOpen: Int?, _ color: MainViewModel.MainBackgroundColor?)
}

final class MainPresenter {
    weak var viewController: MainViewControllerInput?

    init(viewController: MainViewControllerInput?) {
        self.viewController = viewController
    }
    
    func updateMainLabel(_ timesOpen: Int?) -> String {
        let messageBeginning = NSLocalizedString("CleanTimeZone opened", comment: "")
        let timesOpen = timesOpen?.description ?? "X"
        let messageEnd = NSLocalizedString("times", comment: "")
        let mainText = messageBeginning + "\r" + timesOpen + " " + messageEnd
        return mainText
    }
}

extension MainPresenter: MainPresenterInput {
    
    func modelUpdated(_ timesOpen: Int?, _ color: MainViewModel.MainBackgroundColor?) {
        let mainText = updateMainLabel(timesOpen)
        let viewModel = MainViewModel.Content(mainText: mainText, backgroundColor: color)
        viewController?.viewModelUpdated(viewModel)
    }
}
