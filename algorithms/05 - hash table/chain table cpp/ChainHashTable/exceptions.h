#ifndef EXCEPTIONS_H
#define EXCEPTIONS_H

#include <exception>
/*
template <class CurrentType, class NecessaryType>
class incorrect_key_type_exception : public std::exception
{
public:
    virtual const char* what() const noexcept
    {
        CurrentType curr;
        const char* current_type = typeid(curr).name();
        NecessaryType nec;
        const char* necessary_type = typeid(nec).name();

        std::string res = "Exception! Key type is " + curr +
                "It must be " + nec + "\n";
        return res;

        //return "Exception! Key type is incorrect! Type shall be integral\n";
    }
};
*/
#endif // EXCEPTIONS_H
