//
//  CalculateModel.swift
//  SimpleMVPApp
//
//  Created by Rin on 2022/08/13.
//

import Foundation

enum DivisionError: Error {
    case dividendByZero
}

protocol DivisionModelInput {
    func fetchQuotient(dividend: Int, divisor: Int, completion: @escaping (Result<Int, DivisionError>) -> Void)
}

final class DivisionModel: DivisionModelInput {

    func fetchQuotient(dividend: Int, divisor: Int, completion: @escaping (Result<Int, DivisionError>) -> Void) {

        if divisor == 0 {
            completion(.failure(.dividendByZero))
            return
        }

        let quotient = dividend / divisor
        completion(.success(quotient))
    }
}
