local Color = require('Files/Color')
local Util = require('Files/Util')
local Extra = require('Files/Extra')
local sw1 = true
if os.getos() == 'Windows' then
    os.execute('title Lua Text Adventure')
end
while sw1 do
    clear()
    Color.print(Color.start..Color.brg.white..'Welcome to '..Color.start..Color.brg.cyan.."LuaTextJourney! (Beta)"..Color.start)
    print(Color.start.."eHow you will start?\n1:New Game\n"..Color.start..Color.brg.black.."2:Countinue"..Color.start..Color.sty.reset.."\n3:Exit\n"..'4-Options(select if you are a linux/mac user)')
    io.write('>')
    local e = io.read()
    if e == '4' then
      if LowEnd == false then
         print('1- ( ) Low-End mode (recommended for linux/mac)')
      else
         print('1- (X) Low-End mode (recommended for linux/mac)')
      end
      local b = io.write('>') and io.read()
      if b == '1' then
         if LowEnd == false then LowEnd = true 
         elseif LowEnd == true then LowEnd = false end
         b = false
      end
    end
    if e == '1' then
       io.write("Insert Character Name:")
       local Name = io.read()
       io.write("'"..Name.."', this name is correct? (Y/N):")
       local Confirm = io.read()
       if Confirm == 'y' then
        clear()
        sw1 = false
        local scene1 = true
        while scene1 do
            clear()
            Report('???', 'Hello? Anyone here?')
            sleep(3)
            Report('???', 'Whatever, if someone is here. Please help me')
            sleep(3)
            print(Name.." has woken up.")
            break
        end
               local sw2 = true
               while sw2 do
                io.write('>')
                local act = io.read()
                
                if act == '/clear' then
                   clear()
                end

                if act == 'follow trail' then
                   if Follow == false and Check == true then
                      print('You follow the trail...')
                      sleep(3)
                      Color.print(Color.start..Color.brg.red..'Oh no, an goblin appeared!'..Color.start)
                      sleep(3)
                      clear()
                      sw2 = false
                      local sw3 = true
                      while sw3 do
                        Color.print(Color.start..Color.brg.red..'Goblin stares at you!'..Color.start)
                        print('|1- ATTACK  2- CHECK   \n3-ITEM   4-ACT')
                        io.write(">>")
                        local act2 = io.read()
                       if act2 == '1' and Player.HP >= 0 then
                          Enemies.Goblin.HP = Enemies.Goblin.HP - Player.ATK
                          
                          print(Name..' attacked the goblin, '..Player.ATK.." Damage! ("..Color.start..Color.brg.red..Enemies.Goblin.HP.."HP"..Color.start..Color.sty.reset..')')
                          sleep(3)
                          if Enemies.Goblin.HP >= 0 then
                            Player.HP = Player.HP - Enemies.Goblin.ATK
                            print('Goblin has attacked '..Name..', '..Enemies.Goblin.ATK..' Damage! ('..Color.start..Color.brg.red..Player.HP..'HP'..Color.start..Color.sty.reset..")")
                            sleep(2)
                          end
                          if Enemies.Goblin.HP <= 0 then
                             print('Goblin has died, '..Name..' Wins!')
                             Enemies.Goblin.HP = Enemies.Goblin.MAXHP
                             sleep(2)
                             sw3 = false
                             sw2 = true
                          end
                        end
                        if act2 == '3' then
                           print("EQUIP OR USE\n 1-"..Inventory.Stick.NAME)
                           io.write('>>')
                           local act3 = io.read()
                           if act3 == '1' then
                              if Inventory.Stick.EQUIPPED == true then
                                 print(Name..' has unequipped '..Inventory.Stick.NAME)
                                 Player.ATK = Player.ATK - Inventory.Stick.ATK
                                 Inventory.Stick.EQUIPPED = false
                              else
                              Player.ATK = Player.ATK + Inventory.Stick.ATK
                              print(Name..' has equipped '..Inventory.Stick.NAME)
                              sleep(2)
                              Inventory.Stick.EQUIPPED = true
                              end
                           end
                        end
                        if act2 == '4' then
                            print('ACT:\n1-SKIP   2-DEFEND\n3-RUN')
                            io.write('>>')
                            local act4 = io.read()
                            if act4 == '1' then
                              print(Name..' has skipped thier turn')
                              sleep(2)
                              Player.HP = Player.HP - Enemies.Goblin.ATK
                              print('Goblin has attacked '..Name..', '..Enemies.Goblin.ATK..' Damage! ('..Color.start..Color.brg.red..Player.HP..'HP'..Color.start..Color.sty.reset..")")
                              sleep(2)
                            end
                            if act4 == '2' then
                               print(Name..' Defended and reduced all damage this turn by '..Player.DEF..'!')
                               sleep(2)
                               Enemies.Goblin.ATK = Enemies.Goblin.ATK - Player.DEF
                               Player.HP = Player.HP - Enemies.Goblin.ATK
                               print('Goblin has attacked '..Name..', '..Enemies.Goblin.ATK..' Damage! ('..Color.start..Color.brg.red..Player.HP..'HP'..Color.start..Color.sty.reset..")")
                               Enemies.Goblin.ATK = Enemies.Goblin.ATK + Player.DEF
                               sleep(2)
                            end
                            if act4 == '3' then
                               print(Name.." Tried to run...")
                               sleep(2)
                               print('But failed!')
                               sleep(2)
                               Player.HP = Player.HP - Enemies.Goblin.ATK
                               print('Goblin has attacked '..Name..', '..Enemies.Goblin.ATK..' Damage! ('..Color.start..Color.brg.red..Player.HP..'HP'..Color.start..Color.sty.reset..")")
                               sleep(2)
                            end
                         end
                         if Player.HP <= 0 then
                            clear()
                            print(Name..' has losed concience...')
                            sleep(2)
                            print('Suddently, '..Name..' has backed to his safezone!')
                            sleep(2)
                            Player.HP = Player.MAXHP
                            sw3 = false
                            sw2 = true
                          end
                          if act2 == '2' then
                           print('Goblin \nATK:'..Enemies.Goblin.ATK.."\nDEF: "..Enemies.Goblin.DEF.."\nHP: "..Enemies.Goblin.HP.."\nDESC: Ork.")
                           sleep(4)
                          end
                          clear()
                          
                      end
                   end
                   
                end

                if act == 'look around' then
                    if La == false then
                        print('You look around..')
                        sleep(3)
                        print('You are in a florest.')
                        La = true
                    elseif La == true then
                        print('You already know you are in a florest, try to check the area.')
                        sleep(2)
                    end
                end
                
                if act == 'check area' then
                   if Check == false then
                       print('You try to inspect the area...')
                       sleep(3)
                       print('You founded an trail, and you have something in you inventory...')
                       Check = true
                   elseif Check == true then
                      print('You know has a trial here, better follow it!')
                      sleep(3)
                   end
                end
               end
            end
    elseif e == '3' then
       Color.print(Color.start..Color.brg.blue.."See you next time!"..Color.start)
       sleep(1)
       os.exit()
    else
        print('Invalid option')
        sleep(3)
        clear()
    end
end
