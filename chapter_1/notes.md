# building abstraction with procedures

John Locke - 
3 ways of thinking:
1. combine several simple ideas -> complex idea
2. set two ideas side by side and compare -> relation between ideas
3. separate the ideas from all other ideas that accompany them in their real existence

* learn to blur the traditional distinction between passive data and active process.
* The abilibty to represent __procedures as data__ also makes Lisp an excelent language for writing programs that must __manipulate other programs as data__.

## 1.1 elements of the programming 
every poweful programming language has three powerful mechanisms:
* primitive expression: simplest entities the language is concerned with
* means of combination: by which compound elements are built from simple ones
* means of abstraction: by which compound elements can be named and manipulated as units

In programming, we deal with 2 kinds of elements:
* procedure: the description of the rules for manipulating the data
* data: the stuff we want to manipulate
(not much difference between the two)
so any powerful language should be able to describe the primitive data, primitive procedures, the ways to combine and abstract data & procedure

### lisp primitive element, combination
(+ 123 456)
+ is operator, rest are operands

the convention of placing the operator to the left is called **prefix notation**
advantages
1. you can put arbitrary number of arguments, as (+ 1 2 3 4)
2. extends in a straight forward way to allow combinations to be **nested**, such as
   (+ (+ 1 2) (* 4 5))

### lisp abstraction
the simplest abstraction is using define 
(define size 2)
```
#lang scheme

(define + -)
(+ 1 2)
```
It should be clear that the possibility of associating values with symbols and later retrieving them means that the interpreter must maintain some sort of mem that keeps track of the name-object pairs. The mem is called global env. (later we will have more other envs)
