//
//  SwiftUIView.swift
//  Sipzy
//
//  Created by Pasquale Mirabelli on 27/02/25.
//

import SwiftUI

struct Contact: Identifiable {
    var id = UUID()
    var name: String = "Pepi Vintage Room"
    var phoneNumber: String = "+39 320 070 6622"
    var address: String = "Vico San Domenico Maggiore 23, 80134 Napoli"
    var link: URL? = URL(string: "https://www.instagram.com/pepivintageroom/")!
}

struct Contact1: Identifiable {
    var id = UUID()
    var name: String = "Cammarota Spritz"
    var phoneNumber: String = "+39 320 277 5687"
    var address: String = "Vico Lungo Teatro Nuovo 31, 80134 Napoli"
    var link: URL? = URL(string: "https://www.cammarotaspritz.it/")
}

struct Contact2: Identifiable {
    var id = UUID()
    var name: String = "Kestè"
    var phoneNumber: String = "+39 346 494 9996"
    var address: String = "Via San Giovanni Maggiore Pignatelli 26/27, 80134 Napoli"
    var link: URL? = URL(string: "https://www.kestenapoli.com/")
}
struct Contact3: Identifiable {
    var id = UUID()
    var name: String = "Kitebeer"
    var phoneNumber: String = "+39 081 177 66 308"
    var address: String = "Vico Medina 15, 80123 Napoli"
    var link: URL? = URL(string: "https://www.kitebeer.it/")
}
struct Contact4: Identifiable {
    var id = UUID()
    var name: String = "L'Antiquario"
    var phoneNumber: String = "+39 081 7645390"
    var address: String = "Via Vannella Gaetani 2, 80121 Napoli"
    var link: URL? = URL(string: "https://lantiquarionapoli.superbexperience.com/")
}
struct Contact5: Identifiable {
    var id = UUID()
    var name: String = "Grand Tour cockatil boutique"
    var phoneNumber: String = "+39 342 504 7868"
    var address: String = "Via Santa Lucia 66/68, 80132 Napoli"
    var link: URL? = URL(string: "https://lantiquarionapoli.superbexperience.com/")
}
struct Contact6: Identifiable {
    var id = UUID()
    var name: String = "Miami Barroom"
    var phoneNumber: String = "+39 081 229 8332"
    var address: String = "Via Raffaele Morgheen, 80129 Napoli"
    var link: URL? = URL(string: "http://www.miamibarroom.it/")
}
struct Contact7: Identifiable {
    var id = UUID()
    var name: String = "La Fesseria"
    var phoneNumber: String = "+39 081 1882 3409"
    var address: String = "Via Giovanni Paladino 17, 80138 Napoli"
    var link: URL? = URL(string: "https://lafesseria.it/")
}
struct Contact8: Identifiable {
    var id = UUID()
    var name: String = "Flanagan's Rooms"
    var phoneNumber: String = "+39 375 512 2812"
    var address: String = "Via Raffaele Morghen 31, 80127 Napoli"
    var link: URL? = URL(string: "https://www.facebook.com/Flanagansrooms/")
}
struct Contact9: Identifiable {
    var id = UUID()
    var name: String = "Tasso Alcolico"
    var phoneNumber: String = "+39 3485425373"
    var address: String = "Via Girolamop Santa Croce 61, 80129 Napoli"
    var link: URL? = URL(string: "https://www.facebook.com/tassoalcolicofans/?locale=it_IT")
}

