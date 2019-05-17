//
//  MovieListCell.swift
//  BioBeatsApp
//
//  Created by Sweta Jaiswal on 08/05/2019.
//  Copyright © 2019 Sweta Jaiswal. All rights reserved.
//

import UIKit

class MovieListCell: UITableViewCell {

    @IBOutlet weak var movieImgView: UIImageView!
    @IBOutlet weak var movieLbl: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupAccessibilityLabels()
    }
    
    
    func configureCell(arr: [MovieItem], index: Int) {
        
        self.accessibilityIdentifier = "MovieListCell_Index_\(String(describing: index))"
        
        activityIndicator.startAnimating()
        
        movieImgView?.layer.cornerRadius = 10
        movieImgView.layer.borderColor = UIColor.orange.cgColor
        movieImgView.layer.borderWidth = 3.0
        
        if arr[index].title != nil {
            movieLbl.text = arr[index].title
        }
        
        if arr[index].poster != nil  {
            let url = URL(string: arr[index].poster!)!
            movieImgView.load(url: url)
        } else {
            movieImgView.image = UIImage.init(named: "default-movie")
        }
        
        activityIndicator.stopAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
}



//MARK: - Private Methods

extension MovieListCell {
    
    private func setupAccessibilityLabels() {
        
        movieImgView.accessibilityIdentifier = Accessibility.Identifiers.MoviesList.Table.Cell.imageView
        movieLbl.accessibilityIdentifier = Accessibility.Identifiers.MoviesList.Table.Cell.title
        activityIndicator.accessibilityIdentifier = Accessibility.Identifiers.MoviesList.Table.Cell.activityIndicator
    }
    
    
}
