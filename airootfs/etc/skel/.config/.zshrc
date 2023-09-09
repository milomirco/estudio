# architalia 

if [ -r ~/.zshrc -a -r ~/.zshrc.global -a ! -r ~/.zshrc.local ] ; then
    printf '-!-\n'
    printf '-!- Looks like you are using the old zshrc layout of grml.\n'
    printf '-!- Please read the notes in the grml-zsh-refcard, being'
    printf '-!- available at: http://grml.org/zsh/\n'
    printf '-!-\n'
    printf '-!- If you just want to get rid of this warning message execute:\n'
    printf '-!-        touch ~/.zshrc.local\n'
    printf '-!-\n'
fi


echo ""
echo -e "\e[34mWelcome to Core Linux.\e[0m"
echo ""

network(){
testping=$(ping -q -c 1 -W 1 archlinux.org >/dev/null)

if $testping ; then
   ipx=$(curl -s www.icanhazip.com)
   isp=$(lynx -dump https://www.iplocation.net | grep "ISP:" | cut -d ":" -f 2- | cut -c 2-200)
   echo -e "IP: \e[32m$ipx\e[0m ISP: \e[32m$isp\e[0m"
else
echo -e "\e[31mDisconnected or Network Issue\e[0m"
fi
pingx=$(ping -c 1 archlinux.org | head -n2 )
echo -e "\e[90m$pingx\e[0m"
echo ""
}

echo -e "\e[33mConnection Status\e[0m"

if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
  network
else
 echo -e "\e[31mSystem Disconnected\e[0m"
fi

echo ""

sudo su
