:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V2, V1)), []).
trans_preds(p(_, data(V2, V1)), p(_, data(V2p, V1p)), []).
var2names(p(pc(_), data(V2, V1)), [(V2, 'y'), (V1, 'x')]).
globals(p(pc(_), data(V2, V1)), [], []).
% start location
start(pc(main-0-11)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-1-12)). % line 12
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V2, V1), []).
% cfg loop exit relation
cfg_exit_relation([]).
% 11 transitions
r(p(pc(main-0-11), data(V2, V1)), p(pc(main-1-12), data(V2p, V1p)), [], [V2p = V2, V1p = -50], 1). % x := -50
stmtsrc(1, 'x=-50;').
transition_access( 1, [_, w] ).
r(p(pc(main-1-12), data(V2, V1)), p(pc(main-4-12), data(V2p, V1p)), [], [V2p = V2, V1p = V1], 2). % 
stmtsrc(2, 'skip;').
transition_access( 2, [_, _] ).
r(p(pc(main-4-12), data(V2, V1)), p(pc(main-5-14), data(V2p, V1p)), [(V1 +1 =< 0)], [V2p = V2, V1p = V1], 3). % x < 0
stmtsrc(3, 'assume(x < 0);').
transition_access( 3, [_, r] ).
r(p(pc(main-4-12), data(V2, V1)), p(pc(main-6-12), data(V2p, V1p)), [(V1 >= 0)], [V2p = V2, V1p = V1], 4). % x >= 0
stmtsrc(4, 'assume(x >= 0);').
transition_access( 4, [_, r] ).
r(p(pc(main-5-14), data(V2, V1)), p(pc(main-7-0), data(V2p, V1p)), [], [V2p = V2, V1p = (V1 + V2)], 5). % x := x + y
stmtsrc(5, 'x=x + y;').
transition_access( 5, [r, w] ).
r(p(pc(main-7-0), data(V2, V1)), p(pc(main-1-12), data(V2p, V1p)), [], [V2p = (V2 + 1), V1p = V1], 6). % y := y + 1
stmtsrc(6, 'y=y + 1;').
transition_access( 6, [w, _] ).
r(p(pc(main-3-0), data(V2, V1)), p(pc(main-2-16), data(V2p, V1p)), [], [V2p = V2, V1p = V1], 7). % 
stmtsrc(7, 'skip;').
transition_access( 7, [_, _] ).
r(p(pc(main-2-16), data(V2, V1)), p(pc(main-err-0), data(V2p, V1p)), [(V2 =< 0)], [V2p = V2, V1p = V1], 8). % y <= 0
stmtsrc(8, 'assume(y <= 0);').
transition_access( 8, [r, _] ).
r(p(pc(main-2-16), data(V2, V1)), p(pc(main-8-17), data(V2p, V1p)), [(V2 >= 1+ 0)], [V2p = V2, V1p = V1], 9). % y > 0
stmtsrc(9, 'assume(y > 0);').
transition_access( 9, [r, _] ).
r(p(pc(main-8-17), data(V2, V1)), p(pc(main-ret-0), data(V2p, V1p)), [], [V2p = V2, V1p = V1], 10). % 
stmtsrc(10, 'skip;').
transition_access( 10, [_, _] ).
r(p(pc(main-6-12), data(V2, V1)), p(pc(main-3-0), data(V2p, V1p)), [], [V2p = V2, V1p = V1], 11). % 
stmtsrc(11, 'skip;').
transition_access( 11, [_, _] ).
% Atomic blocks
strengthening(p(pc(main-1-12), data(V2, V1)), [1>=0,1>=0,1>=0]).
