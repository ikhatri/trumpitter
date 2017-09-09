#Reading from the tweetText.txt
test_string = File.open("test_text.txt") {|t| t.read}
#puts test_string #for testing

#Identifying different words in string
dictionary = {}
def create_dictionary(text)
	string_left_to_parse = test_string
end

def find_next_word(text)
	char = text[0]
	if(char.eql? " ")
		""
	else
		char + find_next_word(text[1..-1])
	end
end

puts find_next_word(test_string)

#output a word based on the probability of word appearing in a phrase
def choose_word(set)
	val_array = set.values
	sum = val_array.inject(0){|sum,x| sum + x }
	rand_num = rand(1..sum)
	puts rand_num
	prev_sum = 0
	range_array = val_array.map {|x| prev_sum += x}
	print range_array
	index = 0
	i = 0
	while (rand_num > range_array[i]) do
	  i += 1
	  index += 1
	end
	key_array = set.keys
	return key_array[index]
end