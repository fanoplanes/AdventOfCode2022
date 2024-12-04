#lang racket
(define pos 0)
(define input (regexp-replace #rx"\n" (file->string "input") ""))
(for/and ([i (in-range (- (string-length input) 3))]) (begin (set! pos (+ i 4))
  (check-duplicates (string->list (substring input i (+ i 4))))))
(print pos)
