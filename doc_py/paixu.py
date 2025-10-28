a = [5,6,1,8,9]
n = len(a)
for i in range(n-1):
    for j in range(n-1-i):
        if a[j] > a[j+1]:
            a[j],a[j+1] = a[j+1],a[j]
print(a)