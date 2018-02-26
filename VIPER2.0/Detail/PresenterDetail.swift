//
//  PresenterDetailViewController.swift
//  VIPER2.0
//
//  Created by Andres Felipe Ocampo Eljaiesk on 24/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation

protocol InterfacePresenterDetalleEntrada : InterfaceDetalleInteractorSalida, InterfaceDetailViewControllerSalida {
}

class PresenterDetalle : InterfacePresenterDetalleEntrada {
    
    
    
    weak var view : InterfaceDetailViewControllerEntrada!
    var interactor : InterfaceDetalleInteractorEntrada!
    
    //Pasamos los datos a través del modulo router
    func datosObjetoModeloSeleccionado(_ dataModel : DataEntity){
        self.interactor.configuraModeloDatos(dataModel)
    }
    
    func proveedorDatosTransportados(_ modeloDatos: DataEntity) {
        view.aderirModeloDatos(modeloDatos)
    }
    
}
