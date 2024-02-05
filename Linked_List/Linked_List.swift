//
//  Linked_List.swift
//  Play_data_structure
//
//  Created by 송성욱 on 2/5/24.
//

import Foundation
// 링크드 리스트(Linked List)
///데이터를 가지고 있는 노드들을 포인터로 선형적으로 연결해 사용하는 자료구조
///삭제와 삽입에 O(1)의 시간 복잡도가 걸리기 때문에(원하는 노드까지의 탐색시간 제외) 빈번하게 삽입과 삭제가 필요한 상황에 유용하게 사용
///하지만 배열처럼 인덱스를 통한 Random Access가 불가능하고, 처음부터 원하는 데이터가 나올 때까지 탐색을 진행해야하기 때문에 탐색에는
///O(N)의 시간복잡도가 요구된다는 단점이 있습니다. 그리고 포인터 기반이라서 디버깅이 어렵다.
//Node : 먼저 데이터를 실제로 저장하고, 다음 노드의 참조값을 저장할 노드 자료구조를 정의
class Node<T: Equatable> {
	/// id 는 이후에 삭제와 삽입을 쉽게 확인하기 위해 만듬
	/// 실제로 데이터를 저장할 data, 현재 노드와 다음 노드를 저장할 next 프로퍼티
	let id: Int
	let data: T
	var next: Node?
	
	init(id: Int, data: T, next: Node? = nil) {
		self.id = id
		self.data = data
		self.next = next
	}
}
/// 가장 앞에 위치한 노드를 가리키는 head와 가장 마지막 노드를 가리키는 tail 로 구성
/// 현재까지 링크드 리스트에 연결되어 있는 노드들을 모두 순서대로 출력할 showList
struct LinkedList<T: Equatable> {
	var head: Node<T>?
	var tail: Node<T>?
	
	func showList() {
		var now = head
		print("=== Linked List ===")
		while now != nil {
				now?.next == nil
				? print("id: \(now?.id)| data: \(now?.data)")
				: print("id: \(now?.id)| data: \(now?.data) -> ")
				now = now?.next
		}
		print("===================")
	}
	
	mutating func add(node: Node<T>) {
		// head node does not exist
		if head == nil {
			head = node
			tail = node
			return
		}
		// search for Last node and attatch new
		tail?.next = node
		tail = node
	}
	
	func searchNode(with data: T)->Node<T>? {
		var now = head
		while now?.data != data && now != nil {
			now = now?.next
		}
		return now
	}
	
	mutating func insert(node: Node<T>, after id: Int) {
		var now = head
		while now?.id != id && now?.next != nil {
			now = now?.next
		}
		node.next = now?.next
		now?.next = node
	}
	
	mutating func insert(node: Node<T>, before id: Int) {
		var now = head
		if now?.id == id {
			head = node
			node.next = now
			return
		}
		while now?.next?.id != id && now?.next != nil {
			now = now?.next
		}
		node.next = now?.next
		now?.next = node
	}
	
	mutating func delete(node: Node<T>)->Bool {
		var now = self.head
		//head에 타겟 노드일 경우
		if now === node {
			if self.head === self.tail { self.tail = nil }
			self.head = now?.next
			return true
		}
		while now?.next !== node && now?.next != nil {
			now = now?.next
		}
		// 타겟이 head아닌 경우
		if now == nil { return false }
		if now?.next === tail {
			tail = now
		}
		// 노드 삭제
		now?.next = now?.next?.next
		return true
	}
}


//추가(add) - O(1)
///추가 연산은 두가지 경우가 있다
///링크드 리스트에 아무 노드가 없을 경우, 이떄는 head가 가리키는 노드가 없으므로 nil 초기값
///head 에 새로 들어온 노드를 연결해주고, tail도 nil일테니 여기에도 새로운 노드를 연결
///링크드 리스트에 이미 데이터가 있는 경우
///이떄는 마지막 노드를 가리키는 tail포인터로 찾아가서 tail이 가리키는 노드의 다음 노ㄷ에 새로 노드를 연결해준 뒤
///tail이 가리키는 노드를 새로운 노드로 변경해준다. -> 무조건 tail을 참조해서 새노드를 연결만 해주면 되니 항상 O(1)의 시간복잡도

//탐색(search) - O(N)
///탐색연산 링크드 리스트는 Random Access 가 불가능해서 특정한 노드에 접근하려면 항상 제일 처음 노드인 head 부터 원하는 노드를 찾을 때까지 next 프로퍼티를 통해 다음 노드를 재귀적으로 탐색해야 한다.
///노드가 중간에 있는 노드까지 탐색을 하고 싶다고 가정 -> 찾고 싶은 노드의 id는 4
///탐색을 시작하기 위해 head와 tail이 아닌 커서의 역할을 할 포인터 now를 만들어 준다
///이때 now를 움직이면서 now가 가리키는 id가 4가 될 때까지 커서를 움직여 줍니다.
///next프로퍼티는 항상 자신의 다음 노드를 가리키고 있기 때문에 이를 이용하면 커서를 이동시키는 건 쉽습니다.
///id를 발견하면 해당 노드의 참조값을 그대로 반환하고, 찾지 못한다면 마지막 노드까지 이동해 nil을 반환하게 하면 됩니다.

//삽입(insert) - O(1) or O(N)
///삽입 연산은 가장 뒤가 아닌 어떤 특저안 노드의 앞이나 뒤에 새로운 노드를 끼워넣는 것을 의미합니다.
///삽입을 하려면 원하는 지점까지의 탐색이 선행되어야 합니다.
///id 가 4인 노드와 5인 노드 사이에 새로운 노드를 삽입해보겠습니다.
///새로운 노드의 삽입은 노드들 사이의 포인터만 바꾸면 쉽게 가능할 것 같습니다.
///방금 찾은 노드가 가리키던 다음 노드를 새로운 노드 또한 가리키게 만들고,
///찾은 노드가 새로 삽입할 노드를 가리키게 하면 간단하게 삽입 연산이 완성됩니다.
///목표 노드를 찾기 위해서 탐색연산을 수행하기 떄문에 O(N)의 시간복잡도가 요구되고, 그 이후에 삽입은 포인터의 변경만 있으므로 O(1)에 끝나게 됩니다.
///O(1)로 삽입이 되는 경우도 있다, head나 tail 앞이나 뒤에 새로운 노드를 삽입하면 탐색이 필요없기 때문에 O(1)에 삽입이 가능하다

//삭제(delete) - O(1) or O(N)
///삭제 연산은 삽입과 유사합니다. 먼저 삭제할 노드를 찾고, 그 앞에 있는 노드의 next 포인터를 삭제할 노드의 다음 노드로 정해주면 되겠죠
///삭제할 노드까지 찾아가면  이전 노드에 접근할 방법이 없기 떄문에 다음 노드가 삭제할 노드가 될 때까지 now 포인터를 움직여 준다.
///삭제할 노드를 건너뛰고 다음 노드와 현재 포인터를 연결해줍니다.
///건너뛴 노드는 더 이상 참조하고 있는 노드가 없으니 메모리에서 해제됩니다. 삭제 완료
///삭제 역시도 삽입처럼 탐색에 O(N), 삭제에 O(1)의 시간복잡도가 요구되기 때문에 삭제할 노드가 head나 tail이 아닐 때는 O(N), head나 tail일 때는 O(1)의 시간복잡도가 됩니다.

