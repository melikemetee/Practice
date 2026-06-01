while True:
    print("\nSimple Calculator")

num1 = float(input("First number: "))
num2 = float(input("Second number: "))

print("Choose operation:")
print("+ Add")
print("- Subtract")
print("* Multiply")
print("/ Divide")

op = input("Operation: ")

if op == "+":
    print("Result:", num1 + num2)

elif op == "-":
    print("Result:", num1 - num2)

elif op == "*":
    print("Result:", num1 * num2)

elif op == "/":
    if num2 == 0:
        print("Cannot divide by zero!")
    else:
        print("Result:", num1 / num2)

else:
    print("Invalid operation")