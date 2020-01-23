pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
--in lua, unctions may return
--multiple results

function maximum(a)
 local mi = 1  --max index
 local m=a[mi] --max value
 for i,val in pairs(a) do
  if val > m then
   mi=i
   m=val
  end
 end
 return m,mi
end

print(maximum({8,10,23,12,5}))

--in a multiple assignment,
--a function call as the last
--(or only) expression produces
--as many results as needed to
--match the variables:
function foo () return 'a','b' end
x,y,z = 10,foo()
-- x=10, y='a', z='b'

--if a function has no results,
--or not as many results as we
--need, lua produces nils:
x,y,z = foo()
-- x='a', y='b', z=nil

--a constructor also collects
--all results from a call,
--without any adjustments:
a = {foo()} -- a = {'a', 'b'}

function _init() end
function _update() end
function _draw() end
-->8
--an important use for unpack
--is in a generic call
--mechanism. a generic call
--mechanism allows you to call
--any function, with any
--arguments, dynamically.

function unpack (t, i)
	i = i or 1
	if t[i] ~= nil then
	 return t[i], unpack(t, i + 1)
	end
end

--the call to unpack returns
--all values in a, which become
--the arguments to f.
--for instance, if we execute
f = print
a = {"hello", 64, 120}

--then this call...
f(unpack(a))
--is the same as
print("hello", 64, 120)
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
