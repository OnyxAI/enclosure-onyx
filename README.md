# Onyx 0.1

The Picroft project is an enclosure for a stock Raspberry Pi connected to a speaker and basic USB microphone.  This is built around a Raspbian Jessie Lite installation.  The entire project is available as a pre-built micro-SD image ready to be burned and placed into a Raspberry Pi.  You can download the pre-built image here:


# Requirements

* Raspberry Pi 3
* MicroSD Card (4 GB or larger)
* Any analog speaker
* USB Microphone.  Tested with CM108-based microphones.

# Usage

Upon boot, Onyx will search for open wifi networks or an Ethernet connection.  If neither is found, the Wifi Setup process will begin to get the device connected to any available network.

After that, you can simply speak to Onyx as you would to any Onyx implementation.

# Versions

* 0.1 - Original image

# Help and more info
- Wiki [here](https://github.com/OnyxProject/enclosure-onyx/wiki).  
- Website [Documentation](https://onyxlabs.fr/).

# There are two scripts run on startup
* `audio_setup.sh` configures your specific audio setup.
* `custom_setup.sh` is a stub meant to initialize any other IoT devices or services you might need like a DLNA server or syslog for example.
