#import "template.typ": project

#show: project.with(
  title: "ME5413 Final Project Report",
  authors: (
    (name: "Cao Chenyu", 
    email: "E1192847@u.nus.edu", 
    ID: "A0285295N"),
  ),
  logo: "./assets/logo-nus.png",
  abstract: lorem(59)
)

= Introduction

This project compares the performance of two Linear Programming (LP) solvers - the Simplex method (a non-interior point algorithm) and the Barrier method (an interior point algorithm). The solvers are evaluated based on computational effort, sensitivity to tolerances, and other factors across a set of standard LP test problems.

= Methodology

== Algorithms

The two LP algorithms compared are:

- _Simplex Method:_ The simplex algorithm is the most widely used non-interior point method. It traverses the vertices of the feasible region defined by the constraints until an optimal vertex is found.
- _Barrier Method:_ The barrier method is an interior point algorithm that reaches an optimal solution by traversing the interior of the feasible region. A barrier function is used to encode the constraints into the objective.
== Test Problems
A set of standard LP test problems from the Netlib library were used for the comparison. These included:

- AFIRO (n=28, m=52)
- SC50A (n=49, m=81)
- ADLITTLE (n=138, m=64)
- SHARE1B (n=253, m=183)

Here n is the number of decision variables and m is the number of constraints.

== Evaluation Metrics
The solvers were compared on the following:

- Number of iterations to converge
- Computational time (CPU seconds)
- Sensitivity to tolerances
- Accuracy of solution

The same tolerances were used for both solvers:

- Optimality tolerance = 1e-6
- Feasibility tolerance = 1e-6

= Conclusion
This study compared the simplex and barrier algorithms on a set of standard LP test problems. The barrier method required fewer iterations but more time per iteration compared to simplex. Overall performance was problem dependent, with the barrier method scaling better on larger problems. The choice of algorithm depends on the problem structure and size.