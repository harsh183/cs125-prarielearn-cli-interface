# This program gives a sorta cli interface to do the daily (plus other prarielearn in the future)

# TODO: Headless browser
# TODO: Maybe sub with API?
# TODO: Make a general one for all prarielearn (but this one is cs125 specific) I guess I'll first write cs125 and then generalize

require 'pry'
require 'watir'
require 'nokogiri'

def login
  @browser.goto("https://prairielearn.engr.illinois.edu/pl/")
  @browser.as(class: "btn-illinois")[0].click
  if File.exist? 'account.txt'
    contents = File.read('account.txt').lines
    username = contents[0].chomp
    password = contents[1].chomp
    @browser.inputs(id: 'j_username')[0].send_keys(username)
    @browser.inputs(id: 'j_password')[0].send_keys(password)
    @browser.inputs(type: 'submit')[0].click
  else
    puts "ENTER LOGIN AND HIT SUBMIT"
    puts "HIT ENTER OVER HERE ONCE LOGGED IN"
    gets
  end
end

def go_to_latest_problem
	@browser.goto("https://prairielearn.engr.illinois.edu/pl/course_instance/13327")
	@browser.tables.first.as[0].click # Hit first link in table
	@browser.tables.first.as[0].click

	# Hopefully we reached the problem 
	# TODO: Add check to see if I reached the problem
end

def get_problem(program_name)
  # First get all elements
  text = @browser.div(class: 'question-body').text
  text = text.split(program_name)[0] # Take the part before the program
  return text
end

def get_program_name
  @browser.divs(class: 'ace_editor')[0].siblings[0].text
end

def get_starter_code
  @browser.divs(class: 'ace_content')[0].text
end

def submit_solution(program_text)
  # Be careful here bc checkstyle
  write_to_program_box(program_text)
  hit_submit_button
end

def write_to_program_box(program_text)
end

def hit_submit_button
  @browser.div(class: 'question-container')
end

def get_error_message
end

def success?
end

def print_seperator
	puts "==================================================================="
	puts "\n\n\n\n\n"
end

@browser = Watir::Browser.new

puts "Welcome to CLI prarielearn (tho this is using the website rn, subject to change later)"
print_seperator

login
go_to_latest_problem

program_name = get_program_name

problem_statement = get_problem(program_name)
puts problem_statement
print_seperator

starter_code = get_starter_code
File.write(program_name, starter_code)

puts "==================================================================="
puts "Created a file named #{program_name} for you. Keep editing it, saving it and HIT ENTER to submit everytime"
puts "Open a new tab and editor of choice for it"
puts "Results displayed here"

binding.pry

problem_finished = false
until problem_finished
  program_text = File.read(program_name)
  submit_solution(program_text)
  problem_finished = success?
end

puts "Congrats you finished"

binding.pry