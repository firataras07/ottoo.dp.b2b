import json

data = open('./aaa.csv', 'r').read().split('\n')

info = {}
for d in data:
    row = d.split('\n')
    k = '+'.join(row[:1])
    c = row[3]
    t = row[4]
    if info.get(k, None) ==None:
        info[k] = {"c" : [], "t":[]}
    info[k]['c'].append(c)
    info[k]['t'].append(t)
print (json.dumps(info, indent = 4))
            
    
    