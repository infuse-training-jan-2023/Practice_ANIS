class A:
  def sum(self, a, b):
    return a + b


# test sum

def test_sum(mocker):
  mock = mocker.patch(__name__ + '.A.sum', return_value = 9)
  a = A()
  value = a.sum(2,2)
  print(value)
  assert value == 9
