freq
====

Erlang word frequency counter

As part of learning erlang and writting an erlang ibook i have started writting some sample code, this is the initial version
of some of this code. Its very simple but is just the first steps in helping you undertand the ideas behind erlang.

freq is a word frequency counter, it loads a text file and counts the number of times that word is in the file, 
the example uses Treasure Island full.txt or the first chapter small.txt, it then produces an output txt file of the word frequency.

I havent put any comments in the code as of yet, i might do that in the next update.

I hope you find these examples of some use, and are of some help, please get in touch if you have any questions or any feedback.

Cheers Richard Claxton


BUILD
=====
erlc f.erl


RUN
===
in erlang prompt use 

f:run("small.txt")

or

f:run("full.txt")

or

f:run("you own txt file").


