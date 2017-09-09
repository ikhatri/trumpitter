#This is the current state file. It will contain an abstraction of the current "state" of the transition table in the Markov Chain.
#The current state is represented by two words that are current in the sentence

def new_state(first, second)
	[first, second]
end

def shift_in(state, word)
	[state[1], word]
end
