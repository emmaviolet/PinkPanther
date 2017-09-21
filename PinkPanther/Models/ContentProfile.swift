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

enum ContentProfile {
    case bridget, tolstoy
    
    var title: String {
        switch self {
        case .bridget:
            return "Bridget Jones"
        case .tolstoy:
            return "War And Peace"
        }
    }
    
    var keywords: [String] {
        switch self {
        case .bridget:
            return ["nineties", "chickflick", "girlfriends"]
        case .tolstoy:
            return ["serious", "russia", "lovestory", "wartime"]
        }
    }
    
    var imageName: String {
        switch self {
        case .bridget:
            return "bridget_jones"
        case .tolstoy:
            return "war_and_peace"
        }
    }
    
    var type: ContentType {
        switch self {
        case .bridget:
            return .film
        case .tolstoy:
            return .book
        }
    }

    var blurb: String {
        switch self {
        case .bridget:
            return "At the start of the New Year, 32-year-old Bridget (Renée Zellweger) decides it's time to take control of her life -- and start keeping a diary. Now, the most provocative, erotic and hysterical book on her bedside table is the one she's writing. With a taste for adventure, and an opinion on every subject - from exercise to men to food to sex and everything in between - she's turning the page on a whole new life."
        case .tolstoy:
            return "At a glittering society party in St Petersburg in 1805, conversations are dominated by the prospect of war. Terror swiftly engulfs the country as Napoleon's army marches on Russia, and the lives of three young people are changed forever. The stories of quixotic Pierre, cynical Andrey and impetuous Natasha interweave with a huge cast, from aristocrats and peasants to soldiers and Napoleon himself. In War and Peace, Tolstoy entwines grand themes - conflict and love, birth and death, free will and faith - with unforgettable scenes of nineteenth-century Russia, to create a magnificent epic of human life in all its imperfection and grandeur.\nAnthony Briggs's superb translation combines stirring, accessible prose with fidelity to Tolstoy's original, while Orlando Figes's afterword discusses the novel's vast scope and depiction of Russian identity. This edition also contains appendices, notes, a list of prominent characters and maps."
        }
    }
}
