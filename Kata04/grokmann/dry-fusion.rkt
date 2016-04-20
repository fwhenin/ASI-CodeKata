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
       [min-spread -1])
    
    (define in (open-input-file file-name))
    
    (for ([line (in-lines in)])
      (define for-goals (string->number (get-col-from-row line val1-col)))
      (define against-goals (string->number (get-col-from-row line val2-col)))
      
      (when for-goals 
        (define team (get-col-from-row line name-col))
        ;    (displayln (string-append team ": For: " (number->string for-goals) " Against: " (number->string against-goals)))
        
        (when team 
          (define spread (abs (- for-goals against-goals)))
          (when (or (< spread min-spread) (< min-spread 0))
            
            ;        (displayln "BEFORE")
            ;        (display "\tmin-spread :") (displayln min-spread)
            ;        (display "\tspread :") (displayln spread)
            
            (set! min-spread spread)
            (set! min-spread-team team)
            
            ;        (displayln "AFTER")
            ;        (display "\tspread :") (displayln spread)
            ;        (display "\tmin-spread :") (displayln min-spread))
            
            )
          )
        )
      )
    
    (display (string-append "min-spread-team: " min-spread-team))
    (close-input-port in)
    )
  )