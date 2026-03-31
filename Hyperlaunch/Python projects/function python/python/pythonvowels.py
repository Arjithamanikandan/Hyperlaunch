String = "Eat"
vowels = "aeiou"
count = 0
for char in String.lower():
    if char in vowels:
        count += 1
print(count)
