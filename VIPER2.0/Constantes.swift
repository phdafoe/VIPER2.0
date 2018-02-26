//
//  Constantes.swift
//  VIPERtest
//
//  Created by Andres Felipe Ocampo Eljaiesk on 17/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation

let CONSTANTES = Constantes()

struct Constantes {
    let LLAMADAS = Llamadas()
}

struct Llamadas {
    let BASE_URL = "https://rss.itunes.apple.com/api/v1/us/movies/top-movies/all/100/explicit.json"
}
