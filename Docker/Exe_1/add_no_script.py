import os
arg1 = os.getenv('Argument1')
arg2 = os.getenv('Argument2')
print(arg1)
print(arg2)


def hello(a,b):
    print("hello and that's your sum:")
    sum = a + b
    print(sum)

if __name__ == "__main__":
    hello(int(arg1), int(arg2))

