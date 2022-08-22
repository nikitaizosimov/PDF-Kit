//
//  PDFController.swift
//
//  Created by Nikita Izosimov on 21.08.2022.
//

import UIKit
import PDFKit

public class PDFController: UIViewController {
//    public static let fileType = "pdf"
//    public static let extenshionFileType = ".pdf"
//
//    public var titleText: String?
//
//    public var fileUrl: URL?
    
//    public let open = Delegate<Void, Void>()
    
    private var pdfDocument: PDFDocument?
//    private var heightConstraint: NSLayoutConstraint?
    
//    private var searchResults = [PDFSelection]()
//
//    private var isOpenSearchView = false {
//        didSet {
//            self.handleSearchViewState()
//        }
//    }
    
    private var currentIndex = 0
    
    private lazy var pdfView: PDFView = {
        let view = PDFView()
        
        view.backgroundColor = .white
        
        return view
    }()
    
//    private lazy var searchView: PDFSearchView = {
//        let view = PDFSearchView()
//
//        view.addBottomSeparator()
//
//        view.searchText.delegate(to: self) { `self`, text in
//            self.performSearch(text: text)
//        }
//
//        view.tapArrow.delegate(to: self) { `self`, direction in
//            self.goByArrow(to: direction)
//        }
//
//        return view
//    }()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupViews()
        
//        self.title = titleText
        
        //self.handleSearchViewState()
        self.load(from: fileUrl)
    }
    
    public func load(from fileUrl: URL?) {
        guard let fileUrl = fileUrl else { return }
        
        self.fileUrl = fileUrl
        
        self.openPDFDocument(from: fileUrl)
    }
    
    private func setupViews() {
        self.view.addSubview(self.pdfView)
        //self.view.addSubview(self.searchView)
        
//        self.searchView.layout.all.except(.bottom).equal(to: self.view.layout.safe)
//        self.heightConstraint = self.searchView.layout.height.equal(to: 0)
        
//        self.pdfView.layout.top.equal(to: self.view.layout.safe)
//        self.pdfView.layout.all.except(.top).equal(to: self.view.layout)
    }
    
    private func openPDFDocument(from fileUrl: URL) {
        //self.view.hideActivityIndicator()
        
        self.pdfDocument = PDFDocument(url: fileUrl)
        
        self.pdfView.document = self.pdfDocument
        self.pdfView.document?.delegate = self
        self.pdfView.displayMode = .singlePageContinuous
        self.pdfView.autoScales = true
        
        // Hotfix
        DispatchQueue.main.async {
            guard let firstPage = self.pdfView.document?.page(at: 0) else { return }
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
