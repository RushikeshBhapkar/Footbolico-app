//
//  ModelBuilder.swift
//  Collapsible_TableView
//
//

import UIKit

struct Employee {
    
    var name: String
    var homeTeamScore: Int
    var homeTeamLogo: String
    var homeTeamName: String

    var awayTeamScore: Int
    var awayTeamLogo: String
    var awayTeamName: String
}

class TableSection: SectionItemProtocol {
    
    var id: Int
    var name: String
    var title: String
    var isVisible: Bool
    //var items: [Employee]
    var events: [Event]
    var logoUrl: String
    
    init() {
        title = ""
        isVisible = false
        events = []
        id = 0
        name = ""
        logoUrl = ""
    }
}

class ModelBuilder: NSObject {

    class func modelGenerator(matches: [Match])  -> [SectionItemProtocol] {
        var collector = [SectionItemProtocol]()
        for match in matches {
            let section = TableSection()
            section.title = match.name!
            section.logoUrl = match.logoUrl!
            section.events = match.events!
            section.id = match.id!
            section.name = match.name!
            collector.append(section)
        }
        return collector
    }
    
}
