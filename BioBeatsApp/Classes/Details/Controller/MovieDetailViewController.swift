//
//  MovieDetailViewController.swift
//  BioBeatsApp
//
//  Created by Sweta Jaiswal on 09/05/2019.
//  Copyright © 2019 Sweta Jaiswal. All rights reserved.
//

import UIKit
import Alamofire


class MovieDetailViewController: UIViewController {

    @IBOutlet weak var crossBtn: UIButton!
    @IBOutlet weak var detailsTable: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let apiManager = APIManager()
    
    var imdbID: String = ""
    private var dict = [String: String]()
    private var keys = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupAccessibilityLabels()
        loadMovieDetails(imDBID: imdbID)
    }
    
    
    @IBAction func crossBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}



//MARK: - UITableView DataSource

extension MovieDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dict.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailsCell", for: indexPath) as! MovieDetailsCell
        cell.configureCell(dict: dict, index: indexPath.row, key: keys[indexPath.row])
        return cell
    }
    
}


//MARK: - Private Methods

extension MovieDetailViewController {
    
    // Make API request to fetch movie details based on IMDB ID
    
    private func loadMovieDetails(imDBID: String) {
        
        if NetworkReachabilityManager()!.isReachable {
            
            var params = ["i": imDBID]
            
            apiManager.getMovieDetails(params: &params, completion: {(success, responseObject) in
                
                if success {
                    
                    if let response = responseObject as? MovieDetailModel {
                        self.dict = response.convertToDict() as! [String: String]
                        self.keys = self.dict.keys.sorted()
                        
                        DispatchQueue.main.async {
                            self.detailsTable.reloadData()
                            sleep(1)
                            self.stopIndicator(activityIndicator: self.activityIndicator)
                        }
                    }
                    
                } else {
                    
                    self.stopIndicator(activityIndicator: self.activityIndicator)
                    self.showAlertAndHide(msg: "Something went wrong, please try again later!")
                }
            })
            
        } else {
            
            self.stopIndicator(activityIndicator: self.activityIndicator)
            showAlertAndHide(msg: "Please check your internet connection!")
        }
    }
    
    
    private func setupUI() {
        
        let crossImg = UIImage.init(named: "Cross")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        crossBtn.tintColor = UIColor.orange
        crossBtn.backgroundColor = UIColor.white
        crossBtn.setImage(crossImg, for: .normal)
        crossBtn.layer.cornerRadius = crossBtn.frame.width/2
        
        detailsTable.tableFooterView = UIView()
        detailsTable.layer.cornerRadius = 6.0
        detailsTable.delegate = self
        detailsTable.dataSource = self
        
        activityIndicator.startAnimating()
        
        self.providesPresentationContextTransitionStyle = true
        self.definesPresentationContext = true
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.modalTransitionStyle = .crossDissolve
    }
   
    
    private func setupAccessibilityLabels() {
        detailsTable.accessibilityIdentifier = Accessibility.Identifiers.MovieDetails.Table.tableView
        crossBtn.accessibilityIdentifier = Accessibility.Identifiers.MovieDetails.crossbutton
        activityIndicator.accessibilityIdentifier = Accessibility.Identifiers.MovieDetails.activityIndicator
    }
  
}

