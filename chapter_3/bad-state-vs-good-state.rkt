#lang racket

(define (rand-wrong input)
  (let ((init 0))
  (define (rand-update x)
    (+ x 1))
  (define (dispatch func)
    (cond ((eq? func 'reset)
           (lambda(x) (set! init x)))
          ((eq? func 'random)
           (begin (set! init (rand-update init))
                  init))
          (else (error "wrong input, try rest or random")))
      )
  (dispatch input)))


; you should return a processure
; use the () does the evaluation, which resets the state 
; to keep the state, you should always return a lambda/func, not a evaluation result 

(define rand-correct 
  (let ((init 0))
  (define (rand-update x)
    (+ x 1))
  (define (dispatch func)
    (cond ((eq? func 'reset)
           (lambda(x) (set! init x)))
          ((eq? func 'random)
           (begin (set! init (rand-update init))
                  init))
          (else (error "wrong input, try rest or random")))
      )
  dispatch ))

(define (x input) (rand-wrong input))
(x 'random) ;1
(x 'random) ;1
(x 'random) ;1

(display "the correct one\n")
(define y rand-correct)
( y 'random) ;1
( y 'random) ;2
( y 'random) ;3


