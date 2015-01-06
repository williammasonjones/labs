* Read the manual page for a unix command with man or woman.
  What command did you read about? What does it do?
  Bonus: Do a command we didn't cover in class.

    Sort - This command sorts the lines of a text file. It rearranges the
           contents of the text file in various ways like alphabetically,
           numerically, or reverse order. It also tells you if a text file has
           already been sorted.



* Have a look on Ruby Doc at the methods defined on strings and symbols.
  Describe 2 methods that strings have but symbols don't and vice versa.
  Pick a method defined on the Enumerable class (arrays, etc). What does
  it do and when might you use it?

    If you go into pry and do "".methods - :a.methods it will list the methods
    that strings have that symbols do not. The same is true for the reverse.

    Two methods strings can do that symbols cannot are .upcase! and .downcase!

    Two methods that symbols have that strings do not are [:id2name, :to_proc]

    Max returns the object in enum w/ the maximum value. 
