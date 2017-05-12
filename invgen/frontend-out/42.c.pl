:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V2, V1, V3, V4)), []).
trans_preds(p(_, data(V2, V1, V3, V4)), p(_, data(V2p, V1p, V3p, V4p)), []).
var2names(p(pc(_), data(V2, V1, V3, V4)), [(V2, 'y'), (V1, 'x'), (V3, 'flag'), (V4, 'a')]).
globals(p(pc(_), data(V2, V1, V3, V4)), [], []).
% start location
start(pc(main-0-7)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-3-15)). % line 15
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V2, V1, V3, V4), []).
% cfg loop exit relation
cfg_exit_relation([]).
% 32 transitions
r(p(pc(main-0-7), data(V2, V1, V3, V4)), p(pc(main-2-0), data(V2p, V1p, V3p, V4p)), [], [V2p = V2, V1p = 1, V3p = V3, V4p = V4], 1). % x := 1
stmtsrc(1, 'x=1;').
transition_access( 1, [_, w, _, _] ).
r(p(pc(main-2-0), data(V2, V1, V3, V4)), p(pc(main-1-10), data(V2p, V1p, V3p, V4p)), [], [V2p = 1, V1p = V1, V3p = V3, V4p = V4], 2). % y := 1
stmtsrc(2, 'y=1;').
transition_access( 2, [w, _, _, _] ).
r(p(pc(main-1-10), data(V2, V1, V3, V4)), p(pc(main-4-11), data(V2p, V1p, V3p, V4p)), [(V3 +1 =< 0)], [V2p = V2, V1p = V1, V3p = V3, V4p = V4], 3). % flag < 0
stmtsrc(3, 'assume(flag < 0);').
transition_access( 3, [_, _, r, _] ).
r(p(pc(main-1-10), data(V2, V1, V3, V4)), p(pc(main-4-11), data(V2p, V1p, V3p, V4p)), [(V3 >= 1+ 0)], [V2p = V2, V1p = V1, V3p = V3, V4p = V4], 4). % flag > 0
stmtsrc(4, 'assume(flag > 0);').
transition_access( 4, [_, _, r, _] ).
r(p(pc(main-4-11), data(V2, V1, V3, V4)), p(pc(main-3-15), data(V2p, V1p, V3p, V4p)), [], [V2p = V2, V1p = V1, V3p = V3, V4p = 0], 5). % a := 0
stmtsrc(5, 'a=0;').
transition_access( 5, [_, _, _, w] ).
r(p(pc(main-1-10), data(V2, V1, V3, V4)), p(pc(main-5-13), data(V2p, V1p, V3p, V4p)), [(V3 = 0)], [V2p = V2, V1p = V1, V3p = V3, V4p = V4], 6). % flag == 0
stmtsrc(6, 'assume(flag == 0);').
transition_access( 6, [_, _, r, _] ).
r(p(pc(main-5-13), data(V2, V1, V3, V4)), p(pc(main-3-15), data(V2p, V1p, V3p, V4p)), [], [V2p = V2, V1p = V1, V3p = V3, V4p = 1], 7). % a := 1
stmtsrc(7, 'a=1;').
transition_access( 7, [_, _, _, w] ).
r(p(pc(main-3-15), data(V2, V1, V3, V4)), p(pc(main-8-15), data(V2p, V1p, V3p, V4p)), [], [V2p = V2, V1p = V1, V3p = V3, V4p = V4], 8). % 
stmtsrc(8, 'skip;').
transition_access( 8, [_, _, _, _] ).
r(p(pc(main-8-15), data(V2, V1, V3, V4)), p(pc(main-9-16), data(V2p, V1p, V3p, V4p)), [], [V2p = V2, V1p = V1, V3p = V3, V4p = V4], 9). % 
stmtsrc(9, 'skip;').
transition_access( 9, [_, _, _, _] ).
r(p(pc(main-8-15), data(V2, V1, V3, V4)), p(pc(main-10-15), data(V2p, V1p, V3p, V4p)), [], [V2p = V2, V1p = V1, V3p = V3, V4p = V4], 10). % 
stmtsrc(10, 'skip;').
transition_access( 10, [_, _, _, _] ).
r(p(pc(main-9-16), data(V2, V1, V3, V4)), p(pc(main-12-19), data(V2p, V1p, V3p, V4p)), [(V3 +1 =< 0)], [V2p = V2, V1p = V1, V3p = V3, V4p = V4], 11). % flag < 0
stmtsrc(11, 'assume(flag < 0);').
transition_access( 11, [_, _, r, _] ).
r(p(pc(main-9-16), data(V2, V1, V3, V4)), p(pc(main-12-19), data(V2p, V1p, V3p, V4p)), [(V3 >= 1+ 0)], [V2p = V2, V1p = V1, V3p = V3, V4p = V4], 12). % flag > 0
stmtsrc(12, 'assume(flag > 0);').
transition_access( 12, [_, _, r, _] ).
r(p(pc(main-12-19), data(V2, V1, V3, V4)), p(pc(main-14-0), data(V2p, V1p, V3p, V4p)), [], [V2p = V2, V1p = V1, V3p = V3, V4p = (V1 + V2)], 13). % a := x + y
stmtsrc(13, 'a=x + y;').
transition_access( 13, [r, r, _, w] ).
r(p(pc(main-14-0), data(V2, V1, V3, V4)), p(pc(main-11-26), data(V2p, V1p, V3p, V4p)), [], [V2p = V2, V1p = (V1 + 1), V3p = V3, V4p = V4], 14). % x := x + 1
stmtsrc(14, 'x=x + 1;').
transition_access( 14, [_, w, _, _] ).
r(p(pc(main-9-16), data(V2, V1, V3, V4)), p(pc(main-13-24), data(V2p, V1p, V3p, V4p)), [(V3 = 0)], [V2p = V2, V1p = V1, V3p = V3, V4p = V4], 15). % flag == 0
stmtsrc(15, 'assume(flag == 0);').
transition_access( 15, [_, _, r, _] ).
r(p(pc(main-13-24), data(V2, V1, V3, V4)), p(pc(main-15-0), data(V2p, V1p, V3p, V4p)), [], [V2p = V2, V1p = V1, V3p = V3, V4p = ((V1 + V2) + 1)], 16). % a := (x + y) + 1
stmtsrc(16, 'a=(x + y) + 1;').
transition_access( 16, [r, r, _, w] ).
r(p(pc(main-15-0), data(V2, V1, V3, V4)), p(pc(main-11-26), data(V2p, V1p, V3p, V4p)), [], [V2p = (V2 + 1), V1p = V1, V3p = V3, V4p = V4], 17). % y := y + 1
stmtsrc(17, 'y=y + 1;').
transition_access( 17, [w, _, _, _] ).
