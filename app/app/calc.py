"""
Fibonacci series
"""


def fibonacci_series(number):
    # base case
    if number <= 2:
        return number
    else:
        return fibonacci_series(number-1) + fibonacci_series(number-2)


if __name__ == "__main__":
    print(fibonacci_series(10))
