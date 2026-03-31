list = ['1','2','3','4','7','2','7','5']
count_dict ={}
for val in set(list):
    count_dict[val] = list.count(val)
print(count_dict)