# !/bin/bash +x
ssh -M -S my-ctrl-socket -fnNT -D 5000 user@ip.addr
