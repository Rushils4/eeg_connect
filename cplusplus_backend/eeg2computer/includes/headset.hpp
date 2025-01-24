/**
 * @file headset.hpp
 * @author Rushil Shah (rushils4@illinois.edu) (shahrushil520@gmail.com)
 * @brief 
 * @version 0.1
 * @date 2025-01-12
 * 
 * @copyright Copyright (c) 2025
 * 
 */

#ifndef HEADSET_HPP
#define HEADSET_HPP

#include "channel.hpp"
#include "bluetoothserialport.hpp"

#include <map>

class Headset {
    public:
        Headset() = default;

    private:
        DeviceINQ connection_details;
        std::map<std::string, Channel*> channels;
};

#endif