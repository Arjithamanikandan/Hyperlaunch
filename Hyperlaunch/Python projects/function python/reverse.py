def reverse_words(sentence):
    words = sentence.split()
    reversed_words = words[::-1]
    return ' '.join(reversed_words)
s = 'Python is fun'
output = reverse_words(s)
print(output)