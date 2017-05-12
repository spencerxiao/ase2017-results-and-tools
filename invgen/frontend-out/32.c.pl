:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V4, V1, V3, V2, V5)), []).
trans_preds(p(_, data(V4, V1, V3, V2, V5)), p(_, data(V4p, V1p, V3p, V2p, V5p)), []).
var2names(p(pc(_), data(V4, V1, V3, V2, V5)), [(V4, 'n'), (V1, 'k'), (V3, 'j'), (V2, 'i'), (V5, 'b')]).
globals(p(pc(_), data(V4, V1, V3, V2, V5)), [], []).
% start location
start(pc(main-0-15)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-1-15)). % line 15
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V4, V1, V3, V2, V5), []).
% cfg loop exit relation
cfg_exit_relation([]).
% 19 transitions
r(p(pc(main-0-15), data(V4, V1, V3, V2, V5)), p(pc(main-2-0), data(V4p, V1p, V3p, V2p, V5p)), [], [V4p = V4, V1p = 100, V3p = V3, V2p = V2, V5p = V5], 1). % k := 100
stmtsrc(1, 'k=100;').
transition_access( 1, [_, w, _, _, _] ).
r(p(pc(main-2-0), data(V4, V1, V3, V2, V5)), p(pc(main-3-0), data(V4p, V1p, V3p, V2p, V5p)), [], [V4p = V4, V1p = V1, V3p = V3, V2p = V3, V5p = V5], 2). % i := j
stmtsrc(2, 'i=j;').
transition_access( 2, [_, _, r, w, _] ).
r(p(pc(main-3-0), data(V4, V1, V3, V2, V5)), p(pc(main-1-15), data(V4p, V1p, V3p, V2p, V5p)), [], [V4p = 0, V1p = V1, V3p = V3, V2p = V2, V5p = V5], 3). % n := 0
stmtsrc(3, 'n=0;').
transition_access( 3, [w, _, _, _, _] ).
r(p(pc(main-1-15), data(V4, V1, V3, V2, V5)), p(pc(main-6-15), data(V4p, V1p, V3p, V2p, V5p)), [], [V4p = V4, V1p = V1, V3p = V3, V2p = V2, V5p = V5], 4). % 
stmtsrc(4, 'skip;').
transition_access( 4, [_, _, _, _, _] ).
r(p(pc(main-6-15), data(V4, V1, V3, V2, V5)), p(pc(main-7-16), data(V4p, V1p, V3p, V2p, V5p)), [(V4 +1 =< (2 * V1))], [V4p = V4, V1p = V1, V3p = V3, V2p = V2, V5p = V5], 5). % n < 2 * k
stmtsrc(5, 'assume(n < 2 * k);').
transition_access( 5, [r, r, _, _, _] ).
r(p(pc(main-6-15), data(V4, V1, V3, V2, V5)), p(pc(main-8-15), data(V4p, V1p, V3p, V2p, V5p)), [(V4 >= (2 * V1))], [V4p = V4, V1p = V1, V3p = V3, V2p = V2, V5p = V5], 6). % n >= 2 * k
stmtsrc(6, 'assume(n >= 2 * k);').
transition_access( 6, [r, r, _, _, _] ).
r(p(pc(main-7-16), data(V4, V1, V3, V2, V5)), p(pc(main-10-17), data(V4p, V1p, V3p, V2p, V5p)), [(V5 +1 =< 0)], [V4p = V4, V1p = V1, V3p = V3, V2p = V2, V5p = V5], 7). % b < 0
stmtsrc(7, 'assume(b < 0);').
transition_access( 7, [_, _, _, _, r] ).
r(p(pc(main-7-16), data(V4, V1, V3, V2, V5)), p(pc(main-10-17), data(V4p, V1p, V3p, V2p, V5p)), [(V5 >= 1+ 0)], [V4p = V4, V1p = V1, V3p = V3, V2p = V2, V5p = V5], 8). % b > 0
stmtsrc(8, 'assume(b > 0);').
transition_access( 8, [_, _, _, _, r] ).
r(p(pc(main-10-17), data(V4, V1, V3, V2, V5)), p(pc(main-9-15), data(V4p, V1p, V3p, V2p, V5p)), [], [V4p = V4, V1p = V1, V3p = V3, V2p = (V2 + 1), V5p = V5], 9). % i := i + 1
stmtsrc(9, 'i=i + 1;').
transition_access( 9, [_, _, _, w, _] ).
r(p(pc(main-7-16), data(V4, V1, V3, V2, V5)), p(pc(main-11-19), data(V4p, V1p, V3p, V2p, V5p)), [(V5 = 0)], [V4p = V4, V1p = V1, V3p = V3, V2p = V2, V5p = V5], 10). % b == 0
stmtsrc(10, 'assume(b == 0);').
transition_access( 10, [_, _, _, _, r] ).
r(p(pc(main-11-19), data(V4, V1, V3, V2, V5)), p(pc(main-9-15), data(V4p, V1p, V3p, V2p, V5p)), [], [V4p = V4, V1p = V1, V3p = (V3 + 1), V2p = V2, V5p = V5], 11). % j := j + 1
stmtsrc(11, 'j=j + 1;').
transition_access( 11, [_, _, w, _, _] ).
