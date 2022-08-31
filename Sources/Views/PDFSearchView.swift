//
//  PDFSearchView.swift
//
//  Created by Nikita Izosimov on 01.09.2022.
//

import UIKit

protocol PDFSearchViewProtocol: AnyObject {
    
    func close()
}

final class PDFSearchView: UIView {
    
    weak var delegate: PDFSearchViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    private func commonInit() {
        
    }
}
