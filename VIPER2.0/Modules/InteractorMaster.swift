//
//  InteractorViewController.swift
//  VIPER2.0
//
//  Created by Andres Felipe Ocampo Eljaiesk on 24/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation

protocol InterfaceMasterInteractorEntrada : class {
    func solicitaTodaInformacionAlProvider()
}

protocol InterfaceMasterInteractorSalida : class {
    func proveedorDatos(_ arrayDatos : [DataEntity])
    func muestraErrorDatos()
}

class InteractorMaster : InterfaceMasterInteractorEntrada{
    
    weak var presenter : InterfaceMasterInteractorSalida!
    var provider : InterfaceProviderProtocol!
    
    func solicitaTodaInformacionAlProvider(){
        provider.solicitarDatosAPIApple { (resultados) in
            guard let resultadosDes = resultados else { return }
            self.presenter?.proveedorDatos(resultadosDes)
        }
    }
}
