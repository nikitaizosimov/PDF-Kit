//
//  Images.swift
//
//  Created by Nikita Izosimov on 03.09.2022.
//

import UIKit

enum Images {
    static let back = image(named: "back")
    static let close = image(named: "close")
    static let more = image(named: "more")
    static let search = image(named: "search")
    
    static let arrowLeft = image(named: "arrowLeft")
    static let arrowRight = image(named: "arrowRight")
    
    private static func image(named name: String) -> UIImage? {
        return UIImage(named: name, in: .module, compatibleWith: nil)
    }
}
