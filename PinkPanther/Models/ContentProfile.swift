//
//  ContentProfile.swift
//  PinkPanther
//
//  Created by Emma Makinson on 20/09/2017.
//  Copyright © 2017 Emma Makinson. All rights reserved.
//

import Foundation

enum ContentType {
    case book, news, theatre, research, film
    
    var iconName: String {
        switch self {
        case .book:
            return "book_icon"
        case .film:
            return "film_icon"
        default:
            return "heart_icon"
        }
    }
}

struct ContentProfile {

    var title: String = "Bridget Jones"
    var keywords: [String] = ["nineties", "chickflick", "girlfriends"]
    var imageName: String = "bridget_jones"
    var type: ContentType = .film
    var blurb: String = "At the start of the New Year, 32-year-old Bridget (Renée Zellweger) decides it's time to take control of her life -- and start keeping a diary. Now, the most provocative, erotic and hysterical book on her bedside table is the one she's writing. With a taste for adventure, and an opinion on every subject - from exercise to men to food to sex and everything in between - she's turning the page on a whole new life."
}
