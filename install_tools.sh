#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade

#requirements tools
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y python3-pip
sudo apt-get install -y git
sudo apt-get install -y wget


#install go
if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					echo "Installing Golang"
					wget https://dl.google.com/go/go1.21.3.linux-amd64.tar.gz
					rm -rf /usr/local/go && tar -C /usr/local -xzf go1.21.3.linux-amd64.tar.gz
					export PATH=$PATH:/usr/local/go/bin
					echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bash_profile
					source ~/.bash_profile
					sleep 1
					break
					;;
				no)
					echo "Please install go and rerun this script"
					echo "Aborting installation..."
					exit 1
					;;
	esac	
done
fi

#install chromium
echo "Installing Chromium"
sudo snap install chromium
echo "done"

#Installing Aquatone
echo "Installing Aquatone"
wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip
unzip aquatone_linux_amd64_1.7.0.zip
mv aquatone /usr/bin/
echo "done"

#installing Sublist3r
echo "installing Sublist3r"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r*
pip install -r requirements.txt
mv Sublist3r /usr/bin/
cd ~/tools/
echo "done"

#installing Knock
echo "Installing Knock"
git clone https://github.com/guelfoweb/knock.git
cd knock*
pip3 install -r requirements.txt
mv Knock /usr/bin/
cd ~/tools/
echo "done"


#install Subfinder
echo "Installing Subfinder"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
echo "done"

---------
#install Amass
echo "Installing Amass"
go install -v github.com/owasp-amass/amass/v4/...@master
echo "done"

#install Unfurl
echo "Installing  Unfurl"
go install github.com/tomnomnom/unfurl@latest
echo "done"


#install gau
echo "Installing gau"
go install github.com/lc/gau/v2/cmd/gau@latest
echo "done"

#install waybackurls
echo "Installing waybackurls"
go install github.com/tomnomnom/waybackurls@latest
echo "done"

#install qsreplace
echo "Installing qsreplace"
go install github.com/tomnomnom/qsreplace@latest
echo "done"

#install ffuf
echo "Installing ffuf"
go install github.com/ffuf/ffuf/v2@latest
echo "done"


#install httpx-toolkit
echo "Installing httpx-toolkit"
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
echo "done"


#install httprobe
echo "Installing httprobe"
go install github.com/tomnomnom/httprobe@latest
echo "done"

#install anew
echo "Installing anew"
go install -v github.com/tomnomnom/anew@latest
echo "done"

#install dirsearch
echo "Installing dirsearch"
sudo apt-get install dirsearch
echo "done"

#Download Seclists
echo "downloading Seclists"
cd ~/tools/
git clone https://github.com/danielmiessler/SecLists.git
cd ~/tools/SecLists/Discovery/DNS/
##THIS FILE BREAKS MASSDNS AND NEEDS TO BE CLEANED
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
cd ~/tools/
echo "done"
echo "Do not forget to subscribe Nahomsec,,Just modified by me"