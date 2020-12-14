function clear()
   if os.getenv("OS") == 'Windows_NT' then os.execute('cls')
   else os.execute('clear') end
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
         os.execute('ping -n '.. a ..' localhost > /dev/null')
      end
    else
       assert(false ,"Attempt to call "..type(a).." instead of an number value")
    end
end