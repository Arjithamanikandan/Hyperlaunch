sentence = "Hello Python World"
result = " ".join(word[::-1] for word in sentence.split())
print (result)