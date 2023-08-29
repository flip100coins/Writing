#lang racket
(define (f g) (g 2))

(define (close-enough? x y)
  (< (abs(- x y)) 0.0001))

(define tolerance 0.00001)

(define (fix-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
    (define (try guess)
      (let ((next (f guess)))
        (display next)
        (newline)
        (if (close-enough? next guess)
            next
            (try next))))
(try first-guess))

(define (golden-ratio n) (fix-point (lambda (y) (+ 1.0 (/ 1.0 y))) n))

(define (x-x-1000 n) (fix-point (lambda (y) (/ (log 1000) (log y))) n))

(define (cont-prac n d k)
  (if (= k 0)
      0
      (/ (n k) (+ (d k) (cont-prac n d (- k 1))))))

(define (it-cont-prac n d k)
  (iter-cont-prac n d k 0))

(define (iter-cont-prac n d k result)
  (if (= 0 k)
      result
      (iter-cont-prac n d (- k 1) (/ (n k) (+ (d k) result)))))

(define (e-D s)
  (cond
    ((or (= (remainder s 3) 1)(= (remainder s 3) 0)) 1)
    ((= (remainder s 3) 2) (* (+ (floor (/ s 3)) 1) 2))))

(define (test-e-D s)
  (display (e-D s))
  (display " ")
  (if (= s 0)
      (display "done")
      (test-e-D (- s 1))))

(define (continued-e k)
  (+ 2 (it-cont-prac (lambda (i) 1.0) e-D k)))

(define (tan-cf x k)
  (special-cont-prac (lambda (a b)
                       (if (= b 1)
                           a
                           (square a)))
                      tan-d  k x))

(define (tan-d k)
  (+ 1 (* (- k 1) 2)))

(define (special-cont-prac n d k x)
  (special-iter-cont-prac n d k 0 x))

(define (special-iter-cont-prac n d k result x)
  (if (= 0 k)
      result
      (special-iter-cont-prac n d (- k 1) (/ (n x k) (- (d k) result)) x)))

(define (square n) (* n n))