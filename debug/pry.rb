create_file '.pryrc', <<~CODE
  # awesome_print
  begin
    require "awesome_print"
    Pry.config.print = proc { |output, value| output.puts value.ai }
  rescue LoadError
    puts "no awesome_print :("
  end

  # prydebug
  if defined?(PryByebug)
    Pry.commands.alias_command 's', 'step'
    Pry.commands.alias_command 'n', 'next'
    Pry.commands.alias_command 'f', 'finish'
    Pry.commands.alias_command 'c', 'continue'
  end
CODE

git add: '.'

git commit: %( -m 'setting pry' )
