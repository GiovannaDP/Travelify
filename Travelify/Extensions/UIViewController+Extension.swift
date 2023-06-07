//
//  UIViewController+Extension.swift
//  Travelify
//
//  Created by Giovanna Danelli Pau on 30/03/23.
//


import Foundation
import UIKit

extension UIViewController {
    func navigateToMenuUsuario() {
        let vc = DadosUsuarioViewController()
        vc.modalTransitionStyle = .coverVertical

        let transicao = CATransition()
        transicao.duration = 0.3
        transicao.type = CATransitionType.moveIn
        transicao.subtype = CATransitionSubtype.fromTop
        navigationController?.view.layer.add(transicao, forKey: kCATransition)
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func navigateToMenuVendedor() {
        let vc = DadosVendedorViewController()
        vc.modalTransitionStyle = .coverVertical
        
        let transicao = CATransition()
        transicao.duration = 0.3
        transicao.type = CATransitionType.moveIn
        transicao.subtype = CATransitionSubtype.fromTop
        navigationController?.view.layer.add(transicao, forKey: kCATransition)
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func popToTelaInicialCompras() {
        if let telaAnterior = navigationController?.viewControllers.first(where: { $0 is TelaInicialViewController }) {
            navigationController?.popToViewController(telaAnterior, animated: true)
        }
    }
    
    func popToTelaInicialVendas() {
        if !UserViewModel.body.flights.isEmpty || !UserViewModel.body.hotels.isEmpty || !UserViewModel.body.packages.isEmpty {
            if let telaAnterior = navigationController?.viewControllers.first(where: { $0 is ComAnuncioViewController }) {
                navigationController?.popToViewController(telaAnterior, animated: true)
            }
        } else {
            if let telaAnterior = navigationController?.viewControllers.first(where: { $0 is SemAnuncioViewController }) {
                navigationController?.popToViewController(telaAnterior, animated: true)
            }
        }
    }
}
