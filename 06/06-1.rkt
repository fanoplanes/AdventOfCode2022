#lang racket
(define pos 0)
(define input (string->list (regexp-replace #rx"\n" (file->string "input") "")))
(for/and ([i (in-range (- (length input) 3))]) (begin (set! pos (+ i 4))
  (check-duplicates (list (list-ref input i) (list-ref input (+ i 1)) (list-ref input (+ i 2)) (list-ref input (+ i 3))))))
(print pos)
