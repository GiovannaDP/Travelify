//
//  HoteisViewControllerCell.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//

import Foundation
import UIKit

protocol HoteisViewControllerCell: AnyObject {
    func didSelectView(_ viagem: PacotesModel?)
}

class HoteisCellController: UITableViewCell {
    
    private var customView: HoteisScreenViewCell = HoteisScreenViewCell()
    
    weak var delegate: HoteisViewControllerCell?

}


