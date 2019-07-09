#ifndef COMMON_H
#define COMMON_H

#include <string>
#include <sys/socket.h>
#include <sys/un.h>

const int MESSAGE_SIZE = 50;

#include <iostream>

struct ClientInfo
{
    std::string name;
    struct sockaddr_un client_addr;
    socklen_t len;

    ClientInfo(): name(std::string())
    {
        memset(&client_addr, 0, sizeof(client_addr));
        len = sizeof(struct sockaddr_un);
    }

    ClientInfo(const ClientInfo& other)
    {
        //std::cout << "copy ctor" << std::endl;

        name = other.name;
        client_addr.sun_family = other.client_addr.sun_family;
        auto length = sizeof(client_addr.sun_path);
        strncpy(client_addr.sun_path, other.client_addr.sun_path, length-1);
        client_addr.sun_path[length-1] = '\0';
        len = other.len;

        std::cout << other.client_addr.sun_family << " " << client_addr.sun_family << std::endl;

        //std::cout << "other [" << other.client_addr.sun_path << "]" << std::endl;
        //std::cout << "ctored [" << client_addr.sun_path << "]" << std::endl;
    }

    ClientInfo& operator= (const ClientInfo& other)
    {
        if(&other == this) return *this;
        name = other.name;
        client_addr.sun_family = other.client_addr.sun_family;
        auto length = sizeof(client_addr.sun_path);
        strncpy(client_addr.sun_path, other.client_addr.sun_path, length-1);
        client_addr.sun_path[length-1] = '\0';
        len = other.len;
        return *this;
    }

    //ClientInfo(ClientInfo&& other) = default;

    bool operator==(const ClientInfo& other)
    {
        return (this->client_addr.sun_path == other.client_addr.sun_path);
    }
};

struct MessageInfo
{
    ClientInfo* sender;
    std::string msg;

    MessageInfo(ClientInfo* cl, std::string text): sender(cl), msg(text) {}
};

#endif // COMMON_H
