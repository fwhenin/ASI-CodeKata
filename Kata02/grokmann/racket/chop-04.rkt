#lang racket
(require math)
;chop(int, array_of_int)  -> int

(provide chop) ;; so we can put tests in a second file

(define z (range 1 10))

(define chop
  (lambda (x ary)
    (letrec ([f (lambda (arr1 offset index)
                  (if (> (array-size arr1) 0)
                      (cond
                        [(equal? (array-ref arr1 #[0]) x) index]
                        [(> (array-size arr1) 1) (let ([new-offset (floor (/ (array-size arr1) 2))])
                                (let-values ([(front) (array-slice-ref arr1 (list (:: #f new-offset 1)))]
                                             [(back) (array-slice-ref arr1 (list (:: new-offset #f 1)))])
                                             (if (and (not (empty? back)) (>= x (array-ref back #[0])))
                                                 (f back new-offset (+ index new-offset))
                                                 (f front offset index))))]
                        [else -1])
                      -1))])
      (f ary 0 0))))

(module+ test
  (define arr (array #[1 2 3 4 5 6]))
  (chop 3 (array #[1 3 5]))
  (list-tail z (list-ref z (floor (/ (length z) 2))))
  )

