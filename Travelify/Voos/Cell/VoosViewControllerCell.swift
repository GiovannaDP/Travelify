//
//  VoosViewControllerCell.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

protocol VoosCellControllerDelegate: AnyObject {
    func didSelectView(_ viagem: VoosModel?)
}


class VoosViewControllerCell: UITableViewCell {
    
    private var customView: VoosScreenViewCell = VoosScreenViewCell()
    
    weak var delegate: VoosCellControllerDelegate?

}
