#lang racket
;chop(int, array_of_int)  -> int

(provide (all-defined-out)) ;; so we can put tests in a second file

(define z (range 1 10))

(define chop
  (lambda (x ls)
    (letrec ([f (lambda (n lst offset)
                  (if (pair? ls)
                      (cond
                        [(equal? (first ls) x)
                         offset]
                        [else -1])
                      -1))])
      (f x ls 0))))

(module+ test
  (chop 1 z)
  (list-tail z (list-ref z (floor (/ (length z) 2))))
  )

