//
//  PacotesViewControllerCell.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

protocol PacotesCellControllerDelegate: AnyObject {
    func didSelectView(_ viagem: PacotesModel?)
}

class PacotesViewControllerCell: UITableViewCell {
    
    private var customView: PacotesScreenViewCell = PacotesScreenViewCell()
    
    weak var delegate: PacotesCellControllerDelegate?

}

