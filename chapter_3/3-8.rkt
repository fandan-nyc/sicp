
(define f 
  (let ((t 0)
        (tmp 0))
    (lambda (x)
    (begin (set! tmp t)
           (set! t x)
           tmp))))
