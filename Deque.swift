//
//  Deque.swift
//  Play_data_structure
//
//  Created by 송성욱 on 2/23/24.
//

import Foundation

class Deque<T> {
		var enqueue: [T]
		var dequeue: [T] = []
		var count: Int {
				return enqueue.count + dequeue.count
		}
		
		var isEmpty: Bool {
				return enqueue.isEmpty && dequeue.isEmpty
		}
		
		var first: T? {
				if dequeue.isEmpty {
						return enqueue.first
				}
				return dequeue.last
		}
		
		init(_ queue: [T]) {
				enqueue = queue
		}
		
		func pushFirst(_ element: T) {
				dequeue.append(element)
		}
		func pushLast(_ element: T) {
				enqueue.append(element)
		}
		func popFirst() -> T? {
				if dequeue.isEmpty {
						dequeue = enqueue.reversed()
						enqueue.removeAll()
				}
				return dequeue.popLast()
		}
		func popLast() -> T? {
				if enqueue.isEmpty {
						enqueue = dequeue.reversed()
						dequeue.removeAll()
				}
				return  enqueue.popLast()
		}
}
