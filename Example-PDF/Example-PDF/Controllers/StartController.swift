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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "open PDF", style: .plain, target: self, action: #selector(addTapped))
    }
    
    @objc
    private func addTapped() {
        guard let path = Bundle.main.path(forResource: "sample", ofType: "pdf") else { return }
        
        let controller = PDFController()
        
        controller.fileUrl = URL(fileURLWithPath: path)
        
        navigationController?.pushViewController(controller, animated: true)
    }
}
