#include "basemessage.h"

std::string TextMessage::get()
{
    std::cout << "get: " << toUnderlyingType(MessageDescriptors::TEXT)
              << " " << text_ << std::endl;
    uint8_t data = (int) toUnderlyingType(MessageDescriptors::TEXT);
    std::cout << "data (" << data << ")" << std::endl;
    BaseMessage msg(/*toUnderlyingType(MessageDescriptors::TEXT)*/ 12, text_);
    return msg.build();
}
