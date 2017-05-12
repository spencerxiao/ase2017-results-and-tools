:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V2, V1, V5, V4, V3)), []).
trans_preds(p(_, data(V2, V1, V5, V4, V3)), p(_, data(V2p, V1p, V5p, V4p, V3p)), []).
var2names(p(pc(_), data(V2, V1, V5, V4, V3)), [(V2, 'y'), (V1, 'x'), (V5, 'n'), (V4, 'm'), (V3, 'i')]).
globals(p(pc(_), data(V2, V1, V5, V4, V3)), [], []).
% start location
start(pc(main-0-8)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-1-11)). % line 11
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V2, V1, V5, V4, V3), []).
% cfg loop exit relation
cfg_exit_relation([]).
% 22 transitions
r(p(pc(main-0-8), data(V2, V1, V5, V4, V3)), p(pc(main-2-0), data(V2p, V1p, V5p, V4p, V3p)), [], [V2p = V2, V1p = 0, V5p = V5, V4p = V4, V3p = V3], 1). % x := 0
stmtsrc(1, 'x=0;').
transition_access( 1, [_, w, _, _, _] ).
r(p(pc(main-2-0), data(V2, V1, V5, V4, V3)), p(pc(main-3-0), data(V2p, V1p, V5p, V4p, V3p)), [], [V2p = 0, V1p = V1, V5p = V5, V4p = V4, V3p = V3], 2). % y := 0
stmtsrc(2, 'y=0;').
transition_access( 2, [w, _, _, _, _] ).
r(p(pc(main-3-0), data(V2, V1, V5, V4, V3)), p(pc(main-4-0), data(V2p, V1p, V5p, V4p, V3p)), [], [V2p = V2, V1p = V1, V5p = V5, V4p = V4, V3p = 0], 3). % i := 0
stmtsrc(3, 'i=0;').
transition_access( 3, [_, _, _, _, w] ).
r(p(pc(main-4-0), data(V2, V1, V5, V4, V3)), p(pc(main-1-11), data(V2p, V1p, V5p, V4p, V3p)), [], [V2p = V2, V1p = V1, V5p = V5, V4p = 10, V3p = V3], 4). % m := 10
stmtsrc(4, 'm=10;').
transition_access( 4, [_, _, _, w, _] ).
r(p(pc(main-1-11), data(V2, V1, V5, V4, V3)), p(pc(main-7-11), data(V2p, V1p, V5p, V4p, V3p)), [], [V2p = V2, V1p = V1, V5p = V5, V4p = V4, V3p = V3], 5). % 
stmtsrc(5, 'skip;').
transition_access( 5, [_, _, _, _, _] ).
r(p(pc(main-7-11), data(V2, V1, V5, V4, V3)), p(pc(main-8-13), data(V2p, V1p, V5p, V4p, V3p)), [(V3 +1 =< V5)], [V2p = V2, V1p = V1, V5p = V5, V4p = V4, V3p = V3], 6). % i < n
stmtsrc(6, 'assume(i < n);').
transition_access( 6, [_, _, r, _, r] ).
r(p(pc(main-7-11), data(V2, V1, V5, V4, V3)), p(pc(main-9-11), data(V2p, V1p, V5p, V4p, V3p)), [(V3 >= V5)], [V2p = V2, V1p = V1, V5p = V5, V4p = V4, V3p = V3], 7). % i >= n
stmtsrc(7, 'assume(i >= n);').
transition_access( 7, [_, _, r, _, r] ).
r(p(pc(main-8-13), data(V2, V1, V5, V4, V3)), p(pc(main-11-0), data(V2p, V1p, V5p, V4p, V3p)), [], [V2p = V2, V1p = V1, V5p = V5, V4p = V4, V3p = (V3 + 1)], 8). % i := i + 1
stmtsrc(8, 'i=i + 1;').
transition_access( 8, [_, _, _, _, w] ).
r(p(pc(main-11-0), data(V2, V1, V5, V4, V3)), p(pc(main-10-14), data(V2p, V1p, V5p, V4p, V3p)), [], [V2p = V2, V1p = (V1 + 1), V5p = V5, V4p = V4, V3p = V3], 9). % x := x + 1
stmtsrc(9, 'x=x + 1;').
transition_access( 9, [_, w, _, _, _] ).
