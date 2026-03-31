def swap_first_last(lst):
    lst[0], lst[-1] = lst[-1], lst[0]
    return lst
print(swap_first_last([1, 2, 3, 4])) 
