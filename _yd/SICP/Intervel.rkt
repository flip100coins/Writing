#lang sicp
(define (mul-interval x y)
  (cond
    ((and (positive? (lower-bound x)) (positive? (lower-bound y)))
     (make-interval (* (upper-bound x) (upper-bound y))
                    (* (lower-bound x) (lower-bound y))))
    ((and (negative? (upper-bound x)) (negative? (upper-bound y)))
     (make-interval (* (lower-bound x) (lower-bound y))
                    (* (upper-bound x) (upper-bound y))))
    ((and (positive? (lower-bound x)) (negative? (upper-bound y)))
     (make-interval (* (lower-bound x) (upper-bound y))
                    (* (upper-bound x) (lower-bound y))))
    ((and (positive? (lower-bound y)) (negative? (upper-bound x)))
     (make-interval (* (lower-bound y) (upper-bound x))
                    (* (upper-bound y) (lower-bound x))))
    ((positive? (lower-bound x))
     (make-interval (* (upper-bound x) (upper-bound y))
                    (* (upper-bound x) (lower-bound y))))
    ((positive? (lower-bound y))
     (make-interval (* (upper-bound y) (upper-bound x))
                    (* (upper-bound y) (lower-bound x))))
    ((negative? (upper-bound x))
     (make-interval (* (lower-bound x) (lower-bound y))
                    (* (lower-bound x) (upper-bound y))))
    ((negative? (upper-bound y))
     (make-interval (* (lower-bound y) (lower-bound x))
                    (* (lower-bound y) (upper-bound x))))
    (else(make-interval(max (* (upper-bound x) (upper-bound x))
                            (* (lower-bound x) (lower-bound y)))
                       (min (* (lower-bound x) (upper-bound y))
                            (* (lower-bound y) (upper-bound x)))))))

(define (lower-bound i) (cdr i))

(define (make-interval u l) (cons u l))

(define (upper-bound i) (car i))

(define (make-center-width c w)
  (make-interval (+ c w) (- c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (make-center-width c (* p c)))

(define (center2 i)
  (center i))

(define (percent i)
  (/ (width i) (center i)))

(define (add-interval x y)
  (make-interval (+ (upper-bound x) (upper-bound y))
                 (+ (lower-bound x) (lower-bound y))))

(define (div-interval x y)
  (if (and (> 0 (lower-bound y)) (< 0 (upper-bound y)))
      (error "undef")
      (mul-interval x (make-interval (/ 1.0 (upper-bound y))
                                     (/ 1.0 (lower-bound y))))))

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one (add-interval (div-interval one r1)
                       (div-interval one r2)))))

(define interval1 (make-center-percent 100 0.5))
(define interval2 (make-center-percent 20 0.5))