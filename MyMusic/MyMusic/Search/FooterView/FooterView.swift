//
//  FooterView.swift
//  MyMusic
//
//  Created by dzmitry on 4.05.23.
//

import UIKit

class FooterView: UIView {
    
    private var myLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    private var loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView()
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.hidesWhenStopped = true
        return loader
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
    }
    
    private func setupElements() {
        addSubview(myLabel)
        addSubview(loader)
        
        // констрейнты для UIActivityIndicatorView
        loader.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        loader.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        loader.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        // констрейнты для UILabel
        myLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        myLabel.topAnchor.constraint(equalTo: loader.bottomAnchor, constant: 8).isActive = true
    }
    
    func showLoader() {
        loader.startAnimating()
        myLabel.text = "LOADING"
    }
    
    func hideLoader() {
        loader.stopAnimating()
        myLabel.text = ""
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

