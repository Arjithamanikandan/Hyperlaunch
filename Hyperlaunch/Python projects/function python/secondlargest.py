def second_largest(lst):
    unique = list(set(lst))
    unique.sort(reverse=True)
    return unique[1]
print(second_largest([10, 20, 15, 5]))  