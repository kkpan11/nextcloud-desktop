//
//  DocumentActionViewController.swift
//  FileProviderUIExt
//
//  Created by Claudio Cambra on 20/2/24.
//

import FileProviderUI
import OSLog

class DocumentActionViewController: FPUIActionExtensionViewController {
    func prepare(childViewController: NSViewController) {
        addChild(childViewController)
        view.addSubview(childViewController.view)

        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: childViewController.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: childViewController.view.trailingAnchor),
            view.topAnchor.constraint(equalTo: childViewController.view.topAnchor),
            view.bottomAnchor.constraint(equalTo: childViewController.view.bottomAnchor)
        ])
    }

    override func prepare(
        forAction actionIdentifier: String, itemIdentifiers: [NSFileProviderItemIdentifier]
    ) {
        Logger.actionViewController.info("Preparing for action: \(actionIdentifier)")
        let shareViewController = ShareViewController()
        addChild(shareViewController)
        view.addSubview(shareViewController.view)

        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: shareViewController.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: shareViewController.view.trailingAnchor),
            view.topAnchor.constraint(equalTo: shareViewController.view.topAnchor),
            view.bottomAnchor.constraint(equalTo: shareViewController.view.bottomAnchor)
        ])
    }
    
    override func prepare(forError error: Error) {
        Logger.actionViewController.info("Preparing for error: \(error.localizedDescription)")
    }

    override public func loadView() {
        self.view = NSView()
    }
}

