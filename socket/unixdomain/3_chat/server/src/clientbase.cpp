#include "clientbase.h"

#include <algorithm>
#include <iostream>

ClientBase::ClientBase()
{
    clients_.clear();
}

ClientBase::~ClientBase()
{
    for(auto elem : clients_)
    {
        ClientInfo* p = elem;
        delete p;
        elem = nullptr;
    }
}

ClientInfo *ClientBase::add(const ClientInfo &client)
{
    //std::cout << "ClientBase::add" << std::endl;
    //std::cout << "clients base size " << clients_.size() << std::endl;

    auto result = std::find_if(clients_.begin(), clients_.end(),
    [&client](ClientInfo* elem)
    {
        int res = strcmp(elem->client_addr.sun_path, client.client_addr.sun_path);
        //std::cout << "strcmp " << res << std::endl;
        return (res == 0);
    });

    if(result != clients_.end())
    {
        //std::cout << "found!" << std::endl;
        return *result;
    }
    else
    {
        // std::cout << "not found!" << std::endl;
        ClientInfo* pc = new ClientInfo(client);
        std::cout << "push client [" << pc->client_addr.sun_path
                  << "] to client base" << std::endl;
        clients_.push_back(pc);
        return pc;
    }
}

std::vector<ClientInfo *> ClientBase::others(const ClientInfo &client)
{
    //std::cout << "clients size " << clients_.size() << std::endl;
    auto vec = clients_;
    auto newEnd = std::remove(vec.begin(), vec.end(), &client);
    vec.erase(newEnd, vec.end());

    //std::cout << "others size " << vec.size() << std::endl;
    return vec;
}

void ClientBase::deleteFrom(ClientInfo *info)
{
    //std::cout << "before remove size " << clients_.size() << std::endl;
    auto newEnd = std::remove_if(clients_.begin(), clients_.end(),
    [&info](ClientInfo* elem)
    {
        int res = strcmp(elem->client_addr.sun_path, info->client_addr.sun_path);
        //std::cout << "strcmp " << res << std::endl;
        return (res == 0);
    });
    clients_.erase(newEnd, clients_.end());
    //std::cout << "after remove size " << clients_.size() << std::endl;
}
