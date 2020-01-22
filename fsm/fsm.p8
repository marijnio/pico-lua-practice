pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
function _init()
 fsm = machine.create({
  initial = 'green',
  events = {
   { name = 'warn',  from = 'green',  to = 'yellow' },
   { name = 'panic', from = 'yellow', to = 'red'    },
   { name = 'calm',  from = 'red',    to = 'yellow' },
   { name = 'clear', from = 'yellow', to = 'green'  }
 	},
	 callbacks = {
--	  onwarn=function(self,event,from,to) print("yellow lights...") end,
	}})
end


function _update()
 if btnp(❎) then
  print("the current state is " .. fsm.current)
	elseif btnp(⬆️) then
	 if fsm:is("yellow") then fsm:panic() end
	 if fsm:is("green") then fsm:warn() end
	 print("the new state is " .. fsm.current)
 elseif btnp(⬇️) then
	 if fsm:is("yellow") then fsm:clear() end
	 if fsm:is("red") then fsm:calm() end
	 print("the new state is " .. fsm.current)
 end
end

function _draw()
end

-->8
machine = {}
machine.__index = machine

function munpack(t, from, to)
  from = from or 1
  to = to or #t
  if from > to then return end
  return t[from], munpack(t, from+1, to)
end

function call_handler(handler, params)
 if handler then
  return handler(munpack(params))
 end
end

--this function creates the
--transitions for between states
local function create_transition(name)
 return function(self, ...)
  --check transition is legal
  local can, to = self:can(name)

  --if we can
	 if can then
	  --get some params
   local from = self.current
   local params = { self, name, from, to, ... }
      
   if call_handler(self["onbefore" .. name], params) == false
   or call_handler(self["onleave" .. from], params) == false then
    return false
   end
   
   --perform transition
   self.current = to
   
   --perform callbacks
   call_handler(self["onenter" .. to] or self["on" .. to], params)
   call_handler(self["onafter" .. name] or self["on" .. name], params)
   call_handler(self["onstatechange"], params)

   return true
 	end

 	return false
	end
end

local function add_to_map(map, event)
 if type(event.from) == 'string' then
  map[event.from] = event.to
 else
  for _, from in ipairs(event.from) do
   map[from] = event.to
  end
 end
end

function machine.create(options)
 assert(options.events)

 local fsm = {}
 setmetatable(fsm, machine)

 fsm.options = options
 fsm.current = options.initial or 'none'
 fsm.events = {}

 for _, event in pairs(options.events or {}) do
  local name = event.name
  fsm[name] = fsm[name] or create_transition(name)
  fsm.events[name] = fsm.events[name] or { map = {} }
  add_to_map(fsm.events[name].map, event)
 end
  
 for name, callback in pairs(options.callbacks or {}) do
  fsm[name] = callback
 end

 return fsm
end

function machine:is(state)
 return self.current == state
end

function machine:can(e)
 local event = self.events[e]
 local to = event and event.map[self.current] or event.map['*']
 return to ~= nil, to
end

function machine:cannot(e)
 return not self:can(e)
end

__gfx__
000000000a0000a000cccc00880000880e0000e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000a000000a0cccccc00888888000eeee000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700a0aaaa0acccccccc080000800eeeeee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000a0aa0a0cc0cc0cc08088080ee0ee0ee0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000aa00aa00cccccc008000080eee00eee0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070000aaaa0000cccc00088888800ee00ee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000aa00aa00cccccc008088080e0e00e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000a0a00a0acc0cc0cc00800800e000000e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
