#ifndef CLIENTBASE_H
#define CLIENTBASE_H

#include "common.h"

#include <vector>

// pool of connected clients
class ClientBase
{
public:
    ClientBase();
    ~ClientBase();

    // add a new client to base
    // return a ptr to already storaged client or new added client
    ClientInfo* add(const ClientInfo& client);

    std::vector<ClientInfo*> others(const ClientInfo& client);

    void deleteFrom(ClientInfo* info);

private:
    std::vector<ClientInfo*> clients_;
};

#endif // CLIENTBASE_H
