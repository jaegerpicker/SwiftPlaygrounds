// Playground - noun: a place where people can play

import Cocoa

class Node<T: NSObject> {
    var value : T? = nil
    var next : Node<T>? = nil
    var prev : Node<T>? = nil
    
    init() {
        
    }
    
    init(value: T) {
        self.value = value
    }
}

class DoublyLinkedList<T: NSObject> {
    var count : Int = 0
    var first : Node<T> = Node<T>()
    var current : Node<T> = Node<T>()
    var last : Node<T> = Node<T>()
    
    init() {
        
    }
    
    func isEmpty() -> Bool {
        return self.count == 0
    }
    
    func push(value: T) {
        var node: Node<T> = Node<T>(value: value)
        if self.isEmpty() {
            self.first = node
            self.last = node
        } else {
            node.next = self.first
            self.first.prev = node
            self.first = node
        }
        self.count++
    }
    
    func pop() -> T? {
        if self.isEmpty() {
            return nil
        } else if self.count == 1 {
            var temp : Node<T> = self.first
            self.count--
            return temp.value
        } else {
            var temp : Node<T> = self.last
            self.last.prev!.next = nil
            self.last = self.last.prev!
            self.count--
            return temp.value
        }
        
    }
}

var l : DoublyLinkedList<NSNumber> = DoublyLinkedList<NSNumber>()
l.push(1)
l.push(2)
l.push(3)
l.pop()

var t : Int = 1000
for j in 1...t {
    l.push(j)
}

while l.count > 0 {
    var i = l.pop()
    print("\(i) ")
}
