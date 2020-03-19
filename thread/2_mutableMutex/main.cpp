#include <iostream>
#include <mutex>

class A
{
  int value_;
  mutable std::mutex m_;

public:
  A() { value_ = 0; }
  A(int v) { value_ = v; }

  A& operator = (const A& other) {
    if(&other != this) {
      std::lock(this->m_, other.m_);
      std::lock_guard<std::mutex> lk1(this->m_, std::adopt_lock);
      std::lock_guard<std::mutex> lk2(other.m_, std::adopt_lock);

      value_ = other.value_;
    }
    return *this;
  }

  void print() {
    std::lock_guard<std::mutex> lk(m_);
    std::cout << "value is " << value_ << std::endl;
  }
};

int main()
{
  A obj1(10);
  A obj2(5);
  obj1.print();
  obj2.print();

  obj1 = obj2;

  obj1.print();
  obj2.print();
  return 0;
}
