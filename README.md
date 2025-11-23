#VLESS-by-WNS-Team


https://github.com/EvgenyNerush/easy-xray/
curl -L https://codeload.github.com/EvgenyNerush/easy-xray/tar.gz/main | tar -xz


https://github.com/XTLS/Xray-install/
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install  #now


https://github.com/XTLS/Xray-core/ #orig




#Info about: 
https://github.com/XTLS/Xray-core/discussions/3518


#gui +
https://github.com/MHSanaei/3x-ui
bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh):
19 - SSL
 	



#scan
https://github.com/XTLS/RealiTLScanner 

apt-get install fail2ban - setting IP-spam


#OS:
nano /etc/ssh/sshd_config
ufw allow <new_port_xray>/tcp && ufw enable
ufw allow <port_for_gRPC>/tcp && ufw enable
ufw allow 443/tcp && ufw enable

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
#wget -N https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh && bash menu.sh

#Add cloudflare gpg key
curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg

#Add this repo to your apt repositories
echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list

#Install
sudo apt-get update && sudo apt-get install cloudflare-warp

#Settings
warp-cli registration new && warp-cli mode proxy && warp-cli connect

openssl req -x509 -newkey rsa:4096 -nodes -sha256 -keyout private.key -out public.key -days 3650  && docker cp private.key 3x-ui:private.key && docker cp public.key 3x-ui:public.key
openssl req -new -newkey rsa:2048 -nodes -keyout your_private_key.key -out your_domain.csr


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

#Fail2Ban!!!???
#BBR!!!!????

#NGINX:

openssl req -x509 -newkey rsa:4096 -nodes -sha256 -keyout /etc/ssl/private/ssl-cert-snakeoil.key -out /etc/ssl/certs/ssl-cert-snakeoil.pem -days 3650 -subj "/CN=YOUR_DOMAIN_GOES HERE"
openssl req -out CSR.csr -new -newkey rsa:4096 -keyout privatekey.key

#Masking(persistent, т. е. запихнуть в rc.local, сервис systemd или куда‑нибудь ещё.):
iptables -t nat -A PREROUTING -i eth0 -p udp --dport 443 -j DNAT --to-destination <IP>:443
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT --to-destination <IP>:80

curl -X PATCH "https://api.cloudflare.com/client/v4/zones/ID_ZONE/settings/ech" -H "X-Auth-Key: YOUR_GLOBAL_API_KEY" -H "X-Auth-Email: YOUR_EMAIL" -H "Content-Type: application/json" --data '{"id":"ech","value":"off"}'


nodash.org or 188.114.97.3
	curl -vI --tlsv1.3 --http2 https://nodash.org 2>&1 | grep -E "ALPN: server accepted h2|SSL connection using TLSv1.3|X25519"
	curl -v nodash.org 2>&1 | grep  Location
	curl -L -w "@curl-format.txt" -o tmp -s nodash.org
	openssl s_client -connect nodash.org:443 -tls1_3 -msg


#More info (optional):
	cd /home/ && git clone https://github.com/drwetter/testssl.sh.git && cd testssl.sh && ./testssl.sh https://example.com/ (or apt install testssl.sh)


bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install  && systemctl disable xray && service xray stop


openssl rand -hex 8


curl ifconfig.me
