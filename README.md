# doorberry
voip doorbell (audio only) connected to an external asterisk server

Hardware: Radpberry PI B+ with wolfson sound card, 
	  MCP23017 I2C GPIO expander

Software: pjsip (https://github.com/pjsip/pjproject)

------------------------------------------------------------------
Specifically for the Wolfson Sound Card:

Instructions for the driver (kernels 4.9++), here:
https://www.horus.com/~hias/cirrus-driver.html

Create 3 files in modprobe.d, that contain:
1) blacklist rtl8192cu
2) blacklist rtl8xxxu
3) softdep arizona-spi pre: arizona-ldo1
------------------------------------------------------------------

To compile:
1) Create a <i>bin/</i> folder

2) Add a <i>credentials.h</i> file in <i>src/</i> with the asterisks user data:

<small>
#ifndef CREDENTIALS_H<br/>
#define CREDENTIALS_H<br/>
#define SIP_DOMAIN	"ASTERISK_ADDR"<br/>
#define SIP_USER	"USERNAME"<br/>
#define SIP_PASSWD	"********"<br/>
#endif<br/>
</small>


3) Add a <i>recipient.txt</i> in <i>bin/</i> with:
<small>
sip:TARGETUSER@ASTERISK_ADDR
</small>


Run: <i>make</i>
