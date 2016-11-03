(require racket/trace)
; newton method 
; f'(x) = 0 <=> f(x) = x which gives you the fixing point 
; f(x0) / (x0 - x1) = f'(x)
; x1 = x0 - f(x0)/f'(x0)
; f'(x0) = (f(x0+dx) - f(x0)) / dx


(define tolerance 0.00001)
(define (close-enough? a b)
  ( < ( abs ( - a b )) tolerance)
  )

(define (fix-point f )
  ( define (helper f guess)
     ( if (close-enough? (f guess) guess)
          guess
          (helper f (f guess))
          )
     )
  (helper f 1.0)
  )

(define dx 0.00001)
(define (derive f)
  ( lambda (x) (/ ( - (f (+ x dx)) (f x) ) dx)
     )
  )

(define (newton-transform f)
  (lambda (x) ( - x
                  ( / (f x) ((derive f) x))
                  )
    )
  )
(define (newton-method f)
  (fix-point (newton-transform f))
   )
(define (sqrt x)
  (newton-method (lambda (y) (- ( * y y ) x))
                 )
  )
(sqrt 10)
(require racket/trace)
; newton method 
; f'(x) = 0 <=> f(x) = x which gives you the fixing point 
; f(x0) / (x0 - x1) = f'(x)
; x1 = x0 - f(x0)/f'(x0)
; f'(x0) = (f(x0+dx) - f(x0)) / dx


(define tolerance 0.00001)
(define (close-enough? a b)
  ( < ( abs ( - a b )) tolerance)
  )

(define (fix-point f )
  ( define (helper f guess)
     ( if (close-enough? (f guess) guess)
          guess
          (helper f (f guess))
          )
     )
  (helper f 1.0)
  )

(define dx 0.00001)
(define (derive f)
  ( lambda (x) (/ ( - (f (+ x dx)) (f x) ) dx)
     )
  )

(define (newton-transform f)
  (lambda (x) ( - x
                  ( / (f x) ((derive f) x))
                  )
    )
  )
(define (newton-method f)
  (fix-point (newton-transform f))
   )
(define (sqrt x)
  (newton-method (lambda (y) (- ( * y y ) x))
                 )
  )
(sqrt 10)
(require racket/trace)
; newton method 
; f'(x) = 0 <=> f(x) = x which gives you the fixing point 
; f(x0) / (x0 - x1) = f'(x)
; x1 = x0 - f(x0)/f'(x0)
; f'(x0) = (f(x0+dx) - f(x0)) / dx


(define tolerance 0.00001)
(define (close-enough? a b)
  ( < ( abs ( - a b )) tolerance)
  )

(define (fix-point f )
  ( define (helper f guess)
     ( if (close-enough? (f guess) guess)
          guess
          (helper f (f guess))
          )
     )
  (helper f 1.0)
  )

(define dx 0.00001)
(define (derive f)
  ( lambda (x) (/ ( - (f (+ x dx)) (f x) ) dx)
     )
  )

(define (newton-transform f)
  (lambda (x) ( - x
                  ( / (f x) ((derive f) x))
                  )
    )
  )
(define (newton-method f)
  (fix-point (newton-transform f))
   )
(define (sqrt x)
  (newton-method (lambda (y) (- ( * y y ) x))
                 )
  )
(sqrt 10)
(require racket/trace)
; newton method 
; f'(x) = 0 <=> f(x) = x which gives you the fixing point 
; f(x0) / (x0 - x1) = f'(x)
; x1 = x0 - f(x0)/f'(x0)
; f'(x0) = (f(x0+dx) - f(x0)) / dx


(define tolerance 0.00001)
(define (close-enough? a b)
  ( < ( abs ( - a b )) tolerance)
  )

(define (fix-point f )
  ( define (helper f guess)
     ( if (close-enough? (f guess) guess)
          guess
          (helper f (f guess))
          )
     )
  (helper f 1.0)
  )

(define dx 0.00001)
(define (derive f)
  ( lambda (x) (/ ( - (f (+ x dx)) (f x) ) dx)
     )
  )

(define (newton-transform f)
  (lambda (x) ( - x
                  ( / (f x) ((derive f) x))
                  )
    )
  )
(define (newton-method f)
  (fix-point (newton-transform f))
   )
(define (sqrt x)
  (newton-method (lambda (y) (- ( * y y ) x))
                 )
  )
(sqrt 10)
(require racket/trace)
; newton method 
; f'(x) = 0 <=> f(x) = x which gives you the fixing point 
; f(x0) / (x0 - x1) = f'(x)
; x1 = x0 - f(x0)/f'(x0)
; f'(x0) = (f(x0+dx) - f(x0)) / dx


(define tolerance 0.00001)
(define (close-enough? a b)
  ( < ( abs ( - a b )) tolerance)
  )

(define (fix-point f )
  ( define (helper f guess)
     ( if (close-enough? (f guess) guess)
          guess
          (helper f (f guess))
          )
     )
  (helper f 1.0)
  )

(define dx 0.00001)
(define (derive f)
  ( lambda (x) (/ ( - (f (+ x dx)) (f x) ) dx)
     )
  )

(define (newton-transform f)
  (lambda (x) ( - x
                  ( / (f x) ((derive f) x))
                  )
    )
  )
(define (newton-method f)
  (fix-point (newton-transform f))
   )
(define (sqrt x)
  (newton-method (lambda (y) (- ( * y y ) x))
                 )
  )
(sqrt 10)
(require racket/trace)
; newton method 
; f'(x) = 0 <=> f(x) = x which gives you the fixing point 
; f(x0) / (x0 - x1) = f'(x)
; x1 = x0 - f(x0)/f'(x0)
; f'(x0) = (f(x0+dx) - f(x0)) / dx


(define tolerance 0.00001)
(define (close-enough? a b)
  ( < ( abs ( - a b )) tolerance)
  )

(define (fix-point f )
  ( define (helper f guess)
     ( if (close-enough? (f guess) guess)
          guess
          (helper f (f guess))
          )
     )
  (helper f 1.0)
  )

(define dx 0.00001)
(define (derive f)
  ( lambda (x) (/ ( - (f (+ x dx)) (f x) ) dx)
     )
  )

(define (newton-transform f)
  (lambda (x) ( - x
                  ( / (f x) ((derive f) x))
                  )
    )
  )
(define (newton-method f)
  (fix-point (newton-transform f))
   )
(define (sqrt x)
  (newton-method (lambda (y) (- ( * y y ) x))
                 )
  )
(sqrt 10)
(require racket/trace)
; newton method 
; f'(x) = 0 <=> f(x) = x which gives you the fixing point 
; f(x0) / (x0 - x1) = f'(x)
; x1 = x0 - f(x0)/f'(x0)
; f'(x0) = (f(x0+dx) - f(x0)) / dx


(define tolerance 0.00001)
(define (close-enough? a b)
  ( < ( abs ( - a b )) tolerance)
  )

(define (fix-point f )
  ( define (helper f guess)
     ( if (close-enough? (f guess) guess)
          guess
          (helper f (f guess))
          )
     )
  (helper f 1.0)
  )

(define dx 0.00001)
(define (derive f)
  ( lambda (x) (/ ( - (f (+ x dx)) (f x) ) dx)
     )
  )

(define (newton-transform f)
  (lambda (x) ( - x
                  ( / (f x) ((derive f) x))
                  )
    )
  )
(define (newton-method f)
  (fix-point (newton-transform f))
   )
(define (sqrt x)
  (newton-method (lambda (y) (- ( * y y ) x))
                 )
  )
(sqrt 10)
(require racket/trace)
; newton method 
; f'(x) = 0 <=> f(x) = x which gives you the fixing point 
; f(x0) / (x0 - x1) = f'(x)
; x1 = x0 - f(x0)/f'(x0)
; f'(x0) = (f(x0+dx) - f(x0)) / dx


(define tolerance 0.00001)
(define (close-enough? a b)
  ( < ( abs ( - a b )) tolerance)
  )

(define (fix-point f )
  ( define (helper f guess)
     ( if (close-enough? (f guess) guess)
          guess
          (helper f (f guess))
          )
     )
  (helper f 1.0)
  )

(define dx 0.00001)
(define (derive f)
  ( lambda (x) (/ ( - (f (+ x dx)) (f x) ) dx)
     )
  )

(define (newton-transform f)
  (lambda (x) ( - x
                  ( / (f x) ((derive f) x))
                  )
    )
  )
(define (newton-method f)
  (fix-point (newton-transform f))
   )
(define (sqrt x)
  (newton-method (lambda (y) (- ( * y y ) x))
                 )
  )
(sqrt 10)
(require racket/trace)
; newton method 
; f'(x) = 0 <=> f(x) = x which gives you the fixing point 
; f(x0) / (x0 - x1) = f'(x)
; x1 = x0 - f(x0)/f'(x0)
; f'(x0) = (f(x0+dx) - f(x0)) / dx


(define tolerance 0.00001)
(define (close-enough? a b)
  ( < ( abs ( - a b )) tolerance)
  )

(define (fix-point f )
  ( define (helper f guess)
     ( if (close-enough? (f guess) guess)
          guess
          (helper f (f guess))
          )
     )
  (helper f 1.0)
  )

(define dx 0.00001)
(define (derive f)
  ( lambda (x) (/ ( - (f (+ x dx)) (f x) ) dx)
     )
  )

(define (newton-transform f)
  (lambda (x) ( - x
                  ( / (f x) ((derive f) x))
                  )
    )
  )
(define (newton-method f)
  (fix-point (newton-transform f))
   )
(define (sqrt x)
  (newton-method (lambda (y) (- ( * y y ) x))
                 )
  )
(sqrt 10)

