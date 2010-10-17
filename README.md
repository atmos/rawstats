rawstats
========

How to host [awstats](http://awstats.sourceforge.net/) under ruby or rack.  You should only have to setup a daily cron job.

Running
-------

    % bundle install --binstubs
    % bin/rackup
    % open http://localhost:9292

Config Options
--------------

There's only two options, where your store your data and the command
used to grab your history from logs.

### DirData Config Option

By default the data is set to `<rawstats root>/local-data`.  If you need to change that then you should export the `RAWSTATS_DATA_DIR` environmental variable, it'll automatically use that if set.  For more information on this variable, checkout the [awstats docs on this option][dirdata].

### LogFile Config Option

By default the data is set to `gzip -c -d /var/log/nginx/access_logs/*.log.*.gz |`.  If you need to change that then you should export the `RAWSTATS_LOG_COMMAND` environmental variable, it'll automatically use that if set.  For more information on this variable, checkout the [awstats docs on this option][logfile].

Cron
----

You only need to run `bin/daily` from a cron job, you can run it by hand if you want.

    % bin/daily

I'm running it like this on my systems:

    % crontab -l
    0 8 * * * cd /home/atmos/pages-stats && bin/daily >> /home/atmos/pages-stats/cron.log

LICENSE
-------

The license is GPL because I have no clue how else to distribute awstats(which is GPL).

[dirdata]: http://awstats.sourceforge.net/docs/awstats_config.html#DirData
[logfile]: http://awstats.sourceforge.net/docs/awstats_config.html#LogFile
