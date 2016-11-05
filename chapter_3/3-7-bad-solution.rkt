;; this problem is that,
;; a has password a
;; b has password b
;; the password is mixed
;; which is very wrong
(define (make-account password balance)
  (let ((passwords (cons password null)))
  (define (withdraw x)
    (if (>= balance x)
        (begin (set! balance (- balance x))
               balance)
        "insufficient fund"))
  (define (deposite x)
    (set! balance (+ balance x))
    balance)
  (define (check-password pass)
    (define (iter pass-set)
      (cond ((null? pass-set) #f)
            ((eq? pass (car pass-set)) #t)
            (else (iter (cdr pass-set))))
      )
    (iter passwords)
    )
  (define (add-password pass)
    (set! passwords (cons pass passwords)))
  (define (check-balance) balance)
  (define (dispatch pass func)
    (cond  (( not (check-password pass))
            (lambda(x) "wrong password, try again"))
            ((eq? func 'withdraw) withdraw)
            ((eq? func 'deposite) deposite)
            ((eq? func 'add-acc) add-password)
            ((eq? func 'check-balance) check-balance)
            (else (lambda(x) "the method does not exist"))
            )
    )
  dispatch))

(define (make-joint acc accPass newUserPass)
  (begin ((acc accPass 'add-acc) newUserPass)
         acc
         ))
  
(define peter (make-account 'aa 100))
  
(define bob (make-joint peter 'aa 'bb))

((peter 'aa 'check-balance))

( (bob 'bb 'withdraw) 99)

( (peter 'aa 'check-balance))
