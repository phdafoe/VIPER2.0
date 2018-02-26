//
//  AssemblyMaster.swift
//  VIPER2.0
//
//  Created by Andres Felipe Ocampo Eljaiesk on 24/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation

class AssemblyMaster{
    
    //MARK: - Singleton
    static let shared = AssemblyMaster()
    
    func configuracion(_ viewController : MasterViewController){
        let provider = Provider()
        let interactor = InteractorMaster()
        let presenter = PresenterMaster()
        let router = RoutingMaster()
        viewController.presenter = presenter
        interactor.presenter = presenter
        interactor.provider = provider
        presenter.interactor = interactor
        presenter.view = viewController
        presenter.router = router
        router.viewController = viewController
    }
    
}
