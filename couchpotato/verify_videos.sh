#!/bin/bash
echo "" > video_errors.log

#find based on extension, -or -name can be used for multiple OR searchs
#ffprobe checks the video file (part of ffmpeg) without converting it.
#we try to get the video duration, we assume that if we dont find it there is an error with the file.
#grep returns 1 if the required string is not found.

find /media/cloud_media/Movies -name "*.mp4" -or -name "*.mkv" -exec sh -c 'echo "{}";ffprobe -show_format "{}" | grep -qi duration; case "$?" in "0") echo "seems_ok" + "{}";; "1") echo "error invalid" + "{}";; *) echo "error unknown: $?" + "{}";; esac | grep error >> video_errors.log' \;

find /media/cloud_media/Movies -name "*.wmv" -exec sh -c 'echo "{}";ffprobe -show_format "{}" | grep -qi duration; case "$?" in "0") echo "seems_ok" + "{}";; "1") echo "error invalid" + "{}";; *) echo "error unknown: $?" + "{}";; esac | grep error >> video_errors.log' \;

find /media/cloud_media/Movies -name "*.avi" -exec sh -c 'echo "{}";ffprobe -show_format "{}" | grep -qi duration; case "$?" in "0") echo "seems_ok" + "{}";; "1") echo "error invalid" + "{}";; *) echo "error unknown: $?" + "{}";; esac | grep error >> video_errors.log' \;
