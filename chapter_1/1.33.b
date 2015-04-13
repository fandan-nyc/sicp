#lang racket

; 1.33.b 
(define (accumulate-filter-recur filter combine null-value term a next b)
  (if (> a b)
      null-value
      ( combine (if (filter (term a) b) (term a) null-value) (accumulate-filter-recur filter combine null-value term (next a ) next b)
                )
                )
      )

(define (accumulate-filter-iter filter combine null-value term a next b)
  (define (helper a result)
    (if(> a b )
     result
     (helper (next a) (combine result (if (filter (term a) b) (term a) null-value)))
     )
    )
  (helper a null-value)
  )
; calc the product of all the positive numbers who are relatively prime to n
(define (gcd-recur a b)
  (cond (( = b 0 ) a)
        ( else ( gcd-recur b (modulo a b )))))
(define (filter-gcd a b)
  (= 1 ( gcd-recur a b)
      )
  )
(define (term a )
  a
  )
(define (next a)
  (+ a 1)
  )
(define (product-all-relative-prime x)
  (accumulate-filter-recur filter-gcd * 1 term 2 next x) 
  )
(define (product-all-relative-prime-iter x)
  (accumulate-filter-iter filter-gcd * 1 term 2 next x)
  )
(product-all-relative-prime 10)
(product-all-relative-prime-iter 10)
