#This file represents the set of words that can come next as a dictionary in the format {word: # times it appears in the learned text}

def empty_set
end

#checks if word is in set, if not adds to set, if yes increments
def add_to_set(set, word)
	if !(set.key?(word))
		set.merge!(word => 1)
	else
		set[word] += 1
	end
end

def word_picker
end
