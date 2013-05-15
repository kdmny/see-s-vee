require File.join(File.dirname(__FILE__), "../array")
module SeeSVee
  class Engine < ::Rails::Engine
    isolate_namespace SeeSVee
  end
end
