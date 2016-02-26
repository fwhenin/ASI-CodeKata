# Kata08: Conflicting Objectives
Why do we write code? At one level, we’re trying to solve some particular problem, to add some kind of value to the world. But often there are also secondary objectives: the code has to solve the problem, and it also has to be fast, or easy to maintain, or extend, or whatever. So let’s look at that.

For this kata, we’re going to write a program to solve a simple problem, and we’re going to write it with three different sub-objectives. Our program is going do process the dictionary we used in previous kata, this time looking for all six letter words which are composed of two concatenated smaller words. For example:

```Ruby
al + bums => albums
bar + ely => barely
be + foul => befoul
con + vex => convex
here + by => hereby
jig + saw => jigsaw
tail + or => tailor
we + aver => weaver
```
Write the program three times.

- The first time, make program as readable as you can make it.
- The second time, optimize the program to run fast fast as you can make it.
- The third time, write as extendible a program as you can.

Now look back at the three programs and think about how each of the three subobjectives interacts with the others. For example, does making the program as fast as possible make it more or less readable? Does it make easier to extend? Does making the program readable make it slower or faster, flexible or rigid? And does making it extendible make it more or less readable, slower or faster? Are any of these correlations stronger than others? What does this mean in terms of optimizations you may perform on the code you write?
