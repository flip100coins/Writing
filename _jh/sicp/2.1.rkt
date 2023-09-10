#lang racket
; 2.1
(define (make-rat n d)
  (cond
    ((and (> n 0) (> d 0)) (cons n d))
    ((and (< n 0) (< d 0)) (cons (- n) (- d)))
    ((and (> n 0) (< d 0)) (cons (- n) (- d)))
    ((and (< n 0) (> d 0)) (cons n d))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
(newline)
(display (numer x))
(display "/")
  (display (denom x)))

; 2.2
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point x y)
  (cons x y))
(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))

(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "Argument not 0 or 1: CONS" m))))
  dispatch)
(define (car z) (z 0))
(define (cdr z) (z 1))

; 2.4
(define (cons1 x y)
  (lambda (m) (m x y)))
(define (car1 z)
  (z (lambda (p q) p)))
(define (cdr1 z)
  (z (lambda (p q) q)))

; 2.5

; 2.6
(define identity (lambda (x) x))
(define zero (lambda (f) identity))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
(define one (lambda (f) (f identity)))
(define two (lambda (f) (f (f identity))))
(define (times n m)
  (lambda (f)
    (m (n f))))
(define (plug n m)
  (lambda (f)
    
    