class MyException(Exception):
    pass
class ArrayOperations:
    def __init__(self, list) -> None:
        self.list = list
        pass

    def element_at(self, index):
        if(type(index) == int):
            if(index < 0 or index > len(self.list)):
                raise MyException("Index not in range")
            else:
                return list[index]
        else:
            raise MyException("Only integers are allowed")

    def inclusive_range(self, start_pos, end_pos):
        if(start_pos < 0 or start_pos > len(self.list) or end_pos < 0 or end_pos > len(self.list) or end_pos < start_pos):
            raise MyException("Index not in range")
        else:
            for i in range(start_pos, end_pos):
                return list[start_pos:end_pos+1]

    def non_inclusive_range(self, start_pos, end_pos):
        if(start_pos < 0 or start_pos > len(self.list) or end_pos < 0 or end_pos > len(self.list) or end_pos < start_pos):
            raise MyException("Index not in range")
        else:
            return list[start_pos:end_pos]

    def start_and_length(self, start_pos, length):
        if(start_pos < 0 or start_pos > len(self.list) or length < 0 or length > len(self.list)):
            raise MyException("Index not in range")
        elif((start_pos+length) < len(self.list)):
            return list[start_pos:length+1]
        else:
            raise MyException("Length Out of Bound")


list = [9, 5, 1, 2, 3, 4, 0, -1]
index = 1
array_op = ArrayOperations(list)
print(array_op.element_at(index))
print(array_op.inclusive_range(1,3))
print(array_op.non_inclusive_range(1,3))
print(array_op.start_and_length(1,3))
