import sys
import os
sys.path.append("/home/pi/onyx")
from onyx.sockyx.client.ws import WebsocketClient
from onyx.sockyx.message import Message

if len(sys.argv) == 2:
    messageToSend = sys.argv[1]
elif len(sys.argv) > 2:
    messageToSend = " ".join(sys.argv[2:])
else:
    filename = os.path.basename(__file__)
    print (filename)
    print ("Simple command line interface to the messagebus.")
    print ("Usage:   sockyx <utterance>\n")
    print ("         where <utterance> is treated as if spoken to Onyx.")
    print ("Example: " + filename + " onyx.wifi.start")
    exit()


def onConnected(event=None):
    print ("Sending message...'" + messageToSend + "'")
    sockyx.emit(Message(messageToSend))
    sockyx.close()
    exit()


# Establish a connection with the messagebus
sockyx = WebsocketClient()
sockyx.on('connected', onConnected)


# This will block until the client gets closed
sockyx.run_forever()
