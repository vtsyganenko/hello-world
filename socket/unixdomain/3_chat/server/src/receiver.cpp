#include "receiver.h"

#include "messagequeue.h"
#include "clientbase.h"

#include <iostream>

Receiver::Receiver(const int &socket_fd, MessageQueue* queue, ClientBase *base, std::condition_variable &cv)
    : socket_(socket_fd), messages_(queue), clientsBase_(base), cv_(cv)
{
}

void Receiver::operator()()
{
    while(true)
    {
        ClientInfo client;
        char buf[MESSAGE_SIZE];

        memset(&buf, 0, sizeof(buf));
        auto receive_bytes = recvfrom(socket_, buf, sizeof(buf), 0,
                                     (struct sockaddr*)(&client.client_addr),
                                     &client.len);
        std::cout << "receive " << sizeof (buf) << " bytes, from "
                  << client.client_addr.sun_path << std::endl;
        if(receive_bytes < 1)
        {
            perror("receiver read error");
            continue;
        }

        std::cout << "recieve [" << buf << "]" << std::endl;

/*
        std::cout << "client " << client.client_addr.sun_path << std::endl;
        std::cout << "[" << client.name << std::endl;
        std::cout << "[" << client.client_addr.sun_family << std::endl;
        std::cout << "[" << client.client_addr.sun_path << std::endl;
        std::cout << "[" << client.len << std::endl;
*/
        ClientInfo* pClient = clientsBase_->add(client);
       /* std::cout << "p " << pClient << std::endl;

        std::cout << "[" << client.name << "] [" << pClient->name << "]" << std::endl;
        std::cout << "[" << client.client_addr.sun_family << "] [" << pClient->client_addr.sun_family << "]" << std::endl;
        std::cout << "[" << client.client_addr.sun_path << "] [" << pClient->client_addr.sun_path << "]" << std::endl;
        std::cout << "[" << client.len << "] [" << pClient->len << "]" << std::endl;

*/

        MessageInfo info(pClient, std::string(buf));
        messages_->push(info);

        //std::cout << "end cycle" << std::endl;
        cv_.notify_one();
        std::cout << "notifyed" << std::endl;
    }
}
