/<para>/{
N
c\
.LP
}
/<Figure Begin>/,/<Figure End>/{
w fig.interleaf
/<Figure End>/i\
.FG\
<insert figure here>\
.FE
d
}
/^$/d
