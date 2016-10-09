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
        ((expo? exp)
         (make-product (exponent exp) (make-product (make-expo (base exp) 
                                                         (make-sum (exponent exp) -1))
                                              (derive (base exp) var))))
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
       (eq? (car x) a))))

(define (sum? x)
  (operator? x '+))

(define (prod? x)
  (operator? x '*))

(define addend cadr)
;(define augend caddr)
(define multiplier cadr)
;(define multiplicant caddr)
(define (=number? a t)
  (and (number? a) (= a t)))

(define (make-sum a b)
  (cond ((=number? a 0) b)
        ((=number? b 0) a)
        ((and (number? a ) (number? b)) (+ a b))
        (else (list '+ a b))))

(define (make-product a b)
  (cond ( (or (=number? a 0) (=number? b 0)) 0)
        ( (=number? a 1) b)
        ( (=number? b 1) a)
        ((and (number? a ) (number? b)) (* a b))
        (else (list '* a b))))

;;;; 2.56
(define (expo? exp)
 (operator? exp '**))

(define exponent caddr)
(define base cadr)
(define (make-expo base expo)
  (cond ((=number? exp 0) 1)
        ((=number? exp 1) base)
        ((and (number? base) (number? expo)) (calc-expo base expo))
        (else (list '** base expo))))

(define (calc-expo a b)
  (cond ((= 0 b) 1)
        ((= 1 b) a)
        ((even? b) (calc-expo (* a a) (/ b 2)))
        (else (* a (calc-expo a (- b 1))))))
         
;;;; 2,57
; this question is the deal with situation (+ a b c d)
(define (accumulate init op seq)
  (if(null? seq)
     init
     (op (car seq) (accumulate init op (cdr seq)))))

(define (augend x)
  (accumulate 0 make-sum (cddr x))
  )

(define (multiplicant x)
  (accumulate 1 make-product (cddr x)))

