
(define (monitor fun)
  (let ((count 0))
    (lambda (first . rest)
      (cond ((eq? first 'how-many) count)
            ((eq? first 'reset) (set! count 0) count)
            (else (begin (set! count (+ count 1))
                         (apply fun (cons first rest))))
            )
    )))

(define m+ (monitor (lambda(t y) (* t y))))
(m+ 1 2 )
(m+ 'how-many)
(m+ 'how-many)
(m+ 3 3)
(m+ 'how-many)
(m+ 5 5)
(m+ 'reset)

(m+ 9 1)

              
