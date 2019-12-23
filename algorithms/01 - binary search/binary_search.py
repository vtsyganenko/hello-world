#!/usr/bin/python3

# binary search example

print("Input please an interval for numbers guessing")
print("From: ", end='')
try:
	num_from = int(input())
except ValueError:
	print("wrong value! exit...")
	exit(1)
print("To: ", end='')
try:
	num_to = int(input())
except ValueError:
	print("wrong value! exit...")
	exit(1)

if num_from >= num_to or num_to - num_from == 1:
	print("wrong interval: from", num_from, "to", num_to)
	print("exit...")
	exit(1)

print("from", num_from, "to", num_to)

while True:

	suppose = (num_to - num_from) // 2
	suppose = num_from + suppose

	print("please evaluate my supposition:", suppose)
	print("if you number is smaller, please \"-\"")
	print("if you number is bigger, please \"+\"")
	print("if you number is it, please \"ok\"")
	answer = input()

	#print(answer)

	if answer == "-":
		num_to = suppose
	elif answer == "+":
		num_from = suppose
	elif answer == "ok":
		print("Great! good bye")
		exit()
	else:
		print("please, re-try your answer")

	print()
	#print("step over, from", num_from, "to", num_to)
	#print()

	if num_to == num_from:
		print("you make a mistake!")
		exit(1)
