:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V1, V3, V2, V5, V4)), []).
trans_preds(p(_, data(V1, V3, V2, V5, V4)), p(_, data(V1p, V3p, V2p, V5p, V4p)), []).
var2names(p(pc(_), data(V1, V3, V2, V5, V4)), [(V1, 'j'), (V3, 'i'), (V2, 'flag'), (V5, 'b'), (V4, 'a')]).
globals(p(pc(_), data(V1, V3, V2, V5, V4)), [], []).
% start location
start(pc(main-0-7)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-13-23)). % line 23
cutpoint(pc(main-2-12)). % line 12
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V1, V3, V2, V5, V4), []).
% cfg loop exit relation
cfg_exit_relation([(pc(main-2-12), pc(main-13-23))]).
% 33 transitions
r(p(pc(main-0-7), data(V1, V3, V2, V5, V4)), p(pc(main-1-8), data(V1p, V3p, V2p, V5p, V4p)), [], [V1p = 1, V3p = V3, V2p = V2, V5p = V5, V4p = V4], 1). % j := 1
stmtsrc(1, 'j=1;').
transition_access( 1, [w, _, _, _, _] ).
r(p(pc(main-1-8), data(V1, V3, V2, V5, V4)), p(pc(main-3-8), data(V1p, V3p, V2p, V5p, V4p)), [(V2 +1 =< 0)], [V1p = V1, V3p = V3, V2p = V2, V5p = V5, V4p = V4], 2). % flag < 0
stmtsrc(2, 'assume(flag < 0);').
transition_access( 2, [_, _, r, _, _] ).
r(p(pc(main-1-8), data(V1, V3, V2, V5, V4)), p(pc(main-3-8), data(V1p, V3p, V2p, V5p, V4p)), [(V2 >= 1+ 0)], [V1p = V1, V3p = V3, V2p = V2, V5p = V5, V4p = V4], 3). % flag > 0
stmtsrc(3, 'assume(flag > 0);').
transition_access( 3, [_, _, r, _, _] ).
r(p(pc(main-3-8), data(V1, V3, V2, V5, V4)), p(pc(main-2-12), data(V1p, V3p, V2p, V5p, V4p)), [], [V1p = V1, V3p = 0, V2p = V2, V5p = V5, V4p = V4], 4). % i := 0
stmtsrc(4, 'i=0;').
transition_access( 4, [_, w, _, _, _] ).
r(p(pc(main-1-8), data(V1, V3, V2, V5, V4)), p(pc(main-4-9), data(V1p, V3p, V2p, V5p, V4p)), [(V2 = 0)], [V1p = V1, V3p = V3, V2p = V2, V5p = V5, V4p = V4], 5). % flag == 0
stmtsrc(5, 'assume(flag == 0);').
transition_access( 5, [_, _, r, _, _] ).
r(p(pc(main-4-9), data(V1, V3, V2, V5, V4)), p(pc(main-2-12), data(V1p, V3p, V2p, V5p, V4p)), [], [V1p = V1, V3p = 1, V2p = V2, V5p = V5, V4p = V4], 6). % i := 1
stmtsrc(6, 'i=1;').
transition_access( 6, [_, w, _, _, _] ).
r(p(pc(main-2-12), data(V1, V3, V2, V5, V4)), p(pc(main-7-12), data(V1p, V3p, V2p, V5p, V4p)), [], [V1p = V1, V3p = V3, V2p = V2, V5p = V5, V4p = V4], 7). % 
stmtsrc(7, 'skip;').
transition_access( 7, [_, _, _, _, _] ).
r(p(pc(main-7-12), data(V1, V3, V2, V5, V4)), p(pc(main-8-13), data(V1p, V3p, V2p, V5p, V4p)), [], [V1p = V1, V3p = V3, V2p = V2, V5p = V5, V4p = V4], 8). % 
stmtsrc(8, 'skip;').
transition_access( 8, [_, _, _, _, _] ).
r(p(pc(main-7-12), data(V1, V3, V2, V5, V4)), p(pc(main-9-12), data(V1p, V3p, V2p, V5p, V4p)), [], [V1p = V1, V3p = V3, V2p = V2, V5p = V5, V4p = V4], 9). % 
stmtsrc(9, 'skip;').
transition_access( 9, [_, _, _, _, _] ).
r(p(pc(main-8-13), data(V1, V3, V2, V5, V4)), p(pc(main-10-14), data(V1p, V3p, V2p, V5p, V4p)), [], [V1p = V1, V3p = (V3 + 2), V2p = V2, V5p = V5, V4p = V4], 10). % i := i + 2
stmtsrc(10, 'i=i + 2;').
transition_access( 10, [_, w, _, _, _] ).
