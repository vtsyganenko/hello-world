#include "receiver.h"

#include "messagequeue.h"
#include "clientbase.h"

#include <arpa/inet.h>

#include <iostream>

Receiver::Receiver(const int &socket_fd, MessageQueue* queue, ClientBase *base, std::condition_variable &cv)
    : socket_(socket_fd), messages_(queue), clientsBase_(base), cv_(cv)
{
}

void Receiver::operator()()
{
    char buf[MESSAGE_SIZE];
    while(true)
    {
        ClientInfo client;
        memset(&buf, 0, sizeof(buf));

//        auto receive_bytes = recvfrom(socket_, buf, sizeof(buf), 0,
//                                     (struct sockaddr*)(&client.client_addr),
//                                     &client.len);

        auto receive_bytes = recvfrom(socket_, buf, sizeof(buf), 0,
                                     (struct sockaddr*)(&client.client_addr),
                                     &client.len);
        if(receive_bytes < 1)
        {
            perror("receiver read error");
            continue;
        }

        std::cout << "new incoming message:" << std::endl;
        std::cout << "port " << ntohs(client.client_addr.sin_port) << " address " << inet_ntoa(client.client_addr.sin_addr) << std::endl;
        std::cout << "read " << receive_bytes << " bytes: [" << buf << "]" << std::endl;

        ClientInfo* pClient = clientsBase_->add(client);
        std::string message(buf);
        pClient->setNameByMessage(message);

        MessageInfo info(pClient, message);
        messages_->push(info);

        cv_.notify_one();
        std::cout << "notifyed" << std::endl;
    }
}
