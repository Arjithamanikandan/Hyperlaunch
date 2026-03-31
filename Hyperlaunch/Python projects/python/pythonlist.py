name = ['A','B','C']
age = [21,22,23]
eligible =[]
for n,a in zip(name,age):
    if a>=22:
        eligible.append(n)
print(eligible)
