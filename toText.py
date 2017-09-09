import json

def makeItPretty(current):
	new = current
	start = current.find('https://t.co/')
	if (start != -1):
		end = start + 24
		new = current[0:start] + current[end:]
	return new


data_file = open('/Users/willmorgus/Desktop/trumpitter/tweets.json', 'r')  
data = data_file.read()
data_file.close()

x = json.loads(data)

o = open('/Users/willmorgus/Desktop/trumpitter/tweetText.txt', 'w')
for obj in x:
	new = obj['content']
	two = new
	start = new.find('https://t.co/')
	if (start != -1):
		end = start + 24
		two = new[0:start] + new[end:]
	if (two.find('https://t.co/') == -1):
		o.write(two.encode('UTF-8') + '\n')
	


