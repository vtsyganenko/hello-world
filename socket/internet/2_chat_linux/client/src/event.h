#ifndef EVENT_H
#define EVENT_H

#include <string>

enum class EventType
{
    MESSAGE,

};

struct Event
{
    EventType type;
    std::string data;
};

#endif // EVENT_H
