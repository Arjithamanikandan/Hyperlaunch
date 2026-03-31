def char_count(s):
    count = {}
    
    for ch in s:
        count[ch] = count.get(ch, 0) + 1
    
    return count
if __name__ == "__main__":
    sample_string = "banana"
    print(char_count(sample_string))