pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
m={}

function _init()
 m.items={
  {name="work", items={
   {name="contract"},
   {name="match"},
   },
  },
  {name="staff"},
  {name="shop"},
  {name="settings"},
 }
 m.changed=true
 m.trail={1}
end

function m:get_item(trail)
 local t=trail or m.trail
 local i=m.items[t[1]]
 if (#t==1) then
  return i
 else
  return get_item(i,pop(t))
 end
end

function m.traverse(d)
 if (d==⬇️) then
  m.trail[#m.trail]+=1
  m.changed=true
 end
 if (d==⬆️) then
  m.trail[#m.trail]-=1
  m.changed=true
 end
end

function pop(stack)
 local v = stack[#stack]
 stack[#stack]=nil
 return v
end

function _update()
 if btnp(⬇️) then
  m.traverse(3)
 elseif btnp(⬆️) then
  m.traverse(2)
 end
end

function draw_menu(m)
 if (m.changed==false) return
 m.changed=false
 print("menu state changed")
 for i in all(m.items) do
  print(i.name)
  if (i==m.selected) then print("*") end
 end
 print("selected " .. m.get_item().name)
end

function _draw()
 draw_menu(m)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
