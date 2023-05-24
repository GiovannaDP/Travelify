//
//  DadosUsuarioViewControllerCell.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

protocol DadosDoUsuarioCellControllerDelegate: AnyObject {
    func didSelectView(_ viagem: PacotesModel?)
}


class DadosUsuarioViewControllerCell: UITableViewCell {
    
    private var customView: DadosUsuarioScreenViewCell = DadosUsuarioScreenViewCell()
    
    weak var delegate: DadosDoUsuarioCellControllerDelegate?
}
