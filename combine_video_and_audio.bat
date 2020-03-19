:: Name:     combine_video_and_audio_file.cmd
:: Purpose:  swaps the audio stream from a video file with an audio file
:: Author:   iorga.ton@gmail.com
:: Revision: 17th March 2020 - initial version
::           (Quarantine Code)

@ECHO OFF
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

set /p video_file=Input the VIDEO FILE here and press ENTER:

set video_file=%video_file:"=%

for %%i in ("%video_file%") do (
	set video_filedrive=%%~di
	set video_filepath=%%~pi
	set video_filename=%%~ni
	set video_fileextension=%%~xi
)



set /p audio_file=Input the AUDIO FILE here and press ENTER:

set audio_file=%audio_file:"=%

for %%i in ("%audio_file%") do (
	set audio_filepath=%%~pi
	set audio_filename=%%~ni
	set audio_fileextension=%%~xi
)

set video_file_folder_path="!video_filedrive!!video_filepath!"

echo !video_file_folder_path!

CD /D !video_file_folder_path!

echo Currend dir: !cd!
echo Video file path: !video_filepath!

ffmpeg -i "!video_file!" -i "!audio_file!" -vcodec copy -acodec copy -map 0:0 -map 1:0 "!video_filename!_combined!video_fileextension!"

echo Done. Batch by C.Iorga, inspired by Wand Chenwei 

ENDLOCAL
ECHO ON
PAUSE
@EXIT /B 0