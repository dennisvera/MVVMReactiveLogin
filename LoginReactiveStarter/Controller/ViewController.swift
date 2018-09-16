//
//  ViewController.swift
//  LoginReactiveStarter
//
//  Created by Brian Voong on 7/5/18.
//  Copyright © 2018 Brian Voong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    static let inputHeight: CGFloat = 50
    
    let usernameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Username"
        tf.backgroundColor = .white
        tf.heightAnchor.constraint(equalToConstant: inputHeight).isActive = true
        tf.layer.cornerRadius = inputHeight / 2
        tf.textAlignment = .center
        tf.addTarget(self, action: #selector(handleTextFieldChange), for: .editingChanged)
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.backgroundColor = .white
        tf.heightAnchor.constraint(equalToConstant: inputHeight).isActive = true
        tf.layer.cornerRadius = inputHeight / 2
        tf.textAlignment = .center
        tf.addTarget(self, action: #selector(handleTextFieldChange), for: .editingChanged)
        return tf
    }()
    
    let registerViewModel = RegisterViewModel()
    
    @objc func handleTextFieldChange(textField: UITextField) {
        if textField == usernameTextField {
            registerViewModel.username = textField.text
        } else if textField == passwordTextField {
            registerViewModel.password = textField.text
        }
    }
    
    let registerButton: RegisterButton = {
        let button = RegisterButton(type: .system)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.heightAnchor.constraint(equalToConstant: inputHeight).isActive = true
        button.setTitleColor(UIColor(white: 1, alpha: 0.5), for: .disabled)
        button.isEnabled = false
        return button
    }()
    
    let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Already have account?", for: .normal)
        button.setTitleColor(.rgb(r: 130, g: 144, b: 165), for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerViewModel.isValidListener = { [unowned self] (isValid) in
            self.registerButton.isEnabled = isValid
        }
        
        setupGradient()
        setupStackView()
    }

    fileprivate func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [usernameTextField, passwordTextField, registerButton, alreadyHaveAccountButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }

}
