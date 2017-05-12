:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V1, V2, V3)), []).
trans_preds(p(_, data(V1, V2, V3)), p(_, data(V1p, V2p, V3p)), []).
var2names(p(pc(_), data(V1, V2, V3)), [(V1, 'sum'), (V2, 'n'), (V3, 'i')]).
globals(p(pc(_), data(V1, V2, V3)), [], []).
% start location
start(pc(main-0-12)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-1-12)). % line 12
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V1, V2, V3), []).
% cfg loop exit relation
cfg_exit_relation([]).
% 13 transitions
r(p(pc(main-0-12), data(V1, V2, V3)), p(pc(main-2-0), data(V1p, V2p, V3p)), [], [V1p = 0, V2p = V2, V3p = V3], 1). % sum := 0
stmtsrc(1, 'sum=0;').
transition_access( 1, [w, _, _] ).
r(p(pc(main-2-0), data(V1, V2, V3)), p(pc(main-3-0), data(V1p, V2p, V3p)), [(V2 >= 0)], [V1p = V1, V2p = V2, V3p = V3], 2). % n >= 0
stmtsrc(2, 'assume(n >= 0);').
transition_access( 2, [_, r, _] ).
r(p(pc(main-3-0), data(V1, V2, V3)), p(pc(main-1-12), data(V1p, V2p, V3p)), [], [V1p = V1, V2p = V2, V3p = 0], 3). % i := 0
stmtsrc(3, 'i=0;').
transition_access( 3, [_, _, w] ).
r(p(pc(main-1-12), data(V1, V2, V3)), p(pc(main-6-12), data(V1p, V2p, V3p)), [], [V1p = V1, V2p = V2, V3p = V3], 4). % 
stmtsrc(4, 'skip;').
transition_access( 4, [_, _, _] ).
r(p(pc(main-6-12), data(V1, V2, V3)), p(pc(main-7-12), data(V1p, V2p, V3p)), [(V3 +1 =< V2)], [V1p = V1, V2p = V2, V3p = V3], 5). % i < n
stmtsrc(5, 'assume(i < n);').
transition_access( 5, [_, r, r] ).
r(p(pc(main-6-12), data(V1, V2, V3)), p(pc(main-8-12), data(V1p, V2p, V3p)), [(V3 >= V2)], [V1p = V1, V2p = V2, V3p = V3], 6). % i >= n
stmtsrc(6, 'assume(i >= n);').
transition_access( 6, [_, r, r] ).
r(p(pc(main-7-12), data(V1, V2, V3)), p(pc(main-9-0), data(V1p, V2p, V3p)), [], [V1p = (V1 + V3), V2p = V2, V3p = V3], 7). % sum := sum + i
stmtsrc(7, 'sum=sum + i;').
transition_access( 7, [w, _, r] ).
r(p(pc(main-9-0), data(V1, V2, V3)), p(pc(main-1-12), data(V1p, V2p, V3p)), [], [V1p = V1, V2p = V2, V3p = (V3 + 1)], 8). % i := i + 1
stmtsrc(8, 'i=i + 1;').
transition_access( 8, [_, _, w] ).
r(p(pc(main-5-0), data(V1, V2, V3)), p(pc(main-4-15), data(V1p, V2p, V3p)), [], [V1p = V1, V2p = V2, V3p = V3], 9). % 
stmtsrc(9, 'skip;').
transition_access( 9, [_, _, _] ).
r(p(pc(main-4-15), data(V1, V2, V3)), p(pc(main-err-0), data(V1p, V2p, V3p)), [(V1 +1 =< 0)], [V1p = V1, V2p = V2, V3p = V3], 10). % sum < 0
stmtsrc(10, 'assume(sum < 0);').
transition_access( 10, [r, _, _] ).
r(p(pc(main-4-15), data(V1, V2, V3)), p(pc(main-10-16), data(V1p, V2p, V3p)), [(V1 >= 0)], [V1p = V1, V2p = V2, V3p = V3], 11). % sum >= 0
stmtsrc(11, 'assume(sum >= 0);').
transition_access( 11, [r, _, _] ).
r(p(pc(main-10-16), data(V1, V2, V3)), p(pc(main-ret-0), data(V1p, V2p, V3p)), [], [V1p = V1, V2p = V2, V3p = V3], 12). % 
stmtsrc(12, 'skip;').
transition_access( 12, [_, _, _] ).
r(p(pc(main-8-12), data(V1, V2, V3)), p(pc(main-5-0), data(V1p, V2p, V3p)), [], [V1p = V1, V2p = V2, V3p = V3], 13). % 
stmtsrc(13, 'skip;').
transition_access( 13, [_, _, _] ).
% Atomic blocks
strengthening(p(pc(main-1-12), data(V1, V2, V3)), [( 1)*V3 +( 0) >= 0, ( 1)*V2 +( 0) >= 0, ( 1)*V1 +( 0) >= 0,( 1)*V3 +( 0) >= 0, ( 1)*V2+( -1)*V3 +( 1) >= 0, ( 1)*V2+( 1)*V3 +( 0) >= 0, ( 1)*V2 +( 0) >= 0, ( 1)*V1+( -1)*V3 +( 1) >= 0, ( 1)*V1+( 1)*V3 +( 0) >= 0, ( 1)*V1+( 1)*V2 +( 0) >= 0, ( 1)*V1 +( 0) >= 0,( 0)*V1+( 1)*V2+( -1)*V3 +( 1) >= 0]).
