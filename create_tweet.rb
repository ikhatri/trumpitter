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

#Choose random word from the list of next possible words

