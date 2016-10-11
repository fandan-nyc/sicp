
(require racket/trace)
(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (is-leaf x)
  (eq? (car x) 'leaf))

(define leaf-symbol cadr)
(define leaf-weight caddr)

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right)))
  )

(define left-branch car)
(define right-branch cadr)

(define (symbols x)
  (if (is-leaf x)
      (list (leaf-symbol x))
      (caddr x)))

(define (weight x)
  (if (is-leaf x)
      (leaf-weight x)
      (cadddr x)))
        

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))
(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(define (decode bits tree)
  (define (helper curr-bits curr-tree)
    ;(trace helper)
    (if (null? curr-bits)
        '()
    (let ((next-b (next-branch (car curr-bits) curr-tree)))
      (cond ((null? curr-bits) '())
            ((is-leaf next-b) (cons (leaf-symbol next-b) (helper (cdr curr-bits) tree)))
            (else (helper (cdr curr-bits) next-b))))))
  (define (next-branch bit tree1)
    (if (= 1 bit) (right-branch tree1)
        (left-branch tree1)))
  (helper bits tree))

(decode sample-message sample-tree)
