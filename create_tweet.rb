#Reading from the tweetText.txt

test_string = File.open("test_text.txt") {|text| text.read}

# test_string = "wtf"
# File.open("test_text.txt").each do |line|
#	test_string + line
#end

puts test_string

dictionary = {}

#Choose random word from the list of next possible words

