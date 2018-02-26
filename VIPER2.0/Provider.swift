//
//  Provider.swift
//  VIPER2.0
//
//  Created by Andres Felipe Ocampo Eljaiesk on 24/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Kingfisher

protocol InterfaceProviderProtocol {
    func solicitarDatosAPIApple(_ completion: @escaping ([DataEntity]?) -> ())
}

class Provider : InterfaceProviderProtocol {
    
    //MARK: - Singleton del Provider
    //static let shared = Provider()
    
    
    /// Metodo que se encarga de solicitar la informacion al API de Apple
    ///
    /// - Parameter completion: retorna un CallBack de un array de [DataEntity]
    func solicitarDatosAPIApple(_ completion: @escaping ([DataEntity]?) -> ()) {
        
        guard let url = URL(string: CONSTANTES.LLAMADAS.BASE_URL) else { return }
        
        Alamofire.request(url,
                          method: .get).validate().responseJSON { (responseData) in
                            switch responseData.result{
                            case .success:
                                guard let valorData = responseData.result.value else{return}
                                let jsonData : JSON?
                                jsonData = JSON(valorData)
                                if let jsonDatDes = jsonData{
                                    var resultData = [DataEntity]()
                                    for c_result in jsonDatDes["feed"]["results"].arrayValue{
                                        let movieDicionary = DataEntity(json: c_result)
                                        resultData.append(movieDicionary)
                                    }
                                    completion(resultData)
                                }
                            case . failure(let error):
                                print("Error: \(error.localizedDescription)")
                                completion(nil)
                            }
        }
    }
    
}


