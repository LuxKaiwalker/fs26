#import "./template.typ": eth-solution, theorem, proof, function-table, lemma

#eth-solution(
  course: "Discrete Mathematics",
  department: "Department of Computer Science",
  professor: "Dennis Hofheinz",
  semester: "Autumn Semester 2025",
  assignment-title: "Exercise Sheet 12",
  due-date: "December 11, 2025",
  authors: (
    (name: "Vincent Xigu Liu", id: "25-927-229", ta: "Moeto Suzuki"),
  )
)[
  = Exercise 11.2

  == 1)
  
  *Lemma Ex. 11.2.1:*
  
  Let $||$ denote the concatenation operation. Let $+$ denote the arithmetic sum operation. Then we have 
  $ 
    forall x in cal(C): (exists a, b in union.big_(i in NN*) F^i: a||b = x) -> "hw"(a) + "hw"(b) = "hw"(x)
  $

  #proof[
    
    Let $x  = (x_1, x_2, ..., x_n)$ for all sequences $x$. We define the indicator function: 
    $
    k_i (x) = cases(
        1 "if" x_i!=0,
        0 "otherwise"
    )
    $ 
    Then, we have for the Hamming weight of $x$ the following splitting:
    $
      k_i (x) = cases(k_(i) (a) "if" 1<=i<=abs(a), k_(i-abs(a)) (b) "if" abs(a)+1<=i<=n)
    $
    which gives
    $
      "hw"(x) = sum_(i =1)^n k_i (x) = sum_(i =1)^abs(a) k_(i) (a) + sum_(i =abs(a)+1)^n k_(i-abs(a))(b) = "hw"(a) + "hw"(b)
    $
  ] 

  *Lemma Ex. 11.2.2:*

  Let $u$ be a sequence over $F^n, n in NN^*$. Then,

  $
    "hw"(u) = "hw"(-u)
  $

  #proof[
    Let $u = (u_1, u_2, ..., u_n)$. Then, we have
    $
      -u = (-u_1, -u_2, ..., -u_n)
    $
    and according to the definition of Hamming weight, we have
    $
      "hw"(u) = sum_(i in [n]) cases(
        0 "if" u_i = 0,
        1 "otherwise"
      ) 
    $
    and
    $
      "hw"(-u) = sum_(i in [n]) cases(
        0 "if" -u_i = 0,
        1 "otherwise"
      ) 
    $
    However, according to the properties of a field, we have
    $
      u_i = 0 <=> -u_i = 0
    $
    so in all positions $i in [n]$, the contribution to the Hamming weight from $u_i$ and $-u_i$ are the same.
  ] 

\ \ \ 


  According to Lemma Ex. 11.2.1, as 
  $
  x = (x_1, x_2, ..., x_n) = x_1 || x_2 || ... || x_n
  $
  we have

  $
    "hw"(x) = sum_(i in [n]) "hw"(x_i) and
    "hw"(y) = sum_(i in [n]) "hw"(y_i)\

    => "hw"(x)+"hw"(y) = sum_(i in [n]) "hw"(x_i) + sum_(i in [n]) "hw"(y_i) = sum_(i in [n]) "hw"(x_i) + "hw"(y_i)
  $

  analogously, we have 

  $
  "hw"(x+y) = sum_(i in [n]) "hw"(x_i + y_i)
  $

  We notice that
  $
    x_i = 0 and y_i = 0 => x_i + y_i = 0 => "hw"(x_i + y_i) = 0 and "hw"(x_i) + "hw"(y_i) = 0 + 0 = 0\
    x_i = 0 and y_i != 0 => x_i + y_i != 0 => "hw"(x_i + y_i) = 1 and "hw"(x_i) + "hw"(y_i) = 0 + 1 = 1\
    x_i != 0 and y_i = 0 => x_i + y_i != 0 => "hw"(x_i + y_i) = 1 and "hw"(x_i) + "hw"(y_i) = 1 + 0 = 1\
    x_i != 0 and y_i != 0 => x_i + y_i != 0 => "hw"(x_i + y_i) = 1 and "hw"(x_i) + "hw"(y_i) = 1 + 1 = 2
  $ 

  as in all cases,
  $
    "hw"(x_i + y_i) <= "hw"(x_i) + "hw"(y_i)
  $
  we have 
  $
    "hw"(x+y) = sum_(i in [n]) "hw"(x_i + y_i) <= sum_(i in [n]) "hw"(x_i) + "hw"(y_i) = "hw"(x)+"hw"(y)
  $
  with which our claim is proven.


  == 2)

  1. $d_min (cal(C)) <= min_(c in cal(C) - {0^n}) "hw"(c)$:

  suppose that there is a $c in cal(C)-{0^n}$ with $"hw"(c)< d_min (cal(C))$. Then, the Hemming distance between $0^n$ and $c$ is exactly $"hw"(c)$, so $d(0^n, c)< d_min (cal(C))$ which is a contradiction, so the opposite is proven.

  2. $d_min (cal(C)) >= min_(c in cal(C) - {0^n}) "hw"(c)$:

  suppose that there is $a, b in cal(C)$ with $d(a,b) < min_(c in cal(C) - {0^n})$. Then, let $a_n = a+(-a) = 0$, $b_n = b+(-a)$. The hamming distance remains the same because for all positions $i in [n]$, if $a_i = b_i$ then $a_i + (-a_i) = b_i + (-a_i)$, else $a_i != b_i$ implies $a_i + (-a_i) != b_i + (-a_i)$. So we have $d(a_n, b_n) = d(a,b) < min_(c in cal(C) - {0^n})$. However, $d(a_n, b_n) = "hw"(b_n)$ and $b_n in cal(C) - {0^n}$, which is a contradiction. So the opposite is proven.

  Combining 1. and 2), we have
  $    d_min (cal(C)) = min_(c in cal(C) - {0^n}) "hw"(c)  $

  == 3)
  
  According to 2), we have

  $
    d_min (cal(D)) = min_(d in cal(D) - {0^(2n)}) "hw"(d) \ and d_min (U) = min_(u in cal(U) - {0^n}) "hw"(u) \ and d_min (V) = min_(v in cal(V) - {0^n}) "hw"(v)\
  $
  so it is sufficient to prove that
  $

    => min_(d in cal(D) - {0^(2n)}) "hw"(d) = min (2*min_(u in cal(U) - {0^n}) "hw"(u), min_(v in cal(V) - {0^n}) "hw"(v))

  $

  we prove in both directions:

  *1.* $min_(d in cal(D) - {0^(2n)}) "hw"(d) <= min (2*min_(u in cal(U) - {0^n}) "hw"(u), min_(v in cal(V) - {0^n}) "hw"(v))$:

  *Case 1*: $2*min_(u in cal(U) - {0^n}) "hw"(u)<= min_(v in cal(V) - {0^n}) "hw"(v)$

  In this case, let $v = 0^n$. Then, we have $u||u in cal(D)$ and $"hw"(u||u) = 2*"hw"(u)$. Hence, we have $
  min_(d in cal(D) - {0^(2n)}) "hw"(d) <= "hw"(u||u) = 2*"hw"(u) = 2*min_(u in cal(U) - {0^n}) "hw"(u) \ = min (2*min_(u in cal(U) - {0^n}) "hw"(u), min_(v in cal(V) - {0^n}) "hw"(v))
  $

  *Case 2*: $2*min_(u in cal(U) - {0^n}) "hw"(u)> min_(v in cal(V) - {0^n}) "hw"(v)$

  In this case, let $u = 0^n$. Then, we have $0^n||v in cal(D)$ and $"hw"(0^n||v) = "hw"(v)$. Hence, we have $
  min_(d in cal(D) - {0^(2n)}) "hw"(d) <= "hw"(0^n||v) = "hw"(v) = min_(v in cal(V) - {0^n}) "hw"(v) \ = min (2*min_(u in cal(U) - {0^n}) "hw"(u), min_(v in cal(V) - {0^n}) "hw"(v))
  $

  As the case distinction is complete, the claim is proven.

\ \
  *2.* $min_(d in cal(D) - {0^(2n)}) "hw"(d) >= min (2*min_(u in cal(U) - {0^n}) "hw"(u), min_(v in cal(V) - {0^n}) "hw"(v))$:

  Suppose that there is a $d in cal(D) - {0^(2n)}$ with 
  $
  "hw"(d) < min (2*min_(u in cal(U) - {0^n}) "hw"(u), min_(v in cal(V) - {0^n}) "hw"(v))
  $
  
  Let $d = u||(u+v)$ with $u in cal(U), v in cal(V)$. 

  *Case 1*: $ v = 0^n$

  In this case, $u != 0^n$ because otherwise $d = 0^(2n)$. So we have

  $
    "hw"(d) = "hw"(u||(u+0^n)) = "hw"(u||u) \ = 2*"hw"(u) >= 2*min_(u in cal(U) - {0^n}) "hw"(u) >= min (2*min_(u in cal(U) - {0^n}) "hw"(u), min_(v in cal(V) - {0^n}) "hw"(v))
  $

  which is a contradiction.

  *Case 2*: $v != 0^n $

  In this case, we have 
  $
  "hw"(d) = "hw"(u||(u+v)) = "hw"(u) + "hw"(u+v)\  = "hw"(-u) + "hw"(u+v) >= "hw"(v+u-u)\ = "hw"(v) >= min_(v in cal(V) - {0^n}) "hw"(v) >= min (2*min_(u in cal(U) - {0^n}) "hw"(u), min_(v in cal(V) - {0^n}) "hw"(v))
  $

  which is a contradiction.

  As the case distinction is complete, the claim is proven.


  As both directions are proven, we have
  $    min_(d in cal(D) - {0^(2n)}) "hw"(d) = min (2*min_(u in cal(U) - {0^n}) "hw"(u), min_(v in cal(V) - {0^n}) "hw"(v))
  $

  which is exactly what we wanted to show.

  





]