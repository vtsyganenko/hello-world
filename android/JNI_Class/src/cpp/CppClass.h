#ifndef CPP_CLASS_H
#define CPP_CLASS_H

class CppClass {
public:
    CppClass();
    CppClass(int x, int y);

    void setX(int x);
    void setY(int y);
    int sum();

private:
    int _x{0};
    int _y{0};
};

#endif // CPP_CLASS_H