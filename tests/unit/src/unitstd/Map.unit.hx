// String
var map = new Map();
map.exists("foo") == false;
map.get("foo") == null;
map.set("foo", 1);
map.set("bar", 2);
map.set("baz", 3);
var dynmap:Dynamic = map;
var map2:haxe.Constraints.IMap<Dynamic,Dynamic> = dynmap;
var map3:haxe.Constraints.IMap<String, Dynamic> = dynmap;
var map4:haxe.Constraints.IMap<String, Int> = dynmap;
(map is haxe.ds.StringMap) == true;
map.exists("foo") == true;
map.exists("bar") == true;
map.exists("baz") == true;
map.get("foo") == 1;
map.get("bar") == 2;
map.get("baz") == 3;
map2.exists("foo") == true;
map2.get("foo") == 1;
map3.exists("foo") == true;
map3.get("foo") == 1;
map4.exists("foo") == true;
map4.get("foo") == 1;

var copied = map.copy();
copied != map;
copied.exists("foo") == map.exists("foo");
copied.exists("bar") == map.exists("bar");
copied.exists("baz") == map.exists("baz");
copied.get("foo") == map.get("foo");
copied.get("bar") == map.get("bar");
copied.get("baz") == map.get("baz");

copied.set("foo", 4);
copied.get("foo") == 4;
map.get("foo") == 1;

var values = [];
for (val in map) {
	values.push(val);
}
values.length == 3;
values[0] in [1, 2, 3];
values[1] in [1, 2, 3];
values[2] in [1, 2, 3];
var keys = ["foo", "bar", "baz"];
for (key in map.keys()) {
	t(keys.remove(key));
}
keys == [];
map.remove("bar") == true;
map.remove("bar") == false;
map.exists("foo") == true;
map.exists("bar") == false;
map.exists("baz") == true;
map.get("bar") == null;

// Int
var map = new Map();
map.exists(1) == false;
map.get(1) == null;
map.set(1, 1);
map.set(2, 2);
map.set(3, 3);
(map is haxe.ds.IntMap) == true;
map.exists(1) == true;
map.exists(2) == true;
map.exists(3) == true;
map.get(1) == 1;
map.get(2) == 2;
map.get(3) == 3;

var copied = map.copy();
copied != map;
copied.exists(1) == map.exists(1);
copied.exists(2) == map.exists(2);
copied.exists(3) == map.exists(3);
copied.get(1) == map.get(1);
copied.get(2) == map.get(2);
copied.get(3) == map.get(3);

copied.set(1, 4);
copied.get(1) == 4;
map.get(1) == 1;

var values = [];
for (val in map) {
	values.push(val);
}
values.length == 3;
values[0] in [1, 2, 3];
values[1] in [1, 2, 3];
values[2] in [1, 2, 3];
var keys = [1, 2, 3];
for (key in map.keys()) {
	t(keys.remove(key));
}
keys == [];
map.remove(2) == true;
map.remove(2) == false;
map.exists(1) == true;
map.exists(2) == false;
map.exists(3) == true;
map.get(2) == null;

// Hashable
var map = new Map();
var a = new unit.MyAbstract.ClassWithHashCode(1);
var b = new unit.MyAbstract.ClassWithHashCode(2);
var c = new unit.MyAbstract.ClassWithHashCode(3);
map.exists(a) == false;
map.get(a) == null;
map.set(a, 1);
map.set(b, 2);
map.set(c, 3);
map.exists(a) == true;
map.exists(b) == true;
map.exists(c) == true;
map.get(a) == 1;
map.get(b) == 2;
map.get(c) == 3;

var copied = map.copy();
copied != map;
copied.exists(a) == map.exists(a);
copied.exists(b) == map.exists(b);
copied.exists(c) == map.exists(c);
copied.get(a) == map.get(a);
copied.get(b) == map.get(b);
copied.get(c) == map.get(c);

copied.set(a, 4);
copied.get(a) == 4;
map.get(a) == 1;

var values = [];
for (val in map) {
	values.push(val);
}
values.length == 3;
values[0] in [1, 2, 3];
values[1] in [1, 2, 3];
values[2] in [1, 2, 3];
var keys = [a, b, c];
for (key in map.keys()) {
	t(keys.remove(key));
}
keys == [];
map.remove(b) == true;
map.remove(b) == false;
map.exists(a) == true;
map.exists(b) == false;
map.exists(c) == true;
map.get(b) == null;

// Object
var map = new Map();
var a = new unit.MyAbstract.ClassWithoutHashCode(1);
var b = new unit.MyAbstract.ClassWithoutHashCode(2);
var c = new unit.MyAbstract.ClassWithoutHashCode(3);
map.exists(a) == false;
map.get(a) == null;
map.set(a, 1);
map.set(b, 2);
map.set(c, 3);
map.exists(a) == true;
map.exists(b) == true;
map.exists(c) == true;
map.get(a) == 1;
map.get(b) == 2;
map.get(c) == 3;

var copied = map.copy();
copied != map;
copied.exists(a) == map.exists(a);
copied.exists(b) == map.exists(b);
copied.exists(c) == map.exists(c);
copied.get(a) == map.get(a);
copied.get(b) == map.get(b);
copied.get(c) == map.get(c);

copied.set(a, 4);
copied.get(a) == 4;
map.get(a) == 1;

var values = [];
for (val in map) {
	values.push(val);
}
values.length == 3;
values[0] in [1, 2, 3];
values[1] in [1, 2, 3];
values[2] in [1, 2, 3];
var keys = [a, b, c];
for (key in map.keys()) {
	t(keys.remove(key));
}
keys == [];
map.remove(b) == true;
map.remove(b) == false;
map.exists(a) == true;
map.exists(b) == false;
map.exists(c) == true;
map.get(b) == null;

// [] access
var map = new Map();
map["foo"] == null;
map["foo"] = 12;
map.get("foo") == 12;
map["foo"] == 12;
map["foo"] += 2;
map.get("foo") == 14;
map["foo"] == 14;
map["foo"] *= map["foo"] + 2;
map["foo"] == 224;
map["f" + "o" + "o"] -= 223;
map[(function(s) return s + "o")("fo")] == 1;
map["bar"] = map["foo"] = 9;
map["bar"] == 9;
map["foo"] == 9;

#if !(java || cs)
['' => ''].keys().next() == '';
['' => ''].iterator().next() == '';
[2 => 3].keys().next() == 2;
[2 => 3].iterator().next() == 3;
//[a => b].keys().next() == a;
//[a => b].iterator().next() == b;
#end