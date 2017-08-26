# Wealthsimple Lightning Challenge

### Background
At Wealthsimple, the simplest model of an investment account is a `snapshot`. A `snapshot` represents an account's market liquidation value and the cash flow going in or out of that account for a given day.It is assumed that all market values are calculated at the end of day, while cash flows occur before the end of day.

One of the most important things our clients want to see is the return rate of their account. The simplest way to calculate this is the formula `(current_market_value / previous_market_value) - 1`. However, this value, which we call the Naive return, is not always reliable; instead, the industry standard uses Time Weighted Return.

The time weighted return can be found by calculating the naive return for each sub-period between each day, and geometrically linking them. The naive return used should use the market value of the first day and the market value before cash flows for the second day. This is better explained using an example:

##### Daily Snapshots

This is the raw data you're given.

*Day 1.* Cash flow: 0, Market Value: 100

*Day 2.* Cash flow: 15, Market Value: 120

*Day 3.* Cash flow: 10, Market Value: 127

##### Sub-periods

This is the naive return between each day.

*Sub-period 1.* ((120 - 15) / 100) - 1 = 0.05 = 5%

*Sub-period 2.* ((127 - 10) / 120) - 1 = -0.025 = -2.5%

##### Geometric Linking

This is the compounded return considering all the sub-periods.

(1 + 0.05) * (1 - 0.025) - 1 = 0.02375 = 2.375%

### Problem

You must write code to calculate Time Weighted Return, given a series of snapshots. The skeleton code and some basic tests are provided to you.

The winner of the challenge will be selected based on:
- Correctness
- Readability
- Efficiency
- Edge-case handling

### Rules

- You may not use any existing libraries, or copy existing code.
- You should fork this project, and submit your entry by submitting a pull request.
- Your latest commit must be on GitHub no later than the time specified by the engineer running the challenge.

### Prizes

The winner of the Wealthsimple Lightning Challenge will receive a pair of Bose QC25 Noise Cancelling Headphones. You'll never be distracted while coding again!
