
(define (random-point low high)
  (+ low 
     (random (- high low))
     )
   )

(define (square a)
  (* a a))

(define (square-sum a b)
  (+ (square a) (square b)))

(define (square-diff a b c d )
  (+ (square ( - a b))
     (square ( - c d)))
  )
  
; this one is not ideal
; since I did not abstract the monte-carlo simulation (this concept) as a processure.

(define (monte-carlo-dfan x y radis diff how-many)
  (define (experiment a b) 
    ( <= (square-diff a x b y) (square radis)))
  (define (random-x)
    (random-point (- x diff ) (+ x diff)))
  (define (random-y)
    (random-point (- y diff ) (+ y diff)))
  (define (helper success total)
    (cond ((= total 0) (/ success  how-many))
          ((experiment (random-x) (random-y))
           (helper (+ success 1) (- total 1)))
          (else (helper success (- total 1)))))
  (helper 0 how-many))


(define (circle-area x y radis)
  (let ((diff (* 3 radis))
        (p  (monte-carlo-dfan x y radis (* 3 radis) 10000.0)))
    (* p (square (* 2 diff)))))

(define (test)
  (let ((test (circle-area 3 5 7))
        (real (* pi (square 7))))
    (display "test: ")
    (display test)
    (display "\nreal: ")
    (display real)
    ))

(test)
