:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V3, V5, V4, V6, V2, V1)), []).
trans_preds(p(_, data(V3, V5, V4, V6, V2, V1)), p(_, data(V3p, V5p, V4p, V6p, V2p, V1p)), []).
var2names(p(pc(_), data(V3, V5, V4, V6, V2, V1)), [(V3, 'z'), (V5, 'y'), (V4, 'x'), (V6, 'w'), (V2, 'j'), (V1, 'i')]).
globals(p(pc(_), data(V3, V5, V4, V6, V2, V1)), [], []).
% start location
start(pc(main-0-11)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-1-13)). % line 13
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V3, V5, V4, V6, V2, V1), []).
% cfg loop exit relation
cfg_exit_relation([]).
% 22 transitions
r(p(pc(main-0-11), data(V3, V5, V4, V6, V2, V1)), p(pc(main-2-0), data(V3p, V5p, V4p, V6p, V2p, V1p)), [], [V3p = V3, V5p = V5, V4p = V4, V6p = V6, V2p = V2, V1p = 1], 1). % i := 1
stmtsrc(1, 'i=1;').
transition_access( 1, [_, _, _, _, _, w] ).
r(p(pc(main-2-0), data(V3, V5, V4, V6, V2, V1)), p(pc(main-3-0), data(V3p, V5p, V4p, V6p, V2p, V1p)), [], [V3p = V3, V5p = V5, V4p = V4, V6p = V6, V2p = 0, V1p = V1], 2). % j := 0
stmtsrc(2, 'j=0;').
transition_access( 2, [_, _, _, _, w, _] ).
r(p(pc(main-3-0), data(V3, V5, V4, V6, V2, V1)), p(pc(main-4-0), data(V3p, V5p, V4p, V6p, V2p, V1p)), [], [V3p = 1, V5p = V5, V4p = V4, V6p = V6, V2p = V2, V1p = V1], 3). % z := 1
stmtsrc(3, 'z=1;').
transition_access( 3, [w, _, _, _, _, _] ).
r(p(pc(main-4-0), data(V3, V5, V4, V6, V2, V1)), p(pc(main-5-0), data(V3p, V5p, V4p, V6p, V2p, V1p)), [], [V3p = V3, V5p = V5, V4p = 0, V6p = V6, V2p = V2, V1p = V1], 4). % x := 0
stmtsrc(4, 'x=0;').
transition_access( 4, [_, _, w, _, _, _] ).
r(p(pc(main-5-0), data(V3, V5, V4, V6, V2, V1)), p(pc(main-6-0), data(V3p, V5p, V4p, V6p, V2p, V1p)), [], [V3p = V3, V5p = 0, V4p = V4, V6p = V6, V2p = V2, V1p = V1], 5). % y := 0
stmtsrc(5, 'y=0;').
transition_access( 5, [_, w, _, _, _, _] ).
r(p(pc(main-6-0), data(V3, V5, V4, V6, V2, V1)), p(pc(main-1-13), data(V3p, V5p, V4p, V6p, V2p, V1p)), [], [V3p = V3, V5p = V5, V4p = V4, V6p = 0, V2p = V2, V1p = V1], 6). % w := 0
stmtsrc(6, 'w=0;').
transition_access( 6, [_, _, _, w, _, _] ).
r(p(pc(main-1-13), data(V3, V5, V4, V6, V2, V1)), p(pc(main-9-13), data(V3p, V5p, V4p, V6p, V2p, V1p)), [], [V3p = V3, V5p = V5, V4p = V4, V6p = V6, V2p = V2, V1p = V1], 7). % 
stmtsrc(7, 'skip;').
transition_access( 7, [_, _, _, _, _, _] ).
r(p(pc(main-9-13), data(V3, V5, V4, V6, V2, V1)), p(pc(main-10-16), data(V3p, V5p, V4p, V6p, V2p, V1p)), [], [V3p = V3, V5p = V5, V4p = V4, V6p = V6, V2p = V2, V1p = V1], 8). % 
stmtsrc(8, 'skip;').
transition_access( 8, [_, _, _, _, _, _] ).
r(p(pc(main-9-13), data(V3, V5, V4, V6, V2, V1)), p(pc(main-11-13), data(V3p, V5p, V4p, V6p, V2p, V1p)), [], [V3p = V3, V5p = V5, V4p = V4, V6p = V6, V2p = V2, V1p = V1], 9). % 
stmtsrc(9, 'skip;').
transition_access( 9, [_, _, _, _, _, _] ).
r(p(pc(main-10-16), data(V3, V5, V4, V6, V2, V1)), p(pc(main-13-0), data(V3p, V5p, V4p, V6p, V2p, V1p)), [], [V3p = (V3 + ((V4 + V5) + V6)), V5p = V5, V4p = V4, V6p = V6, V2p = V2, V1p = V1], 10). % z := z + ((x + y) + w)
stmtsrc(10, 'z=z + ((x + y) + w);').
transition_access( 10, [w, r, r, r, _, _] ).
r(p(pc(main-13-0), data(V3, V5, V4, V6, V2, V1)), p(pc(main-12-17), data(V3p, V5p, V4p, V6p, V2p, V1p)), [], [V3p = V3, V5p = (V5 + 1), V4p = V4, V6p = V6, V2p = V2, V1p = V1], 11). % y := y + 1
stmtsrc(11, 'y=y + 1;').
transition_access( 11, [_, w, _, _, _, _] ).
