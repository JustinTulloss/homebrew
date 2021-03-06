require 'formula'

class Redcar < Formula
  head 'https://github.com/danlucraft/redcar.git'
  homepage 'https://github.com/danlucraft/redcar'

  depends_on 'jruby'
  depends_on 'cucumber' => :jruby

  def install
    puts "You need the RSpec gem installed under JRuby or this will not work."

    system "jruby bin/redcar install"
    system "jruby -S rake build"
    libexec.install ['bin', 'lib', 'plugins', 'textmate', 'vendor']

    (bin+'redcar').write <<-EOS
#!/bin/bash
jruby -J-XstartOnFirstThread \"#{libexec}/bin/redcar\"
EOS
    chmod 0555, (bin+'redcar')
  end
end
