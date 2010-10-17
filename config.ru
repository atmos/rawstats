require 'rubygems'
require 'lib/rawstats'

use Rack::Static, :urls => ["/css", "/icon", "/js", "/classes"], :root => "public"
use Rack::Legacy::Cgi, "public"
run lambda { |env|
  [302, {"Content-Type" => "text/html", "Location" => "/cgi-bin/awstats.pl"}, "Buh Bye"]
}
