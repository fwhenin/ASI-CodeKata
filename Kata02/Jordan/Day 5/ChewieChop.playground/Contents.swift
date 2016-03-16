//: Playground - noun: a place where people can play

import UIKit

func karateChop(target: Int, list: [Int]) -> Int {
    
    var vorpalSlicer: ((ArraySlice<Int>) -> Int)!
    vorpalSlicer = { (slice: ArraySlice<Int>) -> Int in
        if slice.isEmpty {
            return -1
        }
        
        let centerIndex = (slice.endIndex + slice.startIndex) / 2
        
        if target < slice[centerIndex] {
            return vorpalSlicer(slice[slice.startIndex..<centerIndex])
        } else if target > slice[centerIndex] {
            return vorpalSlicer(slice[centerIndex+1..<slice.endIndex])
        } else {
            return centerIndex
        }
    }
    
    return vorpalSlicer(list[0..<list.endIndex])
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
