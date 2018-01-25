#!/bin/bash
#
# versao 0.1
#
# INFORMAÇÕES
#   autorenice.sh         
#
# DESCRICAO
#    Pega a lista de processos do arquivo processo.conf e faz um renice
#
# NOTA
#   Testado e desenvolvido em CentOS 7
#   
#  DESENVOLVIDO_POR
#  Valdenir Luíz Mezadri Junior			- valdenirmezadri@live.com
#
#  MODIFICADO_POR		(DD/MM/YYYY)
#  Valdenir Luíz Mezadri Junior	25/01/2018	- Criado script
#
#########################################################################################################################################
TEMPO_CHECK="3"
while true; do
{ while IFS=';' read  processo nice
  do
    {
      echo "$processo" | egrep "^#" ; } > /dev/null && continue # Pula linhas comentadas no processos.conf
      LISTA_PROCESSO=`ps ax -o pid,ni,cmd | grep $processo | grep -v gre`
      while IFS= read -r line; do
        if [[ $line ]]; then
          ID_PROCESSO=`echo $line| awk {'print $1'}`
	  NICE_PROCESSO=`echo $line| awk {'print $2'}`
	  NOME_PROCESSO=`echo $line| awk {'print $3'}`
	  if [[ $NICE_PROCESSO != $nice  ]]; then
	    renice -n $nice $ID_PROCESSO > /dev/null		
	    echo "Alterando NICE do processo $ID_PROCESSO $NOME_PROCESSO de $NICE_PROCESSO para $nice"
	  fi			
        fi
      done <<< $LISTA_PROCESSO
  done
} < processos.conf

unset LISTA_PROCESSO
sleep $TEMPO_CHECK
done

#fim do script
exit 0

