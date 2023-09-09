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
echo -e "\e[34mBienvenido a su archlinux live.\e[0m"
echo ""

echo ""
echo -e "\e[33mIdioma del sistema y del teclado\e[0m"
localectl status
echo ""

rete(){
testping=$(ping -q -c 1 -W 1 archlinux.org >/dev/null)

if $testping ; then
   ipx=$(curl -s www.icanhazip.com)
   isp=$(lynx -dump https://www.iplocation.net | grep "ISP:" | cut -d ":" -f 2- | cut -c 2-200)
   echo -e "IP: \e[32m$ipx\e[0m ISP: \e[32m$isp\e[0m"
else
echo -e "\e[31mdisconnesso o problema di rete\e[0m"
fi
pingx=$(ping -c 1 archlinux.org | head -n2 )
echo -e "\e[90m$pingx\e[0m"
echo ""
}

echo -e "\e[33mEstado de Conección\e[0m"

if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
  rete
else
 echo -e "\e[31mSistema Desconectado\e[0m"
fi

echo ""

sudo su


