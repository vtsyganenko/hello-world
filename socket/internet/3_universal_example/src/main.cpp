#include "socket.h"

#include <iostream>
#include <thread>
#include <mutex>
#include <sstream>

// printing functor
class Print
{
public:
	explicit Print(const std::string& threadName) : m_threadName(threadName) {}
	void operator () (const std::string& message) {
		std::lock_guard<std::mutex> lock(mtx);
		std::cout << std::this_thread::get_id() << " [" << m_threadName << "] " << message << std::endl;
	}

private:
	std::string m_threadName;

	static std::mutex mtx;
};

// static
std::mutex Print::mtx;

void initRandom() {
	srand(time(NULL));
}

int getRandom(int from, int to) {
	return rand() % to + from;
}

//-------------------------------------------------------------------------------------------------

// thread_A
// send to 65000
// bind to 65001
// thread B
// send to 65001
// bind to 65000

// generate 10 random values
// send them to thread B in message "value is .."
// receive 10 processed values
// check that they are square of initial values
void thread_A()
{
	Print print("thread_A");
	print("started");

	// generate random data
	std::vector<int> data(10, 0);
	for (size_t i = 0; i < data.size(); ++i) {
		data[i] = getRandom(0, 100);
	}

	// print data
	std::stringstream ss;
	ss << "have prepared data: ";
	for (int value : data) {
		ss << std::to_string(value) << " ";
	}
	print(ss.str());

	auto socket = Socket::factory();
	if (socket) {
		// set address to send
		socket->setSendingAddress("127.0.0.1", 65000);
		
		// bind
		if (!socket->bindToAddress("127.0.0.1", 65001)) {
			print("bind fail");
			return;
		}

		// send 10 values
		for (size_t i = 0; i < data.size(); ++i) {
			std::string message{ "value is " + std::to_string(data[i]) };
			socket->send(std::vector<char>{message.begin(), message.end()});
			
			std::string info{ "send " + std::to_string(message.size()) + " bytes: [" + message + "]" };
			print(info);
		}

		// receive 10 values
		std::vector<int> receive_values;
		while (true) {
			std::vector<char> data = socket->blockOnReceiving();
			if (!data.empty()) {
				int received_size = data.size();
				data.push_back('\0');
				std::string message{ data.data() };

				std::string text{ "received " + std::to_string(received_size) + " bytes: [" + message + "]" };
				print(text);

				// parse value from message
				auto n = message.rfind(' ');
				if (n != std::string::npos) {
					std::string value{ message.substr(n) };
					receive_values.push_back(std::stoi(value));
				}

				if (receive_values.size() == 10) break;
			}
		}

		// check
		print("let's check results:");
		for (size_t i = 0; i < data.size(); ++i) {
			std::string status;
			int date_square = data[i] * data[i];
			if (date_square == receive_values[i]) {
				status = " ok";
			}
			else {
				status = " error";
			}
			std::string text{ "value " + std::to_string(data[i]) + " square " + std::to_string(receive_values[i]) + status };
			print(text);
		}

	}
	else {
		print("socket is not created");
	}
	print("finished");
}

//-------------------------------------------------------------------------------------------------

// receive 10 values
// process them: value*value
// send 10 'squares'
void thread_B()
{
	Print print("thread_B");
	print("started");

	auto socket = Socket::factory();
	if (socket) {
		// set address to send
		socket->setSendingAddress("127.0.0.1", 65001);

		// bind
		if (!socket->bindToAddress("127.0.0.1", 65000)) {
			print("bind fail");
			return;
		}

		// receive 10 values
		std::vector<int> receive_values;
		while (true) {
			std::vector<char> data = socket->blockOnReceiving();
			if (!data.empty()) {
				int received_size = data.size();
				data.push_back('\0');
				std::string message{ data.data() };

				std::string text{ "received " + std::to_string(received_size) + " bytes: [" + message + "]" };
				print(text);

				// parse value from message
				auto n = message.rfind(' ');
				if (n != std::string::npos) {
					std::string value{ message.substr(n) };
					receive_values.push_back(std::stoi(value));
				}

				if (receive_values.size() == 10) break;
			}
		}

		// process values
		for (auto& val : receive_values) {
			val = val * val;
		}
		print("made calculations");

		// send 10 values
		for (size_t i = 0; i < receive_values.size(); ++i) {
			std::string message{ "square is " + std::to_string(receive_values[i]) };
			socket->send(std::vector<char>{message.begin(), message.end()});

			std::string info{ "send " + std::to_string(message.size()) + " bytes: [" + message + "]" };
			print(info);
		}
	}
	else {
		print("socket is not created");
	}
	print("finished");
}

//-------------------------------------------------------------------------------------------------

int main()
{
	initRandom();
    if(!Socket::winInit()) {
        std::cout << "socket init failed" << std::endl;
    }

	std::thread t1(thread_A);
	std::thread t2(thread_B);

	t1.join();
	t2.join();

    std::cout << "cleanup: " << Socket::winCleanup() << std::endl;
	return 0;
}
