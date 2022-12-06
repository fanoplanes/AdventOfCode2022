#lang racket
(define pos 0)
(define input (string->list (regexp-replace #rx"\n" (file->string "input") "")))
(for/and ([i (in-range (- (length input) 13))]) (begin (set! pos (+ i 14))
  (check-duplicates (list (list-ref input i) (list-ref input (+ i 1)) (list-ref input (+ i 2)) (list-ref input (+ i 3))(list-ref input (+ i 4))(list-ref input (+ i 5))(list-ref input (+ i 6))(list-ref input (+ i 7))(list-ref input (+ i 8))(list-ref input (+ i 9))(list-ref input (+ i 10))(list-ref input (+ i 11))(list-ref input (+ i 12))(list-ref input (+ i 13))))))
(print pos)
