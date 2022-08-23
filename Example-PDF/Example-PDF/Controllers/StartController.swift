//
//  StartController.swift
//  Example-PDF
//
//  Created by Nikita Izosimov on 23.08.2022.
//

import UIKit
import PDF_Kit

class StartController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
    }
    
    @objc
    private func addTapped() {
        let controller = PDFController()
        
        controller.view.backgroundColor = .black
        
        navigationController?.pushViewController(controller, animated: true)
    }
}
