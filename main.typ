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
    chevron.l x, y chevron.r = x_1 y_1 - x_1 y_2 + x_2 y_1 + x_2 y_2
  $
  Show that $chevron.l .,. chevron.r$ is an inner product in $RR^2$
]
#solution[
    We see that $chevron.l .,. chevron.r$ is a bilinear mapping _(The solution is similar to @prob:bilinear)_
]
