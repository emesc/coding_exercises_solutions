# Solutions to the Coding Problems
Solves Scrabble Score and Credit Check

## Scrabble
  * Insensitive to case
  * An empty word or nil scores 0
  * For scoring only valid english words, git checkout scrabble-english-check. This makes use of meaning gem which is based on dictionary.cambridge.org site. However, running the app and tests will be slower.

## Credit Check
  * Also checks whether the input is an integer
  * Works for American Express numbers

## Run the solver
```
  $ ./bin/guide.rb
```

a)
    Commands: credit or scrabble (quit to exit)
    > credit
    Enter a number to validate
    > 4929735477250543
    valid

b)
    Commands: credit or scrabble (quit to exit)
    > scrabble
    Letter values found
    Enter a word to score
    > hello
    Score is: 8    

## Reference
- https://gist.github.com/elle/b9739bc21eb348916a60622f3fb6e2e4
