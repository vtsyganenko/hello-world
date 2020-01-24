#ifndef EXCEPTIONS_H
#define EXCEPTIONS_H

#include <exception>

class incorrect_key_type_exception : public std::exception
{
public:
    virtual const char* what() const noexcept
    {
        return "Key type is incorrect! Type shall be integral\n";
    }
};

#endif // EXCEPTIONS_H
