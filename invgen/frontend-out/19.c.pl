:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V4, V3, V1, V2)), []).
trans_preds(p(_, data(V4, V3, V1, V2)), p(_, data(V4p, V3p, V1p, V2p)), []).
var2names(p(pc(_), data(V4, V3, V1, V2)), [(V4, 'y'), (V3, 'x'), (V1, 'n'), (V2, 'm')]).
globals(p(pc(_), data(V4, V3, V1, V2)), [], []).
% start location
start(pc(main-0-14)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-1-15)). % line 15
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V4, V3, V1, V2), []).
% cfg loop exit relation
cfg_exit_relation([]).
% 18 transitions
r(p(pc(main-0-14), data(V4, V3, V1, V2)), p(pc(main-2-0), data(V4p, V3p, V1p, V2p)), [(V1 >= 0)], [V4p = V4, V3p = V3, V1p = V1, V2p = V2], 1). % n >= 0
stmtsrc(1, 'assume(n >= 0);').
transition_access( 1, [_, _, r, _] ).
r(p(pc(main-2-0), data(V4, V3, V1, V2)), p(pc(main-3-0), data(V4p, V3p, V1p, V2p)), [(V2 >= 0)], [V4p = V4, V3p = V3, V1p = V1, V2p = V2], 2). % m >= 0
stmtsrc(2, 'assume(m >= 0);').
transition_access( 2, [_, _, _, r] ).
r(p(pc(main-3-0), data(V4, V3, V1, V2)), p(pc(main-4-0), data(V4p, V3p, V1p, V2p)), [(V2 +1 =< V1)], [V4p = V4, V3p = V3, V1p = V1, V2p = V2], 3). % m < n
stmtsrc(3, 'assume(m < n);').
transition_access( 3, [_, _, r, r] ).
r(p(pc(main-4-0), data(V4, V3, V1, V2)), p(pc(main-5-0), data(V4p, V3p, V1p, V2p)), [], [V4p = V4, V3p = 0, V1p = V1, V2p = V2], 4). % x := 0
stmtsrc(4, 'x=0;').
transition_access( 4, [_, w, _, _] ).
r(p(pc(main-5-0), data(V4, V3, V1, V2)), p(pc(main-1-15), data(V4p, V3p, V1p, V2p)), [], [V4p = V2, V3p = V3, V1p = V1, V2p = V2], 5). % y := m
stmtsrc(5, 'y=m;').
transition_access( 5, [w, _, _, r] ).
r(p(pc(main-1-15), data(V4, V3, V1, V2)), p(pc(main-8-15), data(V4p, V3p, V1p, V2p)), [], [V4p = V4, V3p = V3, V1p = V1, V2p = V2], 6). % 
stmtsrc(6, 'skip;').
transition_access( 6, [_, _, _, _] ).
r(p(pc(main-8-15), data(V4, V3, V1, V2)), p(pc(main-9-16), data(V4p, V3p, V1p, V2p)), [(V3 +1 =< V1)], [V4p = V4, V3p = V3, V1p = V1, V2p = V2], 7). % x < n
stmtsrc(7, 'assume(x < n);').
transition_access( 7, [_, r, r, _] ).
r(p(pc(main-8-15), data(V4, V3, V1, V2)), p(pc(main-10-15), data(V4p, V3p, V1p, V2p)), [(V3 >= V1)], [V4p = V4, V3p = V3, V1p = V1, V2p = V2], 8). % x >= n
stmtsrc(8, 'assume(x >= n);').
transition_access( 8, [_, r, r, _] ).
r(p(pc(main-9-16), data(V4, V3, V1, V2)), p(pc(main-11-17), data(V4p, V3p, V1p, V2p)), [], [V4p = V4, V3p = (V3 + 1), V1p = V1, V2p = V2], 9). % x := x + 1
stmtsrc(9, 'x=x + 1;').
transition_access( 9, [_, w, _, _] ).
r(p(pc(main-11-17), data(V4, V3, V1, V2)), p(pc(main-12-17), data(V4p, V3p, V1p, V2p)), [(V3 >= 1+ V2)], [V4p = V4, V3p = V3, V1p = V1, V2p = V2], 10). % x > m
stmtsrc(10, 'assume(x > m);').
transition_access( 10, [_, r, _, r] ).
r(p(pc(main-12-17), data(V4, V3, V1, V2)), p(pc(main-1-15), data(V4p, V3p, V1p, V2p)), [], [V4p = (V4 + 1), V3p = V3, V1p = V1, V2p = V2], 11). % y := y + 1
stmtsrc(11, 'y=y + 1;').
transition_access( 11, [w, _, _, _] ).
r(p(pc(main-11-17), data(V4, V3, V1, V2)), p(pc(main-1-15), data(V4p, V3p, V1p, V2p)), [(V3 =< V2)], [V4p = V4, V3p = V3, V1p = V1, V2p = V2], 12). % x <= m
stmtsrc(12, 'assume(x <= m);').
transition_access( 12, [_, r, _, r] ).
r(p(pc(main-7-0), data(V4, V3, V1, V2)), p(pc(main-6-19), data(V4p, V3p, V1p, V2p)), [], [V4p = V4, V3p = V3, V1p = V1, V2p = V2], 13). % 
stmtsrc(13, 'skip;').
transition_access( 13, [_, _, _, _] ).
r(p(pc(main-6-19), data(V4, V3, V1, V2)), p(pc(main-err-0), data(V4p, V3p, V1p, V2p)), [(V4 +1 =< V1)], [V4p = V4, V3p = V3, V1p = V1, V2p = V2], 14). % y < n
stmtsrc(14, 'assume(y < n);').
transition_access( 14, [r, _, r, _] ).
r(p(pc(main-6-19), data(V4, V3, V1, V2)), p(pc(main-err-0), data(V4p, V3p, V1p, V2p)), [(V4 >= 1+ V1)], [V4p = V4, V3p = V3, V1p = V1, V2p = V2], 15). % y > n
stmtsrc(15, 'assume(y > n);').
transition_access( 15, [r, _, r, _] ).
r(p(pc(main-6-19), data(V4, V3, V1, V2)), p(pc(main-13-20), data(V4p, V3p, V1p, V2p)), [(V4 = V1)], [V4p = V4, V3p = V3, V1p = V1, V2p = V2], 16). % y == n
stmtsrc(16, 'assume(y == n);').
transition_access( 16, [r, _, r, _] ).
r(p(pc(main-13-20), data(V4, V3, V1, V2)), p(pc(main-ret-0), data(V4p, V3p, V1p, V2p)), [], [V4p = V4, V3p = V3, V1p = V1, V2p = V2], 17). % 
stmtsrc(17, 'skip;').
transition_access( 17, [_, _, _, _] ).
r(p(pc(main-10-15), data(V4, V3, V1, V2)), p(pc(main-7-0), data(V4p, V3p, V1p, V2p)), [], [V4p = V4, V3p = V3, V1p = V1, V2p = V2], 18). % 
stmtsrc(18, 'skip;').
transition_access( 18, [_, _, _, _] ).
% Atomic blocks
strengthening(p(pc(main-1-15), data(V4, V3, V1, V2)), [( 1)*V2 +( 0) >= 0, ( 1)*V1 +( -1) >= 0, ( 1)*V3 +( 0) >= 0, ( 1)*V4 +( 0) >= 0,( 1)*V2 +( 0) >= 0, ( 1)*V1+( -1)*V2 +( 0) >= 0, ( 1)*V1+( 1)*V2 +( -1) >= 0, ( 1)*V1 +( -1) >= 0, ( 1)*V3+( 1)*V2 +( 0) >= 0, ( 1)*V3+( 1)*V1 +( -1) >= 0, ( 1)*V3 +( 0) >= 0, ( -1)*V3+( 1)*V1 +( 1) >= 0, ( 1)*V4+( -1)*V2 +( 0) >= 0, ( 1)*V4+( 1)*V2 +( 0) >= 0, ( 1)*V4+( 1)*V1 +( -1) >= 0, ( 1)*V4+( -1)*V3 +( 0) >= 0, ( 1)*V4+( 1)*V3 +( 0) >= 0, ( 1)*V4 +( 0) >= 0,( 0)*V4+( 0)*V3+( 1)*V1+( 0)*V2 +( -1) >= 0, ( 0)*V4+( -1)*V3+( 1)*V1+( 0)*V2 +( 1) >= 0, ( -1)*V4+( 1)*V3+( 0)*V1+( 1)*V2 +( 0) >= 0, ( 1)*V4+( 0)*V3+( 0)*V1+( -1)*V2 +( 0) >= 0, ( 1)*V4+( -1)*V3+( 0)*V1+( 0)*V2 +( 0) >= 0]).
