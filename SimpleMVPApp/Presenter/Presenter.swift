//
//  Presenter.swift
//  SimpleMVPApp
//
//  Created by Rin on 2022/08/13.
//

import Foundation


// InputにはViewControllerからどんなイベントを受け取るかを書きます
protocol PresenterInput: AnyObject {
    func tappedButton(dividend: Int, divisor: Int)
}

// OutputにはModelから処理の結果を受け取ったのち、何を表示してほしいかを書きます
protocol PresenterOutput: AnyObject {
    func showResult(quotient: Int)
    func showError(error: DivisionError)
}

final class Presenter {

    weak var view: PresenterOutput?
    private let model: DivisionModelInput

    init(view: PresenterOutput, model: DivisionModelInput) {
        self.view = view
        self.model = model
    }
}

extension Presenter: PresenterInput {

    func tappedButton(dividend: Int, divisor: Int) {
        model.fetchQuotient(dividend: dividend, divisor: divisor) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let quotient):
                strongSelf.view?.showResult(quotient: quotient)
            case .failure(let error):
                strongSelf.view?.showError(error: error)
            }
        }
    }
}
