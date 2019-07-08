#ifndef CLIENTBASE_H
#define CLIENTBASE_H

#include "common.h"

#include <vector>

class ClientBase
{
public:
    ClientBase();
    ~ClientBase();

    ClientInfo* add(const ClientInfo& client);

    std::vector<ClientInfo*> others(const ClientInfo& client);

    void deleteFrom(ClientInfo* info);

private:
    std::vector<ClientInfo*> clients_;
};

#endif // CLIENTBASE_H
