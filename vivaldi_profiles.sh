#!/bin/bash

DEFINED_ARGUMENT=$1
CONFIG_DIR=~/.config/vivaldi
NUM_PROFILES=$(ls $CONFIG_DIR | grep -c "Profile ")
PROFILE_STRING=$(ls $CONFIG_DIR | grep "Profile ")

PROFILE_ARRAY=()
PROFILE_NAME_ARRAY=()
j=0
for ((i=1; i <= ($NUM_PROFILES * 2); i+=2)); do
  PROFILE_ARRAY[$j]=$(echo $PROFILE_STRING | cut -d ' ' -f $i,$(($i + 1)) )
  PROFILE_NAME_ARRAY[$j]=$(cat $CONFIG_DIR/"${PROFILE_ARRAY[$j]}"/Preferences \
                           | jq '.[]' \
                           | jq ."name" 2>/dev/null \
                           | jq -r "" \
                           | grep -v null)
  echo "${PROFILE_ARRAY[$j]}"
  echo "${PROFILE_NAME_ARRAY[$j]}"
  let j++
done

CHOICE=$(zenity --list "${PROFILE_NAME_ARRAY[@]}" \
                --column="User Profiles" \
                --title="Vivaldi Users" \
                --height 350 \
                --width 150)

k=0
for PROFILE in ${PROFILE_NAME_ARRAY[@]}; do
  if [ $PROFILE == $CHOICE ]; then
    vivaldi-stable --profile-directory="${PROFILE_ARRAY[$k]}" $DEFINED_ARGUMENT
    break
  fi
  let k++
done
