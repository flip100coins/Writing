#lang sicp
(define (simpson-integral f a b n)
  (simpson-integral-do f a b n 0 0 a))

(define (simpson-integral-do f a b n counter sum s)
  (cond
    ((> counter n) (* sum (/ (- b s) (* 3 n))))
    ((or (= counter 0) (= counter n)) (simpson-integral-do f (+ a (/ (- b s) n)) b n (+ counter 1) (+ sum (f a)) s))
    ((odd? counter) (simpson-integral-do f (+ a (/ (- b s) n)) b n (+ counter 1) (+ sum (* 4 (f a))) s))
    (else(simpson-integral-do f (+ a (/ (- b s) n)) b n (+ counter 1) (+ sum (* 2 (f a))) s))))

(define (cube n)
  (* n n n))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
(iter a 0))

(define (re-product term a next b)
  (if (> a b)
      1
      (* (term a) (re-product term (next a) next b))))

(define (it-product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
(iter a 1))    


(define (factorial n)
  (re-product identity 1 inc n))

(define (pi-product n)
  (/ (* 4 (/ (it-product even-square 2 pi-next n) (it-product square 3 pi-next (- n 1)))) n))

(define (square n)
  (* n n))

(define (pi-next n) (+ n 2))

(define (even-square n)
  (if (= n 2)
      2
      (* n n)))

(define (pi-sum n)
  (* 6 (sum over-square 1 inc n)))

(define (over-square n)
  (/ 1 (square n)))


(define (re-accumlate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (re-accumlate combiner null-value term (next a) next b))))

(define (it-accumlate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
(iter a null-value))

(define (filtered-accumulate filter combiner null-value term a next b)
  (cond ((> a b) null-value)
        ((filter a) (combiner (term a) (filtered-accumulate filter combiner null-value term (next a) next b)))
        (else(filtered-accumulate filter combiner null-value term (next a) next b)))) 
      
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (smallest-divisor n) (find-divisor n 2))

(define (GCD a b)
  (if (= b 0)
      a
      (GCD b (remainder a b))))

(define (WCD? a b)
  (if (= (GCD a b) 1)
      #t
      #f))

(define (lp n)
  (define (WCD-inner a)
    (WCD? a n))
(filtered-accumulate WCD-inner * 1 identity 1 inc (- n 1))) 
