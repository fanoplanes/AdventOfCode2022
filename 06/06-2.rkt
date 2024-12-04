#lang racket
(define pos 0)
(define input (regexp-replace #rx"\n" (file->string "input") ""))
(for/and ([i (in-range (- (string-length input) 13))]) (begin (set! pos (+ i 14))
  (check-duplicates (string->list (substring input i (+ i 14))))))
(print pos)
