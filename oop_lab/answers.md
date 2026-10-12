**Course:** CS442 Mobile Application Development  
**Lab:** Campus Library System  
**Registration Number Suffix:** 04072312022
**Name:** Nabiha Noor

## Q1. What is the difference between extends and implements in Dart?

The `extends` keyword is used for inheritance. A child class inherits the properties and methods of its parent class. The `implements` keyword is used to follow an interface contract, requiring the class to provide implementations of its members.

In this lab, `Book` extends `LibraryItem` and implements `Borrowable`.
mit -
## Q2. Why are mixins useful?

Mixins allow different classes to reuse the same functionality without duplicating code.

In this lab, the `Renewable` mixin is used by `Book` and `Dvd` to provide renewal functionality. `Magazine` does not use this mixin.

## Q3. What is the purpose of operator overloading?

Operator overloading allows custom objects to use operators such as `+`, `>`, and `==`.

In this lab, the `Fine` class overloads these operators to add fines, compare their amounts, and check equality. The `hashCode` override ensures that equal fine objects behave correctly in a Set.

## Q4. What is the difference between static and const?

A `static` member belongs to the class rather than an individual object. It can be accessed using the class name.

In this lab, `LibraryItem.created` counts the number of created library items.

The `const` keyword allows compile-time constant objects. Identical constant constructor expressions with the same values refer to the same canonical object.

In this lab, `identical(const Fine(10), const Fine(10))` returns `true`, while two separately created non-const Fine objects are not identical.