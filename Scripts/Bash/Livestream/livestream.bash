#!/bin/bash

# crontab
# * */2 * * * bash /home/misigno/scripts/Livestream/Livestream.bash

now_stamp=`date +'%Y-%m-%d-%H'`
music_dir="/mnt/MD0/Audio/Music"
livestream_dir="/home/misigno/scripts/Livestream"
playlist_file="$livestream_dir/Playlists/$now_stamp.txt"
input_device="/dev/video0"
resolution="800x600"
frames_per_second="5"
iframe_interval="10" # should be double of frames_per_second
iframe_minimum_interval="5" # should be equal to frames_per_second
threads="0"
bitrate="1000k" # constant bitrate (should be between 1000k - 3000k)
quality_preset="ultrafast"
audio_rate="44100"
stream_repo="rtmp://live.twitch.tv/app/live_469920893_z2gwahibwBSrT7Jn6abyfZSDhjSt7Z"

killall ffmpeg

rm -rf "$livestream_dir/Playlists"
mkdir -p "$livestream_dir/Playlists"
touch "$playlist_file"

find "$music_dir/." -name "*mp3" | sort -R | head -n 240 | while read file; do
  if ! [[ "$file" == *"'"* ]]; then
   echo "file '$file'" >> "$playlist_file"
  fi
done

ffmpeg -re -s "$resolution" -i "$input_device" -f flv -r "$frames_per_second" \
  -f concat -safe 0 -i "$playlist_file" -c:a aac \
  -fflags +igndts -fflags +genpts -copytb 1 \
  -vcodec libx264 -g "$iframe_interval" -keyint_min "$iframe_minimum_interval" \
  -b:v "$bitrate" -minrate "$bitrate" -maxrate "$bitrate" -pix_fmt yuv420p \
  -s "$resolution" -preset "$quality_preset" \
  -tune film -acodec libmp3lame -threads "$threads" -strict normal -tune zerolatency \
  -bufsize "$bitrate" -t 01:59:57 -f flv "$stream_repo"

