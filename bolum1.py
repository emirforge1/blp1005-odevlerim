# Bölüm 1: Algoritma ve izleme

# Soru 1.1 - İz sürme
numbers = [4, 7, 2, 9, 5, 1, 8]
total = 0
result = []

for i in range(len(numbers)):
    if numbers[i] % 2 == 0:
        total = total + numbers[i]
    else:
        result.append(numbers[i])

print("Soru 1.1")
print(total)
print(result)
print()

# Soru 1.2 - En uzun seri
readings = [18, 21, 23, 25, 24, 26, 27, 19, 20, 22, 23, 24, 25, 26]
threshold = 22

current = 0
longest = 0

for value in readings:
    if value > threshold:
        current = current + 1
        if current > longest:
            longest = current
    else:
        current = 0

print("Soru 1.2")
print(longest)
print()

# Soru 1.3 - Elle gruplama
records = [
    {"student": "Ece", "course": "VTYS"},
    {"student": "Ali", "course": "Yapay Zeka"},
    {"student": "Ece", "course": "Yapay Zeka"},
    {"student": "Can", "course": "VTYS"},
    {"student": "Ali", "course": "VTYS"},
    {"student": "Ece", "course": "Robotik"},
]

counts = {}

for record in records:
    course = record["course"]

    if course in counts:
        counts[course] = counts[course] + 1
    else:
        counts[course] = 1

print("Soru 1.3")
print(counts)

# Soru 1.1 iz sürme tablosu:
# i | numbers[i] | total | result
# 0 | 4          | 4     | []
# 1 | 7          | 4     | [7]
# 2 | 2          | 6     | [7]
# 3 | 9          | 6     | [7, 9]
# 4 | 5          | 6     | [7, 9, 5]
# 5 | 1          | 6     | [7, 9, 5, 1]
# 6 | 8          | 14    | [7, 9, 5, 1]
#
# Rapor cümlesi:
# Python'da for ve if ile dersleri saymak, SQL'deki GROUP BY gibi
# aynı gruba ait kayıtları bir araya getirip saymamızı sağlar.
