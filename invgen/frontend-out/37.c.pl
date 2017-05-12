:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V1, V4, V3, V2)), []).
trans_preds(p(_, data(V1, V4, V3, V2)), p(_, data(V1p, V4p, V3p, V2p)), []).
var2names(p(pc(_), data(V1, V4, V3, V2)), [(V1, 'x'), (V4, 'tmp'), (V3, 'n'), (V2, 'm')]).
globals(p(pc(_), data(V1, V4, V3, V2)), [], []).
% start location
start(pc(main-0-10)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-1-11)). % line 11
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V1, V4, V3, V2), []).
% cfg loop exit relation
cfg_exit_relation([]).
% 24 transitions
r(p(pc(main-0-10), data(V1, V4, V3, V2)), p(pc(main-2-0), data(V1p, V4p, V3p, V2p)), [], [V1p = 0, V4p = V4, V3p = V3, V2p = V2], 1). % x := 0
stmtsrc(1, 'x=0;').
transition_access( 1, [w, _, _, _] ).
r(p(pc(main-2-0), data(V1, V4, V3, V2)), p(pc(main-1-11), data(V1p, V4p, V3p, V2p)), [], [V1p = V1, V4p = V4, V3p = V3, V2p = 0], 2). % m := 0
stmtsrc(2, 'm=0;').
transition_access( 2, [_, _, _, w] ).
r(p(pc(main-1-11), data(V1, V4, V3, V2)), p(pc(main-5-11), data(V1p, V4p, V3p, V2p)), [], [V1p = V1, V4p = V4, V3p = V3, V2p = V2], 3). % 
stmtsrc(3, 'skip;').
transition_access( 3, [_, _, _, _] ).
r(p(pc(main-5-11), data(V1, V4, V3, V2)), p(pc(main-6-12), data(V1p, V4p, V3p, V2p)), [(V1 +1 =< V3)], [V1p = V1, V4p = V4, V3p = V3, V2p = V2], 4). % x < n
stmtsrc(4, 'assume(x < n);').
transition_access( 4, [r, _, r, _] ).
r(p(pc(main-5-11), data(V1, V4, V3, V2)), p(pc(main-7-11), data(V1p, V4p, V3p, V2p)), [(V1 >= V3)], [V1p = V1, V4p = V4, V3p = V3, V2p = V2], 5). % x >= n
stmtsrc(5, 'assume(x >= n);').
transition_access( 5, [r, _, r, _] ).
r(p(pc(main-6-12), data(V1, V4, V3, V2)), p(pc(main-9-13), data(V1p, V4p, V3p, V2p)), [], [V1p = V1, V4p = V4, V3p = V3, V2p = V2], 6). % 
stmtsrc(6, 'skip;').
transition_access( 6, [_, _, _, _] ).
r(p(pc(main-9-13), data(V1, V4, V3, V2)), p(pc(main-8-15), data(V1p, V4p, V3p, V2p)), [], [V1p = V1, V4p = V4, V3p = V3, V2p = V1], 7). % m := x
stmtsrc(7, 'm=x;').
transition_access( 7, [r, _, _, w] ).
r(p(pc(main-6-12), data(V1, V4, V3, V2)), p(pc(main-8-15), data(V1p, V4p, V3p, V2p)), [], [V1p = V1, V4p = V4, V3p = V3, V2p = V2], 8). % 
stmtsrc(8, 'skip;').
transition_access( 8, [_, _, _, _] ).
r(p(pc(main-8-15), data(V1, V4, V3, V2)), p(pc(main-1-11), data(V1p, V4p, V3p, V2p)), [], [V1p = (V1 + 1), V4p = V4, V3p = V3, V2p = V2], 9). % x := x + 1
stmtsrc(9, 'x=x + 1;').
transition_access( 9, [w, _, _, _] ).
r(p(pc(main-4-0), data(V1, V4, V3, V2)), p(pc(main-3-17), data(V1p, V4p, V3p, V2p)), [], [V1p = V1, V4p = V4, V3p = V3, V2p = V2], 10). % 
stmtsrc(10, 'skip;').
transition_access( 10, [_, _, _, _] ).
r(p(pc(main-3-17), data(V1, V4, V3, V2)), p(pc(main-11-17), data(V1p, V4p, V3p, V2p)), [(V3 >= 1+ 0)], [V1p = V1, V4p = V4, V3p = V3, V2p = V2], 11). % n > 0
stmtsrc(11, 'assume(n > 0);').
transition_access( 11, [_, _, r, _] ).
r(p(pc(main-11-17), data(V1, V4, V3, V2)), p(pc(main-13-17), data(V1p, V4p, V3p, V2p)), [(0 =< V2)], [V1p = V1, V4p = V4, V3p = V3, V2p = V2], 12). % 0 <= m
stmtsrc(12, 'assume(0 <= m);').
transition_access( 12, [_, _, _, r] ).
r(p(pc(main-13-17), data(V1, V4, V3, V2)), p(pc(main-15-17), data(V1p, V4p, V3p, V2p)), [(V2 +1 =< V3)], [V1p = V1, V4p = V4, V3p = V3, V2p = V2], 13). % m < n
stmtsrc(13, 'assume(m < n);').
transition_access( 13, [_, _, r, r] ).
r(p(pc(main-15-17), data(V1, V4, V3, V2)), p(pc(main-12-17), data(V1p, V4p, V3p, V2p)), [], [V1p = V1, V4p = 1, V3p = V3, V2p = V2], 14). % tmp := 1
stmtsrc(14, 'tmp=1;').
transition_access( 14, [_, w, _, _] ).
r(p(pc(main-13-17), data(V1, V4, V3, V2)), p(pc(main-16-17), data(V1p, V4p, V3p, V2p)), [(V2 >= V3)], [V1p = V1, V4p = V4, V3p = V3, V2p = V2], 15). % m >= n
stmtsrc(15, 'assume(m >= n);').
transition_access( 15, [_, _, r, r] ).
r(p(pc(main-16-17), data(V1, V4, V3, V2)), p(pc(main-12-17), data(V1p, V4p, V3p, V2p)), [], [V1p = V1, V4p = 0, V3p = V3, V2p = V2], 16). % tmp := 0
stmtsrc(16, 'tmp=0;').
transition_access( 16, [_, w, _, _] ).
r(p(pc(main-11-17), data(V1, V4, V3, V2)), p(pc(main-14-17), data(V1p, V4p, V3p, V2p)), [(0 >= 1+ V2)], [V1p = V1, V4p = V4, V3p = V3, V2p = V2], 17). % 0 > m
stmtsrc(17, 'assume(0 > m);').
transition_access( 17, [_, _, _, r] ).
r(p(pc(main-14-17), data(V1, V4, V3, V2)), p(pc(main-12-17), data(V1p, V4p, V3p, V2p)), [], [V1p = V1, V4p = 0, V3p = V3, V2p = V2], 18). % tmp := 0
stmtsrc(18, 'tmp=0;').
transition_access( 18, [_, w, _, _] ).
r(p(pc(main-12-17), data(V1, V4, V3, V2)), p(pc(main-err-0), data(V1p, V4p, V3p, V2p)), [(V4 = 0)], [V1p = V1, V4p = V4, V3p = V3, V2p = V2], 19). % tmp == 0
stmtsrc(19, 'assume(tmp == 0);').
transition_access( 19, [_, r, _, _] ).
r(p(pc(main-12-17), data(V1, V4, V3, V2)), p(pc(main-10-18), data(V1p, V4p, V3p, V2p)), [(V4 +1 =< 0)], [V1p = V1, V4p = V4, V3p = V3, V2p = V2], 20). % tmp < 0
stmtsrc(20, 'assume(tmp < 0);').
transition_access( 20, [_, r, _, _] ).
r(p(pc(main-12-17), data(V1, V4, V3, V2)), p(pc(main-10-18), data(V1p, V4p, V3p, V2p)), [(V4 >= 1+ 0)], [V1p = V1, V4p = V4, V3p = V3, V2p = V2], 21). % tmp > 0
stmtsrc(21, 'assume(tmp > 0);').
transition_access( 21, [_, r, _, _] ).
r(p(pc(main-3-17), data(V1, V4, V3, V2)), p(pc(main-10-18), data(V1p, V4p, V3p, V2p)), [(V3 =< 0)], [V1p = V1, V4p = V4, V3p = V3, V2p = V2], 22). % n <= 0
stmtsrc(22, 'assume(n <= 0);').
transition_access( 22, [_, _, r, _] ).
r(p(pc(main-10-18), data(V1, V4, V3, V2)), p(pc(main-ret-0), data(V1p, V4p, V3p, V2p)), [], [V1p = V1, V4p = V4, V3p = V3, V2p = V2], 23). % 
stmtsrc(23, 'skip;').
transition_access( 23, [_, _, _, _] ).
r(p(pc(main-7-11), data(V1, V4, V3, V2)), p(pc(main-4-0), data(V1p, V4p, V3p, V2p)), [], [V1p = V1, V4p = V4, V3p = V3, V2p = V2], 24). % 
stmtsrc(24, 'skip;').
transition_access( 24, [_, _, _, _] ).
% Atomic blocks
strengthening(p(pc(main-1-11), data(V1, V4, V3, V2)), [( 1)*V2 +( 0) >= 0, ( 1)*V1 +( 0) >= 0,( 1)*V2 +( 0) >= 0, ( 1)*V1+( -1)*V2 +( 0) >= 0, ( 1)*V1+( 1)*V2 +( 0) >= 0, ( 1)*V1 +( 0) >= 0,( 0)*V1+( 0)*V4+( 0)*V3+( 1)*V2 +( 0) >= 0, ( 1)*V1+( 0)*V4+( 0)*V3+( -1)*V2 +( 0) >= 0]).
