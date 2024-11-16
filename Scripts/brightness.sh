#!/bin/bash

arg=$1
[$arg = inc] && doas brightnessctl set +10%
[$arg = dec] && doas brightnessctl set 10%-