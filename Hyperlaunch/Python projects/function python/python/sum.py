num = 9875
while num > 9:
    num = sum(int(digit) for digit in str(num))
print(num)