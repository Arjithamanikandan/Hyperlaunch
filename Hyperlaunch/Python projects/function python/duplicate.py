def remove_duplicates(lst):
    unique = []
    for item in lst:
        if item not in unique:
            unique.append(item)
    return unique
sample_list = [1, 2, 2, 3, 1]
print(remove_duplicates(sample_list))
        

