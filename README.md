#VLESS-by-WNS-Team


https://github.com/EvgenyNerush/easy-xray/
curl -L https://codeload.github.com/EvgenyNerush/easy-xray/tar.gz/main | tar -xz


https://github.com/XTLS/Xray-install/
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install  #now


https://github.com/XTLS/Xray-core/ #orig




#Info about: 
https://github.com/XTLS/Xray-core/discussions/3518


#gui
https://github.com/MHSanaei/3x-ui
bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)			 	

#scan
https://github.com/XTLS/RealiTLScanner 

apt-get install fail2ban - setting IP-spam


#OS:
nano /etc/ssh/sshd_config
ufw allow <new_port>/tcp && ufw enable
ufw status numbered
ufw delete [rule_number]

sudo nano /etc/sysctl.conf
#Add:
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
#Save
sudo sysctl -p





apt update && apt upgrade -y && reboot
apt install docker.io docker-compose git curl bash openssl libghc-wai-app-static-dev -y
apt install mc htop nano -y # optional
cd /home/ && git clone https://github.com/MHSanaei/3x-ui.git && cd 3x-ui && git checkout v2.0.2 && docker-compose up -d

#WARP install (optional):
bash <(curl -sSL https://gist.githubusercontent.com/hamid-gh98/dc5dd9b0cc5b0412af927b1ccdb294c7/raw/install_warp_proxy.sh) -y

openssl req -x509 -newkey rsa:4096 -nodes -sha256 -keyout private.key -out public.key -days 3650  && docker cp private.key 3x-ui:private.key && docker cp public.key 3x-ui:public.key

#Connect:
ssh -L <LocalPort>:localhost:<port-3x> user@your_server_ip



#Gui-setting:
	#Site on http://IP_VDS:2053/
	#change login/password (default: admin/admin)
	#change port (default: 2053)
	#change start page (default: /)

	#WARP DNS:

	Domain: geosite:openai
	Domain: .com.ru, .exnet.su, .net.ru, .org.ru, .pp.ru, .ru, .ru.net, .su, abkhazia.su, adygeya.ru, adygeya.su, aktyubinsk.su, arkhangelsk.su, armenia.su, ashgabad.su, azerbaijan.su, balashov.su, bashkiria.ru, bashkiria.su, bir.ru, bryansk.su, bukhara.su, cbg.ru, chimkent.su, dagestan.ru, dagestan.su, east-kazakhstan.su, georgia.su, grozny.ru, grozny.su, ivanovo.su, jambyl.su, kalmykia.ru, kalmykia.su, kaluga.su, karacol.su, karaganda.su, karelia.su, khakassia.su, krasnodar.su, kurgan.su, kustanai.ru, kustanai.su, lenug.su, mangyshlak.su, marine.ru, mordovia.ru, mordovia.su, moscow, msk.ru, msk.su, murmansk.su, mytis.ru, nalchik.ru, nalchik.su, navoi.su, north-kazakhstan.su, nov.ru, nov.su, obninsk.su, penza.su, pokrovsk.su, pyatigorsk.ru, sochi.su, spb.ru, spb.su, tashkent.su, tatar, termez.su, togliatti.su, troitsk.su, tselinograd.su, tula.su, tuva.su, vladikavkaz.ru, vladikavkaz.su, vladimir.ru, vladimir.su, vologda.su, .xn--p1ai, .xn--d1acj3b, .xn--80adxhks, .xn--80asehdb, .xn--c1avg, .xn--p1acf, .xn--p1ai, .xn--80aswg, .ua, .by, .kz, .am, .az, .ge, .kg, .md, .tj, .uz, .tm

	#Punycode deploy:By http://github.com/aggyomfg/punycode-converter:
	punycode "1.рф" && punycode "1.дети" && punycode "1.москва" && punycode "1.онлайн" && punycode "1.орг" && punycode "1.рус" && punycode "1.рф" && punycode "1.сайт" :
		.xn--p1ai, .xn--d1acj3b, .xn--80adxhks, .xn--80asehdb, .xn--c1avg, .xn--p1acf, .xn--p1ai, .xn--80aswg 

	#and Украина: .ua, Беларусь: .by, Казахстан: .kz, Армения: .am, Азербайджан: .az, Грузия: .ge, Кыргызстан: .kg, Молдова: .md, Таджикистан: .tj, Узбекистан: .uz, Туркменистан: .tm
	

#Install and find dest service for HTTP/2, TLS 1.3 and X25519 :
	cd /home/ && git clone https://github.com/XTLS/RealiTLScanner.git && cd RealiTLScanner/ && apt install golang-go -y && go build && ./RealiTLScanner -addr IP_VDS -timeout 5 -thread 10 -out string.csv
#Check:
	curl -vI --tlsv1.3 --http2 https://example.com 2>&1 | grep -E "ALPN: server accepted h2|SSL connection using TLSv1.3|X25519"
	#or
	openssl s_client -connect example.com:443 -alpn h2,http/1.1 2>&1 | grep -E "ALPN: server accepted h2|New, TLSv1.3|Server Temp Key: X25519"
	#or
	xray tls ping google.com | grep -E 'TLS Version:.*TLS 1.3|TLS Post-Quantum key exchange:.*true \(X25519*' | sort -u  #!Without checking the HTTP protocol version	
	
	curl -vI --tlsv1.3 --http2 https://96.126.114.55 2>&1 | grep -E "ALPN: server accepted h2|SSL connection using TLSv1.3|X25519"


	#Location:
	curl -v example.com 2>&1 | grep  Location
	#or
	curl -v IP 2>&1 | grep  Location
	
	
	#time
	https://github.com/speedtestdemon/speed-tests
	curl -L -w "@curl-format.txt" -o tmp -s example.com

#Client Hello and Server Hello messages in cleartext. Following messages will be marked as Encrypted Handshake Messages (Example/Optional):
	openssl s_client -connect example.com:443 -tls1_3 -msg
	<<< TLS 1.3, Handshake [length 007a], ServerHello
	<<< TLS 1.2, RecordHeader [length 0005]
		14 03 03 00 01
	<<< TLS 1.2, RecordHeader [length 0005]
		17 03 03 14 5c
	<<< TLS 1.3, InnerContent [length 0001]
		16
	<<< TLS 1.3, Handshake [length 0006], EncryptedExtensions 
		08 00 00 02 00 00
	#"Encrypted Extensions" are the most important thing we need to find.



	
!!! #This can improve performance and privacy of the connection (optional):
	openssl s_client -connect www.google.com:443 -status | grep "OCSP Response Status: successful"	
	#or
	openssl s_client -connect www.google.com:443 -status | grep "OCSP response: no response sent"

	
!!! #RSA-sert > 3500+ byte (optional):	



nodash.org or 188.114.97.3
	curl -vI --tlsv1.3 --http2 https://nodash.org 2>&1 | grep -E "ALPN: server accepted h2|SSL connection using TLSv1.3|X25519"
	curl -v nodash.org 2>&1 | grep  Location
	curl -L -w "@curl-format.txt" -o tmp -s nodash.org
	openssl s_client -connect nodash.org:443 -tls1_3 -msg


#More info (optional):
	cd /home/ && git clone https://github.com/drwetter/testssl.sh.git && cd testssl.sh && ./testssl.sh https://example.com/ (or apt install testssl.sh)


bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install  && systemctl disable xray && service xray stop



