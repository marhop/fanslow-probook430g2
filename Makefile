fs = $(DESTDIR)/usr/local/bin/fanslow
ec = $(DESTDIR)/usr/local/bin/probook_ec
sc = $(DESTDIR)/etc/systemd/system/fanslow.service

# With proper packaging the following paths would be used instead.
# fs = $(DESTDIR)/usr/bin/fanslow
# ec = $(DESTDIR)/usr/bin/probook_ec
# sc = $(DESTDIR)/lib/systemd/system/fanslow.service

install: fanslow probook_ec fanslow.service
	@install -Dm 755 fanslow $(fs)
	@install -Dm 755 probook_ec $(ec)
	@install -Dm 644 fanslow.service $(sc)
	@sed -i -e '/^ECFILE=/cECFILE=$(ec)' $(fs)
	@sed -i -e '/^ExecStart=/cExecStart=$(fs)' $(sc)
	@sed -i -e '/^ExecStopPost=/cExecStopPost=$(ec) FANRST' $(sc)

uninstall:
	@rm $(fs) $(ec) $(sc)
