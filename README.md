# Swiftional


Swiftional introduce some functional primitives that complement the Swift standard library.

Created for writing Swift code with a slight touch of functional programming.


* [Functions](#functions)
* [Extensions](#extensions)
* [Protocols](#protocols)
* [Operators](#operators)
* [Types](#types)


## Functions


<details><summary> curry</summary>

  
Converts an uncurried function to a curried function.


Example: 


```
(A, B) -> R
becomes
(A) -> (B) -> R
```


</details>


<details><summary> uncurry</summary>

  
Converts a curried function into an uncurried function.


Example: 


```
(A) -> (B) -> R
becomes
(A, B) -> R
```


</details>


<details><summary> partial</summary>

  
Partial application. Applies an argument to a function.


Example: 


```
(A, B) -> R
with applied first argument becomes
(B) -> R
```


</details>


<details><summary> identity</summary>

  
Identity combinator function.
Returns the input without changing it.


</details>


<details><summary> constant</summary>

  
The constant combinator function.
Ignores the function arguments and always returns the provided value.


</details>


<details><summary> flip</summary>

  
Flips the arguments of a function.


Example: 


```
(A, B) -> R
becomes
(B, A) -> R
```


</details>


<details><summary> with</summary>

  
Calls the specified closure with the given attribute as its receiver and returns its result.


</details>


<details><summary> ignored</summary>

  
Ignores the function return and always returns `Void`.
</details>


<details><summary> weakify</summary>

  
Weakifying function.


Example:
```
// Instead of this:
someObject.onActionClosure = otherObject.someFunc // `otherObject` captured by strong reference
// Use operator:
someObject.onActionClosure = weakify(otherObject) { $0.someFunc() } // `otherObject` is weakified, not captured by strong reference
```


</details>


## Extensions


<details><summary> Bool</summary>

  
  * `fold`
Case analysis for the `Bool` type. Applies the provided closures based on the value.


  * `foldRun`
Runs the provided closures based on the content of this value.


  * `oldEither`
Case analysis for the `Bool` type. Applies the provided closures based on the value and return `Either`.
</details>
<details><summary> Optional</summary>
  * `fold`
Case analysis for the `Optional` type. Applies the provided closures based on the content of this `Optional` value.
</details>


## Protocols


<details><summary> Applyable</summary>

  
  * `apply`
Calls the specified closure with Self value as its receiver and returns Self value.


  * `applied`
Calls the specified closure with Self value as its receiver and returns a copy of Self value.
</details>


## Operators


<details><summary> >>></summary>

  
Composes functions and returns a function that is the result of applying `g` to the output of `f`.


</details>


<details><summary> <<< </summary>

  
  Composes functions and returns a function that is the result of applying `g` to the output of `f`.


</details>


<details><summary> |></summary>

  
Pipe forward. Applies an argument to a function.


Example. This:
```
let result = h(parameter: g(parameter: f(parameter: a)))
```
Can also be written as:
```
let result = a |> f |> g |> h
```


</details>


<details><summary> <|</summary>

  
Pipe forward. Applies an argument to a function.


Example. This:
```
let result = h(parameter: g(parameter: f(parameter: a)))
```
Can also be written as:
```
let result = h <| g <| f <| a
```


</details>


<details><summary> |>></summary>

  
Applies a function to an argument and returns a callable function.


Example. This:
```
let result = { a in f(parameter: a) }
```
Can also be written as:
```
let result = a |>> f
```


</details>


<details><summary> <<|</summary>

  
Applies a function to an argument and returns a callable function.


Example. This:
```
let result = { a in f(parameter: a) }
```
Can also be written as:
```
let result = f <<| a
```


</details>


<details><summary> ~~></summary>

  
Asynchronous function composition

  
</details>


<details><summary> >=></summary>

  
Effectful function composition

  
</details>


<details><summary> ?></summary>

  
Weakifying function.


Example:
```
// Instead of this:
someObject.onActionClosure = otherObject.someFunc // `otherObject` captured by strong reference
// Use operator:
someObject.onActionClosure = otherObject ?> { $0.someFunc() } // `otherObject` is weakified, not captured by strong reference
```


</details>


<details><summary> ?>></summary>

  
Weakifying function.


Example:
```
// Instead of this:
someObject.onActionClosure = otherObject.someFunc // `otherObject` captured by strong reference
// Use operator:
someObject.onActionClosure = otherObject ?>> { $0.someFunc } // `otherObject` is weakified, not captured by strong reference
```


</details>


## Types


<details><summary> Either</summary>

  
The type `Either` represents a value of one of these types, but not both: `.left(Left)` or `.right(Right)`.

The `Either` type is shifted to the right by convention.
That is, the `.left` constructor is usually used to hold errors or secondary data,
while `.right` is used to store a "correct", primary value - one that can be worked on further.

Wordplay: "Right" also means "Correct".


</details>
