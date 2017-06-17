#! /usr/bin/env python
b='\\';g='"';p='%';s="b='%s%s';g='%s';p='%s';s=%s%s%s;print s%s(b,b,g,p,g,s,g,p)";print s%(b,b,g,p,g,s,g,p)