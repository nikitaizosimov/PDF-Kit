//
//  PDFController.swift
//
//  Created by Nikita Izosimov on 21.08.2022.
//

import PDFKit
import SnapKit
import UIKit

public class PDFController: UIViewController {
    
    public var titleText: String?
    public var fileUrl: URL?
    
    private var pdfDocument: PDFDocument?
    
    private var currentIndex = 0
    
    private lazy var pdfView: PDFView = {
        let view = PDFView()
        
        return view
    }()
    
    private lazy var searchView: PDFSearchView = {
        let view = PDFSearchView()
        
        return view
    }()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        load()
    }
    
    public func load() {
        guard let fileUrl = fileUrl else { return }
        
        openPDFDocument(from: fileUrl)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(pdfView)
        pdfView.snp.makeConstraints { $0.edges.equalTo(view.safeAreaLayoutGuide) }
    }
    
    private func openPDFDocument(from fileUrl: URL) {
        pdfDocument = PDFDocument(url: fileUrl)
        pdfView.document = pdfDocument
        pdfView.document?.delegate = self
        pdfView.displayMode = .singlePageContinuous
        pdfView.autoScales = true
        
        self.scrollPDFViewToTop()
    }
    
    private func scrollPDFViewToTop() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self,
                  let firstPage = self.pdfView.document?.page(at: 0) else { return }
            
            self.pdfView.go(to: CGRect(x: 0, y: Int.max, width: 0, height: 0), on: firstPage)
        }
    }
    
//    private func handleSearchViewState() {
//        self.heightConstraint?.constant = self.isOpenSearchView ? 108 : 0
//        self.setupRightItems(isCancelState: self.isOpenSearchView)
//
//        UIView.animate(withDuration: Constants.animationDuration) { [weak self] in
//            guard let self = self else { return }
//
//            self.searchView.isHidden = !self.isOpenSearchView
//            self.searchView.alpha = self.isOpenSearchView ? 1 : 0
//        }
//
//        guard self.isOpenSearchView else {
//            self.view.endEditing(true)
//            self.removeAllAnnotations()
//            self.searchView.cleanAccessoryView()
//            return
//        }
//
//        self.searchView.searchBar.becomeFirstResponder()
//    }
    
//    private func performSearch(text: String) {
//        self.pdfDocument?.cancelFindString()
//        self.searchResults.removeAll()
//        self.removeAllAnnotations()
//
//        guard text.count >= 2 else {
//            self.searchView.setup()
//            return
//        }
//
//        self.pdfDocument?.beginFindString(text, withOptions: .caseInsensitive)
//    }
    
//    private func setupRightItems(isCancelState: Bool) {
//
//        var rightItems: [NavigationBar.SideItem] = []
//
//        if isCancelState {
//            rightItems.append(.text("Отменить") { [weak self] _ in self?.isOpenSearchView.toggle() })
//        } else {
//            guard let moreImage = Images.more,
//                  let searchImage = Images.search else { return }
//
//            rightItems = [
//                .image(moreImage) { [weak self] view in self?.share(on: view) },
//                .image(searchImage) { [weak self] _ in self?.isOpenSearchView.toggle() },
//            ]
//        }
//
//        self.navigation.rightItems = rightItems
//    }
    
//    private func share(on barItem: UIBarButtonItem) {
//        guard let fileUrl = self.fileUrl else { return }
//
//        self.shareActivityItems([fileUrl], sender: barItem)
//    }
    
//    private func goByArrow(to direction: ArrowsAccessoryView.ArrowDirection) {
//        let nextIndex = self.currentIndex + (direction == .upward ? 1 : -1)
//
//        guard self.searchResults.indices.contains(nextIndex) else { return }
//
//        self.currentIndex = nextIndex
//        self.view.endEditing(true)
//
//        self.pdfView.go(to: self.searchResults[nextIndex])
//        self.searchView.setup(currentIndex: nextIndex, count: self.searchResults.count)
//    }
}

// MARK: - PDFDocumentDelegate
extension PDFController: PDFDocumentDelegate {
    
    public func documentDidEndDocumentFind(_ notification: Notification) {
        
//        if self.searchResults.isEmpty {
//            self.searchView.setup(currentIndex: 0, count: 0)
//            self.removeAllAnnotations()
//        } else {
//            self.currentIndex = 0
//            self.searchView.setup(currentIndex: self.currentIndex, count: self.searchResults.count)
//            self.selectedSearchInstance(selections: self.searchResults)
//        }
    }
    
    public func didMatchString(_ instance: PDFSelection) {
        //self.searchResults.append(instance)
    }
    
    private func selectedSearchInstance(selections: [PDFSelection]) {
//        selections.forEach { selection in
//            if selections.first === selection {
//                self.pdfView.go(to: selection)
//            }
//            guard let selectPage = selection.pages.first else { return }
//
//            let highlight = PDFAnnotation(bounds: selection.bounds(for: selectPage),
//                                          forType: .highlight,
//                                          withProperties: nil)
//            highlight.endLineStyle = .circle
//            selection.pages.first?.addAnnotation(highlight)
//        }
    }
    
    private func removeAllAnnotations() {
//        guard let document = self.pdfDocument else { return }
//
//        for i in 0..<document.pageCount {
//            if let page = document.page(at: i) {
//                let annotations = page.annotations
//                for annotation in annotations {
//                    page.removeAnnotation(annotation)
//                }
//            }
//        }
    }
}
