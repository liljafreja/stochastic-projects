# Task 1 ----------------------------------------------------------------
# The following Task tackles first the distribution of throwing one coin,
# and later in the number of heads when throwing arbitrary number of coin.
# It is later shown that the distribution fits with the Binomial one.

# Defining probabilities for tossing a possibly fair coin. 
headsProbability <- runif(1,0,1) # Probability of getting "heads"
tailsProbability <- 1 - headsProbability # Probability of getting "tails"
# A vector representing the possible results of a coin toss.
coin <- c(0,1) # 0: heads, 1: tails
toss <- 1
# This problem can be modeled by the Binomial distribution dealing with the
# probability of a success of an event with two possible outcomes.
rbinomCoinToss <- rbinom(n = toss,
                         size = 1,
                         prob = headsProbability)

hist(rbinomCoinToss)
plot(rbinomCoinToss,
     toss,
     xlab = "Number of Heads",
     ylab = "Number of Tosses",
     main = "Distribution of One Coin Toss")


# Task 1: n coin tosses - We are interested in the number of heads.
tosses <- 1000 # Arbitrary coin tosses
headsProbability <- runif(1,0,1) # Probability of getting "heads"
tailsProbability <- 1 - headsProbability # Probability of getting "tails"
coin <- c(0,1) # 0: heads, 1: tails

coinTosses <- sample(coin,
                     size = tosses,
                     replace = TRUE,
                     prob = c(tailsProbability,headsProbability))

rbinomCoinTosses <- rbinom(n = tosses, size = 1, prob = headsProbability)
  
par(mfrow=c(2,1))
hist(rbinomCoinTosses)
hist(coinTosses)

# Task 2a ----------------------------------------------------------------
# When rolling 4 dice simultaneously, we are interested in the event that at least one
# of them shows a "6".
values <- c(1,2,3,4,5,6) # The possible outcomes(colours) of a die.
counts <- c(4,4,4,4,4,4) # Throwing the die 4 times - The urn consits of 4 balls for each colour.
urn <- rep (values, counts)
takeBalls <- sample(urn,
                    size = 4,
                    replace = FALSE)
n <- 100000
sampledBernoulli_a = rbinom(n = n,
                            size = 1,
                            prob = 0.5177)
x <- mean(sampledBernoulli_a)
x

# Task 2b ----------------------------------------------------------------
# When rolling two dice simultaneously 24 times, we are interested in the event that
# at least once, both of them show a "6" simultaneously.
values <- c(1,2,3,4,5,6)
counts <- c(2,2,2,2,2,2)
urn <- rep (values, counts)
takeBalls <- sample(urn,
                    size = 2,
                    replace = FALSE)
n <- 100000
numOfRolls <- 24
# Using the replicate function we repeat the experiment of throwing two dice.
sampledBernoulli_b = replicate(n = numOfRolls,
                               rbinom(n = n,
                                      size = 1,
                                      prob = 1-(35/36)^numOfRolls),
                               simplify = "array")
x <- mean(sampledBernoulli_b)
x
# RESULT: After calculating the means of both scenarios and trying sampling by ourselves
# we have come to the conclusion that the first event is more probable.
# Task 3 ----------------------------------------------------------------
# Simulating the lottery "6 out of 49". 
N <- 10^8 # NOTE: lower for optimization purposes. 
m = integer(7) # Initialize vector of 7 zeros for calculating the mean.
# choose(n,k) - Number of ways to choose k elements from a set of n elements.

for (k in 0:6) {
  s = rbinom(n = N,
             size = 1,
             prob = (choose(43,6-k)*choose(6,k)/choose(49,6)))
  m[k+1] = mean(s)
}
# Output the mean of the results for success for each of the six numbers.
m