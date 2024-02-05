//
//  main.swift
//  Play_data_structure
//
//  Created by 송성욱 on 2/5/24.
//

import Foundation

var list = LinkedList<Int>()
list.add(node: Node(id: 1, data: 0))
list.add(node: Node(id: 2, data: 1))
list.add(node: Node(id: 3, data: 2))
list.add(node: Node(id: 4, data: 3))
list.add(node: Node(id: 5, data: 6))
list.add(node: Node(id: 6, data: 10))

print("search node with data 0")
let deletionTargetNode = list.searchNode(with: 0)
list.showList()

print("delete node with data 0")
print(list.delete(node: deletionTargetNode!))
list.showList()

print("search node with data 0")
print(list.searchNode(with: 0) ?? 0)

print("delete node with data 10")
list.delete(node: list.searchNode(with: 10)!)
list.showList()

print("insert node after node with id(2)")
list.insert(node: Node(id: 30, data: 2), after: 2)
list.showList()

print("insert node before node with id(3)")
list.insert(node: Node(id: 50, data: 3), before: 2)
list.showList()
/*
 search node with data 0
 === Linked List ===
 id: Optional(1)| data: Optional(0) ->
 id: Optional(2)| data: Optional(1) ->
 id: Optional(3)| data: Optional(2) ->
 id: Optional(4)| data: Optional(3) ->
 id: Optional(5)| data: Optional(6) ->
 id: Optional(6)| data: Optional(10)
 ===================
 delete node with data 0
 true
 === Linked List ===
 id: Optional(2)| data: Optional(1) ->
 id: Optional(3)| data: Optional(2) ->
 id: Optional(4)| data: Optional(3) ->
 id: Optional(5)| data: Optional(6) ->
 id: Optional(6)| data: Optional(10)
 ===================
 search node with data 0
 nil
 delete node with data 10
 === Linked List ===
 id: Optional(2)| data: Optional(1) ->
 id: Optional(3)| data: Optional(2) ->
 id: Optional(4)| data: Optional(3) ->
 id: Optional(5)| data: Optional(6)
 ===================
 insert node after node with id(2)
 === Linked List ===
 id: Optional(2)| data: Optional(1) ->
 id: Optional(30)| data: Optional(2) ->
 id: Optional(3)| data: Optional(2) ->
 id: Optional(4)| data: Optional(3) ->
 id: Optional(5)| data: Optional(6)
 ===================
 insert node before node with id(3)
 === Linked List ===
 id: Optional(50)| data: Optional(3) ->
 id: Optional(2)| data: Optional(1) ->
 id: Optional(30)| data: Optional(2) ->
 id: Optional(3)| data: Optional(2) ->
 id: Optional(4)| data: Optional(3) ->
 id: Optional(5)| data: Optional(6)
 ===================
 */
