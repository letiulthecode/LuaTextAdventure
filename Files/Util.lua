local MetaData = require('Files/Extra')

function clear()
   if LowEnd == true then
      for i=1, 25 do
          print('\n\n')
      end
   else
      if os.getos() == 'Unix' then
         os.execute('clear')
      end
      os.execute('cls')
   end
   
end

function Report(pname, msg)
   if pname then io.stderr:write(string.format("%s: ", pname)) end
   io.stderr:write(string.format("%s\n", msg))
   io.stderr:flush()
end

function os.getos()
    if os.getenv("OS") == "Windows_NT" then
       return "Windows"
    else
       return "Unix"
    end
end

function sleep(a)
   if type(a) == "number" then
      if os.getos() == 'Windows' then
        os.execute("ping -n " .. a .. " localhost > NUL")
      else
         os.execute('sleep '..a)
      end
    end
end

