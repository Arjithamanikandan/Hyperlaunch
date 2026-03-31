def count_uppercase(s):
    count = 0
    
    for ch in s:
        if ch.isupper():
            count += 1
    return count
if __name__ == "__main__":
    sample_string = "Hello World"
    print(count_uppercase(sample_string ))
