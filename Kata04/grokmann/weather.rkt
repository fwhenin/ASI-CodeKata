#lang racket
;http://codekata.com/kata/kata04-data-munging/
;Part One: Weather Data
;In weather.dat you’ll find daily weather data for Morristown, NJ for June 2002. Download this text file, then write a program to output the day number (column one) with the smallest temperature spread (the maximum temperature is the second column, the minimum the third column).

(require racket/file)
(define in (open-input-file "../weather.dat"))
(define min-spread-date 0)
(define min-spread 100)

(for ([line (in-lines in)])
  (when (> (string-length line) 0) 
    (define date (string->number (string-trim (substring line 2 4))))
    (define max-temp (string->number (string-trim (substring line 6 8))))
    (define min-temp (string->number (string-trim (substring line 12 14))))
    (when date 
      (define spread (- max-temp min-temp))      
      (when (< spread min-spread)
;        (displayln "BEFORE")
;        (display "\tmin-spread :") (displayln min-spread)
;        (display "\tspread :") (displayln spread)
        (set! min-spread spread)
        (set! min-spread-date date)
;        (displayln "AFTER")
;        (display "\tspread :") (displayln spread)
;        (display "\tmin-spread :") (displayln min-spread))
;      (displayln date)
;      (displayln max-temp)
;      (displayln min-temp)
;      (displayln spread)
      ))))

(display "min-spread-date: ")(displayln min-spread-date)
(close-input-port in)