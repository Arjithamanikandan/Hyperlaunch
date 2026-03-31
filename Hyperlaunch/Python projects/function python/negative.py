def count_negative(lst):
    count = 0
    
    for num in lst:
        if num < 0:
            count += 1
    
    return count
print(count_negative([-1, 2, -3, 4]))