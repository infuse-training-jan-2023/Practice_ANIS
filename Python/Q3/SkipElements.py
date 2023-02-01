class MyException(Exception):
    pass

class SkipElement:
    def __init__(self, list) -> None:
        self.list = list
        pass

    def skip_sports(self, skip_no):
        if( not type(skip_no) == int or skip_no > len(self.list) or skip_no <= 0):
            raise MyException("invalid skip_no")
        else:
            for i in self.list:
                return self.list[skip_no:len(self.list)]


sports = ['Cricket', 'TT', 'Football', 'Hockey']
skip_ele = SkipElement(sports)
print(skip_ele.skip_sports(1))
