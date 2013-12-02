class Player(object):

	def __init__(self):
		pass

	def get_name(self):
		return self.name

	def pick_name(self):
		print "Greetings, traveller! What is your name?"
		self.name = raw_input("> ")
		print "Greetings, " + self.name
