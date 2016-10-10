(define (union-set tree1 tree2) 
   (list->tree (union-set-list (tree->list tree1) 
                          (tree->list tree2)))) 
  
 (define (intersection-set tree1 tree2) 
   (list->tree (intersection-set-list (tree->list tree1) 
                                 (tree->list tree2))))
