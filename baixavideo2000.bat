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
echo  [3] Baixar Playlist inteira (Áudio MP3)
echo  [4] Baixar Playlist inteira (Vídeo MP4)
echo  [5] Sair
echo.
echo ====================================
set /p opcao="Escolha uma opcao (1-5): "

if "%opcao%"=="1" goto baixar_video
if "%opcao%"=="2" goto baixar_audio
if "%opcao%"=="3" goto baixar_playlist_audio
if "%opcao%"=="4" goto baixar_playlist_video
if "%opcao%"=="5" exit
goto menu

:baixar_video
cls
echo --- DOWNLOAD DE VÍDEO ---
echo.
set /p url="Cole o link do video: "
echo.
echo Baixando... aguarde.
yt-dlp --no-playlist -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" --embed-thumbnail --convert-thumbnails jpg --add-metadata -o "%%(title)s.%%(ext)s" "%url%"
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
yt-dlp --no-playlist -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --convert-thumbnails jpg --add-metadata -o "%%(title)s.%%(ext)s" "%url%"
echo.
echo Download concluido com sucesso!
pause
goto menu

:baixar_playlist_audio
cls
echo --- DOWNLOAD DE PLAYLIST (ÁUDIO MP3) ---
echo.
set /p url="Cole o link da playlist: "
echo.
echo Baixando todas as musicas da playlist... aguarde.
yt-dlp --yes-playlist -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --convert-thumbnails jpg --add-metadata -o "%%(playlist_title)s/%%(playlist_index)s - %%(title)s.%%(ext)s" "%url%"
echo.
echo Download da playlist de audio concluido com sucesso!
pause
goto menu

:baixar_playlist_video
cls
echo --- DOWNLOAD DE PLAYLIST (VÍDEO MP4) ---
echo.
set /p url="Cole o link da playlist: "
echo.
echo Baixando todos os videos da playlist... aguarde.
yt-dlp --yes-playlist -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" --embed-thumbnail --convert-thumbnails jpg --add-metadata -o "%%(playlist_title)s/%%(playlist_index)s - %%(title)s.%%(ext)s" "%url%"
echo.
echo Download da playlist de video concluido com sucesso!
pause
goto menu
