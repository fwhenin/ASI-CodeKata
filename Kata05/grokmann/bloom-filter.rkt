#lang racket
;Kata05: Bloom Filters
;http://codekata.com/kata/kata05-bloom-filters/
;So, this kata is fairly straightforward. Implement a Bloom filter based spell checker. You’ll need some kind of bitmap, some hash functions, and a simple way of reading in the dictionary and then the words to check. For the hash function, remember that you can always use something that generates a fairly long hash (such as MD5) and then take your smaller hash values by extracting sequences of bits from the result.
;Play with using different numbers of hashes, and with different bitmap sizes.
;Part two of the exercise is optional. Try generating random 5-character words and feeding them in to your spell checker. For each word that it says it OK, look it up in the original dictionary. See how many false positives you get.

