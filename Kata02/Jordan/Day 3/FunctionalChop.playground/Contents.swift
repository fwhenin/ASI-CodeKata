//: Playground - noun: a place where people can play

import UIKit

func karateChop(target: Int, list: [Int]) -> Int {
    var vorpalSlicer: ((Range<Int>) -> Int)!
    
    vorpalSlicer = { (var range: Range<Int>) -> Int in
        if list[range].isEmpty {
            return -1
        }
        
        let centerIndex = (range.endIndex + range.startIndex) / 2
        
        if target < list[centerIndex] {
            range.endIndex = centerIndex
            return vorpalSlicer(range)
        } else if target > list[centerIndex] {
            range.startIndex = centerIndex + 1
            return vorpalSlicer(range)
        } else {
            return centerIndex
        }
    }
    
    return vorpalSlicer(0..<list.endIndex)
}

assert(karateChop(3, list: []) == -1)
assert(karateChop(1, list: [1]) == 0)
assert(karateChop(3, list: [1, 2]) == -1)

assert(karateChop(1, list: [1, 3, 5]) == 0)
assert(karateChop(3, list: [1, 3, 5]) == 1)
assert(karateChop(5, list: [1, 3, 5]) == 2)
assert(karateChop(2, list: [1, 3, 5]) == -1)
assert(karateChop(4, list: [1, 3, 5]) == -1)
assert(karateChop(6, list: [1, 3, 5]) == -1)

assert(karateChop(1, list: [1, 3, 5, 7]) == 0)
assert(karateChop(3, list: [1, 3, 5, 7]) == 1)
assert(karateChop(5, list: [1, 3, 5, 7]) == 2)
assert(karateChop(7, list: [1, 3, 5, 7]) == 3)
assert(karateChop(0, list: [1, 3, 5, 7]) == -1)
assert(karateChop(2, list: [1, 3, 5, 7]) == -1)
assert(karateChop(4, list: [1, 3, 5, 7]) == -1)
assert(karateChop(6, list: [1, 3, 5, 7]) == -1)
assert(karateChop(8, list: [1, 3, 5, 7]) == -1)
