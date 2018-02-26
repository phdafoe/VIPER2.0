//
//  RoutingMaster.swift
//  VIPER2.0
//
//  Created by Andres Felipe Ocampo Eljaiesk on 24/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//
import Foundation
import UIKit

protocol InterfaceRouterEntrada : class {
    func navegacionAlDetalleDeDatos()
}

class RoutingMaster : InterfaceRouterEntrada {
    
    weak var viewController : MasterViewController!
    
    //MARK: - Navegacion
    func navegacionAlDetalleDeDatos(){
        let detalleVC = DetailViewController()
        guard let indexPathSeleccionado = viewController.myCollectionView.indexPathsForSelectedItems?.first else {return}
        let modeloData = viewController.arrayImagenes[indexPathSeleccionado.row]
        detalleVC.presenter.datosObjetoModeloSeleccionado(modeloData)
        viewController.show(detalleVC, sender: nil)
    }
    
}
