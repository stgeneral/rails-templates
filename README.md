Rails Templates
===============

Frontend Project
---------
* Create a project
<pre>
rails new myapp --skip-active-record --skip-test-unit -m https://raw.github.com/stgeneral/rails-templates/master/frontend.rb
</pre>
* Start development server
<pre>
rails s
</pre>
* Build web app. It is better to stop development server before
<pre>
rake front:build
</pre>
