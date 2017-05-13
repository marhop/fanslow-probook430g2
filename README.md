Better fan control for HP ProBook 430 G2.

On my HP ProBook 430 G2 laptop running Debian, the fan is much too zealous to
my taste, running quite fast even when there's nearly no load on the system.
These scripts take control of the fan and apply a more moderate policy. On my
laptop this works better than the original fan control software, meaning that
the fan runs much less, but your mileage may vary. And of course, it's
nobody's fault if you wreck your hardware!

The core scripts `probook_ec` and `fanslow` are taken from
<https://github.com/k3mpaxl/fanspeed> with no or only minimal modifications.
Further information on the original scripts can be found at
<http://ubuntuforums.org/showthread.php?t=2008756>.

# Overview of the components

The `probook_ec` script is used to change several hardware settings of a
laptop. Useful things you can do with it include switching the fan off and
resetting the embedded controller (I guess that means something like returning
control of the fan to the firmware):

    # probook_ec FANOFF
    # probook_ec FANRST

The `fanslow` script monitors the temperature and sets the fan speed as
needed.

The `fanslow.service` file is a systemd service unit file used for
autostarting and running the `fanslow` script as a background daemon.

# Installation

Just use the Makefile for installation and removal:

    # make install
    # make uninstall

If you really want to do stuff manually look at the Makefile to find out what
needs to be done.

You can watch the script working with the usual systemd tools:

    # systemctl status fanslow
    # journalctl -u fanslow

