#lang racket
(define (find-rows x y)
  (if (> x y)
      (list x y)
      (find-rows (+ x 1) (- y x))))

(define (find-n x y)
  (if (= x 0)
      y
      (find-n (- x 1) (+ x y))))

(define (second-element l)
  (car(cdr l)))

(define (return1? n)
  (or(= (second-element(find-rows 1 n)) 1) (= (second-element(find-rows 1 n)) 0)))

(define (upper n)
  (find-n(-(car(find-rows 1 n)) 2) (second-element(find-rows 1 n))))

(define (upper-left n)
  (find-n(-(car(find-rows 1 n)) 2) (-(second-element(find-rows 1 n)) 1)))

(define (find-eop n)
  (if (return1? n)
      1
      (+(find-eop(upper n)) (find-eop(upper-left n)))))



  

