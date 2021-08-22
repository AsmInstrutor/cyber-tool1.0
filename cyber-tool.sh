#!/bin/bash

main () {
	printf "\nBEM VINDOS A:\n\n "
	figlet -f slant CYBER|lolcat
	figlet -f slant TOOL|lolcat

	printf "\n[1] - Painel\n[2] - Criptografia\n[3] - Aulas\n[4] - Sobre a Cyber-Tool\n[5] - Sobre a Cyber Security\n[99] - Sair\n[00] - Atualizar\n\n"|lolcat
	read -p "Sua escolha>_ " esc

	if [ $esc = 1 ];then
		painel
	elif [ $esc = 2 ];then
		cripto
	elif [ $esc = 3 ];then
		aulas
	elif [ $esc = 4 ];then
		cyber
	elif [ $esc = 5 ];then
		sec
	elif [ $esc = 6 ];then
		sair
	elif [ $esc = 7 ];then
		update
	else
		printf "\nO parametro digitado esta incorreto!\n"
		menu
	fi
}

painel () {
	printf "\n[1] - Consultar IP\n[2] - Consultar DNS\n[3] - Consultar CEP\n[4] - Consultar CNPJ\n[5] - Consultar seu IP\n[6] - Consulta Whois\n[7] - Voltar ao menu\n\n"|lolcat
	read -p "Sua escolha>_ " esc

	if [ $esc = 1 ];then
		read -p "Digite o IP>_ " ip
		printf "Cidade -> "
		curl -s https://ipinfo.io/$ip/json | jq -r '.city'|lolcat
		printf "Estado -> "
		curl -s https://ipinfo.io/$ip/json | jq -r '.region'|lolcat
		printf "País -> "
		curl -s https://ipinfo.io/$ip/json | jq -r '.country'|lolcat
		printf "CEP -> "
		curl -s https://ipinfo.io/$ip/json | jq -r '.postal'|lolcat
		printf "API USADA -> "
		curl -s https://ipinfo.io/$ip/json | jq -r '.readme'|lolcat

		volta
	elif [ $esc = 2 ];then
		read -p "Digite o DNS>_ " dns
		printf "Cidade -> "
		curl -s https://ipinfo.io/$dns/json | jq -r '.city'|lolcat
		printf "Estado -> "
		curl -s https://ipinfo.io/$dns/json | jq -r '.region'|lolcat
		printf "País -> "
		curl -s https://ipinfo.io/$dns/json | jq -r '.country'|lolcat
		printf "CEP -> "
		curl -s https://ipinfo.io/$dns/json | jq -r '.postal'|lolcat
		printf "API USADA -> "
		curl -s https://ipinfo.io/$dns/json | jq -r '.readme'|lolcat

		volta
	elif [ $esc = 3 ];then
		read -p "Digite o CEP>_ " cep
		printf "CEP -> "
		curl -s viacep.com.br/ws/$cep/json/ | jq -r '.cep'|lolcat
		printf "Logradouro -> "
		curl -s viacep.com.br/ws/$cep/json/ |jq -r '.logradouro'|lolcat
		printf "Complemento -> "
		curl -s viacep.com.br/ws/$cep/json/ |jq -r '.complemento'|lolcat
		printf "Bairro -> "
		curl -s viacep.com.br/ws/$cep/json/ |jq -r '.bairro'|lolcat
		printf "Localidade -> "
		curl -s viacep.com.br/ws/$cep/json/ |jq -r '.localidade'|lolcat
		printf "Uf -> "
		curl -s viacep.com.br/ws/$cep/json/ |jq -r '.uf'|lolcat
		printf "IBGE -> "
		curl -s viacep.com.br/ws/$cep/json/ |jq -r '.ibge'|lolcat
		printf "DDD -> "
		curl -s viacep.com.br/ws/$cep/json/ |jq -r '.ddd'|lolcat

		volta
	elif [ $esc = 4 ];then
		printf "\nPainel off\n"

		painel

	elif [ $esc = 5 ];then
		sleep 1
		printf "\nMe desculpem mas não consegui filtrar essa parte\n"

		curl ipinfo.io
	elif [ $esc = 6 ];then
		read -p "Digite o site para consultar>_ " who
		whois $who
	elif [ $esc = 7 ];then
		volta
	else
		printf "\nParametro digitado esta incorreto\n"
		painel
	fi

}

cripto () {
	sleep 1
	python criptografia.py
}

cyber () {
	printf "\nA Cyber Tool é um projeto pensado e criado pela\nCyber Security-RT. A ferramenta foi criada para\nfins educacionais, nos da administração e da\ncriação da mesma não nos responsabilizamos pelos atos\ncometidos pelos usuários!\n"

	volta
}

sec () {
	printf "\nA Cyber Security RT é um grupo criado para\najudar iniciantes na programação e no Hacking com\ncursos 100% gratuitos e com pessoas a disposição\npra ajudar quem precisar, somos uma comunidade voltada\nao Red Team, White Hat e mais...Para saber como\nparticipar, fiquem atentos ao proximos videos\pois postaremos o link de nosso grupo no canal da\ncyber! Agradeçemos a preferencia!\n "

	volta
}

volta () {
	printf "\nDeseja voltar ao menu?[y/n]\n"
	read -p "Sua escolha>_ " esc

	if [ $esc = y ];then
		main
	else
		printf "\nLogout\n"
	fi
}

aulas () {
	printf "\n-->ESCOLHA SUA OPÇÃO<--\n\n[1] - Python\n[2] - JavaScript\n[3] - HTML5 + CSS3\n"|lolcat
	read -p "Sua escolha>_ " aula

	if [ $aula = 1 ];then
		printf "\nNome: Dev Aprender\nPlataforma: YouTube\nAssunto: Python para iniciantes\nLink: https://youtube.com/playlist?list=PLnNURxKyyLIJsQ3WK8LQLvb43XWlFG3tv\n"
		
		volta

	elif [ $aula = 2 ];then
		printf "\nNome: Dev Aprender\nPlataforma: TouTube\nAssunto: Curso completo de JavaScript para iniciantes\nLink; https://youtube.com/playlist?list=PLnNURxKyyLIIyJ_XKZHzU8SQyGu7yuqhn\n"

		volta

	elif [ $aula = 3 ];then
		printf "\nNome: Curso em video\nPlataforma: YouTube\nAssunto: Curso completo e atual de HTML5 e CSS3 - Modulo de 1 a 5\nLink: https://youtube.com/playlist?list=PLHz_AreHm4dkZ9-atkcmcBaMZdmLHft8n"

		volta

	else
		printf "\nParametro nao reconhecido\n"
		aulas
	fi
}

main
