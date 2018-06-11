// Generated by BUCKLESCRIPT VERSION 2.1.0, PLEASE EDIT WITH CARE
'use strict';

var $$Map                         = require("bs-platform/lib/js/map.js");
var $$Array                       = require("bs-platform/lib/js/array.js");
var Curry                         = require("bs-platform/lib/js/curry.js");
var Js_dict                       = require("bs-platform/lib/js/js_dict.js");
var Caml_obj                      = require("bs-platform/lib/js/caml_obj.js");
var Caml_builtin_exceptions       = require("bs-platform/lib/js/caml_builtin_exceptions.js");
var ParameterKey$LonaCompilerCore = require("../core/parameterKey.bs.js");

var compare = Caml_obj.caml_compare;

var include = $$Map.Make(/* module */[/* compare */compare]);

var empty = include[0];

var add = include[3];

var merge = include[6];

var find = include[21];

function fromJsDict(dict) {
  return $$Array.fold_left((function (map, param) {
                return Curry._3(add, ParameterKey$LonaCompilerCore.fromString(param[0]), param[1], map);
              }), empty, Js_dict.entries(dict));
}

function find_opt(key, map) {
  var exit = 0;
  var item;
  try {
    item = Curry._2(find, key, map);
    exit = 1;
  }
  catch (exn){
    if (exn === Caml_builtin_exceptions.not_found) {
      return /* None */0;
    } else {
      throw exn;
    }
  }
  if (exit === 1) {
    return /* Some */[item];
  }
  
}

function assign(base, extender) {
  return Curry._3(merge, (function (_, a, b) {
                if (b) {
                  return /* Some */[b[0]];
                } else if (a) {
                  return /* Some */[a[0]];
                } else {
                  return /* None */0;
                }
              }), base, extender);
}

var is_empty = include[1];

var mem = include[2];

var singleton = include[4];

var remove = include[5];

var compare$1 = include[7];

var equal = include[8];

var iter = include[9];

var fold = include[10];

var for_all = include[11];

var exists = include[12];

var filter = include[13];

var partition = include[14];

var cardinal = include[15];

var bindings = include[16];

var min_binding = include[17];

var max_binding = include[18];

var choose = include[19];

var split = include[20];

var map = include[22];

var mapi = include[23];

exports.empty       = empty;
exports.is_empty    = is_empty;
exports.mem         = mem;
exports.add         = add;
exports.singleton   = singleton;
exports.remove      = remove;
exports.merge       = merge;
exports.compare     = compare$1;
exports.equal       = equal;
exports.iter        = iter;
exports.fold        = fold;
exports.for_all     = for_all;
exports.exists      = exists;
exports.filter      = filter;
exports.partition   = partition;
exports.cardinal    = cardinal;
exports.bindings    = bindings;
exports.min_binding = min_binding;
exports.max_binding = max_binding;
exports.choose      = choose;
exports.split       = split;
exports.find        = find;
exports.map         = map;
exports.mapi        = mapi;
exports.fromJsDict  = fromJsDict;
exports.find_opt    = find_opt;
exports.assign      = assign;
/* include Not a pure module */
