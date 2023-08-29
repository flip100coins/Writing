#lang sicp
(define (double-strategy amount bet-amount)
  (betroll-strategy1-do amount bet-amount bet-amount amount 0 double-term 0))


(define (betroll-strategy1-do amount bet-amount start-betting-amount max-amount times term short-times)
  (let ((roll-result (random 101)))
    (cond ((= amount 0) (display "Game oever, max amount:") (display max-amount) (newline) (display "Gambled ") (display times) (display " times"))
          ((> bet-amount amount) (betroll-strategy1-do
                                  amount
                                  amount
                                  start-betting-amount
                                  max-amount
                                  times
                                  term
                                  short-times))
          ((> bet-amount 400) (betroll-strategy1-do
                               amount
                               400
                               start-betting-amount
                               max-amount
                               times
                               term
                               short-times))
          ((< roll-result 67)
           (betroll-strategy1-do (- amount bet-amount)
                              (term bet-amount short-times)
                              start-betting-amount
                              max-amount
                              (+ times 1)
                              term
                              (+ 1 short-times)))
          ((and(> roll-result 66) (< roll-result 91))
           (max-helper amount
                       bet-amount
                       start-betting-amount
                       max-amount
                       1
                       (+ times 1)
                       term
                       0))
          ((and(> roll-result 90) (< roll-result 100))
           (max-helper amount
                       bet-amount
                       start-betting-amount
                       max-amount
                       3
                       (+ times 1)
                       term
                       0))
          ((= roll-result 100)
           (max-helper amount
                       bet-amount
                       start-betting-amount
                       max-amount
                       9
                       (+ times 1)
                       term
                       0)))))



(define (max-helper amount bet-amount start-betting-amount max-amount n times term short-times)
  (let ((next-amount (+ amount (* n bet-amount))))
    (if (> next-amount max-amount)
        (betroll-strategy1-do next-amount
                              start-betting-amount
                              start-betting-amount
                              next-amount
                              times
                              term
                              short-times)
        (betroll-strategy1-do next-amount
                              start-betting-amount
                              start-betting-amount
                              max-amount
                              times
                              term
                              short-times))))

(define (chipos-strategy amount bet-amount)
  (betroll-strategy1-do amount bet-amount bet-amount amount 0 chipos-term 0))


(define (chipos-term n times)
  (if (odd? times)
      n
      (* 3 n)))

(define (double-term n a)
  (* 2 n))

(define (chipos-term2 n times)
  (cond ((= n 48) 64)
        ((= n 64) 192)
        ((= n 192) 400)
        ((even? times) (* (/ 4 3) n))
        (else(* 3 n))))

(define (chipos-strategy2 amount bet-amount)
  (betroll-strategy1-do amount bet-amount bet-amount amount 0 chipos-term2 0))

(define (max-start-ratio times amount bet-amount term)
  (if (= times 0)
      0
      (+ (/ (betroll-strategy-do amount bet-amount bet-amount amount 0 term 0) amount)
         (max-start-ratio (- times 1) amount bet-amount term))))

(define (max-start-average-ratio times amount bet-amount term)
  (/ (max-start-ratio times amount bet-amount term) times))






(define (betroll-strategy-do amount bet-amount start-betting-amount max-amount times term short-times)
  (let ((roll-result (random 101)))
    (cond ((= amount 0) max-amount)
           ((> bet-amount amount) (betroll-strategy-do
                                   amount
                                   amount
                                  start-betting-amount
                                  max-amount
                                  times
                                  term
                                  short-times))
          ((> bet-amount 400) (betroll-strategy-do
                               amount
                               400
                               start-betting-amount
                               max-amount
                               times
                               term
                               short-times))
          ((< roll-result 67)
           (betroll-strategy-do (- amount bet-amount)
                              (term bet-amount short-times)
                              start-betting-amount
                              max-amount
                              (+ times 1)
                              term
                              (+ 1 short-times)))
          ((and(> roll-result 66) (< roll-result 91))
           (max-helper1 amount
                       bet-amount
                       start-betting-amount
                       max-amount
                       1
                       (+ times 1)
                       term
                       0))
          ((and(> roll-result 90) (< roll-result 100))
           (max-helper1 amount
                       bet-amount
                       start-betting-amount
                       max-amount
                       3
                       (+ times 1)
                       term
                       0))
          ((= roll-result 100)
           (max-helper1 amount
                       bet-amount
                       start-betting-amount
                       max-amount
                       9
                       (+ times 1)
                       term
                       0)))))


(define (max-helper1 amount bet-amount start-betting-amount max-amount n times term short-times)
  (let ((next-amount (+ amount (* n bet-amount))))
    (if (> next-amount max-amount)
        (betroll-strategy-do next-amount
                              start-betting-amount
                              start-betting-amount
                              next-amount
                              times
                              term
                              short-times)
        (betroll-strategy-do next-amount
                              start-betting-amount
                              start-betting-amount
                              max-amount
                              times
                              term
                              short-times))))
