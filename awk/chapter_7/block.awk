BEGIN{ FS= "\n"; RS = ""; OFS = "\n"; ORS = "\n\n" }
{ print $1, $NF }
