//
//  MovieDetailCell.swift
//  BioBeatsApp
//
//  Created by Sweta Jaiswal on 09/05/2019.
//  Copyright © 2019 Sweta Jaiswal. All rights reserved.
//

import UIKit

class MovieDetailsCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var valueTxtView: UITextView!
    @IBOutlet weak var movieImgView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var websiteUrl: URL?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // UI Setup
        styleSetup()
        setupAccessibilityLabels()
    }
}



extension MovieDetailsCell {
    
    private func styleSetup() {
   
        titleLbl.textColor = UIColor.orange
        
        movieImgView.layer.borderColor = UIColor.orange.cgColor
        movieImgView.layer.borderWidth = 3.0
        movieImgView.layer.cornerRadius = 8.0
        
        self.isUserInteractionEnabled = false
        valueTxtView.isUserInteractionEnabled = false
        valueTxtView.isEditable = false
        valueTxtView.isSelectable = false
    }
    
    
    func configureCell(dict: [String: String], index: Int, key: String) {
        
        self.accessibilityIdentifier = "MovieDetailsCell_Index_\(String(describing: index))"
            
        activityIndicator.startAnimating()
        
        if index == 0 {
            
            titleLbl.isHidden = true
            valueTxtView.isHidden = true
            movieImgView.isHidden = false
            activityIndicator.isHidden = false
            self.backgroundColor = UIColor.groupTableViewBackground
            
            guard let imgStr = dict["Poster"] else { return }
            movieImgView.load(url: URL(string: imgStr)! )
        }
        else {
            
            if key != "Poster" {
                
                titleLbl.isHidden = false
                valueTxtView.isHidden = false
                movieImgView.image = nil
                movieImgView.isHidden = true
                activityIndicator.isHidden = true
                self.backgroundColor = UIColor.white
                
                titleLbl.text = key.trimmingCharacters(in: .whitespacesAndNewlines)
                
                // Value text
                let attributedString = NSMutableAttributedString(string: dict[key]!, attributes: nil)
                
                var attributes: [NSAttributedString.Key : NSObject] = [
                    NSAttributedString.Key.foregroundColor : UIColor.black,
                    NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]
                
                if key == "Website" {
                    
                    // Show website as a link to make it user interactable
                    
                    websiteUrl = URL(string: dict[key]!)!
                  
                    attributes = [
                        NSAttributedString.Key.foregroundColor : UIColor.orange,
                        NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17),
                        NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue as AnyObject,
                        NSAttributedString.Key.link: dict[key] as AnyObject] as! [NSAttributedString.Key : NSObject]
                    
                    // Enable textview to interact
                    self.isUserInteractionEnabled = true
                    valueTxtView.isUserInteractionEnabled = true
                    valueTxtView.isEditable = false
                    valueTxtView.isSelectable = true
                }
                
                attributedString.setAttributes(attributes, range: NSMakeRange(0, dict[key]!.count))
                valueTxtView.attributedText = attributedString
            }
        }
        
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
    
    private func setupAccessibilityLabels() {
        
        movieImgView?.accessibilityIdentifier = Accessibility.Identifiers.MovieDetails.Table.Cell.imageView
        titleLbl.accessibilityIdentifier = Accessibility.Identifiers.MovieDetails.Table.Cell.titleLbl
        valueTxtView.accessibilityIdentifier = Accessibility.Identifiers.MovieDetails.Table.Cell.valueLbl
        activityIndicator.accessibilityIdentifier = Accessibility.Identifiers.MovieDetails.Table.Cell.activityIndicator
    }
    
}



//MARK: - UITextView Delegate

extension MovieDetailsCell: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        guard websiteUrl!.absoluteString.count > 0 else {
            return false
        }
        
        UIApplication.shared.open(websiteUrl!, options: [:], completionHandler: nil)
        return true
    }
    
}
