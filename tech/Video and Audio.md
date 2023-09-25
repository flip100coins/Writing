# convert audio to other format
1. m4a -> mp3
	`ffmpeg -v 5 -y -i input.m4a -acodec libmp3lame -ac 2 -ab 192k output.mp3`

# split mp3 intelligently
`mp3splt -s -p nt=70 big_audiobook.mp3`
This will split the mp3 into 70 parts most probably. reference: 
http://manpages.ubuntu.com/manpages/bionic/man1/mp3splt.1.html

You may need to use apt install to get missing comand.