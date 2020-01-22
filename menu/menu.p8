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
end

function pop(stack)
 local v = stack[#stack]
 stack[#stack]=nil
 return v
end

function _update()
 if btnp(⬇️) then
  m:traverse(3)
 elseif btnp(⬆️) then
  m:traverse(2)
 end
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

function menu:get_item(trail)
 local t=trail or self.trail
 local i=self.items[t[1]]
 if (#t==1) then
  return i
 else
  return get_item(i,pop(t))
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
