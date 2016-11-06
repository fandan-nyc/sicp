
(define (make-acc password balance) 
  (define (withdraw amount)
    (if (<= balance amount)
        "not enough"
        (begin (set! balance ( - balance amount))
               balance)))
  (define (deposite amount)
    (begin (set! balance (+ balance amount))
           balance))
  (define (dispatch pass func)
    (cond ((not (eq? pass password))
           (lambda(x . y) "wrong password"))
          ((eq? func 'withdraw) withdraw)
          ((eq? func 'deposite) deposite)
          (else (lambda(x . y) "method does not exist"))))
  dispatch)

(define peter (make-acc 'aa 1000))

(define (make-joint acc acc-pass new-pass)
  (lambda(pass func) 
    (if (eq? new-pass pass)
        (acc acc-pass func)
        (lambda(x . y) "wrong password"))))

(define bob ( make-joint peter 'aa 'tt))
((bob 'tt 'withdraw) 100) ; 900
((bob 'tt 'withdraw) 19)  ; 881
((peter 'aa 'withdraw) 0) ; 881
        
        
