#include "mysharedptr.h"

#include <iostream>

class MyClass {
public:
    MyClass(int id): m_id(id) { std::cout << "MyClass(" << m_id << ")" << std::endl; }
    ~MyClass() { std::cout << "~MyClass(" << m_id << ")" << std::endl; }

    void print() { std::cout << "MyClass id: " << m_id << std::endl; }
private:
    int m_id = 0;
};

int main(int argc, const char* argv[]) {
    std::cout << "begin" << std::endl;

    MySharedPtr<MyClass> p1( new MyClass(10) );
    std::cout << "p1 use_count " << p1.use_count() << std::endl;

    std::cout << "copy ctor" << std::endl;
    MySharedPtr<MyClass> p2(p1);
    std::cout << "p1 use_count " << p1.use_count() << std::endl;
    std::cout << "p2 use_count " << p2.use_count() << std::endl;

    std::cout << "p1->print()" << std::endl;
    p1->print();
    std::cout << "(*p2).print()" << std::endl;
    (*p2).print();
    std::cout << "temporary object is dead" << std::endl;

    std::cout << "move ctor" << std::endl;
    MySharedPtr<MyClass> p3(std::move(p2));
    std::cout << "p1 use_count " << p1.use_count() << std::endl;
    std::cout << "p2 use_count " << p2.use_count() << std::endl;
    std::cout << "p3 use_count " << p3.use_count() << std::endl;
    
    std::cout << "copy assignment" << std::endl;
    p2 = p3;
    std::cout << "p1 use_count " << p1.use_count() << std::endl;
    std::cout << "p2 use_count " << p2.use_count() << std::endl;
    std::cout << "p3 use_count " << p3.use_count() << std::endl;

    std::cout << "empty object " << std::endl;
    MySharedPtr<MyClass> p4;
    std::cout << "p4 use_count " << p4.use_count() << std::endl;
    
    std::cout << "move assignment" << std::endl;
    p4 = std::move(p3);
    std::cout << "p1 use_count " << p1.use_count() << std::endl;
    std::cout << "p2 use_count " << p2.use_count() << std::endl;
    std::cout << "p3 use_count " << p3.use_count() << std::endl;
    std::cout << "p4 use_count " << p4.use_count() << std::endl;
    
    std::cout << "end" << std::endl;
    return 0;
}
