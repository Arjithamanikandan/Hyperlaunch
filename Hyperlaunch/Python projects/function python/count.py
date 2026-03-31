def word_count(sentence):
    words = sentence.split()
    return len(words)
if __name__ == "__main__":
    sample_sentence = "Python is easy to learn"
    print(word_count(sample_sentence))