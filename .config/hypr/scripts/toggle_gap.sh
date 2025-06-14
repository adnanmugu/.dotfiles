#!/usr/bin/env bash

# you need to install jq package, this will not 
# running properly if you dont have the package
#
# get the current gap in and out value from hypr 
curr_gapout=$(hyprctl getoption general:gaps_out -j | jq -r '.custom' | awk '{print $1}')
curr_gapin=$(hyprctl getoption general:gaps_in -j | jq -r '.custom' | awk '{print $1}')

# then we check current gapin and gapout if we in a 
# default which is 10 and 5 we set to 0 and vice versa 
if [[ $curr_gapout = 10 && $curr_gapin = 5 ]]; then
  hyprctl --batch "keyword general:gaps_out 0; keyword general:gaps_in 0; keyword decoration:rounding 0"
else
  hyprctl --batch "keyword general:gaps_out 10; keyword general:gaps_in 5; keyword decoration:rounding 5"
fi

