#lang racket
;chop(int, array_of_int)  -> int

(provide (all-defined-out)) ;; so we can put tests in a second file

(define z (list 1 2 3 4))

(define chop
  (lambda (x ls)
    -1
    ))

(module+ test
  (chop 1 z)
  )