//
//  InteractorDetailViewController.swift
//  VIPER2.0
//
//  Created by Andres Felipe Ocampo Eljaiesk on 24/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation

protocol InterfaceDetalleInteractorEntrada : class {
    func configuraModeloDatos(_ modeloDatos : DataEntity)
}

protocol InterfaceDetalleInteractorSalida : class {
   func proveedorDatosTransportados(_ modeloDatos : DataEntity)
}

class InteractorDetalle : InterfaceDetalleInteractorEntrada {
    
    weak var presenter : InterfaceDetalleInteractorSalida!
    var modelData : DataEntity?
    
    func configuraModeloDatos(_ modeloDatos : DataEntity){
        self.modelData = modeloDatos
    }
    
    func solicitaDatos(){
        self.presenter.proveedorDatosTransportados(modelData!)
    }
    
}
