pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
--functions are the main
--mechanism for abstraction of
--statements and expressions
--in lua.
print(stat(90))
a = sin(3) + cos(10)

--if the function call has no
--arguments, we must write an
--empty list () to indicate
--the call.
print(t())

--there is a special case to
--this rule:

--if the function has one
--single argument and this
--argument is either a literal
--string...
print "hello world"

--or a table constructor.
print [[message]]

function f(t) return t[1] end
f{x=10, y=20}
print(type{})

--this function has 1 as its
--default argument; that is,
--the call inccount(), without
--arguments, increments count
--by one.
function inccount(n)
 n = n or 1
 count = count + n
end

--when you call inccount(),
--lua first initializes n with
--nil; the or results in its
--second operand; and as a
--result lua assigns a default
--1 to n.

function _init() end
function _update() end
function _draw() end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
