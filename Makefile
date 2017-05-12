install: fanslow probook_ec fanslow.service
	@install -Dm 755 fanslow /usr/bin/fanslow
	@install -Dm 755 probook_ec /usr/bin/probook_ec
	@install -Dm 644 fanslow.service /lib/systemd/system/fanslow.service
	@systemctl -q enable fanslow
	@systemctl start fanslow

uninstall:
	@systemctl stop fanslow
	@systemctl -q disable fanslow
	@rm /usr/bin/fanslow
	@rm /usr/bin/probook_ec
	@rm /lib/systemd/system/fanslow.service
