:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V3, V4, V2, V1)), []).
trans_preds(p(_, data(V3, V4, V2, V1)), p(_, data(V3p, V4p, V2p, V1p)), []).
var2names(p(pc(_), data(V3, V4, V2, V1)), [(V3, 'y'), (V4, 'x'), (V2, 't'), (V1, 'i')]).
globals(p(pc(_), data(V3, V4, V2, V1)), [], []).
% start location
start(pc(main-0-12)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-3-16)). % line 16
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V3, V4, V2, V1), []).
% cfg loop exit relation
cfg_exit_relation([]).
% 17 transitions
r(p(pc(main-0-12), data(V3, V4, V2, V1)), p(pc(main-2-0), data(V3p, V4p, V2p, V1p)), [], [V3p = V3, V4p = V4, V2p = V2, V1p = 0], 1). % i := 0
stmtsrc(1, 'i=0;').
transition_access( 1, [_, _, _, w] ).
r(p(pc(main-2-0), data(V3, V4, V2, V1)), p(pc(main-1-14), data(V3p, V4p, V2p, V1p)), [], [V3p = V3, V4p = V4, V2p = V3, V1p = V1], 2). % t := y
stmtsrc(2, 't=y;').
transition_access( 2, [r, _, w, _] ).
r(p(pc(main-1-14), data(V3, V4, V2, V1)), p(pc(main-4-14), data(V3p, V4p, V2p, V1p)), [(V4 = V3)], [V3p = V3, V4p = V4, V2p = V2, V1p = V1], 3). % x == y
stmtsrc(3, 'assume(x == y);').
transition_access( 3, [r, r, _, _] ).
r(p(pc(main-4-14), data(V3, V4, V2, V1)), p(pc(main-ret-0), data(V3p, V4p, V2p, V1p)), [], [V3p = V3, V4p = V4, V2p = V2, V1p = V1], 4). % 
stmtsrc(4, 'skip;').
transition_access( 4, [_, _, _, _] ).
r(p(pc(main-1-14), data(V3, V4, V2, V1)), p(pc(main-3-16), data(V3p, V4p, V2p, V1p)), [(V4 +1 =< V3)], [V3p = V3, V4p = V4, V2p = V2, V1p = V1], 5). % x < y
stmtsrc(5, 'assume(x < y);').
transition_access( 5, [r, r, _, _] ).
r(p(pc(main-1-14), data(V3, V4, V2, V1)), p(pc(main-3-16), data(V3p, V4p, V2p, V1p)), [(V4 >= 1+ V3)], [V3p = V3, V4p = V4, V2p = V2, V1p = V1], 6). % x > y
stmtsrc(6, 'assume(x > y);').
transition_access( 6, [r, r, _, _] ).
r(p(pc(main-3-16), data(V3, V4, V2, V1)), p(pc(main-7-16), data(V3p, V4p, V2p, V1p)), [], [V3p = V3, V4p = V4, V2p = V2, V1p = V1], 7). % 
stmtsrc(7, 'skip;').
transition_access( 7, [_, _, _, _] ).
r(p(pc(main-7-16), data(V3, V4, V2, V1)), p(pc(main-8-17), data(V3p, V4p, V2p, V1p)), [], [V3p = V3, V4p = V4, V2p = V2, V1p = V1], 8). % 
stmtsrc(8, 'skip;').
transition_access( 8, [_, _, _, _] ).
r(p(pc(main-7-16), data(V3, V4, V2, V1)), p(pc(main-9-16), data(V3p, V4p, V2p, V1p)), [], [V3p = V3, V4p = V4, V2p = V2, V1p = V1], 9). % 
stmtsrc(9, 'skip;').
transition_access( 9, [_, _, _, _] ).
r(p(pc(main-8-17), data(V3, V4, V2, V1)), p(pc(main-10-18), data(V3p, V4p, V2p, V1p)), [(V4 >= 1+ 0)], [V3p = V3, V4p = V4, V2p = V2, V1p = V1], 10). % x > 0
stmtsrc(10, 'assume(x > 0);').
transition_access( 10, [_, r, _, _] ).
r(p(pc(main-10-18), data(V3, V4, V2, V1)), p(pc(main-3-16), data(V3p, V4p, V2p, V1p)), [], [V3p = (V3 + V4), V4p = V4, V2p = V2, V1p = V1], 11). % y := y + x
stmtsrc(11, 'y=y + x;').
transition_access( 11, [w, r, _, _] ).
r(p(pc(main-8-17), data(V3, V4, V2, V1)), p(pc(main-3-16), data(V3p, V4p, V2p, V1p)), [(V4 =< 0)], [V3p = V3, V4p = V4, V2p = V2, V1p = V1], 12). % x <= 0
stmtsrc(12, 'assume(x <= 0);').
transition_access( 12, [_, r, _, _] ).
r(p(pc(main-6-0), data(V3, V4, V2, V1)), p(pc(main-5-22), data(V3p, V4p, V2p, V1p)), [], [V3p = V3, V4p = V4, V2p = V2, V1p = V1], 13). % 
stmtsrc(13, 'skip;').
transition_access( 13, [_, _, _, _] ).
r(p(pc(main-5-22), data(V3, V4, V2, V1)), p(pc(main-err-0), data(V3p, V4p, V2p, V1p)), [(V3 +1 =< V2)], [V3p = V3, V4p = V4, V2p = V2, V1p = V1], 14). % y < t
stmtsrc(14, 'assume(y < t);').
transition_access( 14, [r, _, r, _] ).
r(p(pc(main-5-22), data(V3, V4, V2, V1)), p(pc(main-11-23), data(V3p, V4p, V2p, V1p)), [(V3 >= V2)], [V3p = V3, V4p = V4, V2p = V2, V1p = V1], 15). % y >= t
stmtsrc(15, 'assume(y >= t);').
transition_access( 15, [r, _, r, _] ).
r(p(pc(main-11-23), data(V3, V4, V2, V1)), p(pc(main-ret-0), data(V3p, V4p, V2p, V1p)), [], [V3p = V3, V4p = V4, V2p = V2, V1p = V1], 16). % 
stmtsrc(16, 'skip;').
transition_access( 16, [_, _, _, _] ).
r(p(pc(main-9-16), data(V3, V4, V2, V1)), p(pc(main-6-0), data(V3p, V4p, V2p, V1p)), [], [V3p = V3, V4p = V4, V2p = V2, V1p = V1], 17). % 
stmtsrc(17, 'skip;').
transition_access( 17, [_, _, _, _] ).
% Atomic blocks
strengthening(p(pc(main-3-16), data(V3, V4, V2, V1)), [( 1)*V1 +( 0) = 0,( 1)*V1 +( 0) >= 0, ( -1)*V1 +( 0) >= 0, ( 1)*V3+( -1)*V2 +( 0) >= 0,( 0)*V3+( 0)*V4+( 0)*V2+( 1)*V1 +( 0) = 0, ( 1)*V3+( 0)*V4+( -1)*V2+( 0)*V1 +( 0) >= 0]).
