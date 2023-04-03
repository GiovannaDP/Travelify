//
//  DadosVendedorViewControllerCell.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

protocol DadosVendedorCellControllerDelegate: AnyObject {
    func didSelectView()
}


class DadosVendedorViewControllerCell: UITableViewCell {
    
    private var customView: DadosVendedorScreenViewCell = DadosVendedorScreenViewCell()
    
    weak var delegate: DadosVendedorCellControllerDelegate?

}

