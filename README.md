see-s-vee
==========

Making it easy to dump data from a Rails app to a CSV on S3.


Dependencies
===========

see-s-vee requires that you're using Resque and leverages it to build and upload the csv file to S3 in the background.

Installation
==========

In your Gemfile:

  gem 'see-s-vee', :git => "http://github.com/kdmny/see-s-vee"


Run the migration installer

	rake see_s_vee:install:migrations 
	
Run the migrations:

	rake db:migrate

Add the file config/s3.yml with your s3 creds:

	development:
		access_key_id: YOUR_ACCESS_KEY
		secret_access_key: YOUR_SECRET
		bucket: YOUR_BUCKET

Make sure your resque process is working on the `see_s_vee_generator`,  by setting the QUEUE environment variable in your 
env, Procfile, or command:

	QUEUE=default,some_other_queue,see_s_vee_generator bundle exec rake resque:work
	
Usage
==========

Let's assume you have a User model and you want to get a CSV of the properties `email`, `created_at` and `first_name`:

	SeeSVee::FunCsv.create(:name => "user_props", :code => "User.all.map{|u| [u.email, u.created_at, u.first_name]}")


Go get your file at:
	
	YOUR_BUCKET_NAME/csvs/user_props.csv


Contributing to see-s-vee
============
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
============

Copyright (c) 2013 K$. See LICENSE.txt for
further details.

