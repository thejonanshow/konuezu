require "helix_runtime"

begin
  require "konuezu_rust/native"
rescue LoadError
  warn "Unable to load konuezu_rust/native. Please run `rake build`"
end
