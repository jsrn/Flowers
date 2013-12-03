# The __init__.py inside core/ apparently turns it into a package
# from core import player corresponds to core/player.py
from core import player

# A class is like a blueprint for objects of that type
class Flowers(object):

	# The __init__ method is called when an object of class Flowers is created
	# Every method within the class has to take "self" as a parameter, but you
	# need to include "self" when calling the method.
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
			# As you can see, even though handle_input expects two parameters,
			# "self" and "input", we only give it one. "self" is automatically
			# added by the python interpreter
			self.handle_input(input)

	def set_up_game(self):
		# Here we assign the variable "player", a member of "self" to the value
		# of a new instance of the "Player" class, stored in the "player" module
		self.player = player.Player()
		self.player.pick_name()

# Create a new object from the class "Flowers" and store it in the variable
# "game"
game = Flowers()