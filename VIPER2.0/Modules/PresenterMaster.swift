//
//  PresenterViewController.swift
//  VIPER2.0
//
//  Created by Andres Felipe Ocampo Eljaiesk on 24/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation

protocol InterfacePresenterMasterEntrada: InterfaceMasterViewControllerSalida, InterfaceMasterInteractorSalida{
}

class PresenterMaster : InterfacePresenterMasterEntrada{
    
    weak var view : InterfaceMasterViewControllerEntrada!
    var interactor : InterfaceMasterInteractorEntrada!
    var router : InterfaceRouterEntrada!
    
    //el presenter le dice al interactor que la ViewController necesita imagenes
    func solicitaDatosAlInteractor(){
        interactor.solicitaTodaInformacionAlProvider()
    }
    
    //El servicio retorna los datos y el interactor pasa todos los datos al presenter
    //cada vez que la vista se muestre
    func proveedorDatos(_ arrayDatos : [DataEntity]){
        self.view.mostrarDatosSolicitados(arrayDatos)
    }
    
    //El servicio muestra un error del servicio
    func muestraErrorDatos(){
        self.view.mostrarAlertaError()
    }
    
    //Gestionamos la navegacion
    func irVistaDetalle(){
        self.router.navegacionAlDetalleDeDatos()
    }
    
    
}
