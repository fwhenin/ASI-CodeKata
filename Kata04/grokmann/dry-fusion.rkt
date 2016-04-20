#lang racket
;http://codekata.com/kata/kata04-data-munging/
;Part Three: DRY Fusion
;Take the two programs written previously and factor out as much common code as possible, leaving you with two smaller programs and some kind of shared functionality.

(require racket/file)

(define get-min-spread 
  (lambda
      ([file-name "../football.dat"]
       [min-spread-team ""]
       [min-spread -1])
    
    (define in (open-input-file file-name))
    
    (for ([line (in-lines in)])
      (define for-goals (string->number (string-trim (substring line 43 45))))
      (define against-goals (string->number (string-trim (substring line 50 52))))
      
      (when for-goals 
        (define team (string-trim (substring line 7 23)))
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