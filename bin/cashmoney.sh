#!/bin/sh


echo ""
sudo nmap -sS -O $1
echo ""
sudo nmap -v $1
echo ""
