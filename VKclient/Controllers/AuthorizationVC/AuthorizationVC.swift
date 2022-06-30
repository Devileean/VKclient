//
//  AuthorizationVC.swift
//  VKclient
//
//  Created by Алексей Логинов on 12.06.2022.
//

import UIKit

final class AuthorizationVC: UIViewController {
    
    @IBOutlet weak var authorizationScrollView: UIScrollView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logOnButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Подписываемся на два уведомления: оно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе - когда пропадает клавиатура
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "AuthorizationVKclient" {
            guard
                let login = loginTextField.text,
                let password = passwordTextField.text
            else {
                print("Вы забыли указать ID или password")
                showLoginAlert (message: "Поля не заполнены")
                return false
            }
            
            // Проверяем, верны ли они
            if login == "" && password == "" {
                print("успешная авторизация")
                return true
            } else {
                print("неуспешная авторизация")
                showLoginAlert (message: "Введен не правильно login ID или password ID")
                return false
            }
        }
        showLoginAlert (message: "не верный identifier segue")
        return false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //MARK: Отписываемся от клавиатуры
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func logOnButtonPress(_ sender: Any) {
  }
    
    //MARK: Keyboard
    //  Когда клавиатура появляется
    @objc private func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIscrollView, равный размеру клавиатуры
        self.authorizationScrollView?.contentInset = contentInsets
        authorizationScrollView?.scrollIndicatorInsets = contentInsets
    }
    
    // Когда клавиатура исчезает
    @objc private func keyboardWillBeHidden(notification: Notification) {
        
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        authorizationScrollView?.contentInset = contentInsets
        authorizationScrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func hideKeyboard() {
        self.authorizationScrollView?.endEditing(true)
    }
    
    //MARK: Show alert bad Authorization
    private func showLoginAlert (message: String) {
        //Создаем контроллер
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        //Создаем кнопку для UIAlertController
        let action = UIAlertAction(title: "OK", style: .cancel) {_ in
            //Делаем пустые поля после не правильных
            self.loginTextField.text = ""
            self.passwordTextField.text = ""
        }
        alert.addAction(action)
        //Показываем UIAlertController
        present(alert, animated: true, completion: nil)
        }
    
    //MARK: Кнопки
    private func setViews() {
        logOnButton.layer.cornerRadius = 5
        logOnButton.backgroundColor = #colorLiteral(red: 0.3077512383, green: 0.4815763831, blue: 0.7451851964, alpha: 1)
    }

    
}
