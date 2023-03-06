//
//  step2.swift
//  CodeStarterCamp_Week2
//
//  Created by suyeon park on 2023/03/03.
//

import Foundation

let myLottoNumbers: [Int] = [1, 2, 3, 4, 5, 6]

func checkMyLottoNumber(realLottoSet: Set<Int>) {
    
    let sameNumbers = getSameLottoNumber(myLottoNumbers: myLottoNumbers, realLottoNumber: realLottoSet).sorted()
    
    if sameNumbers.count > 0 {
        print("축하합니다! 겹치는 번호는 ", terminator: "")

        for index in 0...(sameNumbers.count-1) {
            if index == 0 {
                print("\(sameNumbers[index])", terminator: "")
            } else {
                print(", \(sameNumbers[index])", terminator: "")
            }
        }
        
        print(" 입니다!")
    } else {
        print("아쉽지만 겹치는 번호가 없습니다.")
    }
}

private func getSameLottoNumber(myLottoNumbers: [Int], realLottoNumber: Set<Int>) -> Set<Int> {
    return Set<Int>(myLottoNumbers).intersection(realLottoNumber)
}

private func makeLotto() {
    var count = 0
    var lottoSet: Set<Int> = Set<Int>()
    var canAddNumber = true
    while (count < 6) {
        
        let number = Int.random(in: 0...45)
        
        if lottoSet.count > 0 {
            for item in lottoSet {
                if item == number {
                    canAddNumber = false
                    return
                }
            }
        }
        
        if canAddNumber {
            lottoSet.insert(number)
            canAddNumber = false
            count = count + 1
        }
    }
    
}
