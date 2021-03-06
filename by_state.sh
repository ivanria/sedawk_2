#!/bin/bash

awk -F ',' '{
	print $4 ", " $0
}' | sort | awk -F ',' '
	$1 == last_state {
		print "\t" $2
	}
	$1 != last_state {
		last_state = $1
		print $1
		print "\t" $2
	}'


