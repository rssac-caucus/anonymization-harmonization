INPUT_PCAP=input.pcap
DNSANON_CMD=dnsanon
IPCRYPT_CMD=ipcrypt.py
AES128_CMD=aes128.pl
HEATMAP_CMD=ipv4-heatmap
HEATMAP_LABELS=iana-labels.txt


HEATMAP=${HEATMAP_CMD} -C -a ${HEATMAP_LABELS} -c 0x337F7F7F

N=0
all: ipcrypt.${N}.png original.${N}.png aes128.${N}.png cryptopan.${N}.png



original.${N}.png: original.dat
	${HEATMAP} -o $@_ < original.dat
	mv $@_ $@

aes128.${N}.png: aes128.${N}.dat
	${HEATMAP} -o $@_ < aes128.${N}.dat
	mv $@_ $@

ipcrypt.${N}.png: ipcrypt.${N}.dat
	${HEATMAP} -o $@_ < ipcrypt.${N}.dat
	mv $@_ $@

cryptopan.${N}.png: cryptopan.${N}.dat
	${HEATMAP} -o $@_ < cryptopan.${N}.dat
	mv $@_ $@




ipcrypt.${N}.dat: original.dat
	${IPCRYPT_CMD} original.dat 0 e > $@_
	mv $@_ $@

aes128.${N}.dat: original.dat aes128.pl
	${AES128_CMD} < original.dat > $@_
	mv $@_ $@

original.dat: ${INPUT_PCAP}
	tcpdump -n -r ${INPUT_PCAP} \
	| awk '{print $$3}' \
	| sed -e 's/\.[0-9][0-9]*$$//' \
	> $@_
	mv $@_ $@

cryptopan.${N}.dat: ${INPUT_PCAP}
	${DNSANON_CMD} -p m -a addr -k cryptopan.${N}.key -i ${INPUT_PCAP} -o - \
	| grep -v '^#' \
	| awk '{print $$3}' \
	| sed -e 's/\*$$//' \
	> $@_
	mv $@_ $@
