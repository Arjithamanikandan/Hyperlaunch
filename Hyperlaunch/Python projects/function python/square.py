def square_list(lst):
    return [num ** 2 for num in lst]
if __name__ == "__main__":
    sample_list = [1, 2, 3]
    print("Squared List:", square_list(sample_list))