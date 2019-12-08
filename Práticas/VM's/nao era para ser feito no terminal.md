/dev/dm-0	/srv/dev-disk-bylabel-gandadisco	ext4	auto	0	0
/dev/dm-1	/srv/dev-disk-bylabel-outrogandadisco	ext4	auto	0	0
/dev/md0	/srv/dev-disk-bylabel-ultimogandadisco	ext4	auto	0	0


#### Montar filesystem no lv1, lv2 e rd10

	mkdir /srv/dev-disk-bylabel-gandadisco
	mount /dev/md-0 /srv/dev-disk-bylabel-gandadisco

	mkdir /srv/dev-disk-bylabel-outrogandadisco
	mount /dev/md-1 /srv/dev-disk-bylabel-outrogandadisco

	mkdir /srv/dev-disk-bylabel-ultimogandadisco
	mount /dev/md0 /srv/dev-disk-bylabel-ultimogandadisco