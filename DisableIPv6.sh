#!/bin/bash
# Get all Network services
services=$(networksetup -listallnetworkservices | tail -n +2 | grep -v "*")

# Fix array so each space in the network service is not its own array element
IFS=$'\n' read -r -d '' -a services_array <<< "$services"

# For loop to disable IPv6 on all detected Network services
for service in "${services_array[@]}"; do
    echo "Disabling IPv6 on $service"
    networksetup -setv6off "$service"
done