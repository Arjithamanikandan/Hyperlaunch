def common_elements(l1, l2):
    common = []
    
    for item in l1:
        if item in l2:
            common.append(item)
    
    return common
print(common_elements([1, 2, 3], [2, 3, 4]))