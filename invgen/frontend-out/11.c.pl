:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V2, V1, V3)), []).
trans_preds(p(_, data(V2, V1, V3)), p(_, data(V2p, V1p, V3p)), []).
var2names(p(pc(_), data(V2, V1, V3)), [(V2, 'x'), (V1, 'j'), (V3, 'i')]).
globals(p(pc(_), data(V2, V1, V3)), [], []).
% start location
start(pc(main-0-15)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-1-15)). % line 15
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V2, V1, V3), []).
% cfg loop exit relation
cfg_exit_relation([]).
% 14 transitions
r(p(pc(main-0-15), data(V2, V1, V3)), p(pc(main-2-0), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = 0, V3p = V3], 1). % j := 0
stmtsrc(1, 'j=0;').
transition_access( 1, [_, w, _] ).
r(p(pc(main-2-0), data(V2, V1, V3)), p(pc(main-3-0), data(V2p, V1p, V3p)), [], [V2p = 100, V1p = V1, V3p = V3], 2). % x := 100
stmtsrc(2, 'x=100;').
transition_access( 2, [w, _, _] ).
r(p(pc(main-3-0), data(V2, V1, V3)), p(pc(main-1-15), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = 0], 3). % i := 0
stmtsrc(3, 'i=0;').
transition_access( 3, [_, _, w] ).
r(p(pc(main-1-15), data(V2, V1, V3)), p(pc(main-6-15), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 4). % 
stmtsrc(4, 'skip;').
transition_access( 4, [_, _, _] ).
r(p(pc(main-6-15), data(V2, V1, V3)), p(pc(main-7-15), data(V2p, V1p, V3p)), [(V3 +1 =< V2)], [V2p = V2, V1p = V1, V3p = V3], 5). % i < x
stmtsrc(5, 'assume(i < x);').
transition_access( 5, [r, _, r] ).
r(p(pc(main-6-15), data(V2, V1, V3)), p(pc(main-8-15), data(V2p, V1p, V3p)), [(V3 >= V2)], [V2p = V2, V1p = V1, V3p = V3], 6). % i >= x
stmtsrc(6, 'assume(i >= x);').
transition_access( 6, [r, _, r] ).
r(p(pc(main-7-15), data(V2, V1, V3)), p(pc(main-9-0), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = (V1 + 2), V3p = V3], 7). % j := j + 2
stmtsrc(7, 'j=j + 2;').
transition_access( 7, [_, w, _] ).
r(p(pc(main-9-0), data(V2, V1, V3)), p(pc(main-1-15), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = (V3 + 1)], 8). % i := i + 1
stmtsrc(8, 'i=i + 1;').
transition_access( 8, [_, _, w] ).
r(p(pc(main-5-0), data(V2, V1, V3)), p(pc(main-4-19), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 9). % 
stmtsrc(9, 'skip;').
transition_access( 9, [_, _, _] ).
r(p(pc(main-4-19), data(V2, V1, V3)), p(pc(main-err-0), data(V2p, V1p, V3p)), [(V1 +1 =< (2 * V2))], [V2p = V2, V1p = V1, V3p = V3], 10). % j < 2 * x
stmtsrc(10, 'assume(j < 2 * x);').
transition_access( 10, [r, r, _] ).
r(p(pc(main-4-19), data(V2, V1, V3)), p(pc(main-err-0), data(V2p, V1p, V3p)), [(V1 >= 1+ (2 * V2))], [V2p = V2, V1p = V1, V3p = V3], 11). % j > 2 * x
stmtsrc(11, 'assume(j > 2 * x);').
transition_access( 11, [r, r, _] ).
r(p(pc(main-4-19), data(V2, V1, V3)), p(pc(main-10-20), data(V2p, V1p, V3p)), [(V1 = (2 * V2))], [V2p = V2, V1p = V1, V3p = V3], 12). % j == 2 * x
stmtsrc(12, 'assume(j == 2 * x);').
transition_access( 12, [r, r, _] ).
r(p(pc(main-10-20), data(V2, V1, V3)), p(pc(main-ret-0), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 13). % 
stmtsrc(13, 'skip;').
transition_access( 13, [_, _, _] ).
r(p(pc(main-8-15), data(V2, V1, V3)), p(pc(main-5-0), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 14). % 
stmtsrc(14, 'skip;').
transition_access( 14, [_, _, _] ).
% Atomic blocks
strengthening(p(pc(main-1-15), data(V2, V1, V3)), [( 1)*V3 +( 0) >= 0, ( -1)*V3 +( 100) >= 0, ( 1)*V1 +( 0) >= 0, ( 1)*V2 +( -100) = 0,( 1)*V3 +( 0) >= 0, ( -1)*V3 +( 100) >= 0, ( 1)*V1+( -1)*V3 +( 0) >= 0, ( 1)*V1+( 1)*V3 +( 0) >= 0, ( 1)*V1 +( 0) >= 0, ( 1)*V2+( -1)*V3 +( 0) >= 0, ( 1)*V2+( 1)*V3 +( -100) >= 0, ( 1)*V2+( 1)*V1 +( -100) >= 0, ( 1)*V2 +( -100) >= 0, ( -1)*V2+( -1)*V3 +( 200) >= 0, ( -1)*V2+( 1)*V3 +( 100) >= 0, ( -1)*V2+( 1)*V1 +( 100) >= 0, ( -1)*V2 +( 100) >= 0,( 1)*V2+( 0)*V1+( 0)*V3 +( -100) = 0, ( 0)*V2+( -1)*V1+( 2)*V3 +( 0) = 0, ( 0)*V2+( 0)*V1+( 1)*V3 +( 0) >= 0, ( 0)*V2+( 0)*V1+( -1)*V3 +( 100) >= 0]).
