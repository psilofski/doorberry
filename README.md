# doorberry
voip doorbell (audio only) connected to an external asterisk server

Hardware: Radpberry PI B+ with wolfson sound card, 
	  MCP23017 I2C GPIO expander

Software: pjsip (https://github.com/pjsip/pjproject)

------------------------------------------------------------------
Specifically for the Wolfson Sound Card:

Instructions for the driver (kernels 4.9++), here:
https://www.horus.com/~hias/cirrus-driver.html

In modprobe.d:
blacklist rtl8192cu
blacklist rtl8xxxu
softdep arizona-spi pre: arizona-ldo1
------------------------------------------------------------------
