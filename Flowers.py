from core import player

class Flowers(object):

	def __init__(self):
		self.print_banner()
		self.set_up_game()
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

	def set_up_game(self):
		self.player = player.Player()
		self.player.pick_name()

game = Flowers()