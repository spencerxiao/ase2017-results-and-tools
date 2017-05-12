:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V3, V1, V4, V2)), []).
trans_preds(p(_, data(V3, V1, V4, V2)), p(_, data(V3p, V1p, V4p, V2p)), []).
var2names(p(pc(_), data(V3, V1, V4, V2)), [(V3, 'y'), (V1, 'x'), (V4, 'j'), (V2, 'i')]).
globals(p(pc(_), data(V3, V1, V4, V2)), [], []).
% start location
start(pc(main-0-10)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-1-12)). % line 12
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V3, V1, V4, V2), []).
% cfg loop exit relation
cfg_exit_relation([]).
% 17 transitions
r(p(pc(main-0-10), data(V3, V1, V4, V2)), p(pc(main-2-0), data(V3p, V1p, V4p, V2p)), [], [V3p = V3, V1p = V2, V4p = V4, V2p = V2], 1). % x := i
stmtsrc(1, 'x=i;').
transition_access( 1, [_, w, _, r] ).
r(p(pc(main-2-0), data(V3, V1, V4, V2)), p(pc(main-1-12), data(V3p, V1p, V4p, V2p)), [], [V3p = V4, V1p = V1, V4p = V4, V2p = V2], 2). % y := j
stmtsrc(2, 'y=j;').
transition_access( 2, [w, _, r, _] ).
r(p(pc(main-1-12), data(V3, V1, V4, V2)), p(pc(main-5-12), data(V3p, V1p, V4p, V2p)), [], [V3p = V3, V1p = V1, V4p = V4, V2p = V2], 3). % 
stmtsrc(3, 'skip;').
transition_access( 3, [_, _, _, _] ).
r(p(pc(main-5-12), data(V3, V1, V4, V2)), p(pc(main-6-14), data(V3p, V1p, V4p, V2p)), [(V1 +1 =< 0)], [V3p = V3, V1p = V1, V4p = V4, V2p = V2], 4). % x < 0
stmtsrc(4, 'assume(x < 0);').
transition_access( 4, [_, r, _, _] ).
r(p(pc(main-5-12), data(V3, V1, V4, V2)), p(pc(main-6-14), data(V3p, V1p, V4p, V2p)), [(V1 >= 1+ 0)], [V3p = V3, V1p = V1, V4p = V4, V2p = V2], 5). % x > 0
stmtsrc(5, 'assume(x > 0);').
transition_access( 5, [_, r, _, _] ).
r(p(pc(main-5-12), data(V3, V1, V4, V2)), p(pc(main-7-12), data(V3p, V1p, V4p, V2p)), [(V1 = 0)], [V3p = V3, V1p = V1, V4p = V4, V2p = V2], 6). % x == 0
stmtsrc(6, 'assume(x == 0);').
transition_access( 6, [_, r, _, _] ).
r(p(pc(main-6-14), data(V3, V1, V4, V2)), p(pc(main-8-0), data(V3p, V1p, V4p, V2p)), [], [V3p = V3, V1p = (V1 - 1), V4p = V4, V2p = V2], 7). % x := x - 1
stmtsrc(7, 'x=x - 1;').
transition_access( 7, [_, w, _, _] ).
r(p(pc(main-8-0), data(V3, V1, V4, V2)), p(pc(main-1-12), data(V3p, V1p, V4p, V2p)), [], [V3p = (V3 - 1), V1p = V1, V4p = V4, V2p = V2], 8). % y := y - 1
stmtsrc(8, 'y=y - 1;').
transition_access( 8, [w, _, _, _] ).
r(p(pc(main-4-0), data(V3, V1, V4, V2)), p(pc(main-3-16), data(V3p, V1p, V4p, V2p)), [], [V3p = V3, V1p = V1, V4p = V4, V2p = V2], 9). % 
stmtsrc(9, 'skip;').
transition_access( 9, [_, _, _, _] ).
r(p(pc(main-3-16), data(V3, V1, V4, V2)), p(pc(main-10-17), data(V3p, V1p, V4p, V2p)), [(V2 = V4)], [V3p = V3, V1p = V1, V4p = V4, V2p = V2], 10). % i == j
stmtsrc(10, 'assume(i == j);').
transition_access( 10, [_, _, r, r] ).
r(p(pc(main-10-17), data(V3, V1, V4, V2)), p(pc(main-err-0), data(V3p, V1p, V4p, V2p)), [(V3 +1 =< 0)], [V3p = V3, V1p = V1, V4p = V4, V2p = V2], 11). % y < 0
stmtsrc(11, 'assume(y < 0);').
transition_access( 11, [r, _, _, _] ).
r(p(pc(main-10-17), data(V3, V1, V4, V2)), p(pc(main-err-0), data(V3p, V1p, V4p, V2p)), [(V3 >= 1+ 0)], [V3p = V3, V1p = V1, V4p = V4, V2p = V2], 12). % y > 0
stmtsrc(12, 'assume(y > 0);').
transition_access( 12, [r, _, _, _] ).
r(p(pc(main-10-17), data(V3, V1, V4, V2)), p(pc(main-9-18), data(V3p, V1p, V4p, V2p)), [(V3 = 0)], [V3p = V3, V1p = V1, V4p = V4, V2p = V2], 13). % y == 0
stmtsrc(13, 'assume(y == 0);').
transition_access( 13, [r, _, _, _] ).
r(p(pc(main-3-16), data(V3, V1, V4, V2)), p(pc(main-9-18), data(V3p, V1p, V4p, V2p)), [(V2 +1 =< V4)], [V3p = V3, V1p = V1, V4p = V4, V2p = V2], 14). % i < j
stmtsrc(14, 'assume(i < j);').
transition_access( 14, [_, _, r, r] ).
r(p(pc(main-3-16), data(V3, V1, V4, V2)), p(pc(main-9-18), data(V3p, V1p, V4p, V2p)), [(V2 >= 1+ V4)], [V3p = V3, V1p = V1, V4p = V4, V2p = V2], 15). % i > j
stmtsrc(15, 'assume(i > j);').
transition_access( 15, [_, _, r, r] ).
r(p(pc(main-9-18), data(V3, V1, V4, V2)), p(pc(main-ret-0), data(V3p, V1p, V4p, V2p)), [], [V3p = V3, V1p = V1, V4p = V4, V2p = V2], 16). % 
stmtsrc(16, 'skip;').
transition_access( 16, [_, _, _, _] ).
r(p(pc(main-7-12), data(V3, V1, V4, V2)), p(pc(main-4-0), data(V3p, V1p, V4p, V2p)), [], [V3p = V3, V1p = V1, V4p = V4, V2p = V2], 17). % 
stmtsrc(17, 'skip;').
transition_access( 17, [_, _, _, _] ).
% Atomic blocks
strengthening(p(pc(main-1-12), data(V3, V1, V4, V2)), [1>=0,( -1)*V1+( 1)*V2 +( 0) >= 0, ( -1)*V3+( 1)*V4 +( 0) >= 0,( 1)*V3+( -1)*V1+( -1)*V4+( 1)*V2 +( 0) = 0, ( -1)*V3+( 0)*V1+( 1)*V4+( 0)*V2 +( 0) >= 0]).
