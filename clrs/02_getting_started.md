# 02. Getting Started

```
INSERTION-SORT (A)

1   for j = 2 to A.length
2       key = A[j]
3       // Insert A[j] into the sorted sequence A[1 .. j-1]
4       i = j - 1
5       while i > 0 and A[i] > key
6           A[i + 1] = A[i]
7           i = i - 1
8       A[i + 1] = key
```

## Loop invariant

A loop invariant is a formal condition or property that is guaranteed to be true before and after each iteration of a loop. It acts as a mathematical "truth" that remains unchanged (invariant) while the state of your variables changes inside the loop

* Initialization: It is true prior to the first iteration of the loop
* Maintenance: If it is true before an iteration of the loop, it remains true before the next iteration
* Termination: When the loop terminates, the invariant gives us a useful property that helps show that algorithm is correct

## Analysis of algorithms

* Input size: depends on the problem being studied. For many problems is the number of items in the input, for many others is teh total number of bits needed to represent the input in ordinay binary notation, sometimes it is more appropiate to describe the size of the input with two number rather than one (e.g. with graphs)
* Running time: is the number of primitive operations or "steps" executed
    * The wors-case running time of an algorithm gives us an upper bound on the running time for any input
    * For some algorithms, the worst case occurs fairly often
    * The "average case" is often roughly as bad as the worst case

## Order of growth

* A mathematical simplification that describes how the running time increases as the input size scales toward infinity. It drops lower-order terms and constant multipliers to focus strictly on the dominant factor driving the execution cost.
* An algorithm whose running time has a higher order of growth might take less time for small inputs than an algorithm whose running time has a lower order of growth

## Designing algorithms

### The divide-and-conquer approach

* Many useful algorithms are recursive in structure: to solve a given problem, they call themselves recursively one or more times to deal with closely related subproblems.

    * Divide the problem into a number of subproblems that are smaller instances of the same problem.
    * Conquer the subproblems by solving them recursively. If the subproblem sizes are small enough, however, just solve the subproblems in a straightforward manner.
    * Combine the solutiosn to the subproblems into the solution for the original problem

### Analyzing divide-and-conquer algorithms

* When an algorithm contains a recursive call to itself, we can often describe its running time by a recurrence equation or recurrence, which describes the overall running time on a problem of size n in terms of the running time on smaller inputs

* A recurrence for the running time of a divide-and-conquer algorithm falls out from the three steps of the basic paradigm.
* Let T(n) be the running time on a problem of size n
* If the problem size is small enough, say $n \leq c$ for some constant $c$, the straightforward solution takes constant time, which is write as $\Theta(n)$
* Supposed that the division of the problem yields $a$ subproblems, each of which is $\frac{1}{b}$ the size of the original
* It takes time $T(n/b)$ to solve one subproblem of size $n/b$, and so it takes time $aT(n/b)$ to solve $a$ of them
* If take $D(n)$ time to divide the problem into subproblems and $C(n)$ time to combine the solutions to the subproblems into the solution to the original problem, we get the reconcurrence

$$
T(n) = 
\begin{cases}
\Theta(1) & \text{if } n \leq c, \\
aT(n/b) + D(n) + C(n) & \text{otherwise}
\end{cases}
$$

* Divide: The divide step just computes the middle of the subarray, which takes constant time. Thus $D(n)=\Theta(1)$
* Conquer: Two subproblems are solved, each of size $n/2$, which contributes $2T(n/2)$ to the running time
* Combine: The Merge procedure on an n-element subarray takes time $\Theta(n)$ and so $C(n) = \Theta(n)$

$$
T(n) = 
\begin{cases}
\Theta(1) & \text{if } n \leq c, \\
2T(n/2) + \Theta(n) & \text{otherwise}
\end{cases}
$$


