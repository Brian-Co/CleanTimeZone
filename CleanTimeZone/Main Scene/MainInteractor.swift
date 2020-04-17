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
    
    var timesOpen: Int?
    var currentColor: MainBackgroundColor?
    
    init(presenter: MainPresenterInput?) {
        self.presenter = presenter
    }
    
    func updatePresenter() {
        presenter?.modelUpdated(timesOpen, currentColor)
    }
}

extension MainInteractor: MainInteractorInput {
    func loadContent() {
        let defaults = UserDefaults.standard
        var timesOpenDefault = defaults.integer(forKey: "timesOpen")
        timesOpenDefault += 1
        timesOpen = timesOpenDefault
        defaults.set(timesOpen, forKey: "timesOpen")
        
        updatePresenter()
    }
    
    func changeBackgroundColor() {
        let allColors = MainBackgroundColor.allCases
        let colors = allColors.filter { $0 != currentColor }
        let newColor = colors.randomElement()
        currentColor = newColor
        
        updatePresenter()
    }
}

