//
//  SelectColorVC.swift
//  DelegateClosureExample
//
//  Created by Vitaly Prosvetov on 03.12.2020.
//

import UIKit

class SelectColorVC: UIViewController {
    
    let pinkButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tappedPink), for: .touchUpInside)
        return button
    }()
    
    let blueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tappedBlue), for: .touchUpInside)
        return button
    }()
    
    var completion: ((_ color: UIColor) -> ())?
    weak var colorDelegate: ColorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(pinkButton)
        view.addSubview(blueButton)
        view.setNeedsUpdateConstraints()
    }
    
    
    @objc
    private func tappedPink() {
        completion?(.systemPink)
        dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func tappedBlue() {
        colorDelegate?.update(color: .systemBlue)
        dismiss(animated: true, completion: nil)
    }
    
    override func updateViewConstraints() {
        NSLayoutConstraint.activate([
            pinkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pinkButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            pinkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pinkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pinkButton.heightAnchor.constraint(equalToConstant: 50),
            
            blueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            blueButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40),
            blueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            blueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            blueButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        super.updateViewConstraints()
    }
}
