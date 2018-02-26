//
//  AssemblyDetail.swift
//  VIPER2.0
//
//  Created by Andres Felipe Ocampo Eljaiesk on 24/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation

class AssemblyDetalle{
    
    //MARK: - Singleton
    static let shared = AssemblyDetalle()
    
    func configuracion(_ viewController : DetailViewController){
        
        let interactor = InteractorDetalle()
        let presenter = PresenterDetalle()
        viewController.presenter = presenter
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.view = viewController
    }
    
}
