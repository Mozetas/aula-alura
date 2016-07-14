#!/bin/env ruby
# encoding: windows-1252

def da_boas_vindas
	puts
    puts "        P  /_\  P                              "
    puts "       /_\_|_|_/_\                             "
    puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
    puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinha��o!"
    puts "  |' '  |  |_|  |'  ' |                        "
    puts "  |_____| ' _ ' |_____|                        " 
    puts "        \__|_|__/                              "
    puts
	puts "Qual � o seu nome?"
	nome = gets.strip
	puts "\n\n\n"
	puts "Come�aremos o jogo para voc�, #{nome}"
	nome
end

def pede_dificuldade
	puts "Qual o n�vel de dificuldade?"
    puts "(1) Muito f�cil (2) F�cil (3) Normal (4) Dif�cil (5) Imposs�vel"
    puts "Escolha: "
	dificuldade = gets.to_i
end


def sorteia_numero_secreto(dificuldade)
	case dificuldade
	when 1
		maximo = 30
	when 2
		maximo = 60
	when 3
		maximo = 100
	when 4
		maximo = 150
	else
		maximo = 200
	end
			
	puts "Escolhendo um n�mero secreto entre 1 e #{maximo}..."
	sorteado = rand(maximo) + 1
	puts "Escolhido... que tal adivinhar hoje nosso n�mero secreto?"
	sorteado
end

def pede_um_numero(chutes, tentativa, limite_de_tentativas)
	puts "\n\n\n"
	puts "Tentativa #{tentativa} de #{limite_de_tentativas}"
	puts "Chutes at� agora #{chutes}"
	puts "Entre com o n�mero"
	chute = gets
	puts "Ser� que acertou? Voc� chutou #{chute}"
	chute.to_i
end

def ganhou
    puts
    puts "             OOOOOOOOOOO               "
    puts "         OOOOOOOOOOOOOOOOOOO           "
    puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
    puts "    OOOOOO      OOOOO      OOOOOO      "
    puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
    puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
    puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
    puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
    puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
    puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
    puts "         OOOOOO         OOOOOO         "
    puts "             OOOOOOOOOOOO              "
    puts
    puts "               Acertou!                "
    puts
end

def verifica_se_acertou(numero_secreto, chute)
	acertou = numero_secreto == chute

	if acertou
		ganhou
		return true
	end

	maior = numero_secreto > chute
	if maior
		puts "O n�mero secreto � maior!"
	else
		puts "O n�mero secreto � menor!"
	end
	false
end

def joga(nome, dificuldade)
	numero_secreto = sorteia_numero_secreto dificuldade

	pontos_ate_agora = 1000
	limite_de_tentativas = 5
	chutes = []

	for tentativa in 1..limite_de_tentativas

		chute = pede_um_numero chutes, tentativa, limite_de_tentativas
		chutes << chute

		if nome == "mozetas"
			ganhou
			break
		end

		pontos_a_perder = (chute - numero_secreto).abs / 2.0
		pontos_ate_agora -= pontos_a_perder

		if verifica_se_acertou numero_secreto, chute
			break
		end
	end

	puts "Voc� ganhou #{pontos_ate_agora} pontos."

end

def nao_quer_jogar?
	puts "Deseja jogar novamente? (S/N)"
	quero_jogar = gets.strip
	nao_quero_jogar = quero_jogar.upcase == "N"
end

nome = da_boas_vindas
dificuldade = pede_dificuldade

loop do
    joga nome, dificuldade
    break if nao_quer_jogar?
end


