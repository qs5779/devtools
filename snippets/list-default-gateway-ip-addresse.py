#!/usr/bin/env python

import pprint
import re

import netifaces
import psutil


# get Neti Info
def getNetiInfo():
    result = []
    neti_dict = psutil.net_if_addrs()
    for neti in neti_dict:
        ipv4_ip = ""
        ipv6_ip = ""
        ipv4_netmask = ""
        ipv6_netmask = ""
        mac = ""

        snic_list = neti_dict[neti]
        for snic in snic_list:
            if snic.family.name == "AF_INET":
                ipv4_ip = snic.address
                ipv4_netmask = snic.netmask

            elif snic.family.name == "AF_INET6":
                ipv6_ip = re.sub("%.*$", "", snic.address)
                ipv6_netmask = snic.netmask

            elif snic.family.name == "AF_PACKET":
                mac = snic.address

        result.append([neti, ipv4_ip, ipv6_ip, ipv4_netmask, ipv6_netmask, mac])

    return result


def getDefaultGateway():
    result = {}
    gateway, neti = netifaces.gateways()["default"][netifaces.AF_INET]
    result[neti] = gateway

    return result


pp = pprint.PrettyPrinter(indent=4)
pp.pprint(getDefaultGateway())
pp.pprint(getNetiInfo())
