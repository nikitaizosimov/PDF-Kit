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
    
    private var searchViewHeightConstraint: Constraint?
    private var isSeachNow = false {
        didSet {
            setupRightButtons()
        }
    }
    
    private lazy var pdfView: PDFView = {
        let view = PDFView()
        
        return view
    }()
    
    private lazy var searchView: PDFSearchView = {
        let view = PDFSearchView()
        
        return view
    }()
    
    private lazy var searchBarButton: UIBarButtonItem = {
       let view = UIBarButtonItem()
        
        view.image = Images.search
        view.action = #selector(openSearch)
        
        return view
    }()
    
    private lazy var moreBarButton: UIBarButtonItem = {
       let view = UIBarButtonItem()
        
        view.image = Images.more
        view.action = #selector(openMore)
        
        return view
    }()
    
    private lazy var closeBarButton: UIBarButtonItem = {
       let view = UIBarButtonItem()
        
        view.image = Images.close
        view.action = #selector(closeSearch)
        
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
        
        view.addSubview(searchView)
        searchView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            searchViewHeightConstraint = make.height.equalTo(0).constraint
        }
        
        view.addSubview(pdfView)
        pdfView.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        navigationItem.title = title
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: Images.back,
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(close))
        setupRightButtons()
    }
    
    private func setupRightButtons() {
        navigationItem.rightBarButtonItems = isSeachNow ? [closeBarButton] : [searchBarButton, moreBarButton]
    }
    
    @objc
    private func close() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func openSearch() {
        searchViewHeightConstraint?.update(offset: 60)
        isSeachNow = true
    }
    
    @objc
    private func closeSearch() {
        searchViewHeightConstraint?.update(offset: 0)
        isSeachNow = false
    }
    
    @objc
    private func openMore() {
        guard let fileUrl = fileUrl else { return }
        
        DispatchQueue.main.async { [weak self] in
            let activityController = UIActivityViewController(activityItems: [fileUrl], applicationActivities: nil)
            self?.present(activityController, animated: true)
        }
    }
    
    
    private func openPDFDocument(from fileUrl: URL) {
        pdfDocument = PDFDocument(url: fileUrl)
        pdfView.document = pdfDocument
        
        pdfView.document?.delegate = self
        pdfView.displayMode = .singlePageContinuous
        pdfView.autoScales = true
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
