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
    
    private lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        
        return view
    }()
    
    private lazy var searchPanelStackView: UIStackView = {
        let view = UIStackView()
        
        view.addArrangedSubview(matchText)
        view.addArrangedSubview(arrowLeft)
        view.addArrangedSubview(arrowRight)
        
        return view
    }()
    
    private lazy var arrowLeft: UIButton = {
        let view = UIButton(type: .system)
        
        view.setImage(Images.arrowLeft, for: .normal)
        
        return view
    }()
    
    private lazy var arrowRight: UIButton = {
        let view = UIButton(type: .system)
        
        view.setImage(Images.arrowRight, for: .normal)
        
        return view
    }()
    
    private lazy var matchText: UILabel = {
        let view = UILabel()
        
        view.text = "12"
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    private func commonInit() {
        layer.masksToBounds = true
        
        addSubview(searchBar)
        searchBar.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(safeAreaLayoutGuide)
        }
        
        addSubview(searchPanelStackView)
        searchPanelStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(searchBar.snp.trailing).offset(6)
            make.trailing.equalTo(safeAreaLayoutGuide)
        }
    }
}
