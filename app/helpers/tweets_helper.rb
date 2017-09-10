module TweetsHelper
    require_relative '../../current_state.rb'
	require 'json'

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
		dict.store(".", Hash.new) #adding "." for start of sentences

		#loop through dictionary to update word_sets
		File.open(text).each do |line|
			string_left_to_parse = line[0..line.length - 2] #making the line the right length

			first_word = find_next_word(string_left_to_parse)
			string_left_to_parse = string_left_to_parse[(first_word.length + 1)..-1]

			last_word = "" #store the last word to put that info into the word_map

			period_word_map = dict["."] #mapping the start of sentences "." to the first words
			if(period_word_map[first_word].eql? nil)
				period_word_map.store(first_word, 1)
			else
				period_num_appearances = period_word_map[first_word] + 1
				period_word_map.store(first_word, period_num_appearances)
			end

			while !(string_left_to_parse.eql? nil) do #looping through every word
				next_word = find_next_word(string_left_to_parse)
				word_map = dict[first_word]
				#puts word_map[next_word]
				if(word_map[next_word].eql? nil)
					word_map.store(next_word, 1)
				else
					if(next_word.eql? ".")
						last_word = first_word
					end
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

	#output a word based on the probability of word appearing in a phrase
	def choose_word(ptr_string, dictionary)
		set = dictionary[ptr_string]
		val_array = set.values
		sum = val_array.inject(0){|sum,x| sum + x }
		rand_num = rand(1..sum)
		prev_sum = 0
		range_array = val_array.map {|x| prev_sum += x}
		index = 0
		i = 0
		while (rand_num > range_array[i]) do
		i += 1
		index += 1
		end
		key_array = set.keys
		return key_array[index]
	end


	def write_to_json(dictionary, file_name)
		create_dictionary(dictionary, "tweetText.txt")
		File.open(file_name, 'w'){|f| f.write(dictionary.to_json)} #write this to the json file
	end

	#write_to_json(dictionary, "tweet_text.json")
	def make_tweet
		tweet_file = File.read("tweet_text.json")
		dictionary = JSON.parse(tweet_file)
		tweet = ""
		cur_state =  new_state(".", ".")
		new_word = choose_word(cur_state[1], dictionary)
		while(tweet.length < 141) #while(!(new_word.eql? "."))
			next_state = shift_in(cur_state, new_word)
			tweet = tweet + next_state[1] + " "
			cur_state = next_state
			new_word = choose_word(cur_state[1], dictionary)
		end
		tweet
	end
	  
end
