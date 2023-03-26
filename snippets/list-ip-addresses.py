#!/usr/bin/env python

import ipaddress

import netifaces


def get_all_ips():
    """
    Find all IPs for this machine.

    :return: ``set`` of IP addresses (``IPAddress``).
    """
    ips = set()
    interfaces = netifaces.interfaces()
    for interface in interfaces:
        addresses = netifaces.ifaddresses(interface)
        for address_family in (netifaces.AF_INET, netifaces.AF_INET6):
            family_addresses = addresses.get(address_family)
            if not family_addresses:
                continue
            for address in family_addresses:
                ips.add(ipaddress.ip_address(address["addr"]))
    return ips


print(get_all_ips())
