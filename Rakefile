# vim: syntax=ruby

require 'rubygems'
require 'bluecloth'
require 'erb'

outputs = []

FileList['examples/*'].each do |input|
    output = File.join("output", File.basename(input)).sub(/\.\w+/, ".html")
    outputs << output

    file output => ["Rakefile", input] do
        vimsyn(input, output)
    end
end

def vimsyn(file, outfile = nil)
    filetype = case file
        when /\.pp/: "puppet"
        when /\.rb/: "ruby"
        when /\.mk/: "make"
        when /\.sh/: "bash"
        when /\.txt/: "text"
        else
            raise "Unknown File type for %s" %  file
        end
    name = File.basename(file).sub(/\..+/, '')
    outfile ||= "/tmp/outfile"
    synfile = outfile + ".tmp"
    codefile = file

    filetype="puppet"

    puts "Creating %s" % outfile
    expr = %Q%/usr/bin/vim -f -n -X -e -s -c  'set filetype=#{filetype}'  -c 'syntax on'    -c 'let html_use_css=1'  -c 'run syntax/2html.vim'  -c 'wq! #{synfile}' -c 'q'  #{codefile}%

    `#{expr}`
    html = File.read(synfile)
    html.sub!(/<title>.+<\/title>/, "<title>#{name}</title>")
    html.sub!(/^(pre.+) \}/) { $1 + "font-size: 22pt; }" }
    html.gsub!(/text-decoration: underline;/, '')
    File.open(outfile, "w") { |f| f.print html }
    File.unlink(synfile)
end

task :clean do
    outputs.each do |file|
        if FileTest.exists?(file)
            File.unlink(file)
        end
    end
end

task :default => outputs
