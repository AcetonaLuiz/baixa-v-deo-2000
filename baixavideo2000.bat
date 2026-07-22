@echo off
chcp 65001 > nul
title Baixador do YouTube

:menu
cls
echo ====================================
echo      BAIXADOR DO YOUTUBE
echo ====================================
echo.
echo  [1] Baixar Vídeo (Melhor Qualidade MP4)
echo  [2] Baixar apenas Áudio (MP3)
echo  [3] Sair
echo.
echo ====================================
set /p opcao="Escolha uma opcao (1-3): "

if "%opcao%"=="1" goto baixar_video
if "%opcao%"=="2" goto baixar_audio
if "%opcao%"=="3" exit
goto menu

:baixar_video
cls
echo --- DOWNLOAD DE VÍDEO ---
echo.
set /p url="Cole o link do video: "
echo.
echo Baixando... aguarde.
yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" --embed-thumbnail --add-metadata -o "%%(title)s.%%(ext)s" "%url%"
echo.
echo Download concluido com sucesso!
pause
goto menu

:baixar_audio
cls
echo --- DOWNLOAD DE ÁUDIO (MP3) ---
echo.
set /p url="Cole o link do video: "
echo.
echo Extraindo audio... aguarde.
yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata -o "%%(title)s.%%(ext)s" "%url%"
echo.
echo Download concluido com sucesso!
pause
goto menu
