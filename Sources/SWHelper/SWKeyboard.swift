//
//  SWKeyboard.swift
//  
//
//  Created by Mirsaid Patarov on 2022-11-19.
//

import UIKit

public class SWKeyboard {
  public static var main = SWKeyboard()

  public var frame: CGRect = .zero

  init() {
    observeKeyboardNotifications()
    observeKeyboard()
  }

  deinit {
    NotificationCenter.default.removeObserver(self)
  }

  private func observeKeyboardNotifications() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
  }

  private func observeKeyboard() {
    let field = UITextField()
    UIApplication.shared.windows.first?.addSubview(field)

    field.becomeFirstResponder()
    field.resignFirstResponder()
    field.removeFromSuperview()
  }

  @objc private func keyboardWillShow(_ notification: Notification) {
    guard frame == .zero else { return }
    guard let userInfo = notification.userInfo else { return }
    guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }

    frame = keyboardFrame
  }
}
