//
//  BinaryHeapTest.swift
//  BinaryHeapTest
//
//  Created by Aaron on 2020/12/16.
//

import XCTest

class BinaryHeapTest: XCTestCase {

    func testMaxHeap() throws {
        var maxHeap = MaxHeap<Int>()
        
        XCTAssertTrue(maxHeap.isEmpty)
        
        maxHeap.insert(72)
        maxHeap.insert(68)
        maxHeap.insert(50)
        maxHeap.insert(43)
        
        XCTAssertEqual(72, maxHeap.replace(38))
        XCTAssertEqual(68, maxHeap.replace(47))
        
        maxHeap.insert(21)
        maxHeap.insert(14)
        maxHeap.insert(80)
        
        // 添加
        XCTAssertEqual(7, maxHeap.count)
        XCTAssertEqual(80, maxHeap.peek())
        
        // 删除
        XCTAssertEqual(80, maxHeap.remove())
        XCTAssertEqual(6, maxHeap.count)
        XCTAssertEqual(50, maxHeap.peek())
        
        XCTAssertEqual(50, maxHeap.remove())
        XCTAssertEqual(5, maxHeap.count)
        XCTAssertEqual(47, maxHeap.peek())
        
        XCTAssertEqual(47, maxHeap.remove())
        XCTAssertEqual(4, maxHeap.count)
        XCTAssertEqual(43, maxHeap.peek())
        
    }
    
    func testMaxHeapArray() throws {
        var heap: MaxHeap<Int> = [30, 34, 73, 60, 68, 43]
        
        XCTAssertEqual(6, heap.count)
        
        XCTAssertEqual(73, heap.remove())
        XCTAssertEqual(5, heap.count)
        XCTAssertEqual(68, heap.peek())
        
        XCTAssertEqual(68, heap.remove())
        XCTAssertEqual(4, heap.count)
        XCTAssertEqual(60, heap.peek())
        
        XCTAssertEqual(60, heap.remove())
        XCTAssertEqual(3, heap.count)
        XCTAssertEqual(43, heap.peek())
        
        XCTAssertEqual(43, heap.remove())
        XCTAssertEqual(2, heap.count)
        XCTAssertEqual(34, heap.peek())
        
        XCTAssertEqual(34, heap.remove())
        XCTAssertEqual(1, heap.count)
        XCTAssertEqual(30, heap.peek())
        
        XCTAssertEqual(30, heap.remove())
        XCTAssertEqual(0, heap.count)
        XCTAssertEqual(nil, heap.peek())
        
        XCTAssertEqual(nil, heap.remove())
    }
    
    func testMinHeap() throws {
        var maxHeap = MinHeap<Int>()
        
        XCTAssertTrue(maxHeap.isEmpty)
        
        maxHeap.insert(72)
        maxHeap.insert(68)
        maxHeap.insert(50)
        maxHeap.insert(43)
        
        XCTAssertEqual(43, maxHeap.replace(38))
        XCTAssertEqual(38, maxHeap.replace(47))
        
        maxHeap.insert(21)
        maxHeap.insert(14)
        maxHeap.insert(80)
        
        // 添加
        XCTAssertEqual(7, maxHeap.count)
        XCTAssertEqual(14, maxHeap.peek())
        
        // 删除
        XCTAssertEqual(14, maxHeap.remove())
        XCTAssertEqual(6, maxHeap.count)
        XCTAssertEqual(21, maxHeap.peek())
        
        XCTAssertEqual(21, maxHeap.remove())
        XCTAssertEqual(5, maxHeap.count)
        XCTAssertEqual(47, maxHeap.peek())
        
        XCTAssertEqual(47, maxHeap.remove())
        XCTAssertEqual(4, maxHeap.count)
        XCTAssertEqual(50, maxHeap.peek())
        
    }
    
    func testMinHeapArray() throws {
        var heap: MinHeap<Int> = [30, 34, 73, 60, 68, 43]
        
        XCTAssertEqual(6, heap.count)
        
        XCTAssertEqual(30, heap.remove())
        XCTAssertEqual(5, heap.count)
        XCTAssertEqual(34, heap.peek())
        
        XCTAssertEqual(34, heap.remove())
        XCTAssertEqual(4, heap.count)
        XCTAssertEqual(43, heap.peek())
        
        XCTAssertEqual(43, heap.remove())
        XCTAssertEqual(3, heap.count)
        XCTAssertEqual(60, heap.peek())
        
        XCTAssertEqual(60, heap.remove())
        XCTAssertEqual(2, heap.count)
        XCTAssertEqual(68, heap.peek())
        
        XCTAssertEqual(68, heap.remove())
        XCTAssertEqual(1, heap.count)
        XCTAssertEqual(73, heap.peek())
        
        XCTAssertEqual(73, heap.remove())
        XCTAssertEqual(0, heap.count)
        XCTAssertEqual(nil, heap.peek())
        
        XCTAssertEqual(nil, heap.remove())
    }

}
