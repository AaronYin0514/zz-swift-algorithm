//
//  main.swift
//  BinaryHeap
//
//  Created by Aaron on 2020/12/16.
//

import Foundation

print("Hello, World!")

var maxHeap = MaxHeap<Int>()

maxHeap.insert(72)
maxHeap.insert(68)
maxHeap.insert(50)
maxHeap.insert(43)
maxHeap.insert(38)
maxHeap.insert(47)
maxHeap.insert(21)
maxHeap.insert(14)
maxHeap.insert(80)

_ = maxHeap.remove()
_ = maxHeap.remove()


var minHeap1 = MinHeap<Int>()
minHeap1.insert(72)
minHeap1.insert(68)
minHeap1.insert(50)
minHeap1.insert(43)
minHeap1.insert(38)
minHeap1.insert(47)
minHeap1.insert(21)
minHeap1.insert(14)
minHeap1.insert(80)
print(minHeap1)

let minHeap2: MinHeap<Int> = [72,68,50,43,38,47,21,14,80]
print(minHeap2)
