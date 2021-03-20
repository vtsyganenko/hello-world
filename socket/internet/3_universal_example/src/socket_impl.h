#pragma once

#include "socket.h"

#if defined(_WIN32)
	#include <winsock.h> // sockaddr_in
#endif
#if defined(__linux__) || defined(__APPLE__)
	#include <netinet/ip.h>
#endif

class Socket::Implementation
{
public:
	Implementation();
	~Implementation();

	bool isDescriptorValid();

	const Status& status();

	// "127.0.0.1" 60000
	void setSendingAddress(const std::string& address, uint16_t port);

	bool send(const std::vector<char>& data);

	bool bindToAddress(const std::string& address, uint16_t port);

	std::vector<char> blockOnReceiving();

private:
	void fillAddress(sockaddr_in& addressStruct, const std::string& addressString, const uint16_t port);

	Status m_status;
	int m_descriptior;
	char m_buffer[255];
	sockaddr_in m_send_addr;
	sockaddr_in m_bind_addr;
};