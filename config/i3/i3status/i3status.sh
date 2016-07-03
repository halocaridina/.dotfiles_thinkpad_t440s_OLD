# shell script to add percentage of ram, monitor brightness, and window title to i3status
# needs sed, free and bc
# showing cpu_usage, disk_usage and battery has to be enabled
# output_format has to be set to "i3bar"

i3status --config /home/srsantos/.config/i3/i3status.conf | while :
do
	read line

	# get ram usage in percent
	# you'll need to edit this to match up your total ram
	ram_used="`free -k | sed -n -e '3p' | sed 's/-\/+ buffers\/cache:\s*//' | cut -b 1-7`"
	ram_total="`free -k | sed -n -e '2p' | sed 's/Mem:\s*//' | cut -b 1-7`"
	ram_buffer="`free -k | sed -n -e '2p' | sed 's/Mem:\s*//' | cut -b 46-51`"
	net_ram=`echo $[$ram_total-$ram_buffer]`
	memperc=`echo "$(echo "scale=1; $ram_used * 100 / $net_ram" | bc )"`

	# get window brightness
	# you'll probably need to edit this section to work with your individual monitor
	max_brightness_file="/sys/class/backlight/intel_backlight/max_brightness"
	brightness_file="/sys/class/backlight/intel_backlight/brightness"
	total_brightness="`cat $max_brightness_file`"
	current_brightness="`cat $brightness_file`"
	mon_brightness=`echo "$(echo "scale=0; $current_brightness * 100 / $total_brightness" | bc)"`
    
    messages="`cat /tmp/newgmails`"
	
	# if used RAM is more than 80% show text in red, else white
	if [ $(echo "$memperc > 75" | bc) -eq 1 ]
	then
		color=FF0000
	else
		color=FFFFFF
	fi

	if [ ${messages} == 0 ]
	then
		color2=222222
	else
		color2=00FFFF
	fi

	
	# add in ram, window brightness,email messages
	sedline="s/cpu_temperature/ram_usage\",\"color\":\"\#${color}\",\"full_text\":\": ${memperc}%\"},{\"name\":\"cpu_temperature/"
	sedline0="s/battery/win_brightness\",\"full_text\":\": ${mon_brightness}%\"},{\"name\":\"battery/"
    sedline1="s/disk/emails\",\"color\":\"\#${color2}\",\"full_text\":\": ${messages}\"},{\"name\":\"disk/"

#    sedline1="s/path_exists/emails\",\"full_text\":\": ${messages}\"},{\"name\":\"path_exists/"
	
	line=`echo $line | sed -e "$sedline" | sed -e "$sedline0" | sed -e "$sedline1" |sed -e "s/% \"/%\"/"`

	colonline='s/\([a-zA-Z]\):/\1/g'
	final=`echo $line | sed -e "$colonline"`

	echo $final || exit 1
done
