pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
function _init()
 m = menu:new{
	 items={
	  {name="work", items={
	   {name="contract"},
	   {name="match"},
	   },
	  },
	  {name="staff"},
	  {name="shop"},
	  {name="settings"},
	 }
	}
	
	m.trail={1,1}
	print(m:get_item(m.trail,m.items).name)
	stop()
end

function pop(stack)
 local v = stack[#stack]
 stack[#stack]=nil
 return v
end

function _update()
 if btnp(⬅️) then m:traverse(⬅️) end
 if btnp(➡️) then m:traverse(➡️) end
 if btnp(⬆️) then m:traverse(⬆️) end
 if btnp(⬇️) then m:traverse(⬇️) end
end

function draw_menu(m)
 if (m.changed==false) return
 m.changed=false
 print("░░░░░")
 for i in all(m.items) do
  local function foo() if (i==m:get_item()) return ">" else return " " end
  print(foo() .. i.name)
 end
end

function _draw()
 draw_menu(m)
end
-->8
--menu system

menu={changed=true,
      trail={1},
      items={},
     }

function menu:new(o)
 o = o or {}
 setmetatable(o, self)
 self.__index = self
 return o
end

function menu:get_item(trail, items)
 local t=trail
 print("getting item...")
 print("t is of type " .. type(t))
 --return if last item in trail
 if (#t==0) then
  print("picked " .. i.name)
  return i
 else
  print("t is of length " .. #t)
  --unpack first item in list
  print("first item in t is " .. type(t[1]))
  --get item on first layer
  i=items[t[1]]
  print("picked " .. i.name)
  --get next item recursively
  pop(t)
  return self:get_item(t, i.items)
 end
end

function menu:traverse(d)
 if (d==⬆️) then
  --return if at start of list
  if (self.trail[1]==1) return
  
  self.trail[#self.trail]-=1
 elseif (d==⬇️) then
  --return if at end of list
  if (self.trail[1]==#self.items) return
  
  self.trail[#self.trail]+=1
	end

	self.changed=true
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
