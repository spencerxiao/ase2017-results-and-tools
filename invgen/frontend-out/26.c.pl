:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V2, V4, V3, V1)), []).
trans_preds(p(_, data(V2, V4, V3, V1)), p(_, data(V2p, V4p, V3p, V1p)), []).
var2names(p(pc(_), data(V2, V4, V3, V1)), [(V2, 'z'), (V4, 'y'), (V3, 'x'), (V1, 'w')]).
globals(p(pc(_), data(V2, V4, V3, V1)), [], []).
% start location
start(pc(main-0-6)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-10-14)). % line 14
cutpoint(pc(main-8-8)). % line 8
cutpoint(pc(main-1-7)). % line 7
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V2, V4, V3, V1), []).
% cfg loop exit relation
cfg_exit_relation([(pc(main-10-14), pc(main-1-7)), (pc(main-8-8), pc(main-10-14))]).
% 33 transitions
r(p(pc(main-0-6), data(V2, V4, V3, V1)), p(pc(main-2-0), data(V2p, V4p, V3p, V1p)), [], [V2p = V2, V4p = V4, V3p = V3, V1p = 1], 1). % w := 1
stmtsrc(1, 'w=1;').
transition_access( 1, [_, _, _, w] ).
r(p(pc(main-2-0), data(V2, V4, V3, V1)), p(pc(main-3-0), data(V2p, V4p, V3p, V1p)), [], [V2p = 0, V4p = V4, V3p = V3, V1p = V1], 2). % z := 0
stmtsrc(2, 'z=0;').
transition_access( 2, [w, _, _, _] ).
r(p(pc(main-3-0), data(V2, V4, V3, V1)), p(pc(main-4-0), data(V2p, V4p, V3p, V1p)), [], [V2p = V2, V4p = V4, V3p = 0, V1p = V1], 3). % x := 0
stmtsrc(3, 'x=0;').
transition_access( 3, [_, _, w, _] ).
r(p(pc(main-4-0), data(V2, V4, V3, V1)), p(pc(main-1-7), data(V2p, V4p, V3p, V1p)), [], [V2p = V2, V4p = 0, V3p = V3, V1p = V1], 4). % y := 0
stmtsrc(4, 'y=0;').
transition_access( 4, [_, w, _, _] ).
r(p(pc(main-1-7), data(V2, V4, V3, V1)), p(pc(main-7-7), data(V2p, V4p, V3p, V1p)), [], [V2p = V2, V4p = V4, V3p = V3, V1p = V1], 5). % 
stmtsrc(5, 'skip;').
transition_access( 5, [_, _, _, _] ).
r(p(pc(main-7-7), data(V2, V4, V3, V1)), p(pc(main-8-8), data(V2p, V4p, V3p, V1p)), [], [V2p = V2, V4p = V4, V3p = V3, V1p = V1], 6). % 
stmtsrc(6, 'skip;').
transition_access( 6, [_, _, _, _] ).
r(p(pc(main-7-7), data(V2, V4, V3, V1)), p(pc(main-9-7), data(V2p, V4p, V3p, V1p)), [], [V2p = V2, V4p = V4, V3p = V3, V1p = V1], 7). % 
stmtsrc(7, 'skip;').
transition_access( 7, [_, _, _, _] ).
r(p(pc(main-8-8), data(V2, V4, V3, V1)), p(pc(main-12-8), data(V2p, V4p, V3p, V1p)), [], [V2p = V2, V4p = V4, V3p = V3, V1p = V1], 8). % 
stmtsrc(8, 'skip;').
transition_access( 8, [_, _, _, _] ).
r(p(pc(main-12-8), data(V2, V4, V3, V1)), p(pc(main-13-9), data(V2p, V4p, V3p, V1p)), [], [V2p = V2, V4p = V4, V3p = V3, V1p = V1], 9). % 
stmtsrc(9, 'skip;').
transition_access( 9, [_, _, _, _] ).
r(p(pc(main-12-8), data(V2, V4, V3, V1)), p(pc(main-14-8), data(V2p, V4p, V3p, V1p)), [], [V2p = V2, V4p = V4, V3p = V3, V1p = V1], 10). % 
stmtsrc(10, 'skip;').
transition_access( 10, [_, _, _, _] ).
