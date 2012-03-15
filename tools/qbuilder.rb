# Takes a file containing the actual question and
# answer, one per line:
#
#  Where is `size_t` defined?
#  stddef.h
#  stdarg.h
#  stdlib.h
#  stdio.h
#  programming
#  C
#  1
#
# (the last 3 lines are category, sub_category(wtf?) and optional 'nerd_level')
#
# These are merged w/ personal data taken from ~/.nerdpursuit
# and the very ornate jsonschema format is generated.
#

def read_ini
  iNI = %w{creator creator_twitter creator_github nerd_level}
  ini = {}
  ini["created_at"] = Time.new.strftime("%Y-%m-%d")
  ini["right_answer"] = "a1"
  begin
    _ini = File.readlines("#{ENV["HOME"]}/.nerdpursuit")
    _ini.each_with_index{|l, i|
    key = iNI[i]
    ini[key] = l.strip if l.strip != ""
    }
  rescue 
  puts $!
  puts $!.backtrace
    # create_ini # TODO
    STDERR.puts "please create a `~/.nerdpursuit` file containing values for:"
    STDERR.puts "creator"
    STDERR.puts "creator_twitter (optional)"
    STDERR.puts "creator_github (optional)"
    STDERR.puts "nerd_level (optional)"
    
    exit 1
  end
  @ini = ini
end

def die msg
  STDERR.puts msg
  exit 1
end

def make_q lns
  h = {}
  flds = %w{text a1 a2 a3 a4 category sub_category nerd_level}
  lns.each_with_index {|l,i|
    die "empty line #{i}" if l.strip! == ""
    h[flds[i]] = l
  }
  q = @ini.merge(h)
  q["nerd_level"] = q["nerd_level"].to_i if q["nerd_level"]
  require 'json'
  JSON.pretty_generate({:question => q})
end

if $0 == __FILE__
  read_ini
  fn = ARGV[0]
  ln = File.readlines(fn)
  puts make_q ln 

end
