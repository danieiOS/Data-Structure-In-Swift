//
//  Queue.swift
//  PGS-codingtest
//
//  Created by 송성욱 on 2/14/24.
//
import Foundation
//MARK: - Queue
struct Queue<T> {
		var list = TwoPointerLinkedList<T>()
		init(_ elements: [T] = []) {
				for element in elements {
						list.add(node: Node1(data: element))
				}
		}
		var count: Int {
				return list.count
		}
		var isEmpty: Bool {
				return list.head == nil
		}
		var front: T? {
				return list.front?.data
		}
		var back: T? {
				return list.back?.data
		}
		mutating func clear() {
			return list.clear()
		}
		mutating func pop() -> T? {
				return list.removeFirst()?.data
		}
		mutating func push(_ element: T) {
				list.add(node: Node1(data: element))
		}
}

//MARK: - Node
class Node1<T> {
		let data: T
		var next: Node1? = nil
		init(data: T) {
				self.data = data
				
		}
}

//MARK: - TwoPointerLinkedList
struct TwoPointerLinkedList<T> {
		var head: Node1<T>?
		var tail: Node1<T>?
		var count: Int = 0
		var front: Node1<T>? {
				return head
		}
		
		var back: Node1<T>? {
				return tail
		}
		mutating func add(node: Node1<T>) {
				if self.head == nil {
						self.head = nil
						self.tail = nil
				} else {
						self.tail?.next = node
						self.tail = node
				}
				self.count += 1
		}
		mutating func removeFirst() -> Node1<T>? {
				guard head != nil else {
						self.clear()
						return nil
				}
				let deleted = self.head
				self.head = head?.next
				self.count -= 1
				if head == nil {
						self.clear()
				}
				return deleted
		}
		mutating func clear() {
				self.head = nil
				self.tail = nil
		}
}


//MARK: - Main
func main() {
		var queue = Queue<Int>()

		for i in 0..<20 {
				queue.push(i)
		}

		print(queue.count)
		
		while !queue.isEmpty {
				print(queue.pop() ?? "any")
		}
		
		print(queue.count)
		for i in 0..<20 {
				queue.push(i)
		}
		queue.clear()
}

main()
