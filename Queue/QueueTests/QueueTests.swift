//
//  QueueTests.swift
//  QueueTests
//
//  Created by Aaron on 2020/11/17.
//

import XCTest
@testable import Queue

class QueueTests: XCTestCase {

    func testQueue() throws {
        let queue = Queue<String>()
        XCTAssertEqual(queue.count, 0)
        queue.enqueue("A")
        queue.enqueue("B")
        queue.enqueue("C")
        queue.enqueue("D")
        queue.enqueue("E")
        queue.enqueue("F")
        XCTAssertEqual(queue.count, 6)
        XCTAssertEqual(queue.front, "A")
        XCTAssertEqual(queue.dequeue(), "A")
        XCTAssertEqual(queue.count, 5)
        XCTAssertEqual(queue.front, "B")
        let arr = ["B", "C", "D", "E", "F"]
        for (idx, e) in queue.enumerated() {
            XCTAssertEqual(e, arr[idx])
        }
    }
    
    func testDeque() throws {
        let deque = Deque<String>()
        XCTAssertEqual(deque.count, 0)
        deque.enqueueFront("A")
        deque.enqueueFront("B")
        deque.enqueueFront("C")
        XCTAssertEqual(deque.front, "C")
        XCTAssertEqual(deque.rear, "A")
        deque.enqueueRear("D")
        deque.enqueueRear("E")
        deque.enqueueRear("F")
        XCTAssertEqual(deque.front, "C")
        XCTAssertEqual(deque.rear, "F")
        
        XCTAssertEqual(deque.dequeueFront(), "C")
        XCTAssertEqual(deque.front, "B")
        XCTAssertEqual(deque.rear, "F")
        
        XCTAssertEqual(deque.dequeueRear(), "F")
        XCTAssertEqual(deque.front, "B")
        XCTAssertEqual(deque.rear, "E")
        
        XCTAssertEqual(deque.count, 4)
        
    }

}
