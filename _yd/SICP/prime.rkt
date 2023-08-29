#lang sicp
(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (square n)
  (* n n))

(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder(square (expmod base (/ exp 2) m))m))
        (else(remainder(* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
(try-it (+ 1 (random (- n 1)))))  

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display "***")
  (display elapsed-time))



(define (next n)
  (if (= n 2)
      3
      (+ n 2)))


(define (search-for-primes-do a b l)
  (cond ((> a b) l)
        ((prime? a) (search-for-primes-do (+ a 1) b (cons a l)))
        (else (search-for-primes-do (+ a 1) b l))))

(define (search-for-primes a b)
  (search-for-primes-do a b (list)))

(define (search-for-prime-do a n l)
  (cond ((= n 0) l)
        ((fast-prime? a 10) (search-for-prime-do (+ a 1) (- n 1) (cons a l)))
        (else(search-for-prime-do (+ a 1) n l))))

(define (search-for-prime a n)
  (search-for-prime-do a n (list)))

  







(define (timed-prime-test3 n)
  (newline)
  (display n)
  (start-prime-test3 n (runtime)))

(define (start-prime-test3 n start-time)
  (if (fast-prime? n 10)
      (report-prime (- (runtime) start-time))))






(define (exmod2 base exp m)
  (remainder (fast-expt base exp) m))


(define (fast-expt b n)
  (cond ((= n 0) 1)
    ((even? n) (square (fast-expt b (/ n 2))))
    (else(* b (fast-expt b (- n 1))))))








(define (timed-prime-test2 n)
  (newline)
  (display n)
  (start-prime-test2 n (runtime)))

(define (start-prime-test2 n start-time)
  (if (prime2? n)
      (report-prime (- (runtime) start-time))))


(define (tf n)
  (display (timed-prime-test2 n))
  (newline)
  (display (timed-prime-test n)))
   
           




(define (smallest-divisor2 n) (find-divisor2 n 2))

(define (find-divisor2 n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor2 n (next test-divisor)))))

(define (prime2? n)
  (= (smallest-divisor2 n) n))
































(define (fermat-test2 n)
  (define (try-it2 a)
    (= (exmod2 a n n) a))
(try-it2 (+ 1 (random (- n 1)))))  

(define (fast-prime2? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime2? n (- times 1)))
        (else false)))





(define (full-fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
(try-it (- n 1)))


  

