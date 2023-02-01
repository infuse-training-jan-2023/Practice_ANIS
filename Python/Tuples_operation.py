original_tuples = ((10,10,10,12), (30,45,56,45),(81,80,39,32), (1,2,3,4))
output = []
for avg in zip(*original_tuples):
    output.append(sum(avg)/len(avg))
print(output)
