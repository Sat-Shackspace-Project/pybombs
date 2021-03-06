#!/bin/bash
clear

echo "----------------------------------------"
echo "                                        "
echo "        {[   Evilzone Network   ]}      "
echo "                                        "
echo "                  Welcome               "
echo "                                        "
echo "----------------------------------------"
sleep 1

configuring()
{
echo ""
echo -n "Username for GIT access? : "
read gituser1
echo ""
echo -n "Where do you want gnuradio to be installed at? Example - /root/Desktop/gnuradio : "
read prefix1
echo ""
echo -n "Do you want gnuradio to install from source, deb package or both? Example - deb,src : "
read satisfy1
echo ""
echo -n "Time the monitor thread waits (in seconds) before retrying downloads - Best time is 30 : "
read time1

touch config.dat
echo "[config]" > config.dat
echo "gituser = $gituser1" >> config.dat
echo "prefix = $prefix1" >> config.dat
echo "satisfy_order = $satisfy1"  >> config.dat
echo "timeout = $time1" >> config.dat
echo "cmakebuildtype = RelWithDebInfo" >> config.dat
}

if [ ! -f ./config.dat ]; then
	echo "config.dat does not exist! continuing"
	sleep 3
	configuring
fi

./pybombs install gnuradio
