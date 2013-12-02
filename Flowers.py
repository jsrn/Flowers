def print_banner():
	print ".----------------------------- FLOWERS -----------------------------."
	print "|                   A(n) ORG_NAME_HERE Adventure                    |"
	print "|          dot|not           ToxicVenom             jsrn            |"
	print "`-------------------------------------------------------------------'"

def handle_input(input):
	print input

# set up world/player objects

print_banner()

# enter game loop
while True:
	input = raw_input("> ")
	handle_input(input)