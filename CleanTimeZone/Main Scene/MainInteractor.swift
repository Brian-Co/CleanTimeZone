//
//  MainInteractor.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 17/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import Foundation

protocol MainInteractorInput: class {
    func loadContent()
    func changeBackgroundColor()
}

final class MainInteractor {
    var presenter: MainPresenterInput?
    
    var currentColor: MainViewModel.MainBackgroundColor?
    
    init(presenter: MainPresenterInput?) {
        self.presenter = presenter
    }
}

extension MainInteractor: MainInteractorInput {
    func loadContent() {
        let defaults = UserDefaults.standard
        var timesOpen = defaults.integer(forKey: "timesOpen")
        timesOpen += 1
        defaults.set(timesOpen, forKey: "timesOpen")
        
        presenter?.modelUpdated(timesOpen)
    }
    
    func changeBackgroundColor() {
        let allColors = MainViewModel.MainBackgroundColor.allCases
        let colors = allColors.filter { $0 != currentColor }
        let newColor = colors.randomElement()
        currentColor = newColor
        
        presenter?.colorUpdated(newColor)
    }
}

