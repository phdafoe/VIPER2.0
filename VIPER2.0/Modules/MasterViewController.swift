//
//  MasterViewController.swift
//  VIPER2.0
//
//  Created by Andres Felipe Ocampo Eljaiesk on 24/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit
import Kingfisher
import APESuperHUD

protocol InterfaceMasterViewControllerSalida : class {
    func solicitaDatosAlInteractor()
    func irVistaDetalle()
}

protocol InterfaceMasterViewControllerEntrada : class {
    func mostrarDatosSolicitados(_ datos : [DataEntity])
    func mostrarAlertaError()
}


class MasterViewController: UIViewController, InterfaceMasterViewControllerEntrada {

    //MARK: - IBOutlest
    @IBOutlet weak var myCollectionView : UICollectionView!
    
    //MARK: - Variables globales
    var presenter : InterfaceMasterViewControllerSalida!
    var arrayImagenes : [DataEntity] = []

    //MARK: - life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Creamos Modulo del VIPER
        AssemblyMaster.shared.configuracion(self)
        realizarPresentacionDeDatos()
        
        //Registro y delegado de la collectionView
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(UINib(nibName: ImagenViewCell.defaultIdentifier,
                                        bundle: nil),
                                  forCellWithReuseIdentifier: ImagenViewCell.defaultIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "V.I.P.E.R._2.0"
    }

    //MARK: - Private Methods
    //Solicitud del resultado de datos al Presenter
    func realizarPresentacionDeDatos(){
        presenter.solicitaDatosAlInteractor()
    }
    
    //El Presenter nos retorna el resultado de datos
    func mostrarDatosSolicitados(_ datos : [DataEntity]){
        APESuperHUD.showOrUpdateHUD(loadingIndicator: .standard,
                                    message: "Loading",
                                    presentingView: self.view)
        self.arrayImagenes.append(contentsOf: datos)
        DispatchQueue.main.async {
            self.myCollectionView.reloadData()
            APESuperHUD.removeHUD(animated: true,
                                  presentingView: self.view,
                                  completion: nil)
        }
    }
    
    func mostrarAlertaError(){
        let alertVC = UIAlertController(title: "Error en el Servicio",
                                        message: "Tenemos problemas con la informacion",
                                        preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    
    

}


//MARK: - extension PeliculasViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension MasterViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayImagenes.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: ImagenViewCell.defaultIdentifier,
                                                        for: indexPath) as! ImagenViewCell
        let model = arrayImagenes[indexPath.row]
        cell.myPriceFromDataWeb.text = model.name
        if let imageDes = model.artworkUrl100, let urlDes = URL(string: imageDes){
            cell.myImageFromDataWeb.kf.setImage(with: ImageResource(downloadURL: urlDes),
                                                placeholder: #imageLiteral(resourceName: "placeholder"),
                                                options: [.transition(ImageTransition.fade(1))],
                                                progressBlock: nil,
                                                completionHandler: nil)
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter.irVistaDetalle()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellSpacing = CGFloat(1)
        let leftRightMar = CGFloat(20)
        let numColmuns = CGFloat(2)
        let totalCellSpace = cellSpacing * (numColmuns - 1)
        let screenWidth = UIScreen.main.bounds.width
        let width = (screenWidth - leftRightMar - totalCellSpace) / numColmuns
        var height = CGFloat(270)
        height = width * height / 180
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
}

