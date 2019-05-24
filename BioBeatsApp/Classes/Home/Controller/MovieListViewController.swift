//
//  HomeViewController.swift
//  BioBeatsApp
//
//  Created by Sweta Jaiswal on 08/05/2019.
//  Copyright © 2019 Sweta Jaiswal. All rights reserved.
//

import UIKit
import Alamofire


class MovieListViewController: UITableViewController, UISearchBarDelegate {

    private var moviesList = [MovieItem]()
    private var filteredMovieList = [MovieItem]()
    
    private var resultSearchController = UISearchController()
    private var searchBar = UISearchBar()
    private var activityIndicator = UIActivityIndicatorView()
    
    private let apiManager = APIManager()
    
    private let defaultSearchString = {
        return "Man"
    }()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupForUI()
        setupAccessibilityLabels()
  
        loadMovies(text: defaultSearchString)
    }

}



//MARK: - UITableView DataSource

extension MovieListViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (resultSearchController.isActive) ? filteredMovieList.count : moviesList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell", for: indexPath) as! MovieListCell
        let arr = resultSearchController.isActive ? filteredMovieList : moviesList
        cell.configureCell(arr: arr, index: indexPath.row)
       
        return cell
    }

}


    
//MARK: - UITableView Delegate

extension MovieListViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        tableView.deselectRow(at: indexPath, animated: true)
        
        let arr = searchBar.text!.count > 0 ? filteredMovieList : moviesList

        guard arr.count > 0, let imdbID = arr[indexPath.row].imdbID else { return }
        
        // Present movie details
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        detailVC.imdbID = imdbID
        detailVC.view.backgroundColor = UIColor.init(white: 0.05, alpha: 0.8)
        
        if resultSearchController.isActive {
            resultSearchController.dismiss(animated: true, completion: nil)
        }
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
}



//MARK: - UISearchBar Delegate

extension MovieListViewController: UISearchControllerDelegate {
    
    internal func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        loadMovies(text: defaultSearchString)
    }
    
    internal func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            resultSearchController.isActive = false
            searchBarCancelButtonClicked(searchBar)
        }
    }
    
    
}


//MARK: - UISearchResultsUpdating Protocol

extension MovieListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
     
        guard searchController.searchBar.text!.count > 0 else { return }
    
        if resultSearchController.isActive {
            loadMovies(text: searchController.searchBar.text!)
        }
    }
}


//MARK: - Private methods

extension MovieListViewController {
    
    private func loadMovies(text: String) {
        
        // Check if internet connection is available
       
        if NetworkReachabilityManager()!.isReachable {
            
            activityIndicator.startAnimating()
            filteredMovieList.removeAll(keepingCapacity: false)
            
            var dict = ["s" : text]
            
            apiManager.getMoviesList(params: &dict, completion: {(success, responseObject) in
                
                if success {
                    
                    if let response = responseObject as? [MovieItem] {
                        if self.resultSearchController.isActive {
                            self.filteredMovieList = response
                        } else {
                            self.moviesList = response
                        }
                    }
               
                } else {
                    // Unable to fetch data for the first time
                
                    if !self.resultSearchController.isActive {
                        self.showAlert(msg: "Something went wrong, please try again later!")
                    }
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.stopIndicator(activityIndicator: self.activityIndicator)
                }
            })
            
        } else {
            stopIndicator(activityIndicator: self.activityIndicator)
            showAlert(msg: "Please check your internet connection!")
        }
    }
    
    
    //MARK: - UI Setup
    
    private func setupForUI() {
        
        setupNavigationbar()
        
        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.dimsBackgroundDuringPresentation = false
            controller.hidesNavigationBarDuringPresentation = false;
            controller.definesPresentationContext = true;
            
            controller.searchResultsUpdater = self
            controller.searchBar.searchBarStyle = .prominent
            controller.searchBar.tintColor = .orange
            controller.searchBar.sizeToFit()
            tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
        
        activityIndicator = ({
            let indicator = UIActivityIndicatorView(style: .whiteLarge)
            indicator.color = UIColor.orange
            indicator.center = self.view.center
            indicator.startAnimating()
            self.view.addSubview(indicator)
            self.view.bringSubviewToFront(indicator)
            return indicator
        })()
        
        searchBar = ({
            let search_bar = resultSearchController.searchBar
            search_bar.delegate = self
            return search_bar
        })()
        
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 80
    }
    
    
    private func setupAccessibilityLabels() {
        tableView.accessibilityIdentifier = Accessibility.Identifiers.MoviesList.Table.tableView
        activityIndicator.accessibilityIdentifier = Accessibility.Identifiers.MoviesList.activityIndicator
    }
    
    
    
}
