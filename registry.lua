local reg = getreg() --> returns Roblox's registry in a table
for i,v in next, reg do
  if type(v) == 'function' then --> Checks if the current iteration is a function
    if getfenv(v).script then --> Checks if the function's environment is in a script
      table.foreach(debug.getupvalues(v), print) --> Basically a for loop that prints everything, but in one line
      rconsoleprint(getfenv(v).script:GetFullName() .. '\n') --> Prints the location of the script
  end
end
end