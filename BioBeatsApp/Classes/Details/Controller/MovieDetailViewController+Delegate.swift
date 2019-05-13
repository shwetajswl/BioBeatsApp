//
//  MovieDetailViewController+Delegate.swift
//  BioBeatsApp
//
//  Created by Sweta Jaiswal on 12/05/2019.
//  Copyright © 2019 Sweta Jaiswal. All rights reserved.
//

import Foundation
import UIKit

extension MovieDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (indexPath.row == 0) ? 250 : UITableView.automaticDimension
    }
    
}
