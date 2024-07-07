#ifndef MY_SHARED_PTR_H
#define MY_SHARED_PTR_H

#include <stdint.h>

template<typename T>
class MySharedPtr {
private:
    struct ControlBlock {
        uint64_t owners;
        // weak counter
        // deleter
        // allocator
    };

    T* ptr = nullptr;
    ControlBlock* block = nullptr;

public:
    MySharedPtr() {}
    MySharedPtr(T* p): ptr(p) {
        block = new ControlBlock;
        block->owners = 1;
    }
    MySharedPtr(const MySharedPtr& other) {
        ptr = other.ptr;
        block = other.block;
        if(block) {
            block->owners++;
        }
    }
    MySharedPtr(MySharedPtr&& other) {
        ptr = other.ptr;
        block = other.block;
        other.ptr = nullptr;
        other.block = nullptr;
    }

    MySharedPtr& operator = (const MySharedPtr& other) {
        if(this != &other) {
            // get rid of the previous one
            if(block) {
                if(block->owners == 1) {
                    if(ptr) delete ptr;
                    delete block;
                }
                else {
                    block->owners--;
                }
            } else {
                // emergency case
                if(ptr) delete ptr;
            }

            // assign the new one
            ptr = other.ptr;
            block = other.block;
            if(block) {
                block->owners++;
            }
        }
        return *this;
    }

    MySharedPtr& operator = (MySharedPtr&& other) {
        if(this != &other) {
                        // get rid of the previous one
            if(block) {
                if(block->owners == 1) {
                    if(ptr) delete ptr;
                    delete block;
                }
                else {
                    block->owners--;
                }
            } else {
                // emergency case
                if(ptr) delete ptr;
            }

            // assign the new one
            ptr = other.ptr;
            block = other.block;
            other.ptr = nullptr;
            other.block = nullptr;
        }
        return *this;
    }

    int use_count() {
        return block ? block->owners : 0;
    }

    T* operator -> () {
        return ptr;
    }

    T operator * () {
        return *ptr;
    }

    ~MySharedPtr() {
        if(block) {
            if(block->owners == 1) {
                if(ptr) delete ptr;
                delete block;
            }
            else {
                block->owners--;
            }
        } else {
            // emergency case
            if(ptr) delete ptr;
        }
    }

};

#endif // MY_SHARED_PTR_H
