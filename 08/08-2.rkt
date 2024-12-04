#lang racket

(define input
  (map (lambda (lst) (map (lambda (x) (- (char->integer x) 48)) lst))
       (map (lambda (str) (string->list str)) (file->lines "input"))))

(define height (length input))
(define width (length (first input)))
(define current 0)

(define (look-left x y)
  (cond
    [(= y 0) y]
    [(> current (list-ref (list-ref input x) (- y 1))) (look-left x (- y 1))]
    [else y]))
(define (look-right x y)
  (cond
    [(= y (sub1 width)) y]
    [(> current (list-ref (list-ref input x) (+ y 1))) (look-right x (+ y 1))]
    [else y]))
(define (look-up x y)
  (cond
    [(= x 0) x]
    [(> current (list-ref (list-ref input (- x 1)) y)) (look-up (- x 1) y)]
    [else x]))
(define (look-down x y)
  (cond
    [(= x (sub1 height)) x]
    [(> current (list-ref (list-ref input (+ x 1)) y)) (look-down (+ x 1) y)]
    [else x]))

(define (visibility-score x y)
  (cond
    [(or (= x 0) (= x (sub1 height)) (= y 0) (= y (sub1 width))) 0]
    [else
     (* (abs (- y (add1 (look-left x y))))
        (abs (- y (add1 (look-right x y))))
        (abs (- x (add1 (look-up x y))))
        (abs (- x (add1 (look-down x y)))))]))

(define visible empty)

(for ([i (in-range height)])
  (for ([j (in-range width)])
    (begin
      (set! current (list-ref (list-ref input i) j))
      (set! visible (cons (visibility-score i j) visible)))))

(print (car (sort visible >)))
