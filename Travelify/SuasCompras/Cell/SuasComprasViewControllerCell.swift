//
//  SuasComprasViewControllerCell.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 22/05/23.
//

import Foundation
import UIKit

protocol SuasComprasViewControllerDelegate: AnyObject {
    func didSelectView(_ viagem: PacotesModel?)
}


class SuasComprasViewControllerCell: UITableViewCell {
    
    private var customView: SuasComprasScreenViewCell = SuasComprasScreenViewCell()
    
    weak var delegate: SuasComprasViewControllerDelegate?
}
