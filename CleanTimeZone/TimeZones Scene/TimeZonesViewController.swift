//
//  TimeZonesViewController.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 17/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import UIKit

protocol TimeZonesViewControllerInput: class {
    func viewModelUpdated(_ viewModel: TimeZonesViewModel.Content)
}

final class TimeZonesViewController: UIViewController {

    var interactor: TimeZonesInteractorInput?
    var viewModel: TimeZonesViewModel.Content?
    
    @IBOutlet weak var timeZonesTableView: UITableView!
    var activityIndicator: UIActivityIndicatorView?
    
    var apiLink: String?
    
    func initScene() {
        interactor = TimeZonesInteractor(presenter: TimeZonesPresenter(viewController: self))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        timeZonesTableView.delegate = self
        timeZonesTableView.dataSource = self
        initScene()
        activityIndicator = view.activityIndicator()
        interactor?.loadContent()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let timeZoneDetailVC = segue.destination as? TimeZoneDetailViewController {
            timeZoneDetailVC.apiLink = apiLink
        }
    }

}

extension TimeZonesViewController: TimeZonesViewControllerInput {
    func viewModelUpdated(_ viewModel: TimeZonesViewModel.Content) {
        self.viewModel = viewModel
        activityIndicator?.stopAnimating()
        timeZonesTableView.reloadData()
    }
}


extension TimeZonesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.timeZones.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let timeZone = viewModel?.timeZones[indexPath.row]
        cell.textLabel?.text = timeZone?.text
        cell.imageView?.image = UIImage(systemName: "clock")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        apiLink = viewModel?.timeZones[indexPath.row].apiLink
        self.performSegue(withIdentifier: "TimeZoneDetailViewController", sender: self)
    }
    
}
