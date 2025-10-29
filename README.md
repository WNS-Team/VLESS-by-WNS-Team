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
apt update && apt upgrade -y && reboot
apt install docker.io docker-compose git curl bash openssl libghc-wai-app-static-dev -y
apt install mc htop nano -y # optional
cd /home/ && git clone https://github.com/MHSanaei/3x-ui.git && cd 3x-ui && git checkout v2.0.2 && docker-compose up -d

# without forcing
bash <(curl -sSL https://gist.githubusercontent.com/hamid-gh98/dc5dd9b0cc5b0412af927b1ccdb294c7/raw/install_warp_proxy.sh)

# force reinstall without confirmation
bash <(curl -sSL https://gist.githubusercontent.com/hamid-gh98/dc5dd9b0cc5b0412af927b1ccdb294c7/raw/install_warp_proxy.sh) -f

# accept default values
bash <(curl -sSL https://gist.githubusercontent.com/hamid-gh98/dc5dd9b0cc5b0412af927b1ccdb294c7/raw/install_warp_proxy.sh) -y

openssl req -x509 -newkey rsa:4096 -nodes -sha256 -keyout private.key -out public.key -days 3650  && docker cp private.key 3x-ui:private.key && docker cp public.key 3x-ui:public.key


#gui
http://111.111.111.111:2053/
#change login/password (default: admin/admin)
#change port (default: 2053)
#change start page (default: /)


#WARP DNS:

#Default
geosite:openai

 .com.ru, .exnet.su, .net.ru, .org.ru, .pp.ru, .ru, .ru.net, .su, abkhazia.su, adygeya.ru, adygeya.su, aktyubinsk.su, arkhangelsk.su, armenia.su, ashgabad.su, azerbaijan.su, balashov.su, bashkiria.ru, bashkiria.su, bir.ru, bryansk.su, bukhara.su, cbg.ru, chimkent.su, dagestan.ru, dagestan.su, east-kazakhstan.su, georgia.su, grozny.ru, grozny.su, ivanovo.su, jambyl.su, kalmykia.ru, kalmykia.su, kaluga.su, karacol.su, karaganda.su, karelia.su, khakassia.su, krasnodar.su, kurgan.su, kustanai.ru, kustanai.su, lenug.su, mangyshlak.su, marine.ru, mordovia.ru, mordovia.su, moscow, msk.ru, msk.su, murmansk.su, mytis.ru, nalchik.ru, nalchik.su, navoi.su, north-kazakhstan.su, nov.ru, nov.su, obninsk.su, penza.su, pokrovsk.su, pyatigorsk.ru, sochi.su, spb.ru, spb.su, tashkent.su, tatar, termez.su, togliatti.su, troitsk.su, tselinograd.su, tula.su, tuva.su, vladikavkaz.ru, vladikavkaz.su, vladimir.ru, vladimir.su, vologda.su, .xn--p1ai, .xn--d1acj3b, .xn--80adxhks, .xn--80asehdb, .xn--c1avg, .xn--p1acf, .xn--p1ai, .xn--80aswg, .ua, .by, .kz, .am, .az, .ge, .kg, .md, .tj, .uz, .tm

#Punycode deploy:By http://github.com/aggyomfg/punycode-converter:
punycode "1.рф" && punycode "1.дети" && punycode "1.москва" && punycode "1.онлайн" && punycode "1.орг" && punycode "1.рус" && punycode "1.рф" && punycode "1.сайт" :
	.xn--p1ai, .xn--d1acj3b, .xn--80adxhks, .xn--80asehdb, .xn--c1avg, .xn--p1acf, .xn--p1ai, .xn--80aswg 

#and Украина: .ua, Беларусь: .by, Казахстан: .kz, Армения: .am, Азербайджан: .az, Грузия: .ge, Кыргызстан: .kg, Молдова: .md, Таджикистан: .tj, Узбекистан: .uz, Туркменистан: .tm