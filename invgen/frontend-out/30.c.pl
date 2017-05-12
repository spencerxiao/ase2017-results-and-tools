:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V1, V2)), []).
trans_preds(p(_, data(V1, V2)), p(_, data(V1p, V2p)), []).
var2names(p(pc(_), data(V1, V2)), [(V1, 'i'), (V2, 'c')]).
globals(p(pc(_), data(V1, V2)), [], []).
% start location
start(pc(main-0-11)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-1-12)). % line 12
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V1, V2), []).
% cfg loop exit relation
cfg_exit_relation([]).
% 12 transitions
r(p(pc(main-0-11), data(V1, V2)), p(pc(main-2-0), data(V1p, V2p)), [], [V1p = 0, V2p = V2], 1). % i := 0
stmtsrc(1, 'i=0;').
transition_access( 1, [w, _] ).
r(p(pc(main-2-0), data(V1, V2)), p(pc(main-1-12), data(V1p, V2p)), [], [V1p = V1, V2p = 0], 2). % c := 0
stmtsrc(2, 'c=0;').
transition_access( 2, [_, w] ).
r(p(pc(main-1-12), data(V1, V2)), p(pc(main-5-12), data(V1p, V2p)), [], [V1p = V1, V2p = V2], 3). % 
stmtsrc(3, 'skip;').
transition_access( 3, [_, _] ).
r(p(pc(main-5-12), data(V1, V2)), p(pc(main-6-14), data(V1p, V2p)), [(V1 +1 =< 1000)], [V1p = V1, V2p = V2], 4). % i < 1000
stmtsrc(4, 'assume(i < 1000);').
transition_access( 4, [r, _] ).
r(p(pc(main-5-12), data(V1, V2)), p(pc(main-7-12), data(V1p, V2p)), [(V1 >= 1000)], [V1p = V1, V2p = V2], 5). % i >= 1000
stmtsrc(5, 'assume(i >= 1000);').
transition_access( 5, [r, _] ).
r(p(pc(main-6-14), data(V1, V2)), p(pc(main-8-0), data(V1p, V2p)), [], [V1p = V1, V2p = (V2 + V1)], 6). % c := c + i
stmtsrc(6, 'c=c + i;').
transition_access( 6, [r, w] ).
r(p(pc(main-8-0), data(V1, V2)), p(pc(main-1-12), data(V1p, V2p)), [], [V1p = (V1 + 1), V2p = V2], 7). % i := i + 1
stmtsrc(7, 'i=i + 1;').
transition_access( 7, [w, _] ).
r(p(pc(main-4-0), data(V1, V2)), p(pc(main-3-17), data(V1p, V2p)), [], [V1p = V1, V2p = V2], 8). % 
stmtsrc(8, 'skip;').
transition_access( 8, [_, _] ).
r(p(pc(main-3-17), data(V1, V2)), p(pc(main-err-0), data(V1p, V2p)), [(V2 +1 =< 0)], [V1p = V1, V2p = V2], 9). % c < 0
stmtsrc(9, 'assume(c < 0);').
transition_access( 9, [_, r] ).
r(p(pc(main-3-17), data(V1, V2)), p(pc(main-9-18), data(V1p, V2p)), [(V2 >= 0)], [V1p = V1, V2p = V2], 10). % c >= 0
stmtsrc(10, 'assume(c >= 0);').
transition_access( 10, [_, r] ).
r(p(pc(main-9-18), data(V1, V2)), p(pc(main-ret-0), data(V1p, V2p)), [], [V1p = V1, V2p = V2], 11). % 
stmtsrc(11, 'skip;').
transition_access( 11, [_, _] ).
r(p(pc(main-7-12), data(V1, V2)), p(pc(main-4-0), data(V1p, V2p)), [], [V1p = V1, V2p = V2], 12). % 
stmtsrc(12, 'skip;').
transition_access( 12, [_, _] ).
% Atomic blocks
strengthening(p(pc(main-1-12), data(V1, V2)), [( 1)*V2 +( 0) >= 0, ( 1)*V1 +( 0) >= 0, ( -1)*V1 +( 1000) >= 0,( 1)*V2 +( 0) >= 0, ( 1)*V1+( 1)*V2 +( 0) >= 0, ( 1)*V1 +( 0) >= 0, ( -1)*V1+( 1)*V2 +( 1) >= 0, ( -1)*V1 +( 1000) >= 0,( -1)*V1+( 0)*V2 +( 1000) >= 0]).
