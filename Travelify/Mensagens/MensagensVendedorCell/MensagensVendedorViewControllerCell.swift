//
//  MensagensVendedorViewControllerCell.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 24/05/23.
//

import Foundation
import UIKit

protocol MensagensVendedorViewControllerDelegate: AnyObject {
    func didSelectView(_ viagem: PacotesModel?)
}


class MensagensVendedorViewControllerCell: UITableViewCell {
    
    private var customView: MensagensVendedorScreenViewCell = MensagensVendedorScreenViewCell()
    
    weak var delegate: MensagensVendedorViewControllerDelegate?
}

