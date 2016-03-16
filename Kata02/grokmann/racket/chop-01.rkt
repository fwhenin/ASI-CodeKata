#lang racket
;chop(int, array_of_int)  -> int

(provide (all-defined-out)) ;; so we can put tests in a second file

(define z (range 1 10))

(define chop
  (lambda (x ls)
    (letrec ([f (lambda (ls1 offset index)
                  (if (pair? ls1)
                      (cond
                        [(equal? (first ls1) x) index]
                        [(> (length ls1) 1) (let ([new-offset (floor (/ (length ls1) 2))])
                                (let-values ([(front back) (split-at ls1 new-offset)])
                                             (if (and (not (empty? front)) (<= x (last front)))
                                                 (f front offset index)
                                                 (f back new-offset (+ index new-offset)))))]
                        [else -1])
                      -1))])
      (f ls 0 0))))

(module+ test
  (chop 3 '(1 3 5))
  ;(chop 3 '(1))
  ;(chop 4 z)
  (list-tail z (list-ref z (floor (/ (length z) 2))))
  )

