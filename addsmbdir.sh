#!/bin/bash


if [[ $@ =~ -s\ ([^ ]+).* ]]; then
    sn=${BASH_REMATCH[1]}
fi

if [[ $@ =~ -p\ ([^ ]+).* ]]; then
    pa=${BASH_REMATCH[1]}
fi

if [[ $@ =~ -u\ ([^ ]+).* ]]; then
    vu=${BASH_REMATCH[1]}
fi

if [[ $@ =~ -w\ ([^ ]+).* ]]; then
    wl=${BASH_REMATCH[1]}
fi

if [ -z $sn ] || [ -z $pa ]; then
    echo ""
    echo "Create an entry of share directory"
    echo ""
    echo "  Add this entry to smb.conf"
    echo ""
    echo "USAGE"
    echo ""
    echo "  $ $0 -s sharename -p path [ -u validusers -w writelist]"
    echo ""
    echo "      -s : required."
    echo "      -p : required."
    echo "      -u : optional. (csv format)"
    echo "      -w : optional. (csv format)"
    echo ""
    exit 1
fi

echo ""
echo "[$sn]"
echo "path = $pa"
echo "valid users = $vu"
echo "read only = yes"
echo "writable = no"
echo "write list = $wl"
echo "guest ok = no"
echo "browsable = no"


