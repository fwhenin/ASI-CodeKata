#lang racket
;http://codekata.com/kata/kata04-data-munging/
;Part Three: DRY Fusion
;Take the two programs written previously and factor out as much common code as possible, leaving you with two smaller programs and some kind of shared functionality.

(require racket/file)

(define (get-col-from-row row col)
  (string-trim (substring row (car col) (+ (car col) (cadr col)))))

(define get-min-spread 
  (lambda
      ([file-name "../football.dat"]
       [name-col '(7 16)] ;col is list of start position and length
       [val1-col '(43 2)]
       [val2-col '(50 2)]
       [min-spread-team ""]
       [min-spread #f])
    
    (define in (open-input-file file-name))
    
    (for ([line (in-lines in)])
      (when (> (string-length line) 1)
        (define val1 (string->number (get-col-from-row line val1-col)))
        (define val2 (string->number (get-col-from-row line val2-col)))
        
        (when val1 
          (define name (get-col-from-row line name-col))
          (when name 
            (define spread (abs (- val1 val2)))
            (when (or (not min-spread) (< spread min-spread))
              (set! min-spread spread)
              (set! min-spread-team name)
              )
            )
          )
        )
      )
    
    (displayln (string-append "min-spread: " min-spread-team))
    (close-input-port in)
    )
  )

(get-min-spread "../weather.dat" '(2 2) '(12 2) '(6 2))
(get-min-spread "../football.dat" '(7 16) '(43 2) '(50 2))
