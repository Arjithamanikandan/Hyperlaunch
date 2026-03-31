def count_vowels(s):
    vowels = "aeiou"
    string = s.lower()
    count = 0
    for char in s:
        if char in vowels:
            count += 1
    return count

string = "hello world"
print(count_vowels(string))
