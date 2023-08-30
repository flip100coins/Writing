#lang sicp
(define (make-rat n d)
  (let ((<n? (< 0 n))
        (>n? (> 0 n))
        (>d? (> 0 d))
        (<d? (< 0 d))
        (ng (/ n (gcd n d)))
        (dg (/ d (gcd n d))))
    (cond ((= 0 n) 0)
          ((= 0 d) (display "undefine"))
          ((and <n? <d?) (cons ng dg))
          ((and >n? >d?) (cons (- ng) (- dg)))
          (>n? (cons ng dg))
          (else (cons (* -1 ng) (* -1 dg))))))

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (midpoint-segment s)
  (cons (/ (+ (x-point (start-segment s)) (x-point (end-segment s))) 2)
        (/ (+ (y-point (start-segment s)) (y-point (end-segment s))) 2)))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define point1 (make-point 1 1))
(define point2 (make-point 3 2))
(define point3 (make-point 0 3))

(define test-segment1 (make-segment point1 point2))

(define test-segment2 (make-segment point1 point3))

(define (make-retangle segment1 segment2)
  (let ((p1 (start-segment segment1))
        (p2 (end-segment segment1))
        (p3 (start-segment segment2))
        (p4 (end-segment segment2))
        (xielu1 (xielu segment1))
        (xielu2 (xielu segment2)))
    (cond
      ((or(> (* xielu1 xielu2) -1.001)
          (< (* xielu1 xielu2) -0.999))
       (make-retangle ))
      ((or(equal-point? p1 p3)
          (equal-point? p1 p4)
          (equal-point? p2 p3)
          (equal-point? p2 p4))
       (cons segment1 segment2))
      (else(display "no connected lines")))))


(define (segment1 retangle) (car retangle))
(define (segment2 retangle) (cdr retangle))

(define (xielu segment)
  (/ (- (x-point (end-segment segment)) (x-point (start-segment segment)))
     (- (y-point (end-segment segment)) (y-point (start-segment segment)))))

(define (re-area retangle)
  (* (segment-lenth(segment1 retangle)) (segment-lenth(segment2 retangle))))

(define (re-peremiter retangle)
  (+ (* 2 (segment-lenth(segment1 retangle)))
     (* 2 (segment-lenth(segment2 retangle)))))

(define (equal-point? p1 p2) (and (= (car p1) (car p2)) (= (cdr p1) (cdr p2))))

(define (segment-lenth segment)
  (sqrt(+(square(- (x-point(start-segment segment)) (x-point(end-segment segment))))
         (square(- (y-point(start-segment segment)) (y-point(end-segment segment)))))))

(define (square n) (* n n))


(define retangle1 (make-retangle test-segment1 test-segment2))

(define (xuanzhuan segment k)
  (make-segment (start-segment segment)
                (make-point (x-point(* (cos (atan k)) segment)))))