//
//  ViewController.swift
//  SimpleMVPApp
//
//  Created by Rin on 2022/08/13.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var dividendTextField: UITextField!
    @IBOutlet private weak var divisorTextField: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!

    @IBAction private func tappedButton(_ sender: UIButton) {
        let dividend = Int(dividendTextField.text!)!
        let divisor = Int(divisorTextField.text!)!
        presenter.tappedButton(dividend: dividend, divisor: divisor)
    }

    private var presenter: PresenterInput!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = Presenter(view: self, model: DivisionModel())
    }
}

extension ViewController: PresenterOutput {

    func showResult(quotient: Int) {
        resultLabel.text = String(quotient)
    }

    func showError(error: DivisionError) {
        switch error {
        case .dividendByZero:
            let alert = UIAlertController(title: "エラー", message: "0では割れません", preferredStyle: .alert)
            let ok = UIAlertAction(title: "はい", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    }
}
