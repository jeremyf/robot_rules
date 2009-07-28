robot_rules
===========

A tool to determine if the robots.txt would prevent a given user agent 
from making a request to a given URI.

Example
-------
  
  Given the following:
    #!/usr/local/bin/ruby -w

    require "robot_rules"
    require "open-uri"

    rules      = RobotRules.new("RubyQuizBrowser 1.0")
    robots_url = "http://pragmaticprogrammer.com/robots.txt"

    open(robots_url) do |url|
       data = url.read

       puts "/robots.txt:"
       puts data
       puts

       rules.parse(robots_url, data)
    end

    puts "URL tests:"
    %w{ http://pragmaticprogrammer.com/images/dave.jpg
         http://pragmaticprogrammer.com/imagination }.each do |test|
       puts "rules.allowed?( #{test.inspect} )"
       puts rules.allowed?(test)
    end

    __END__

  This script will print

    /robots.txt:
    User-agent:  *
    Disallow:    images

    URL tests:
    rules.allowed?( "http://pragmaticprogrammer.com/images/dave.jpg" )
    false
    rules.allowed?( "http://pragmaticprogrammer.com/imagination" )
    true
  


History
-------

RobotRules was created by James Edward Gray II as a response to "Port a 
Library" Ruby Quiz #64.  A few years later, Jeremy Friesen wrapped the 
library up into a gem and added some tests.

Copyright
---------

Copyright (c) 2009 James Edward Gray II and Jeremy Friesen. See LICENSE for details.
