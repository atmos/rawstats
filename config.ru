require 'rubygems'
require 'rack-legacy'
require 'pp'

use Rack::Static, :urls => ["/css", "/icon", "/js", "/classes", "/2010"], :root => "public"
use Rack::Legacy::Cgi, "public"
run lambda { |env|
  [302, {"Content-Type" => "text/html", "Location" => "/cgi-bin/awstats.pl"}, "Buh Bye"]
}
