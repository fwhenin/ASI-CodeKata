#lang racket

(require "chop01.rkt")
(require rackunit)

(chop 1 1)
(check-equal? 1 1 "Simple addition")


(define chop-tests
  (test-suite
   "Tests for chop_01.rkt"
 
   (check-equal? 1 1 "dump chop")
   (check-equal? -1 (chop 3 '()))
 
   ))

(require rackunit/text-ui)
(run-tests chop-tests)