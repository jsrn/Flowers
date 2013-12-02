class Flowers(object):

	def __init__(self):
		self.print_banner()
		self.enter_game_loop()

	def print_banner(self):
		print ".----------------------------- FLOWERS -----------------------------."
		print "|                   A(n) ORG_NAME_HERE Adventure                    |"
		print "|          dot|not           ToxicVenom             jsrn            |"
		print "`-------------------------------------------------------------------'"

	def handle_input(self, input):
		print input

	def enter_game_loop(self):
		while True:
			input = raw_input("> ")
			self.handle_input(input)

game = Flowers()