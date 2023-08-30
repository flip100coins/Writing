#lang sicp
(define (deep-reverse list)
  (define (iter start-list end-list)
    (cond ((null? start-list) end-list)
          ((not(list? start-list)) start-list)
          (else(iter (cdr start-list) (cons (iter (car start-list) nil) end-list)))))
  (iter list nil))

(define (last-pair list)
  (if (null? (cdr list))
      list
      (last-pair (cdr list))))

(define (no-more? list) (null? list))

(define (except-first-denomination list) (cdr list))

(define (first-denomination list) (car list))

(define (same-parity i1 . l) 
  (cond
    ((and (even? i1) (even? (car l)))
     (cons i1 (cons (car l) (same-parity-do i1 (cdr l)))))
    ((and (odd? i1) (odd? (car l)))
     (cons i1 (cons (car l) (same-parity-do i1 (cdr l)))))
    (else(cons i1 (same-parity-do i1 (cdr l))))))

(define (same-parity-do i1 l)
  (cond
    ((null? l) nil)
    ((and (even? i1) (even? (car l)))
     (cons (car l)) (same-parity-do i1 (cdr l)))
    ((and (odd? i1) (odd? (car l)))
     (cons (car l) (same-parity-do i1 (cdr l))))
    (else(same-parity-do i1 (cdr l)))))


(define (for-each procedure list)
  (cond ((null? (cdr list)) (procedure (car list)))
        ((null? list) nil)
        (else(procedure (car list))))
  (for-each procedure (cdr list)))


(define (fringe list)
  (define (iter start-list end-list)
    (cond ((null? start-list) end-list)
          ((not(list? start-list))  (cons start-list end-list))
          (else(append (iter (car start-list) end-list) (iter (cdr start-list) end-list)))))
  (iter list nil))



(define x (list (list 1 2) (list 2 3)))

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car(cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car(cdr branch)))

(define (total-weight mobile)
  (+ (branch-weight-do (left-branch mobile))
     (branch-weight-do (right-branch mobile))))
   
(define (branch-weight-do branch)
  (if (mobile? (branch-structure branch))
      (total-weight (branch-structure branch))
      (branch-structure branch)))
               
(define (balance? mobile)
  (= (* (branch-length (left-branch mobile))
        (total-weight (branch-structure (left-branch mobile))))
     (* (branch-length (right-branch mobile))
        (total-weight (branch-structure (right-branch mobile))))))

(define (mobile? mobile)
  (list? mobile))

(define (square-tree tree)
  (cond
    ((null? tree) nil)
    ((not(pair? tree)) (square tree))
    (else (cons (square-tree (car tree)) (square-tree (cdr tree))))))

(define (square n) (* n n))

(define (square-tree-map tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree-map sub-tree)
             (square sub-tree)))
       tree))

(define (tree-map proc items)
  (cond
    ((null? items) nil)
    ((not(pair? items)) (proc items))
    (else(cons (tree-map proc (car items))
               (tree-map proc (cdr items))))))

(define (square-tree1 tree)
  (tree-map square tree))

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

(define (reverse list)
  (define (iter start-list end-list)
    (if (null? start-list)
        end-list
        (iter (cdr start-list)
              (cons (car start-list) end-list))))
  (iter list nil))
                
