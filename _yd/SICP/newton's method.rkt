#lang sicp
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) dx))
    (define (try guess)
      (let ((next (f guess)))
        (display next)
        (newline)
        (if (close-enough? next guess)
            next
            (try next))))
(try first-guess))




(define (diriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

(define dx 0.000001)

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((diriv g) x)))))

(define (newton-method g guess)
  (fixed-point (newton-transform g) guess))

(define (double term)
  (lambda (x) (term (term x))))

(define (compose func1 func2)
  (lambda (x)
    (func1 (func2 x))))

(define (cube a) (* a a a))

(define (square a) (* a a))

(define (cubic a b c)
  (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))

(define (repeated func1 times)
    (let ((func2 (compose func1 func1)))
      (cond ((= times 2) func2)
            ((even? times) (compose func2 (repeated func1 (/ times 2))))
            (else(compose func1 (repeated func1 (- times 1)))))))


(define (smooth f)
  (lambda (x) (/ (+ (f x) (f (- x dx)) (f (+ x dx))) 3)))

(define (run func data)
  (func data))


(define (compose2 f g)
  (lambda (x) (f (g x))))

(define (repeated2 f times)
  (if (= times 1)
      f
      (compose2 f (repeated2 f (- times 1)))))

(define (average-damp f)
  (lambda (x) (/ (+ x (f x)) 2)))

(define (sprt x)
  (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (* y y)))) 1.0))

(define (forth-root x)
  (fixed-point (average-damp(average-damp (lambda (y) (/ x (* y y y))))) 1.0))

(define (fivth-root x)
  (fixed-point (average-damp(average-damp (lambda (y) (/ x (* y y y y))))) 1.0))


(define (sixth-root x)
  (fixed-point (average-damp(average-damp (lambda (y) (/ x (* y y y y y))))) 1.0))

(define (eighth-root x)
  (fixed-point (average-damp(average-damp (lambda (y) (/ x (* y y y y y y y))))) 1.0))

(define (nth-root n x)
  (fixed-point ((repeated2 average-damp (floor (log n 2)))
                (lambda (y) (/ x (expt y (- n 1))))) 1.0))

(define (iterative-improve improve-guess good-enough?)
  (lambda (guess)
    (let ((next (improve-guess guess)))
      (if (good-enough? guess)
          guess
          ((iterative-improve improve-guess good-enough?) (improve-guess guess))))))