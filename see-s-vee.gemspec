$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "see-s-vee/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "see-s-vee"
  s.version     = SeeSVee::VERSION
  s.authors     = ["Kale McNaney"]
  s.email       = ["kdmny30@gmail.com"]
  s.homepage    = "http://github.com/kdmny/SeeSVee"
  s.summary     = "An easy way to generate CSVs."
  s.description = "An easy way to generate CSVs."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.5"
  s.add_dependency "aws"
  s.add_dependency "aws-s3"  
  s.add_dependency "activeadmin"    
  s.add_dependency "resque"      

  s.add_development_dependency "sqlite3"
end
