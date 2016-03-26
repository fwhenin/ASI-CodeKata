#lang racket

(require "chop-04.rkt")
(require math)
(require rackunit)

; def test_chop
;   assert_equal(-1, chop(3, []))
;   assert_equal(-1, chop(3, [1]))
;   assert_equal(0,  chop(1, [1]))
;   #
;   assert_equal(0,  chop(1, [1, 3, 5]))
;   assert_equal(1,  chop(3, [1, 3, 5]))
;   assert_equal(2,  chop(5, [1, 3, 5]))
;   assert_equal(-1, chop(0, [1, 3, 5]))
;   assert_equal(-1, chop(2, [1, 3, 5]))
;   assert_equal(-1, chop(4, [1, 3, 5]))
;   assert_equal(-1, chop(6, [1, 3, 5]))
;   #
;   assert_equal(0,  chop(1, [1, 3, 5, 7]))
;   assert_equal(1,  chop(3, [1, 3, 5, 7]))
;   assert_equal(2,  chop(5, [1, 3, 5, 7]))
;   assert_equal(3,  chop(7, [1, 3, 5, 7]))
;   assert_equal(-1, chop(0, [1, 3, 5, 7]))
;   assert_equal(-1, chop(2, [1, 3, 5, 7]))
;   assert_equal(-1, chop(4, [1, 3, 5, 7]))
;   assert_equal(-1, chop(6, [1, 3, 5, 7]))
;   assert_equal(-1, chop(8, [1, 3, 5, 7]))
; end


(define chop-tests
  (test-suite
   "Tests for file.rkt"
 
   (check-equal? (chop 3 (array #[])) -1 "empty list")
   (check-equal? (chop 3 (array #[1])) -1 "not present in one element list")
   (check-equal? (chop 1 (array #[1])) 0 "one element match returns 0")
   
   (check-equal? (chop 1 (array #[1 3 5])) 0    "3-element list: test first element")
   (check-equal? (chop 3 (array #[1 3 5])) 1    "3-element list: test second element")
   (check-equal? (chop 5 (array #[1 3 5])) 2    "test" )
   (check-equal? (chop 0 (array #[1 3 5])) -1   "test" )
   (check-equal? (chop 2 (array #[1 3 5])) -1   "test" )
   (check-equal? (chop 4 (array #[1 3 5])) -1   "test" )
   (check-equal? (chop 6 (array #[1 3 5])) -1   "test" )
   
   (check-equal? (chop 1 (array #[1 3 5 7])) 0  "test" )
   (check-equal? (chop 3 (array #[1 3 5 7])) 1  "test" )
   (check-equal? (chop 5 (array #[1 3 5 7])) 2  "test" )
   (check-equal? (chop 7 (array #[1 3 5 7])) 3  "test" )
   (check-equal? (chop 0 (array #[1 3 5 7])) -1 "test" )
   (check-equal? (chop 2 (array #[1 3 5 7])) -1 "test" )
   (check-equal? (chop 4 (array #[1 3 5 7])) -1 "test" )
   (check-equal? (chop 6 (array #[1 3 5 7])) -1 "test" )
   (check-equal? (chop 8 (array #[1 3 5 7])) -1 "test" )
   ))

(require rackunit/text-ui)
 
(run-tests chop-tests)