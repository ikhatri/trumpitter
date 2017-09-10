
dictionary = Hash.new

def create_dictionary(dict, text)
	#Reading from the tweetText.txt
	File.open(text).each do |line|
		string_left_to_parse = line[0..line.length - 2] #making the line the right length
		
		while !(string_left_to_parse.eql? nil) do #looping through every word
			word = find_next_word(string_left_to_parse)
			dict.store(word, Hash.new) #add word to the hashtable dictionary mapping to empty word_sets
			string_left_to_parse = string_left_to_parse[(word.length + 1)..-1]
		end
	end

	#loop through dictionary to update word_sets
	File.open(text).each do |line|
		string_left_to_parse = line[0..line.length - 2] #making the line the right length

		first_word = find_next_word(string_left_to_parse)
		string_left_to_parse = string_left_to_parse[(first_word.length + 1)..-1]

		#store the last word to 
		while !(string_left_to_parse.eql? nil) do #looping through every word
			next_word = find_next_word(string_left_to_parse)
			word_map = dict[first_word]
			#puts word_map[next_word]
			if(word_map[next_word].eql? nil)
				word_map.store(next_word, 1)
			else
				num_appearances = word_map[next_word] + 1
				word_map.store(next_word, num_appearances)
			end
			#dict.store(first_word, Hash.new) #add word to the hashtable dictionary mapping to empty word_sets
			first_word = next_word
			string_left_to_parse = string_left_to_parse[(next_word.length + 1)..-1]
		end
	end


end

#Identifying different words in string
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
create_dictionary(dictionary, "test_text.txt")
puts dictionary
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