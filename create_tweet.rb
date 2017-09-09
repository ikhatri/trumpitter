#Identifying different words in string
dictionary = {}
def create_dictionary(text)
	#Reading from the tweetText.txt
	File.open(text).each do |line|
		string_left_to_parse = line[0..line.length - 1]
		puts string_left_to_parse
		while string_left_to_parse.length > 1 do
			#puts string_left_to_parse
			word = find_next_word(string_left_to_parse)
			puts word
			print word.length + 1
			print "    "
			puts string_left_to_parse.length
			string_left_to_parse = string_left_to_parse[(word.length + 1)..-1]
			#puts "reached"
			#puts string_left_to_parse.length
		end
	end
end

def find_next_word(text)
	char = text[0]
	if(char.eql? " ")
		""
	elsif(text.length == 1)
		char
	else
		char + find_next_word(text[1..-1])
	end
end

#puts find_next_word("dog")
create_dictionary("test_text.txt")
#puts "".length


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