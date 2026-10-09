
import UIKit

final class KeyboardViewController: UIViewController, UITextFieldDelegate {

   

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textFieldBottomConstraint: NSLayoutConstraint!

   

    private var originalBottomConstant: CGFloat = 0

   

    override func viewDidLoad() {
        super.viewDidLoad()

        originalBottomConstant = textFieldBottomConstraint.constant

        textField.delegate = self

        registerKeyboardNotifications()
        configureTapGesture()

        print("KeyboardViewController listo")
    }

    

    private func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(_:)),
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    @objc private func keyboardWillShow(_ notification: Notification) {
        guard
            let userInfo = notification.userInfo,
            let keyboardFrameScreen = userInfo[
                UIResponder.keyboardFrameEndUserInfoKey
            ] as? CGRect
        else {
            return
        }

        let keyboardFrame = view.convert(
            keyboardFrameScreen,
            from: nil
        )

        let safeAreaBottom = view.safeAreaLayoutGuide.layoutFrame.maxY

        let overlap = max(
            0,
            safeAreaBottom - keyboardFrame.minY
        )

        textFieldBottomConstraint.constant =
            originalBottomConstant + overlap + 12

        let duration = userInfo[
            UIResponder.keyboardAnimationDurationUserInfoKey
        ] as? Double ?? 0.25

        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }

        print("Teclado mostrado; desplazamiento: \(overlap)")
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        textFieldBottomConstraint.constant = originalBottomConstant

        let duration = notification.userInfo?[
            UIResponder.keyboardAnimationDurationUserInfoKey
        ] as? Double ?? 0.25

        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }

        print("Teclado ocultado; posición restaurada")
    }


    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
        )

        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
