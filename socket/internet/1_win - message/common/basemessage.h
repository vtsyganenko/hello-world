#ifndef BASEMESSAGE_H
#define BASEMESSAGE_H

#include <stdint.h>
#include <vector>
#include <string>
#include <sstream>

#include <iostream>

struct BaseMessage
{
    uint8_t descriptor_;
    uint16_t payloadSize_;
    std::string payload_;

    BaseMessage() : descriptor_(0), payloadSize_(0) {}
    BaseMessage(uint8_t descr, const std::string& payload)
        : descriptor_(descr), payload_(payload) {
        //std::cout << "BaseMessage ctor " << descriptor_ << " " << payloadSize_ << " " << payload_ << std::endl;

        payloadSize_ = payload_.size();

        std::cout << "BaseMessage ctor " << descriptor_ << " " << payloadSize_ << " " << payload_ << std::endl;
    }

    std::string build()
    {
        std::cout << "build show" << std::endl;
        std::cout << "[" << descriptor_ << "]" << std::endl
                  << "[" << payloadSize_ << "]" << std::endl
                  << "[" << payload_ << "]" << std::endl;
        std::cout << "build end" << std::endl;

        std::ostringstream stream;
        stream << descriptor_ << " "
               << payloadSize_ << " "
               << payload_;
        std::cout << "build :[" << stream.str() << "]" << std::endl;
        return stream.str();
    }

    static BaseMessage parse(const std::string& data)
    {
        BaseMessage msg;
        std::istringstream stream;
        stream >> msg.descriptor_;
        stream >> msg.payloadSize_;
        stream >> msg.payload_;
        return msg;
    }
};

enum class MessageDescriptors : uint8_t
{
    TEXT = 1,
};

template<typename EnumType>
constexpr typename std::underlying_type<EnumType>::type
    toUnderlyingType(EnumType enumerator) noexcept
{
    return static_cast<typename std::underlying_type<EnumType>::type>(enumerator);
}

class TextMessage
{
public:
    TextMessage(const std::string& text) : text_(text)
    {
        text_.pop_back();
        text_.pop_back();
    }

    std::string get();

private:
    std::string text_;

};



#endif // BASEMESSAGE_H
