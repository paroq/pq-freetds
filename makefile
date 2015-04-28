include $(PQ_FACTORY)/factory.mk

pq_part_branch := 0.91.112
pq_part_name   := freetds-$(pq_part_branch)
pq_part_file   := freetds-patched.tar.gz

build-stamp: stage-stamp
	$(MAKE) -C $(pq_part_name)
	$(MAKE) -C $(pq_part_name) install DESTDIR=$(stage_dir)
	touch $@

stage-stamp: configure-stamp

configure-stamp: patch-stamp
	cd $(pq_part_name) && ./configure --prefix=$(part_dir) --with-tdsver=$(pq_part_branch) 
	touch $@

patch-stamp: unpack-stamp
	touch $@

unpack-stamp: $(pq_part_file)
	tar xzf $(source_dir)/$(pq_part_file)
	touch $@

