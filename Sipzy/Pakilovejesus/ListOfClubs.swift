//
//  SwiftUIView.swift
//  Sipzy
//
//  Created by Pasquale Mirabelli on 27/02/25.
//

import SwiftUI

struct Contact: Identifiable {
    var id = UUID()
    var name: String
    var phoneNumber: String
    var address: String
    var link: URL?
}

let clubs: [Contact] = [
    Contact(name: "Pepi Vintage Room", phoneNumber: "+39 320 070 6622", address: "Vico San Domenico Maggiore 23, 80134 Napoli", link: URL(string: "https://www.instagram.com/pepivintageroom/")),
    Contact(name: "Cammarota Spritz", phoneNumber: "+39 320 277 5687", address: "Vico Lungo Teatro Nuovo 31, 80134 Napoli", link: URL(string: "https://www.cammarotaspritz.it/")),
    Contact(name: "Kestè", phoneNumber: "+39 346 494 9996", address: "Via San Giovanni Maggiore Pignatelli 26/27, 80134 Napoli", link: URL(string: "https://www.kestenapoli.com/")),
    Contact(name: "Kitebeer", phoneNumber: "+39 081 177 66 308", address: "Vico Medina 15, 80123 Napoli", link: URL(string: "https://www.kitebeer.it/")),
    Contact(name: "L'Antiquario", phoneNumber: "+39 081 7645390", address: "Via Vannella Gaetani 2, 80121 Napoli", link: URL(string: "https://lantiquarionapoli.superbexperience.com/")),
    Contact(name: "Grand Tour cocktail", phoneNumber: "+39 342 504 7868", address: "Via Santa Lucia 66/68, 80132 Napoli", link: URL(string: "https://lantiquarionapoli.superbexperience.com/")),
    Contact(name: "Miami Barroom", phoneNumber: "+39 081 229 8332", address: "Via Raffaele Morgheen, 80129 Napoli", link: URL(string: "http://www.miamibarroom.it/")),
    Contact(name: "La Fesseria", phoneNumber: "+39 081 1882 3409", address: "Via Giovanni Paladino 17, 80138 Napoli", link: URL(string: "https://lafesseria.it/")),
    Contact(name: "Flanagan's Rooms", phoneNumber: "+39 375 512 2812", address: "Via Raffaele Morghen 31, 80127 Napoli", link: URL(string: "https://www.facebook.com/Flanagansrooms/")),
    Contact(name: "Tasso Alcolico", phoneNumber: "+39 3485425373", address: "Via Girolamo Santa Croce 61, 80129 Napoli", link: URL(string: "https://www.facebook.com/tassoalcolicofans/?locale=it_IT"))
]
