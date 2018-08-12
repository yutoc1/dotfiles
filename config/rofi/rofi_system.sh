declare -A list=(
  ['lock']='i3lock -p default -n -f -e -c 006F86 -i ~/work/pict/wallpaper/lock.png'
  ['poweroff']='systemctl poweroff'
  ['reboot']='systemctl reboot'
)

if [[ ${1##* } == 'yes' ]]; then
  eval ${list[${1%% *}]}
elif [[ ${1##* } == 'no' ]]; then
  echo ${!list[@]} | sed 's/ /\n/g'
elif [[ -n $1 ]]; then
  echo "$1 / no"
  echo "$1 / yes"
else
  echo ${!list[@]} | sed 's/ /\n/g'
fi
