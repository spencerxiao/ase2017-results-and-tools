:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V2, V1, V3)), []).
trans_preds(p(_, data(V2, V1, V3)), p(_, data(V2p, V1p, V3p)), []).
var2names(p(pc(_), data(V2, V1, V3)), [(V2, 'y'), (V1, 'x'), (V3, 'n')]).
globals(p(pc(_), data(V2, V1, V3)), [], []).
% start location
start(pc(main-0-12)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-4-17)). % line 17
cutpoint(pc(main-1-13)). % line 13
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V2, V1, V3), []).
% cfg loop exit relation
cfg_exit_relation([(pc(main-1-13), pc(main-4-17))]).
% 22 transitions
r(p(pc(main-0-12), data(V2, V1, V3)), p(pc(main-2-0), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = 0, V3p = V3], 1). % x := 0
stmtsrc(1, 'x=0;').
transition_access( 1, [_, w, _] ).
r(p(pc(main-2-0), data(V2, V1, V3)), p(pc(main-3-0), data(V2p, V1p, V3p)), [], [V2p = 0, V1p = V1, V3p = V3], 2). % y := 0
stmtsrc(2, 'y=0;').
transition_access( 2, [w, _, _] ).
r(p(pc(main-3-0), data(V2, V1, V3)), p(pc(main-1-13), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = 0], 3). % n := 0
stmtsrc(3, 'n=0;').
transition_access( 3, [_, _, w] ).
r(p(pc(main-1-13), data(V2, V1, V3)), p(pc(main-6-13), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 4). % 
stmtsrc(4, 'skip;').
transition_access( 4, [_, _, _] ).
r(p(pc(main-6-13), data(V2, V1, V3)), p(pc(main-7-15), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 5). % 
stmtsrc(5, 'skip;').
transition_access( 5, [_, _, _] ).
r(p(pc(main-6-13), data(V2, V1, V3)), p(pc(main-8-13), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 6). % 
stmtsrc(6, 'skip;').
transition_access( 6, [_, _, _] ).
r(p(pc(main-7-15), data(V2, V1, V3)), p(pc(main-9-0), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = (V1 + 1), V3p = V3], 7). % x := x + 1
stmtsrc(7, 'x=x + 1;').
transition_access( 7, [_, w, _] ).
r(p(pc(main-9-0), data(V2, V1, V3)), p(pc(main-1-13), data(V2p, V1p, V3p)), [], [V2p = (V2 + 1), V1p = V1, V3p = V3], 8). % y := y + 1
stmtsrc(8, 'y=y + 1;').
transition_access( 8, [w, _, _] ).
r(p(pc(main-5-0), data(V2, V1, V3)), p(pc(main-4-17), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 9). % 
stmtsrc(9, 'skip;').
transition_access( 9, [_, _, _] ).
r(p(pc(main-4-17), data(V2, V1, V3)), p(pc(main-12-17), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 10). % 
stmtsrc(10, 'skip;').
transition_access( 10, [_, _, _] ).
r(p(pc(main-12-17), data(V2, V1, V3)), p(pc(main-13-19), data(V2p, V1p, V3p)), [(V1 +1 =< V3)], [V2p = V2, V1p = V1, V3p = V3], 11). % x < n
stmtsrc(11, 'assume(x < n);').
transition_access( 11, [_, r, r] ).
r(p(pc(main-12-17), data(V2, V1, V3)), p(pc(main-13-19), data(V2p, V1p, V3p)), [(V1 >= 1+ V3)], [V2p = V2, V1p = V1, V3p = V3], 12). % x > n
stmtsrc(12, 'assume(x > n);').
transition_access( 12, [_, r, r] ).
r(p(pc(main-12-17), data(V2, V1, V3)), p(pc(main-14-17), data(V2p, V1p, V3p)), [(V1 = V3)], [V2p = V2, V1p = V1, V3p = V3], 13). % x == n
stmtsrc(13, 'assume(x == n);').
transition_access( 13, [_, r, r] ).
r(p(pc(main-13-19), data(V2, V1, V3)), p(pc(main-15-0), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = (V1 - 1), V3p = V3], 14). % x := x - 1
stmtsrc(14, 'x=x - 1;').
transition_access( 14, [_, w, _] ).
r(p(pc(main-15-0), data(V2, V1, V3)), p(pc(main-4-17), data(V2p, V1p, V3p)), [], [V2p = (V2 - 1), V1p = V1, V3p = V3], 15). % y := y - 1
stmtsrc(15, 'y=y - 1;').
transition_access( 15, [w, _, _] ).
r(p(pc(main-11-0), data(V2, V1, V3)), p(pc(main-10-21), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 16). % 
stmtsrc(16, 'skip;').
transition_access( 16, [_, _, _] ).
r(p(pc(main-10-21), data(V2, V1, V3)), p(pc(main-err-0), data(V2p, V1p, V3p)), [(V2 +1 =< V3)], [V2p = V2, V1p = V1, V3p = V3], 17). % y < n
stmtsrc(17, 'assume(y < n);').
transition_access( 17, [r, _, r] ).
r(p(pc(main-10-21), data(V2, V1, V3)), p(pc(main-err-0), data(V2p, V1p, V3p)), [(V2 >= 1+ V3)], [V2p = V2, V1p = V1, V3p = V3], 18). % y > n
stmtsrc(18, 'assume(y > n);').
transition_access( 18, [r, _, r] ).
r(p(pc(main-10-21), data(V2, V1, V3)), p(pc(main-16-22), data(V2p, V1p, V3p)), [(V2 = V3)], [V2p = V2, V1p = V1, V3p = V3], 19). % y == n
stmtsrc(19, 'assume(y == n);').
transition_access( 19, [r, _, r] ).
r(p(pc(main-16-22), data(V2, V1, V3)), p(pc(main-ret-0), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 20). % 
stmtsrc(20, 'skip;').
transition_access( 20, [_, _, _] ).
r(p(pc(main-14-17), data(V2, V1, V3)), p(pc(main-11-0), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 21). % 
stmtsrc(21, 'skip;').
transition_access( 21, [_, _, _] ).
r(p(pc(main-8-13), data(V2, V1, V3)), p(pc(main-5-0), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 22). % 
stmtsrc(22, 'skip;').
transition_access( 22, [_, _, _] ).
% Atomic blocks
strengthening(p(pc(main-4-17), data(V2, V1, V3)), [( 1)*V3 +( 0) = 0, ( 1)*V1 +( 0) >= 0,( 1)*V3 +( 0) >= 0, ( -1)*V3 +( 0) >= 0, ( 1)*V1+( -1)*V3 +( 0) >= 0, ( 1)*V1+( 1)*V3 +( 0) >= 0, ( 1)*V1 +( 0) >= 0, ( 1)*V2+( -1)*V3 +( 0) >= 0, ( 1)*V2+( 1)*V3 +( 0) >= 0, ( 1)*V2+( -1)*V1 +( 0) >= 0, ( 1)*V2+( 1)*V1 +( 0) >= 0, ( 1)*V2 +( 0) >= 0, ( -1)*V2+( 1)*V1 +( 0) >= 0,( -1)*V2+( 1)*V1+( 0)*V3 +( 0) = 0, ( 0)*V2+( 0)*V1+( 1)*V3 +( 0) = 0, ( 1)*V2+( 0)*V1+( 0)*V3 +( 0) >= 0]).
strengthening(p(pc(main-1-13), data(V2, V1, V3)), [( 1)*V3 +( 0) = 0, ( 1)*V1 +( 0) >= 0, ( 1)*V2 +( 0) >= 0,( 1)*V3 +( 0) >= 0, ( -1)*V3 +( 0) >= 0, ( 1)*V1+( -1)*V3 +( 0) >= 0, ( 1)*V1+( 1)*V3 +( 0) >= 0, ( 1)*V1 +( 0) >= 0, ( 1)*V2+( -1)*V3 +( 0) >= 0, ( 1)*V2+( 1)*V3 +( 0) >= 0, ( 1)*V2+( -1)*V1 +( 0) >= 0, ( 1)*V2+( 1)*V1 +( 0) >= 0, ( 1)*V2 +( 0) >= 0, ( -1)*V2+( 1)*V1 +( 0) >= 0,( -1)*V2+( 1)*V1+( 0)*V3 +( 0) = 0, ( 0)*V2+( 0)*V1+( 1)*V3 +( 0) = 0, ( 1)*V2+( 0)*V1+( 0)*V3 +( 0) >= 0]).
