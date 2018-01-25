# auto_renice
versao 0.1

# INFORMAÇÕES e arquivos
   autorenice.sh         
   processos.conf

# DESCRICAO
    Pega a lista de processos do arquivo processo.conf, faz uma busca por cada um, salva os PIDS e altera o nice

# NOTA
   Testado e desenvolvido em Fedora 27 e CentOS 7
   
#  DESENVOLVIDO_POR
  Valdenir Luíz Mezadri Junior			- valdenirmezadri@live.com

  MODIFICADO_POR		(DD/MM/YYYY)
  Valdenir Luíz Mezadri Junior	25/01/2018	- Criado script

# Configurando processos:
Em processos.conf, adicionar um processo por linha e em cada um você coloca o nome do processo seguido por ponto e vírgula e o valor do novo NICE
Exemplo:
clamd;15 
thunderbird;-5
gnome-calculator;10

Lembrando que o peso maior é -20 e o menor é 19

Dentro do auto autorenice.sh você pode alterar o tempo em segundos de quanto em quanto tempo é para rodar o script
TEMPO_CHECK="3" #Em segundos de quanto em quanto tempo é para rodar o script
