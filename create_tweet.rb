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


#Choose random word from the list of next possible words

