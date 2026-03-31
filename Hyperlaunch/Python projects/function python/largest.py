def find_largest(numbers):
    largest = numbers[0]
    
    for num in numbers:
        if num > largest:
            largest = num
            
    return largest

nums = [5, 12, 7, 9]
print(find_largest(nums))
