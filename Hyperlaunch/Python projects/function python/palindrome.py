def is_palindrome(s):
    reversed_string = s[::-1]
    if s == reversed_string:
        return True
    else:
        return False
print(is_palindrome("madam"))
