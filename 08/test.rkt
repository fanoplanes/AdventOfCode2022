#lang racket

(define (read-inp)
  (map (λ(line) (map (λ(c) (- (char->integer c) 48)) (string->list line)))
       (file->lines "input")))

(define (part1 forest)
  (define (left-of x y) (let ([row (list-ref forest y)]) (take row x)))
  (define (right-of x y) (let ([row (list-ref forest y)]) (drop row (add1 x))))
  (define (above-of x y) (map (λ(row) (list-ref row x)) (take forest y)))
  (define (below-of x y) (map (λ(row) (list-ref row x)) (drop forest (add1 y))))
  (for/sum ([(row y) (in-indexed forest)])
    (for/sum ([(height x) (in-indexed row)])
      (if (or (andmap (λ(h) (< h height)) (left-of x y))
              (andmap (λ(h) (< h height)) (right-of x y))
              (andmap (λ(h) (< h height)) (above-of x y))
              (andmap (λ(h) (< h height)) (below-of x y)))
          1
          0))))

(define (part2 forest)
  (define (left-of x y) (reverse (let ([row (list-ref forest y)]) (take row x))))
  (define (right-of x y) (let ([row (list-ref forest y)]) (drop row (add1 x))))
  (define (above-of x y) (reverse (map (λ(row) (list-ref row x)) (take forest y))))
  (define (below-of x y) (map (λ(row) (list-ref row x)) (drop forest (add1 y))))
  (define (okay-checker height)
    (define matched #f)
    (λ(h) (cond [matched #f]
                [(< h height)]
                [(>= h height) (set! matched #t) #t]
                [else #f])))
  (apply
   max
   (for/list ([(row y) (in-indexed forest)])
     (apply
      max
      (for/list ([(height x) (in-indexed row)])
        (* (length (takef (left-of x y) (okay-checker height)))
           (length (takef (right-of x y) (okay-checker height)))
           (length (takef (above-of x y) (okay-checker height)))
           (length (takef (below-of x y) (okay-checker height)))))))))

(module+ test
  (require rackunit)
  (define test-inp (map (λ(line) (map (λ(c) (- (char->integer c) 48)) (string->list line)))
                        (string-split "30373
25512
65332
33549
35390")))
  (check-equal? (part1 test-inp) 21)
  (check-equal? (part2 test-inp) 8))

(module+ main
  (part1 (read-inp))
  (part2 (read-inp)))
