# CLI Interface for CS 125 Prarirelearn

A web bot to let you pretend that prarielearn can be done via commandline in your text editor of 
choice (micro, vim, emacs, butterflies etc.).

### Setup

1. Install the Ruby programming language and Rubygems. 

2. Install dependencies
```shell
$ gem install pry 
$ gem install watir
$ gem install nokogiri
$ gem install webdrivers
```
3. Install firefox - install it like you would normally do. 

4. Add your netid and password into `account.txt`. If you don't want to add it, remove the file
and the bot will prompt a user login.

### Usage

1. Type into the command line
```shell
$ ruby cs125-prarielearn-cli.rb
```

2. Read the question. 

3. The program will specify that a file was created. Don't close the program, rather open a new
tab and edit it using the editor of choice. Hit enter in the main program to submit your program. 
### TODO

1. Generalize this for other courses
2. Make this work with past hw problems
3. Make this support Spring 19 and later semesters.
4. Reduce dependency with chrome, maybe firefox because it's FOSS.
5. Add bundler support