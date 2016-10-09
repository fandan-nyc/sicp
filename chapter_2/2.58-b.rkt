#lang racket

(require racket/trace)

(define (derive exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if(same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (derive (addend exp) var) (derive (augend exp) var)))
        ((prod? exp)
         (make-sum (make-product (multiplier   exp) 
                                 (derive (multiplicant exp) var))
                   (make-product (multiplicant exp) 
                                 (derive (multiplier   exp) var))
                   )
         )
        (else error("error, not supported yet"))
        ))

        
(define variable? symbol?)
(define (same-variable? a b )
  (and (variable? a)
       (variable? b)
       (eq? a b))
  )


;(define addend car)
;(define augend caddr)
;(define multiplier car)
;(define multiplicant caddr)
(define (=number? a t)
  (and (number? a) (= a t)))

(define (make-sum a b)
  (cond ((=number? a 0) b)
        ((=number? b 0) a)
        ((and (number? a ) (number? b)) (+ a b))
        (else (list  a '+ b))))

(define (make-product a b)
  (cond ( (or (=number? a 0) (=number? b 0)) 0)
        ( (=number? a 1) b)
        ( (=number? b 1) a)
        ((and (number? a ) (number? b)) (* a b))
        (else (list  a '* b))))

;;2.58-b
;; always check + first and split the formular
(define (memq? key exp)
  (cond ((null? exp) #f)
        ((eq? key (car exp)) #t)
        (else (memq? key (cdr exp)))
        )
  )

(define (length x)
  (accumulate (lambda(x y) (+ 1 y)) 0 x))

(define (accumulate op init exp)
  (if (null? exp)
      init
      (op (car exp) (accumulate op init (cdr exp))))
  )
     
(define operator?
  (lambda (x a)
  (and (pair? x)
       (memq? a x))))


(define (sum? x)
  (operator? x '+))

(define (prod? x)
  (operator? x '*))

(define (first-factor exp op)
  (define (helper x result)
    (if (eq? (car x) op)
        (if ( = 1 (length result))
            (car result)
            result)
        (helper (cdr x) (append result (list (car x)))))
    )
  (helper exp null))

(define (addend x)
  (first-factor x '+))

(define (multiplier x)
  (first-factor x '*))

(define (second-factor exp op)
  (if (eq? (car exp) op)
      (if(= (length (cdr exp)) 1)
         (cadr exp)
         (cdr exp))
      (second-factor (cdr exp) op)))

(define (augend x)
  (second-factor x '+))

(define (multiplicant x)
  (second-factor x '*))

(trace derive)
(derive '(x + 3 * (x + y + 2)) 'x)
;(multiplicant '(3 * (x + y + 2)))
