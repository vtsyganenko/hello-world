#include "socket.h"

#include "socket_impl.h"

#include <sstream>

std::shared_ptr<Socket> Socket::factory() {
	std::shared_ptr<Socket> object = std::make_shared<Socket>();
	if (object->valid()) {
		return object;
	}
	return nullptr;
}

Socket::Socket() {
	impl = std::make_unique<Implementation>();
}

Socket::~Socket() {
	// ...
}

bool Socket::valid() {
	return impl->isDescriptorValid();
}

const Socket::Status& Socket::status() {
	return impl->status();
}

Socket::Address::Address() : byte1(0), byte2(0), byte3(0), byte4(0) {
}

std::string Socket::Address::to_string() const {
	std::stringstream ss;
	ss << std::to_string(byte1) << "." << std::to_string(byte2) << "."
	   << std::to_string(byte3) << "." << std::to_string(byte4);
	return ss.str();
}

void Socket::setSendingAddress(const Socket::Address& address, uint16_t port) {
	setSendingAddress(address.to_string(), port);
}

void Socket::setSendingAddress(const std::string address, uint16_t port) {
	impl->setSendingAddress(address, port);
}

bool Socket::send(const std::vector<char>& data) {
	return impl->send(data);
}

bool Socket::bindToAddress(const Address& address, uint16_t port) {
	return bindToAddress(address.to_string(), port);
}

bool Socket::bindToAddress(const std::string& address, uint16_t port) {
	return impl->bindToAddress(address, port);
}

std::vector<char> Socket::blockOnReceiving() {
	return impl->blockOnReceiving();
}
