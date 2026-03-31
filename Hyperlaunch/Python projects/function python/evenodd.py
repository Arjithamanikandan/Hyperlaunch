def count_even_odd(lst):
    even = odd = 0
    
    for num in lst:
        if num % 2 == 0:
            even += 1
        else:
            odd += 1
    
    return even, odd
if __name__ == "__main__":
    sample_list = [1, 2, 3, 4]
    even_count, odd_count = count_even_odd(sample_list)
    print({even_count}, {odd_count})