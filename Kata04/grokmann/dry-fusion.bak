#lang racket
;http://codekata.com/kata/kata04-data-munging/
;Part Two: Soccer League Table
;The file football.dat contains the results from the English Premier League for 2001/2. The columns labeled ‘F’ and ‘A’ contain the total number of goals scored for and against each team in that season (so Arsenal scored 79 goals against opponents, and had 36 goals scored against them). Write a program to print the name of the team with the smallest difference in ‘for’ and ‘against’ goals.

(require racket/file)
(define in (open-input-file "../football.dat"))
(define min-spread-team "")
(define min-spread -1)

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