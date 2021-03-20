#pragma once

#include <memory>
#include <string>
#include <vector>

class Socket : public std::enable_shared_from_this<Socket>
{
public:
	static std::shared_ptr<Socket> factory();

	class Implementation;

	struct Status {
		bool isActive{ false };
		bool isSendingAddressSet{ false };
		bool isBinded{ false };
	};

	Socket();
	~Socket();

	bool valid();
	const Status& status();

	struct Address {
		int8_t byte1;
		int8_t byte2;
		int8_t byte3;
		int8_t byte4;

		Address();
		std::string to_string() const;
	};

	void setSendingAddress(const Address& address, uint16_t port);
	void setSendingAddress(const std::string address, uint16_t port);

	bool send(const std::vector<char>& data);

	bool bindToAddress(const Address& address, uint16_t port);
	bool bindToAddress(const std::string& address, uint16_t port);

	std::vector<char> blockOnReceiving();

private:
	std::unique_ptr<Implementation> impl;
};
