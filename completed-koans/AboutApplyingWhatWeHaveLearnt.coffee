should = require('chai').should() # import Chai.js matchers
FILL_ME_IN = 'Fill this value in' # Don't touch this one!

describe 'About Applying What We Have Learnt', ->
  operations = [
    { direction: 'RT', distance: 200}
    { direction: 'FWD', distance: 50}
    { direction: 'RT', distance: 100}
    { direction: 'RT', distance: 20}
    { direction: 'FWD', distance: 200}
    { direction: 'RT', distance: 10}
  ]

  it 'should find a needle in a haystack (imperative)', ->
    findNeedle = (ops) ->
      hasInvalidOperation = false
      for i in [0..ops.length-1]
        if (ops[i].direction == 'FWD' && ops[i].distance > 100)
          hasInvalidOperation = true
          break
      return hasInvalidOperation

    findNeedle(operations).should.equal true

  it 'should find needle in a haystack (functional)', ->
    findNeedle = (ops) ->
      return true for op in ops when op.direction == 'FWD' && op.distance > 100
      return false

    findNeedle(operations).should.equal true

  it 'should add all the natural numbers below 1000 that are multiples of 3 or 5 (imperative)', ->
    total = 0
    for i in [1..1000]
      if (i % 3 == 0 || i % 5 == 0)
        total += i
    total.should.equal 234168

  it 'should add all the natural numbers below 1000 that are multiples of 3 or 5 (functional)', ->
    func = -> [1..1000].filter((n) -> n % 3 == 0 || n % 5 == 0).reduce((s, i) -> s + i)

    func().should.equal 234168

  it 'should find the sum of all the even valued terms in the fibonacci sequence which do not exceed four million (imperative)', ->
    sum = 0
    fib = [0, 1, 1]
    i = 3
    currentFib = 0

    # Note, the condition in the while loop isn't strictly necessary, as the first fib
    # >4m is actually odd, but it is good practice for avoiding fencepost errors
    while (currentFib = fib[i] = fib[i-1] + fib[i-2]) < 4000000
      if (currentFib % 2 == 0)
        sum += currentFib
      i+=1

    sum.should.equal 4613732

  it 'should find the sum of all the even valued terms in the fibonacci sequence which do not exceed four million (functional)', ->
    nextFib = (fibs) -> fibs[fibs.length - 1] + fibs[fibs.length - 2]

    evenFibSum = (n) ->
      fibs = [0, 1]
      fibs.push(nextFib(fibs)) while fibs[fibs.length - 1] < n
      fibs.filter((n) -> n % 2 == 0).reduce((s, i) -> s + i)
    # FILL_ME_IN solution goes in here
    # HINT: one way of doing this would be to construct an array of Fibonacci numbers
    # using a function and a while loop, and then to filter it using an even function
    evenFibSum(4 * 10**6).should.equal 4613732

###
# UNCOMMENT FOR EXTRA CREDIT
  it 'should find the largest prime factor of a composite number', ->

  it 'should find the largest palindrome made from the product of two 3 digit numbers', ->

  it 'should what is the smallest number divisible by each of the numbers 1 to 20', ->

  it 'should what is the difference between the sum of the squares and the square of the sums', ->

  it 'should find the 10001st prime', ->
###
