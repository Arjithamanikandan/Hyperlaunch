def even_numbers(lst):
    evens = []
    
    for num in lst:
        if num % 2 == 0:
            evens.append(num)
    
    return evens
if __name__ == "__main__":
    sample_list =[1, 4, 5, 6]
    print(even_numbers(sample_list)) 
