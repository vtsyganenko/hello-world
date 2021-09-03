#include "socket_impl.h"

#if defined(__linux__) || defined(__APPLE__)
    #include <string.h>
    #include <arpa/inet.h>
    #include <unistd.h>
#endif

bool Socket::Implementation::winInit() {
    #if defined(_WIN32)
        WSADATA wsaData;
        if (WSAStartup(MAKEWORD(2, 0), &wsaData) != 0) {
            return false;
        }
    #endif
    return true;
}

int Socket::Implementation::winCleanup() {
    #if defined(_WIN32)
        return WSACleanup();
    #endif
    return 0;
}

Socket::Implementation::Implementation() {
    m_descriptior = socket(AF_INET, SOCK_DGRAM, 0);
    memset(&m_send_addr, 0, sizeof(m_send_addr));
    memset(&m_bind_addr, 0, sizeof(m_bind_addr));
    m_status.isActive = isDescriptorValid();
}

Socket::Implementation::~Implementation() {
	#if defined(_WIN32)
        closesocket(m_descriptior);
    #endif
    #if defined(__linux__) || defined(__APPLE__)
        close(m_descriptior);
    #endif
}

bool Socket::Implementation::isDescriptorValid() {
    #if defined(_WIN32)
        return m_descriptior != INVALID_SOCKET;
    #endif
    #if defined(__linux__) || defined(__APPLE__)
        return m_descriptior != -1;
    #endif
}

const Socket::Status& Socket::Implementation::status()
{
    return m_status;
}

void Socket::Implementation::setSendingAddress(const std::string& address, uint16_t port) {
    fillAddress(m_send_addr, address, port);
}

bool Socket::Implementation::send(const std::vector<char>& data) {
    int bytesToSend = data.size();
    int sentBytes{ 0 };
    if ((sentBytes = sendto(m_descriptior, data.data(), bytesToSend, 0,
        (struct sockaddr*)&m_send_addr, sizeof(m_send_addr))) != bytesToSend)
    {
        return false;
    }
    return true;
}

bool Socket::Implementation::bindToAddress(const std::string& address, uint16_t port) {
    fillAddress(m_bind_addr, address, port);
    int result = bind(m_descriptior, (struct sockaddr*)&m_bind_addr, sizeof(m_bind_addr));
    if (result == -1) {
        memset(&m_bind_addr, 0, sizeof(m_bind_addr));
        return false;
    }
    return true;
}

std::vector<char> Socket::Implementation::blockOnReceiving() {
    sockaddr_in client_addr;
    memset(&client_addr, 0, sizeof(client_addr));
    int client_len{ 0 };

    memset(&m_buffer, 0, sizeof(m_buffer));

    std::vector<char> message;
    int readingSize{ 0 };
    if( (readingSize = recvfrom(m_descriptior, m_buffer, sizeof(m_buffer), 0, nullptr, nullptr)) > 0)
    {
        message.reserve(readingSize);
        message.assign(m_buffer, m_buffer + readingSize);
        return message;
    }
    return message;
}

void Socket::Implementation::fillAddress(sockaddr_in& addressStruct, const std::string& addressString, const uint16_t port) {
    memset(&addressStruct, 0, sizeof(addressStruct));
    addressStruct.sin_family = AF_INET;
    addressStruct.sin_addr.s_addr = inet_addr(addressString.c_str());
    addressStruct.sin_port = htons(port);
}
