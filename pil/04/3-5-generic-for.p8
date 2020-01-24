pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
--the generic for loop allows
--you to traverse all values
--returned by an iterator
--function.

a={apple="red",banana="yellow",
   orange="orange"}

--print all values of array `a'
for i,v in pairs(a) do print(v) end
--for each step, i gets an
--index while v gets the value
--from that index.

print("…………")

--a similar example shows how
--we traverse all keys of a
--table.
for k in pairs(a) do print(k) end

print("…………")

--suppose you have a table with
--the names of weekdays:
days = {"sunday", "monday",
        "tuesday", "wednesday",
        "thursday", "friday",
        "saturday"}
--now you want to translate a
--name into its position in the
--week. you can search the
--table, looking for the given
--name. a more efficient
--approach is to build a reverse
--table with the names as
--indices and numbers as values.
revdays={["sunday"] = 1,
         ["monday"] = 2,
         ["tuesday"] = 3,
         ["wednesday"] = 4,
         ["thursday"] = 5,
         ["friday"] = 6,
         ["saturday"] = 7}

--then, all you have to do to
--find the order of a name is
--to index this reverse table:
x="tuesday"
print(revdays[x])

--of course, we do not need to
--manually declare the reverse
--table. we can build it
--automatically.

revdays={}
for i,v in pairs(days) do
 revdays[v]=i
end
print(revdays[x])
--the loop will do the
--assignment for each element
--of days, with the variable i
--getting the index (1, 2, ...)
--and v the value ("sunday",
--"monday", ...).

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
