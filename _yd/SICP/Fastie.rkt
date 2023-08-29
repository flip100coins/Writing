#lang racket
(define (fast-expt b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b counter product)
  (cond
    ((= counter 0) (/ product 2))
    ((and (even? counter) (= product 1)) (fast-expt-iter b (/ counter 2) (square b)))
    ((even? counter) (fast-expt-iter b (/ counter 2) (square product)))                           
    (else(fast-expt-iter b (- counter 1) (* product b)))))

(define (square n)
  (* n n))

(define (double n)
  (+ n n))

(define (halve n)
  (if (even? n)
      (/ n 2)
      (/ (- n 1) 2)))

(define (new-* a b)
  (cond
    ((= b 1) a)
    ((even? b) (double (new-* a (halve b))))
    (else(+ a (new-* a (- b 1))))))

(define (it-new-* a b)
  (iter-new-* a 1 (- b 1)))

(define (ft Z Y N)
  (cond
    ((= N 0) Y)
    ((even? N) (ft (double Z) Y (halve N)))
    (else(ft (double Z) (+ Y Z) (halve N)))))

(define (iter-new-* A B L)
  (cond
    ((= L 0) (+ B (- A 1)))
    ((even? L) (iter-new-* A (+ A B) (- L 1)))
    (else(iter-new-* (double A) B (halve L)))))

(define (fast-expt2 b n)
  (cond ((= n 0) 1)
    ((even? n) (square (fast-expt2 b (/ n 2))))
    (else(* b (fast-expt2 b (- n 1))))))

(define (fast-expt3 b n)
  (fast-expt-iter1 b 1 (- n 1)))

(define (fast-expt-iter1 Z Y N)
  (cond
    ((= N 0) (* Y Z))
    ((even? N) (fast-expt-iter1 Z (* Z Y) (- N 1)))
    (else(fast-expt-iter1 (square Z) Y (halve N)))))



(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (display p)
  (display " ")
  (display q)
  (newline)
  (cond ((= count 0) b)
        ((even? count) (fib-iter a b (+ (square p) (square q)) (+ (* 2 p q) (square q)) (/ count 2)))
         (else(fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
