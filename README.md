Rails Templates
===============

Forontend Project
---------
* create a project
<pre>
rails new myapp --skip-active-record --skip-test-unit -m https://raw.github.com/stgeneral/rails-templates/master/frontend.rb
</pre>
* start build server
<pre>
rails s -e build -p 8989
</pre>
* build project
<pre>
rake front:build
</pre>