:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V1, V2)), []).
trans_preds(p(_, data(V1, V2)), p(_, data(V1p, V2p)), []).
var2names(p(pc(_), data(V1, V2)), [(V1, 'x'), (V2, 'n')]).
globals(p(pc(_), data(V1, V2)), [], []).
% start location
start(pc(main-0-7)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-1-8)). % line 8
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V1, V2), []).
% cfg loop exit relation
cfg_exit_relation([]).
% 13 transitions
r(p(pc(main-0-7), data(V1, V2)), p(pc(main-1-8), data(V1p, V2p)), [], [V1p = 0, V2p = V2], 1). % x := 0
stmtsrc(1, 'x=0;').
transition_access( 1, [w, _] ).
r(p(pc(main-1-8), data(V1, V2)), p(pc(main-4-8), data(V1p, V2p)), [], [V1p = V1, V2p = V2], 2). % 
stmtsrc(2, 'skip;').
transition_access( 2, [_, _] ).
r(p(pc(main-4-8), data(V1, V2)), p(pc(main-5-9), data(V1p, V2p)), [(V1 +1 =< V2)], [V1p = V1, V2p = V2], 3). % x < n
stmtsrc(3, 'assume(x < n);').
transition_access( 3, [r, r] ).
r(p(pc(main-4-8), data(V1, V2)), p(pc(main-6-8), data(V1p, V2p)), [(V1 >= V2)], [V1p = V1, V2p = V2], 4). % x >= n
stmtsrc(4, 'assume(x >= n);').
transition_access( 4, [r, r] ).
r(p(pc(main-5-9), data(V1, V2)), p(pc(main-1-8), data(V1p, V2p)), [], [V1p = (V1 + 1), V2p = V2], 5). % x := x + 1
stmtsrc(5, 'x=x + 1;').
transition_access( 5, [w, _] ).
r(p(pc(main-3-0), data(V1, V2)), p(pc(main-2-11), data(V1p, V2p)), [], [V1p = V1, V2p = V2], 6). % 
stmtsrc(6, 'skip;').
transition_access( 6, [_, _] ).
r(p(pc(main-2-11), data(V1, V2)), p(pc(main-8-11), data(V1p, V2p)), [(V2 >= 1+ 0)], [V1p = V1, V2p = V2], 7). % n > 0
stmtsrc(7, 'assume(n > 0);').
transition_access( 7, [_, r] ).
r(p(pc(main-8-11), data(V1, V2)), p(pc(main-err-0), data(V1p, V2p)), [(V1 +1 =< V2)], [V1p = V1, V2p = V2], 8). % x < n
stmtsrc(8, 'assume(x < n);').
transition_access( 8, [r, r] ).
r(p(pc(main-8-11), data(V1, V2)), p(pc(main-err-0), data(V1p, V2p)), [(V1 >= 1+ V2)], [V1p = V1, V2p = V2], 9). % x > n
stmtsrc(9, 'assume(x > n);').
transition_access( 9, [r, r] ).
r(p(pc(main-8-11), data(V1, V2)), p(pc(main-7-12), data(V1p, V2p)), [(V1 = V2)], [V1p = V1, V2p = V2], 10). % x == n
stmtsrc(10, 'assume(x == n);').
transition_access( 10, [r, r] ).
r(p(pc(main-2-11), data(V1, V2)), p(pc(main-7-12), data(V1p, V2p)), [(V2 =< 0)], [V1p = V1, V2p = V2], 11). % n <= 0
stmtsrc(11, 'assume(n <= 0);').
transition_access( 11, [_, r] ).
r(p(pc(main-7-12), data(V1, V2)), p(pc(main-ret-0), data(V1p, V2p)), [], [V1p = V1, V2p = V2], 12). % 
stmtsrc(12, 'skip;').
transition_access( 12, [_, _] ).
r(p(pc(main-6-8), data(V1, V2)), p(pc(main-3-0), data(V1p, V2p)), [], [V1p = V1, V2p = V2], 13). % 
stmtsrc(13, 'skip;').
transition_access( 13, [_, _] ).
% Atomic blocks
strengthening(p(pc(main-1-8), data(V1, V2)), [( 1)*V1 +( 0) >= 0,( 1)*V1 +( 0) >= 0,( 1)*V1+( 0)*V2 +( 0) >= 0]).
