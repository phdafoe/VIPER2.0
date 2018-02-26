//
//  DetailViewController.swift
//  VIPER2.0
//
//  Created by Andres Felipe Ocampo Eljaiesk on 24/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit
import Kingfisher

protocol InterfaceDetailViewControllerEntrada : class {
    func aderirModeloDatos(_ modeloDatos : DataEntity)
}

protocol InterfaceDetailViewControllerSalida : class {
    func datosObjetoModeloSeleccionado(_ dataModel : DataEntity)
}

class DetailViewController: UIViewController, InterfaceDetailViewControllerEntrada {

    
    //MARK: - Variables locales
    var presenter : InterfaceDetailViewControllerSalida!
    
    //MARK: - IBOutlets
    @IBOutlet weak var myBackgroundImagenData: UIImageView!
    @IBOutlet weak var myImagenPost: UIImageView!
    @IBOutlet weak var myTituloPost : UILabel!
    @IBOutlet weak var myNombreArtistaPost : UILabel!
    @IBOutlet weak var myFechalanzamientoPost : UILabel!
    @IBOutlet weak var myIdPost : UILabel!
    @IBOutlet weak var myUrlPost : UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //Creamos Modulo del VIPER
        AssemblyDetalle.shared.configuracion(self)
    }
    
    func aderirModeloDatos(_ modeloDatos: DataEntity) {
        myNombreArtistaPost.text = modeloDatos.artistName
        myIdPost.text = modeloDatos.id
        myFechalanzamientoPost.text = modeloDatos.releaseDate
        myUrlPost.text = modeloDatos.url
        if let imageDes = modeloDatos.artworkUrl100, let urlDes = URL(string: imageDes){
            myImagenPost.kf.setImage(with: ImageResource(downloadURL: urlDes),
                                                placeholder: #imageLiteral(resourceName: "placeholder"),
                                                options: [.transition(ImageTransition.fade(1))],
                                                progressBlock: nil,
                                                completionHandler: nil)
        }
    }

    

}
