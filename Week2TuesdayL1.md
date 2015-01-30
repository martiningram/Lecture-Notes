<style TYPE="text/css">
code.has-jax {font: inherit; font-size: 100%; background: inherit; border: inherit;}
</style>
<script type="text/x-mathjax-config">
MathJax.Hub.Config({
    tex2jax: {
        inlineMath: [['$','$'], ['\\(','\\)']],
        skipTags: ['script', 'noscript', 'style', 'textarea', 'pre'] // removed 'code' entry
    }
});
MathJax.Hub.Queue(function() {
    var all = MathJax.Hub.getAllJax(), i;
    for(i = 0; i < all.length; i += 1) {
        all[i].SourceElement().parentNode.className += ' has-jax';
    }
});
</script>
<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>

<!---
End of the introductory stuff.
-->

## Tutorial 1 and markup stuff

First going through the tutorial. Unfortunately I forgot mine.

* Get solutions and check at home.

Quick markdown test:

```c++
cout << "test" << endl;
```

Seems to work!

Input parameter: designed to get information into a function; output paremeters
get value from a function. If you pass by value, that necessarily means that you
are using it as an input parameter.  Output parameter: may be used as an output
parameter, but also as input.

* Defensive programming: Being ultra-cautious about the inputs to a
  function. Can also use an assertion -- check whether conditions are true and
  stopping the problem if not.
    * Advantage: You can quickly find the issue in your program.
* Comments: Should have a little bit of information about the author etc. at the
  top, and might annotate function declarations with comments to say what the
  function is doing. General convention: program should speak for itself,
  excluding tricky bits.

## Lecture 2

## Arrays

* Good practise to use a constant for the size of the array -- this makes it
  somewhat more maintainable
* Can use typedef keyword: `typedef int Hours_array[NO_OF_EMPLOYEES];` to give
  this thing a new name
    * Can then just declare `Hours_array hours`
* C++ does no range-checking for you; you can access `hours[-2]`. It may well
  not even complain!
    * Since there are other variables on the stack, you may well be overwriting
      other variables when doing this
    * If you step outside your process, the OS will complain and give a
      segmentation fault
	  * Can initialise also using
	  ```c++
	  int hours[NO_OF_EMPLOYEES] = {10,20,30};
	  ```

	|| Make a c++ code block skeleton || Perhaps re-map TAB to indent 4 characters
* In gdb, can print the array; it will give the result in curly braces
* He shows that you can alter things on the stack just by accessing,
  e.g. `hours[-1]`
* This is not an error; as long as we stay within the stack of the program, the
  OS will not complain
* You could have a huge security breach:
    * You could overwrite interesting things on the stack; for example, you
      could overwrite the return address and have it execute whatever code you
      like!
    * Known as a buffer-overflow attack ("Stack-based exploitation")
    * Roughly half of the security breaches out there are part of this; you have
      to be extremely careful about the size of your variables, or you may be
      vulnerable.
    * Check to see whether you have overstepped the boundaries of the array
      whenever possible
* In what order the stack is populated is entirely up to the compiler.
* Can also define constants using `#define MAX 100` (Not sure about the syntax);
  but this is the old-style C way; both will work, but it depends on the actions
  of the preprocessor
* Array sizes must be known; there will be a caveat which we are getting to
  (dynamic allocation), but currently, the compiler needs to know at
  compile-time how much space to allocate
* We should always pass the array and the length of the array; C++ has no clue
  how long the arrays are. In Java, this is different. It checks whether it's a
  valid index, and returns an exception if not. In other words, C++ trusts what
  the programmer is doing; it's more efficient, but prone to error.
* All the compiler knows is the address of the base element and the type of the
  array. Then it can just compute the offset.
   * So if it's an integer list (4 bytes), it knows there will be 4 bytes per
     element, hence it can infer where all the other elements are.
* Heartbleed bug: based on asking for a message that is a lot longer than it
  actually is. E.g. ask for message "hello", which is 1MB large. Of course it
  really isn't, but the function returns the adjacent stuff, which included
  passwords and so on.
* If you do something horrendous like `hours[45873944] = 34` you will get
  `Segmentation fault`. A program might run on one machine but not on another,
  but this is just because they have different memory management.
* When the OS catches a misbehaving program, it sends it a signal. You can also
send a kill signal. First:
``` bash
ps -fae | grep wjk
```
* This lists processes and their parent processes
* Can then send `kill -9 PID`
* Can also send other signals; e.g. kill all the processes you can kill
* He googles UNIX signals:
    * There are signals like abort or alarm; can get notified when the child
      processes finish; can be instructed to resume; `SIGKILL`; `SIGSEGV` is the
      signal sent when it makes an invalid virtual memory reference
    * There is also `SIGTERM`, which is a more polite form of `SIGKILL`. (this,
      for instance, is signal 15)
* If you pass an array, you actually just pass the memory address (and the type
  I guess); the address is passed by value; so it passes a copy of the address;
  now, when we say `list[0]`, it means go to pigeonhole A100 and fetch the value
  -- or assign a different value
    * It passes a pointer. This pointer is passed by value.

* He tries:

```c++
int a = 3, b = 2; int &c[2] = {a, b};
```

* This does not work. You apparently cannot declare an array of references.
* The answer: People don't really seem to have made their mind up about it. You
  _can_, however, make an array of pointers.
* Can use the `const` modifier to prevent changes to the arrays; the compiler
  will try to stop you, though you can get around it if you want to.

## Wednesday 11am -- more arrays

### Sorting Arrays

* He introduces complexity
* Logs are usually to the base of two
* If we have $O(n^2)$, we can input $\frac{(2n)^{2}}{n^{2}}=4$
* We can do the same for $n log n$; the result of the algebraic manipulation is
  that it roughly doubles (+ a small fraction). It's almost as good as linear,
  and for practical purposes, it is.
* $O(1)$ would be best, but is hard to find.
* Polynomial is OK, but not great; e.g. solving matrix linear system of
  equations
* Truly horrendous: $O(2^{n})$
* Comparison-based sorting has maximum efficiency of $n logn$

## 21st November

* Overloading vs overriding
* To achieve distinct names for each function, the compiler uses "name
mangling", adding on various things
* He shows how overloading works when calling an overloaded function with
different arguments
* All of this is clear at compile time; when you override things,
the decision is only made at runtime (this apparently can also be
called _static_ overriding)
* Constants: if you have a constant as a parameter in a class,
  you _must initialise it after the initialiser colon_; we must
  assign that value to something, initialise it to something,
  after which the compiler does its best to avoid its value being
  changed.
* Some question about whether perhaps we could have a `const
static` in a class.
* He goes through `void f2(int i) const` which says that the
function f2 cannot change the class
* He goes through `const A& anA` -- an efficient way of passing
  objects around without copying them. He shows how we can call
  `anA.f2(1);` despite it being a member function -- but it
  promises to leave anA constant, so it's OK.
* Obviously, if we pass an object just by reference, we can do
whatever we want with it
* Putting a const at the end wherever possible is very good
practice
* void is lack of a type, so can do `main(void)`
* You must initialise a constant; you must do it in the
initialiser list
* The constructor's duty is to set everything up to something
  sensible, so it has to setup any constants; it will most
  probably give an error (he checks it). It does work if you use
  `-fpermissive`, turning it into a value. Someone says he thinks
  they might be initialised to zero, and that does happen once;
  Will thinks it depends on how fussy the compiler writer is, and
  that while Java guarantees initialisation to zero, C++ does
  not.
    * He attempts giving a class an uninitialised constant member
      and checks its value, and this time he gets random
      nonsense, so it seems it might not be initialised to zero
      all the time
* He shows that you _can_ violate the const things if you really
  wanted to using pointers and casting
* As long as you allow pointers and dereferencing, you cannot
  avoid aliasing [look up exact definition again]
* What we're doing with const is just prevent ourselves from
  being stupid.
* He says it's hard for the compiler to stop you because it does
  not know the addresses until runtime
    * Difficult to put into read-only memory apparently
    * `g++ -S` for assembler code; he checks whether if you do
      have a constant in the main, whether it's put into
      read-only memory
    * He manages to change even that however
* He mentions self-modifying code; code which changes its
  instructions during runtime
    * In Javascript you can apparently do some of this stuff
* User Defined Operators
    * You can overload any of the operators, even array brackets,
      new and delete; so you could for example make an array
      which checks whether its index is out of bounds
    * Two ways of doing it: either as a function external to a
      class; e.g. external global function which knows how to add
      together two complex numbers (friends of the class)
    * When you then write z1+z2, the compiler does two things for
    you:
        * It first tries `z1.operator+(z2)`: is there a method
          within the class which I can call, passing the second
          thing to it; if that does not exist:
        * It says "is there a global function which knows how to
          take these two things and add them together?"
        * Only calls the second if it cannot find the first.
        * When you say `cout << z1`, it will first try
          `cout.operator<<(z1)`, but since the guy designing
          `cout` does not know about your class, instead it then
          looks for a global function `operator<<(cout, z1)`
        * So it's a two-level process, and both will work.
        * Error in the notes: should do `Compl operator+ (const
          Compl%) const`
    * Could also have external functions or methods like
      `addComplex` or something, and would have to do this in
      Java; e.g. `z1.plus(z2)`; this of course becomes pretty
      horrible for longer expressions
        * He shows how it looks using global functions and member
          functions on its own
    * Friends vs. inside class: if you can, put it in the class;
      if you don't have access like with cout, you have to, but
      he reckons it is _much_ more elegant to use it as a member
      function
    * Advantages of operators:
        * Avoid verbose code
    * p.63: shows how `cout` really works: take reference to
      cout, put thing to it, and return reference to cout again;
      he replaces `'\n'` with `endl`
    * overloading postfix and prefix; he shows C++ lite; postfix
      stores the old value, increments, and returns the old
      one as a copy, prefix returns reference
* Default arguments:
    * Can specify default arguments; e.g. `A(int j = 22) { i =
      j;};`
        * Then can declare an A without arguments and will set i
          to 22; if we do A(int), then we do set j to i
    * Have to put the default ones before the others
* _Must_ use the initialiser colon to initialise references
  and constants
    * He shows what happens if you do not: if not in the
      initialiser list, it will try to call default constructors
    * He reckons the list is far more elegant
    * Could also make a default constructor, but he reckons
      that's lazy and inefficient
* Implicit function definitions and calls are not part of the
  exam and this course, but it's helpful to see what's going on
  (read through)
    * He shows how the assignment operator works and why it has
      the type it has
    * Take-away: `a1 = A(9)` is less efficient than `A a1(6)` as
      the first will first create an object, then copy it, then
      destroy it; the second will just create it once (I think)
    * If we have `f(A a)` the copy constructor is called making a
      copy of a; at the end of the execution, the copy is
      "destructed"
    * If we have a member object inside an object, it will be
      initialised (nested)
    * Can also construct your object with another object;
      e.g. `C(A& a)`; then, if you do `C aC; A anA1; aC = anA1;`
      it is going to try to turn the A into a C, so it needs to
      be able to construct an object of type C using an object of
      type A; this is what the constructor does
    * Note: should put in const on p.90
    * Summary: you don't want to have many implicit calls; use
      the initialiser colon as much as possible
* Assignments to `this` are illegal
* Forget the linked list example
* If you understand p.115 you are in good shape; pretty much all
  you need to understand for this course
* This is all going into the exam:
    * Problem description, draw UML, design program (headers,
      main function, so on)
    * Each class to go and implement some of the code for the
      member functions
    * If you're really good, write a unit test for each class
      which tests the functionality for each class
    * Never jeopardise a good design to get the program to run,
      but in practice everyone does -- this is called Agile
      programming...
    * He sets exam questions by writing programs and putting in
      Umbrello
    * Exam is all about elegance: are we using inheritance
      appropriately, do we have the correct relationships,
      appropriate classes, gone over the top by putting in too
      many classes; it's all about implementing the set of
      minimal classes to get the functionality in main to work,
      emphasis on good design; if you find yourself cutting and
      pasting your own code you know you got something wrong;
      classes with same attributes, maybe should use the
      superclass; if you write classes with the same relationship
      to other classes, should think about it
    * Exam is paper-based; not about whether the code runs, it's
      about whether the design is elegant
    * If the code would stand a good chance of executing, that's
      an "extreme bonus"
    * Doesn't want to see list of jobs or something on the UML
      diagram, it's just conceptual; don't have to put everything
      on the UML diagram; some things only come out when
      implemented
        * Use relationships rather than list
        * Remember: attributes are of simple type (!)
        * STL types are complex; just another way of expressing
          e.g. an aggregation relationship
    * Obviously have to know how to represent it in C++
    * Questions: are the tutorials representative?
        * Answer: yes they are.
            * University Challenge was one
            * Parking attendants
        * Past papers are apparently available. ("a great wealth
          of them")
        * UML should speak for itself, but if you want to, you
          can explain your decisions
    * Remember:
        * There are ways of representing aggregations,
          associations, etc. etc.; these seem to be there on p.129
