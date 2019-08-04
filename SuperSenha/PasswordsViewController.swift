//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Created by Bruno Luiz on 12/04/19.
//  Copyright © 2019 Bruno Luiz. All rights reserved.
//

import UIKit

class PasswordsViewController: UIViewController {

    @IBOutlet weak var tvPasswords: UITextView!
    
    var numberOfPasswords: Int = 1
    var numberOfCharacters: Int = 10
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters: Bool!
    
    var passwordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Numero de senhas: \(numberOfPasswords)"
        passwordGenerator = PasswordGenerator(numberOfCharacter: numberOfCharacters, useLetters: useLetters,
                                              useNumbers: useNumbers, useCapitalLetters: useCapitalLetters,
                                              useSpecialCharacters: useSpecialCharacters)
        
        generatePasswords()
    }
    
    func generatePasswords() {
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        tvPasswords.text = ""
        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        for password in passwords {
            tvPasswords.text.append(password + "\n\n")
        }
    }
    
    @IBAction func generate(_ sender: UIButton) {
        generatePasswords()
    }
}
