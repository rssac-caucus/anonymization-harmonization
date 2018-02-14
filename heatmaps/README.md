The files in this directory contain a number of "IPv4 heatmaps" visualizing how different address anonymization techniques work.  The techniques tested are:

- AES-128 with truncation to 32-bits
- cryptopan
- ipcrypt

For each technique (plus the original un-anonymized data) there are 10 PNG files from 10 different runs of the anonymization tools.  Note these are relatively large images (4096x4096) and you may need to "zoom in" to see the details.

The Makefile here was used to generate the anonymized data and heatmap images.  It depends on third-party software packages not included in this repository:

- ipv4-heatmap https://github.com/measurement-factory/ipv4-heatmap
- dnsanon (cryptopan) https://ant.isi.edu/software/dnsanon/
- ipcrypt https://github.com/jedisct1/c-ipcrypt

Additionally, the input pcap file is not provided here for privacy reasons.
