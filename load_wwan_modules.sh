#!/bin/bash
echo "Detecting WWAN card..."
WWAN_VID=$(lsusb | grep -oP "(2c7c|1199|12d1|2cb7|1bc7)")
if [ -n "$WWAN_VID" ]; then
    case $WWAN_VID in
        "2c7c") modprobe qmi_wwan && modprobe cdc_mbim && echo "Loaded modules for Quectel WWAN";;
        "1199") modprobe qmi_wwan && echo "Loaded modules for Sierra Wireless WWAN";;
        "12d1") modprobe option && modprobe usbserial && echo "Loaded modules for Huawei WWAN";;
        "2cb7") modprobe qmi_wwan && modprobe cdc_mbim && echo "Loaded modules for Fibocom WWAN";;
        "1bc7") modprobe qmi_wwan && modprobe cdc_mbim && echo "Loaded modules for Telit WWAN";;
        *) echo "Unknown WWAN card detected";;
    esac
else
    echo "No WWAN card detected"
fi
