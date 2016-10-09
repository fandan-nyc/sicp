#lang racket

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

(define operator?
  (lambda (x a)
  (and (pair? x)
       (eq? (cadr x) a))))

(define (sum? x)
  (operator? x '+))

(define (prod? x)
  (operator? x '*))

(define addend car)
(define augend caddr)
(define multiplier car)
(define multiplicant caddr)
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

;;2.58
(derive '(x + (3 * (x + (y + 2)))) 'x)
