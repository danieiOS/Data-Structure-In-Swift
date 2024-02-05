//
//  main.swift
//  Play_data_structure
//
//  Created by 송성욱 on 2/5/24.
//

import Foundation
//먼저 제네릭으로 데이터를 담을 수 있는 배열 하나를 만들어줍니다.
struct Stack<T> {
	var elements: [T] = []
	var count : Int {
		return elements.count
	}
	var isEmpty : Bool {
		return elements.isEmpty
	}
	//삭제(pop) -> O(1)
	///removeLast 는 배열이 비어있을 때 사용하면 에러를 발생시키지만, popLast를 사용하면 배열이 비어있을 때 nil을 반환
	mutating func pop()->T? {
		return elements.popLast()
	}
	//삽입(push) - O(1)
	mutating func push(_ element: T) {
		elements.append(element)
	}

	//조회(top) - O(1)
	///스택의 조회는 특정한 요소를 조회하는 것이 아니라, 스택의 가장 위에 쌓여있는 요소를 조회할 수 있게 합니다.
	///따라서 배열의 last 프로퍼티를 통해 마지막 요소를 반환
	func top()->T? {
		return elements.last
	}
}
/// Stack은 배열 그자체 

