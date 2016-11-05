
(define (monte-carlo trials experiment)
  (define (iter success total)
    (cond ((= total trials)
           (/ success trials ))
          ((experiment)
           (iter (+ success 1) (+ total 1)))
          (else 
           (iter success ( + total 1)))))
  (iter 0.0 0))

;; to calculate the

(define (square a)
  (* a a )
  )

(define (square-sum a . b)
  (define (helper  b result)
    (if (null? b)
        result
        (helper (cdr b) (+ result (square (car b)))))
    )
  (helper b (square a)))


(define (random-range x diff)
  (+ (- x diff) 
     (random (* 2 diff))
     )
  )

(define (circle-area x y radius)
  (define diff (* 3 radius))
  (define (random-x)
    (random-range x diff))
  (define (random-y)
    (random-range y diff))
  (define (experiment)
    (<= (square-sum (- (random-x) x)
                    (- (random-y) y))
        (square radius)))
  (* (monte-carlo 100000 experiment) 
     (square (* 2 diff))))

(circle-area 4 5 9)
(* pi (square 9))
