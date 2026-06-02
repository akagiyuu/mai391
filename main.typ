#import "@preview/orange-book:0.7.1": book
#import "@preview/theorion:0.6.0": *
// #import cosmos.simple: *
#import cosmos.fancy: *
// #import cosmos.rainbow: *
// #import cosmos.clouds: *
#show: show-theorion

#show: book.with(
  title: "Mathematics for Machine Learning",
  subtitle: "MAI391",
  author: "Huynh Minh Khang",
  main-color: rgb("#F36619"),
  lang: "en",
  supplement-chapter: "Chapter",
  supplement-part: "Part",
  part-style: 0,
  lowercase-references: false,
)
#set text(size: 12pt)
#set math.vec(delim: "[")
#set math.mat(delim: "[")

= Analytic Geometry

== Norm

#definition[
  A norm on V is a non-negative function
  $
    ||.||: V -> RR
  $
  such that $forall k in RR$ and $x,y in V$:
  - _Absolute homogeneous_: $||k x|| = abs(k) ||x||$
  - *Triangle inequality*: $||x + y|| <= ||x|| + ||y||$
  - *Positive definite*: $||x|| >= 0$ and $||x|| = 0$ if and only if $x = arrow(0)$
]

#definition[
  Let p be as positive number. The $l_p$-norm $||.||_p$ in $RR^n$:
  $
    ||x||_p = root(p, sum_(i = 1)^n |x_i|^p) "  for any" x = vec(x_1, ..., x_n) in RR^n
  $
]
#example[
  - $p = 1 ->$ Manhattan norm $l_1$:
  $
    ||x||_1 = sum_(i = 1)^n |x_i|
  $
  - $p = 2 ->$ Euclidean norm $l_1$:
  $
    ||x||_2 = sqrt(sum_(i = 1)^n |x_i|^2)
  $
  - $p = infinity ->$ maximum norm $l_infinity$:
  $
    ||x||_infinity = max{|x_1|,...,|x_n|}
  $
]

#definition[
  Euclidean norm on $RR^(m #sym.crossmark n)$:
  $
    ||A|| = (sum_(i = 1)^m sum_(j = 1)^n a_(i j)^2)^(1/2)
  $
]

#definition[
  Spectral norm on $RR^(m #sym.crossmark n)$:
  $
    ||A||_2 = max_(x in RR^n, ||x||_2 = 1) ||A x||_2
  $
]

== Inner Product
#definition[
  A linear mapping $L$ on $V$ is a function $L : V -> RR$ that satisfies:
  - $L(k x) = k L(x)$
  - $L(x + y) = L(x) + L(y)$
  $forall x in V$ and $k in RR$
]

#definition[
  A bilinear mapping or bilinear form $B$ on $V$ is a function $B : V crossmark V -> RR$ that is *linear in each argument separately*:
  - $B(k x, z) = k B(x, z)$
  - $B(x + y, z) = B(x, z) + B(y, z)$
  - $B(x, k z) = k B(x, z)$
  - $B(x, y + z) = B(x, y) + B(x, z)$
  $forall x,y,z in V$ and $k in RR$
]

#problem[
  Show that the mapping $B: R^2 crossmark R^2 -> R$
  $
    B(x, y) = x_1 y_1 - 2 x_1 y_2 + 3 x_2 y_2
  $
  is a bilinear mapping on $R^2$.
] <prob:bilinear>

#solution(qed: auto)[
  $
      B(k x, z) & = k x_1 z_1 - 2 k x_1 z_2 + 3 k x_2 z_2 = k (x_1 z_1 - 2 x_1 z_2 + 3 x_2 z_2) = k B(x, z) \
    B(x + y, z) & = (x_1 + y_1) z_1 - 2 (x_1 + y_1) z_2 + 3(x_2 + y_2) z_2 \
                & = (x_1 z_1 - 2 x_1 z_2 + 3 x_2 z_2) + (y_1 z_1 - 2 y_1 z_2 + 3 y_2 z_2) \
                & =B(x, z) + B(y, z) \
      B(x, k z) & = k x_1 z_1 - 2 k x_1 z_2 + 3 k x_2 z_2 = k (x_1 z_1 - 2 x_1 z_2 + 3 x_2 z_2) = k B(x, z) \
    B(x, y + z) & = x_1 (y_1 + z_1) - 2 x_1 (y_2 + z_2) + 3x_2 (y_2 + z_2) \
                & = (x_1 y_1 - 2 x_1 y_2 + 3 x_2 y_2) + (x_1 z_1 - 2 x_1 z_2 + 3 x_2 z_2) \
                & =B(x, y) + B(x, z) \
  $
  $=> B$ is linear mapping
]

#definition[
  A bilinear mapping $B : V crossmark V -> R$ is called
  - *symmetric* if $B(x, y) = B(y, x)$
  - *positive definite* if $B(x, x) > 0$ for any $V in.rev x != arrow(0)$
]

#definition[
  A positive definite, symmetric bilinear mapping $B: V crossmark V -> R$ is called an *inner product*.
  We typically write $chevron.l x, y chevron.r$ instead of $B(x, y)$ for inner product
]

#definition[
  The pair $(V, chevron.l ., . chevron.r)$ is called *inner product space*
]

#definition[
  The *dot product* or *scalar product* on $RR^n$ is given by
  $
    x^T y = sum_(i = 1)^n x_i y_i
  $
]

#property[
  Dot product is inner product, and $(RR^n, chevron.l ., . chevron.r)$ is *Euclidean vector space*
]

#problem[
  Consider $V = RR^2$. Define
  $
    chevron.l x, y chevron.r = 2 x_1 y_1 + x_1 y_2 + x_2 y_1 + 2 x_2 y_2
  $
  Show that $chevron.l .,. chevron.r$ is an inner product in $RR^2$
]  <prob:positive-definite>
#solution(qed: auto)[
  - $chevron.l .,. chevron.r$ is a bilinear mapping _(The solution is similar to @prob:bilinear)_ \ \

  - $chevron.l .,. chevron.r$ is symmetric
  $
    chevron.l x, y chevron.r & = 2 x_1 y_1 + x_1 y_2 + x_2 y_1 + 2 x_2 y_2 \
                             & = 2 y_1 x_1 + y_1 x_2 + y_2 x_1 + 2 x_2 y_2 = B(y, x)
  $

  - $chevron.l .,. chevron.r$ is positive definite
  $
    chevron.l x, x chevron.r & = 2 x_1^2 + 2 x_2^2 + 2 x_1 x_2 \
                             & = (x_1 + x_2)^2 + x_1^2 + x_2^2 >= 0
  $
  The equality occur only when $x_1 = 0$, $x_2 = 0$, $x_1 + x_2 = 0$ which is $x = arrow(0)$\
  $=> chevron.l .,. chevron.r > 0$ for any $RR^2 in.rev x != arrow(0)$, or $chevron.l .,. chevron.r$ is positive definite \ \

  So $chevron.l .,. chevron.r$ satisfies all properties to be an inner product
]

#definition[
  A symmetric matrix $A in RR^(n crossmark n)$ is
  - *positive definite* if
  $
    x^T A x > 0, " for all non-zero vectors" x in RR^n
  $
  - *positive semidefinite* if
  $
    x^T A x >= 0, " for all non-zero vectors" x in RR^n
  $
]

#problem[
  Consider the matrices
  $
    A = mat(2, 1; 1, 3), B = mat(1, 2; 2, 3)
  $
  Show that $A$ is positive definite but $B$ is not
] <prob:positive-definite-matrix>
#solution(qed: auto)[
  $
    x^T A x & = mat(x_1, x_2) mat(2, 1; 1, 3) vec(x_1, x_2) \
            & = 2 x_1^2 + 2 x_1 x_2 + 3 x_2^2 \
            & > 0 " for all non-zero vectors" x in RR^n
  $ \

  _(the proof for why > 0 is similar to @prob:positive-definite)_

  Also $A$ is symmetric so $A$ is positive definite

  $
    x^T B x & = mat(x_1, x_2) mat(1, 2; 2, 3) vec(x_1, x_2) \
            & = x_1^2 + 4 x_1 x_2 + 3 x_2^2
  $ \

  Take $x = vec(-2, 1) => x^T B x = -1$

  So $B$ is not positive definite and not positive semidefinite
]
#note[
  When multiply matrices of form $x^T A x$ _(like in @prob:positive-definite-matrix)_, the coefficient of
  $
    x_i x_j = cases(
      a_(i j) ", if" i = j,
      a_(i j) + a_(j i) ", if" i != j
    )
  $
]

== Lengths and Distances

#definition[The *norm* is $||x|| := sqrt(chevron.l x"," x chevron.r)$]
#definition[The *distance between $x$ and $y$* is $d(x, y) := ||x - y|| = sqrt(chevron.l x - y"," x - y chevron.r)$]
#theorem[
  *Cauchy-Schwarz* inequality
  $
    |chevron.l x, y chevron.r| <= ||x|| ||y||
  $
]

#problem[
  Let the inner product $chevron.l .,. chevron.r$ be defined on $RR^n$ by
  $
    chevron.l x, y chevron.r = x_1 y_1 - x_1 y_2 - x_2 y_1 + 3 x_2 y_2
  $
  Find the distance between $u = vec(1, 1)$ and $v = vec(-1, 2)$
]
#solution(qed: auto)[
  $
    u - v = vec(2, -1)
  $
  $
    d(u, v) & = ||u - v|| = sqrt(chevron.l u - v", " u - v chevron.r) \
            & = sqrt(2 dot 2 - 2 dot (-1) - (-1) dot 2 + 3 dot (-1) dot (-1)) \
            & = sqrt(11)
  $
]

== Angles and Orthogonality

#definition[
  The *angle* between vector $x$ and $y$ is the number $theta in [0, pi]$ defined by
  $
    cos theta = (chevron.l x, y chevron.r)/(||x|| ||y||)
  $
]
#problem[
  Define the inner product $chevron.l .,. chevron.r$
  $
    chevron.l x, y chevron.r = x dot y = x_1 y_1 + x_2 y_2 italic("(dot product)")
  $
  Find the angle between $x = vec(1, 0)$ and $y = vec(-1/2, sqrt(3)/2)$
]
#solution(qed: auto)[
  $
    chevron.l x, y chevron.r = 1 dot (-1/2) + 0 dot sqrt(3)/2 = -1/2
  $
  $
    ||x|| = sqrt(1 dot 1 + 0 dot 0) = 1 \
    ||y|| = sqrt(-1/2 dot -1/2 + sqrt(3)/2 dot sqrt(3)/2) = 1
  $
  $
    cos theta = (chevron.l x, y chevron.r)/(||x|| ||y||) = (-1/2)/(1 dot 1) = -1/2
  $
  $
    => theta = cos^(-1)(-1/2) = (2 pi) / 3
  $
]

#definition[
  Two vectors $x$ and $y$ are *orthogonal* (or *$x perp y$*) $<=> chevron.l x, y chevron.r = 0$
]
#definition[
  If *$x perp y$* and $||x|| = ||y|| = 1$ _($x$ and $y$ are unit vectors)_ then $x$ and $y$ are *orthonormal*
]

#definition[
  A square matrix $A in RR^(n crossmark n)$ is an *orthogonal matrix* if and only if
  $
    A A^T = A^T A = I_n
  $
]
#property[
  If $A in RR^(n crossmark n)$ is orthogonal then
  - $A^(-1) = A^T$
  - $A$ preserve the length of any vector $x in RR^n$
  $
    ||A x|| = ||x||
  $
  - $A$ preserve the angle between two vectors $x$ and $y$ in $RR^n$
  $
    "angle"(A x, A y) = "angle"(x, y)
  $
]
#note[
  For square matrix $A in RR^(n crossmark n) $, $A^(-1)$ is defined as matrix with
  $
    A A^(-1) = A^(-1) A = I_n
  $
  So if $A$ is orthogonal, $A^T = A^(-1)$
]

== Orthonormal Basis

#definition[
  Given a vector space $V$, a set of vectors ${v_1, ..., v_n}$ is *linear independent* if the *only solution* to equation
  $
    a_1 v_1 + ... + a_n v_n = 0
  $
  is $a_1 = ... = a_n = 0$
]

#definition[
  Given a vector space $V$, a set of vectors $B = {v_1, ..., v_n}$ is basis if:
  - *Every subset* of $B$ is *linear independent*
  - For every $x in V$ there exist ${a_1, ..., a_n}$ such that
  $
    a_1 v_1 + ... + a_n v_n = x
  $
]
