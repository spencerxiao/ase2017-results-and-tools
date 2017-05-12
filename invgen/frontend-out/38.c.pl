:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V2, V1, V4, V3)), []).
trans_preds(p(_, data(V2, V1, V4, V3)), p(_, data(V2p, V1p, V4p, V3p)), []).
var2names(p(pc(_), data(V2, V1, V4, V3)), [(V2, 'y'), (V1, 'x'), (V4, 'n'), (V3, 'i')]).
globals(p(pc(_), data(V2, V1, V4, V3)), [], []).
% start location
start(pc(main-0-7)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-1-9)). % line 9
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V2, V1, V4, V3), []).
% cfg loop exit relation
cfg_exit_relation([]).
% 21 transitions
r(p(pc(main-0-7), data(V2, V1, V4, V3)), p(pc(main-2-0), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = 0, V4p = V4, V3p = V3], 1). % x := 0
stmtsrc(1, 'x=0;').
transition_access( 1, [_, w, _, _] ).
r(p(pc(main-2-0), data(V2, V1, V4, V3)), p(pc(main-3-0), data(V2p, V1p, V4p, V3p)), [], [V2p = 0, V1p = V1, V4p = V4, V3p = V3], 2). % y := 0
stmtsrc(2, 'y=0;').
transition_access( 2, [w, _, _, _] ).
r(p(pc(main-3-0), data(V2, V1, V4, V3)), p(pc(main-1-9), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = V1, V4p = V4, V3p = 0], 3). % i := 0
stmtsrc(3, 'i=0;').
transition_access( 3, [_, _, _, w] ).
r(p(pc(main-1-9), data(V2, V1, V4, V3)), p(pc(main-6-9), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 4). % 
stmtsrc(4, 'skip;').
transition_access( 4, [_, _, _, _] ).
r(p(pc(main-6-9), data(V2, V1, V4, V3)), p(pc(main-7-11), data(V2p, V1p, V4p, V3p)), [(V3 +1 =< V4)], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 5). % i < n
stmtsrc(5, 'assume(i < n);').
transition_access( 5, [_, _, r, r] ).
r(p(pc(main-6-9), data(V2, V1, V4, V3)), p(pc(main-8-9), data(V2p, V1p, V4p, V3p)), [(V3 >= V4)], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 6). % i >= n
stmtsrc(6, 'assume(i >= n);').
transition_access( 6, [_, _, r, r] ).
r(p(pc(main-7-11), data(V2, V1, V4, V3)), p(pc(main-10-0), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = V1, V4p = V4, V3p = (V3 + 1)], 7). % i := i + 1
stmtsrc(7, 'i=i + 1;').
transition_access( 7, [_, _, _, w] ).
r(p(pc(main-10-0), data(V2, V1, V4, V3)), p(pc(main-9-12), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = (V1 + 1), V4p = V4, V3p = V3], 8). % x := x + 1
stmtsrc(8, 'x=x + 1;').
transition_access( 8, [_, w, _, _] ).
