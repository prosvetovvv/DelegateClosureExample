//
//  ViewController.swift
//  DelegateClosureExample
//
//  Created by Vitaly Prosvetov on 03.12.2020.
//

import UIKit

protocol ColorDelegate: class {
    func update(color: UIColor)
}

class ResultVC: UIViewController {
    
    private let changeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Change Color", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(changeButton)
        view.setNeedsUpdateConstraints()
    }
    
    @objc
    private func tappedButton() {
        let destVC = SelectColorVC()
        present(destVC, animated: true)
        destVC.colorDelegate = self
        destVC.completion = { [weak self] color in
            guard let self = self else { return }
            self.view.backgroundColor = color
        }
    }
    
    override func updateViewConstraints() {
        NSLayoutConstraint.activate([
            changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            changeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        super.updateViewConstraints()
    }
}

extension ResultVC: ColorDelegate {
    func update(color: UIColor) {
        self.view.backgroundColor = color
    }
}

