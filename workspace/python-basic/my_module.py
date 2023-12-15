data = 100

def my_mean(*v):
    return sum(v) / len(v)

class Person:
    def __init__(self, name, email):
        self.name = name
        self.email = email

    def display(self):
        print(self.name, self.email)

if __name__ == "__main__": # python my_module.py 방식으로 실행했을 때 True ( import my_module 할때는 False )
    print("my_module입니다")
    # pass