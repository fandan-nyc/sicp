#lang racket

(define (rand-update x)
  (+ x 1))

(define (rand)
  (let ((init 0))
    (define (reset seed)
      (set! init seed))
    (define (generate)
      (begin (set! init (rand-update init))
             init)
      )
  (define (dispatch name)
    (cond ((eq? name 'reset) reset)
          ((eq? name 'generate) generate)))
  dispatch )
  )


(define rand-new
  (let ((init 0))
    (define (reset seed)
      (set! init seed))
    (define (generate)
      (begin (set! init (rand-update init))
             init)
      )
  (define (dispatch name)
    (cond ((eq? name 'reset) reset)
          ((eq? name 'generate) generate)))
  dispatch )
  )



;(define z-independent (rand-new))
; the above would not work because brand-new is dispatch 
; (rand-new) is (dispatch) which requires one input
 
 
;; z and zz share the state, since they both point to the original procedure
(define z rand-new)
(define zz rand-new)
((z 'generate))  ; 1
((zz 'generate)) ; 2
((z 'generate))  ; 3 


(display "\n\n\nrand with state\n")

;; each (rand) generates a new procedure
(define x (rand))
(define y (rand))

((x 'generate)) ;1
((y 'generate)) ;1
((y 'generate)) ;2
((x 'reset) 10) ;
((y 'generate)) ; 3
((x 'generate)) ;11

;; rand-new represent the procedure  ( define
;; (rand) repre the procedure 
;; so (define x rand) ; ( ((x) 'generate)) will always give you one; since each time (x) will generate new procedure 
;; ( define x (rand)) ( (x 'generate)) will accumulate 
;; (define x rand-new); (define y rand-new) ;((x 'generate))  => 1  ( (y 'generate)) => 2; x and y point to the same thing




  
