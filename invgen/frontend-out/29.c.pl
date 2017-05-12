:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V6, V5, V4, V3, V2, V1)), []).
trans_preds(p(_, data(V6, V5, V4, V3, V2, V1)), p(_, data(V6p, V5p, V4p, V3p, V2p, V1p)), []).
var2names(p(pc(_), data(V6, V5, V4, V3, V2, V1)), [(V6, 'y'), (V5, 'x'), (V4, 'd'), (V3, 'c'), (V2, 'b'), (V1, 'a')]).
globals(p(pc(_), data(V6, V5, V4, V3, V2, V1)), [], []).
% start location
start(pc(main-0-11)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-14-24)). % line 24
cutpoint(pc(main-1-12)). % line 12
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V6, V5, V4, V3, V2, V1), []).
% cfg loop exit relation
cfg_exit_relation([(pc(main-14-24), pc(main-1-12))]).
% 30 transitions
r(p(pc(main-0-11), data(V6, V5, V4, V3, V2, V1)), p(pc(main-2-0), data(V6p, V5p, V4p, V3p, V2p, V1p)), [], [V6p = V6, V5p = V5, V4p = V4, V3p = V3, V2p = V2, V1p = 1], 1). % a := 1
stmtsrc(1, 'a=1;').
transition_access( 1, [_, _, _, _, _, w] ).
r(p(pc(main-2-0), data(V6, V5, V4, V3, V2, V1)), p(pc(main-3-0), data(V6p, V5p, V4p, V3p, V2p, V1p)), [], [V6p = V6, V5p = V5, V4p = V4, V3p = V3, V2p = 1, V1p = V1], 2). % b := 1
stmtsrc(2, 'b=1;').
transition_access( 2, [_, _, _, _, w, _] ).
r(p(pc(main-3-0), data(V6, V5, V4, V3, V2, V1)), p(pc(main-4-0), data(V6p, V5p, V4p, V3p, V2p, V1p)), [], [V6p = V6, V5p = V5, V4p = V4, V3p = 2, V2p = V2, V1p = V1], 3). % c := 2
stmtsrc(3, 'c=2;').
transition_access( 3, [_, _, _, w, _, _] ).
r(p(pc(main-4-0), data(V6, V5, V4, V3, V2, V1)), p(pc(main-5-0), data(V6p, V5p, V4p, V3p, V2p, V1p)), [], [V6p = V6, V5p = V5, V4p = 2, V3p = V3, V2p = V2, V1p = V1], 4). % d := 2
stmtsrc(4, 'd=2;').
transition_access( 4, [_, _, w, _, _, _] ).
r(p(pc(main-5-0), data(V6, V5, V4, V3, V2, V1)), p(pc(main-6-0), data(V6p, V5p, V4p, V3p, V2p, V1p)), [], [V6p = V6, V5p = 3, V4p = V4, V3p = V3, V2p = V2, V1p = V1], 5). % x := 3
stmtsrc(5, 'x=3;').
transition_access( 5, [_, w, _, _, _, _] ).
r(p(pc(main-6-0), data(V6, V5, V4, V3, V2, V1)), p(pc(main-1-12), data(V6p, V5p, V4p, V3p, V2p, V1p)), [], [V6p = 3, V5p = V5, V4p = V4, V3p = V3, V2p = V2, V1p = V1], 6). % y := 3
stmtsrc(6, 'y=3;').
transition_access( 6, [w, _, _, _, _, _] ).
r(p(pc(main-1-12), data(V6, V5, V4, V3, V2, V1)), p(pc(main-9-12), data(V6p, V5p, V4p, V3p, V2p, V1p)), [], [V6p = V6, V5p = V5, V4p = V4, V3p = V3, V2p = V2, V1p = V1], 7). % 
stmtsrc(7, 'skip;').
transition_access( 7, [_, _, _, _, _, _] ).
r(p(pc(main-9-12), data(V6, V5, V4, V3, V2, V1)), p(pc(main-10-15), data(V6p, V5p, V4p, V3p, V2p, V1p)), [], [V6p = V6, V5p = V5, V4p = V4, V3p = V3, V2p = V2, V1p = V1], 8). % 
stmtsrc(8, 'skip;').
transition_access( 8, [_, _, _, _, _, _] ).
r(p(pc(main-9-12), data(V6, V5, V4, V3, V2, V1)), p(pc(main-11-12), data(V6p, V5p, V4p, V3p, V2p, V1p)), [], [V6p = V6, V5p = V5, V4p = V4, V3p = V3, V2p = V2, V1p = V1], 9). % 
stmtsrc(9, 'skip;').
transition_access( 9, [_, _, _, _, _, _] ).
r(p(pc(main-10-15), data(V6, V5, V4, V3, V2, V1)), p(pc(main-13-0), data(V6p, V5p, V4p, V3p, V2p, V1p)), [], [V6p = V6, V5p = (V1 + V3), V4p = V4, V3p = V3, V2p = V2, V1p = V1], 10). % x := a + c
stmtsrc(10, 'x=a + c;').
transition_access( 10, [_, w, _, r, _, r] ).
r(p(pc(main-13-0), data(V6, V5, V4, V3, V2, V1)), p(pc(main-12-16), data(V6p, V5p, V4p, V3p, V2p, V1p)), [], [V6p = (V2 + V4), V5p = V5, V4p = V4, V3p = V3, V2p = V2, V1p = V1], 11). % y := b + d
stmtsrc(11, 'y=b + d;').
transition_access( 11, [w, _, r, _, r, _] ).
