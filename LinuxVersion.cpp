#include <iostream>
#include <fstream>
#include <string>

int main() {
    std::fstream read_file("/proc/version", std::ios::in);
    if (!read_file.is_open()) {
        std::perror("error in opening /proc/version");
        return 1;
    }

    std::fstream write_file("LinuxVersion.txt", std::ios::out | std::ios::app);
    if (!write_file.is_open()) {
        std::perror("error in opening LinuxVersion.txt");
        return 1;
    }

    std::string line;
    while (std::getline(read_file, line)) {
        write_file << line << '\n';
    }

    read_file.close();
    write_file.close();

    return 0;
}