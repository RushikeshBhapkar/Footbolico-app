//
//  CollapsibleSectionProtocols.swift
//  Collapsible_TableView
//
//

import Foundation
import UIKit

protocol CollapsibleSectionHeaderProtocol {
    
    func open(_ animated: Bool)
    func close(_ animated: Bool)
    
    var sectionTitleLabel: UILabel! { get }
    
    var sectionLogoImage: UIImageView! { get }
    
    var tappableDelegate: CollapsibleSectionHeaderTappableProtocol! { get set }
    
    var tag: Int { get set }
}

protocol CollapsibleSectionHeaderTappableProtocol {
    
    func sectionTapped(view: CollapsibleSectionHeaderProtocol)
}

protocol SectionItemProtocol {
    
    var id: Int { get }
    
    var name: String { get }
    
    var logoUrl: String { get }

    var isVisible: Bool { get set }
    
    var events: [Event] { get set }
}

