# Kata18: Transitive Dependencies

Let’s write some code that calculates how dependencies propagate between things such as classes in a program.

Highly coupled code is code where the dependencies between things are dense, lots of things depend on other things. This kind of program is hard to understand, tough to maintain, and tends to be fragile, breaking easily when things change.

There are many different kinds of coupling in code. One of the easiest to work with programatically is static coupling, where we’re concerned with the relationships between chunks of source code. Simplisticly, we can say that class A is statically coupled to class B if the compiler needs the definition of B in order to compile

In many languages, static dependencies can be determined by source code analysis. Tools such as makedepend (for C programs) and JDepend (for Java) look for explicit dependencies in the source and list them out.

One of the insidious things about dependencies is that they are transitive—if A depends on B and B depends on C, then A also depends on C. So, let’s write some code that calculates the full set of dependencies for a group of items. The code takes as input a set of lines where the first token is the name of an item. The remaining tokens are the names of things that this first item depends on. Given the following input, we know that A directly depends on B and C, B depends on C and E, and so on.

```ruby
  A   B   C
  B   C   E
  C   G
  D   A   F
  E   F
  F   H
```

The program should use this data to calculate the full set of dependencies. For example, looking at B, we see it directly depends on C and E. C in turn relies on G, E relies on F, and F relies on H. This means that B ultimately relies on C, E, F, G, and H. In fact, the full set of dependencies for the previous example is:

```ruby
  A   B C E F G H
  B   C E F G H
  C   G
  D   A B C E F G H
  E   F H
  F   H
```

Let’s express this using unit tests. The following code assumes that our dependency calculator is a class with an add_direct() method to add the direct dependencies for an item, and a dependencies_for() method to return the full list of dependencies for an item. The code uses Ruby’s %w{…} construct, which builds an array of strings from its argument.

```ruby
def test_basic
  dep = Dependencies.new
  dep.add_direct('A', %w{ B C } )
  dep.add_direct('B', %w{ C E } )
  dep.add_direct('C', %w{ G   } )
  dep.add_direct('D', %w{ A F } )
  dep.add_direct('E', %w{ F   } )
  dep.add_direct('F', %w{ H   } )

  assert_equal( %w{ B C E F G H },   dep.dependencies_for('A'))
  assert_equal( %w{ C E F G H },     dep.dependencies_for('B'))
  assert_equal( %w{ G },             dep.dependencies_for('C'))
  assert_equal( %w{ A B C E F G H }, dep.dependencies_for('D'))
  assert_equal( %w{ F H },           dep.dependencies_for('E'))
  assert_equal( %w{ H },             dep.dependencies_for('F'))
end
```

Stop reading now, and start coding. Once you’ve got your code working, try feeding it the following dependencies.

```ruby
  A B
  B C
  C A
```

Does it work correctly? If not, ask yourself is this is a condition you should have considered during testing.

Once you’ve got your code working with all the various test cases you can imagine, let’s think for a minute about performance. Say we were using this code to find all the relationships between the inhabitants of the United Kingdom. How would your code perform with 55-60 million items?

Originally posted by Dave Thomas (@PragDave) Dec 12th, 2013 
