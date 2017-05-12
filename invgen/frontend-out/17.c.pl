:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V4, V1, V3, V2)), []).
trans_preds(p(_, data(V4, V1, V3, V2)), p(_, data(V4p, V1p, V3p, V2p)), []).
var2names(p(pc(_), data(V4, V1, V3, V2)), [(V4, 'n'), (V1, 'k'), (V3, 'j'), (V2, 'i')]).
globals(p(pc(_), data(V4, V1, V3, V2)), [], []).
% start location
start(pc(main-0-7)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-9-10)). % line 10
cutpoint(pc(main-1-8)). % line 8
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V4, V1, V3, V2), []).
% cfg loop exit relation
cfg_exit_relation([(pc(main-9-10), pc(main-1-8))]).
% 20 transitions
r(p(pc(main-0-7), data(V4, V1, V3, V2)), p(pc(main-2-0), data(V4p, V1p, V3p, V2p)), [], [V4p = V4, V1p = 1, V3p = V3, V2p = V2], 1). % k := 1
stmtsrc(1, 'k=1;').
transition_access( 1, [_, w, _, _] ).
r(p(pc(main-2-0), data(V4, V1, V3, V2)), p(pc(main-3-0), data(V4p, V1p, V3p, V2p)), [], [V4p = V4, V1p = V1, V3p = V3, V2p = 1], 2). % i := 1
stmtsrc(2, 'i=1;').
transition_access( 2, [_, _, _, w] ).
r(p(pc(main-3-0), data(V4, V1, V3, V2)), p(pc(main-1-8), data(V4p, V1p, V3p, V2p)), [], [V4p = V4, V1p = V1, V3p = 0, V2p = V2], 3). % j := 0
stmtsrc(3, 'j=0;').
transition_access( 3, [_, _, w, _] ).
r(p(pc(main-1-8), data(V4, V1, V3, V2)), p(pc(main-6-8), data(V4p, V1p, V3p, V2p)), [], [V4p = V4, V1p = V1, V3p = V3, V2p = V2], 4). % 
stmtsrc(4, 'skip;').
transition_access( 4, [_, _, _, _] ).
r(p(pc(main-6-8), data(V4, V1, V3, V2)), p(pc(main-7-9), data(V4p, V1p, V3p, V2p)), [(V2 +1 =< V4)], [V4p = V4, V1p = V1, V3p = V3, V2p = V2], 5). % i < n
stmtsrc(5, 'assume(i < n);').
transition_access( 5, [r, _, _, r] ).
r(p(pc(main-6-8), data(V4, V1, V3, V2)), p(pc(main-8-8), data(V4p, V1p, V3p, V2p)), [(V2 >= V4)], [V4p = V4, V1p = V1, V3p = V3, V2p = V2], 6). % i >= n
stmtsrc(6, 'assume(i >= n);').
transition_access( 6, [r, _, _, r] ).
r(p(pc(main-7-9), data(V4, V1, V3, V2)), p(pc(main-9-10), data(V4p, V1p, V3p, V2p)), [], [V4p = V4, V1p = V1, V3p = 0, V2p = V2], 7). % j := 0
stmtsrc(7, 'j=0;').
transition_access( 7, [_, _, w, _] ).
r(p(pc(main-9-10), data(V4, V1, V3, V2)), p(pc(main-12-10), data(V4p, V1p, V3p, V2p)), [], [V4p = V4, V1p = V1, V3p = V3, V2p = V2], 8). % 
stmtsrc(8, 'skip;').
transition_access( 8, [_, _, _, _] ).
r(p(pc(main-12-10), data(V4, V1, V3, V2)), p(pc(main-13-12), data(V4p, V1p, V3p, V2p)), [(V3 +1 =< V2)], [V4p = V4, V1p = V1, V3p = V3, V2p = V2], 9). % j < i
stmtsrc(9, 'assume(j < i);').
transition_access( 9, [_, _, r, r] ).
r(p(pc(main-12-10), data(V4, V1, V3, V2)), p(pc(main-14-10), data(V4p, V1p, V3p, V2p)), [(V3 >= V2)], [V4p = V4, V1p = V1, V3p = V3, V2p = V2], 10). % j >= i
stmtsrc(10, 'assume(j >= i);').
transition_access( 10, [_, _, r, r] ).
r(p(pc(main-13-12), data(V4, V1, V3, V2)), p(pc(main-15-0), data(V4p, V1p, V3p, V2p)), [], [V4p = V4, V1p = (V1 + (V2 - V3)), V3p = V3, V2p = V2], 11). % k := k + (i - j)
stmtsrc(11, 'k=k + (i - j);').
transition_access( 11, [_, w, r, r] ).
r(p(pc(main-15-0), data(V4, V1, V3, V2)), p(pc(main-9-10), data(V4p, V1p, V3p, V2p)), [], [V4p = V4, V1p = V1, V3p = (V3 + 1), V2p = V2], 12). % j := j + 1
stmtsrc(12, 'j=j + 1;').
transition_access( 12, [_, _, w, _] ).
r(p(pc(main-11-0), data(V4, V1, V3, V2)), p(pc(main-10-14), data(V4p, V1p, V3p, V2p)), [], [V4p = V4, V1p = V1, V3p = V3, V2p = V2], 13). % 
stmtsrc(13, 'skip;').
transition_access( 13, [_, _, _, _] ).
r(p(pc(main-10-14), data(V4, V1, V3, V2)), p(pc(main-1-8), data(V4p, V1p, V3p, V2p)), [], [V4p = V4, V1p = V1, V3p = V3, V2p = (V2 + 1)], 14). % i := i + 1
stmtsrc(14, 'i=i + 1;').
transition_access( 14, [_, _, _, w] ).
r(p(pc(main-5-0), data(V4, V1, V3, V2)), p(pc(main-4-16), data(V4p, V1p, V3p, V2p)), [], [V4p = V4, V1p = V1, V3p = V3, V2p = V2], 15). % 
stmtsrc(15, 'skip;').
transition_access( 15, [_, _, _, _] ).
r(p(pc(main-4-16), data(V4, V1, V3, V2)), p(pc(main-err-0), data(V4p, V1p, V3p, V2p)), [(V1 +1 =< V4)], [V4p = V4, V1p = V1, V3p = V3, V2p = V2], 16). % k < n
stmtsrc(16, 'assume(k < n);').
transition_access( 16, [r, r, _, _] ).
r(p(pc(main-4-16), data(V4, V1, V3, V2)), p(pc(main-16-18), data(V4p, V1p, V3p, V2p)), [(V1 >= V4)], [V4p = V4, V1p = V1, V3p = V3, V2p = V2], 17). % k >= n
stmtsrc(17, 'assume(k >= n);').
transition_access( 17, [r, r, _, _] ).
r(p(pc(main-16-18), data(V4, V1, V3, V2)), p(pc(main-ret-0), data(V4p, V1p, V3p, V2p)), [], [V4p = V4, V1p = V1, V3p = V3, V2p = V2], 18). % 
stmtsrc(18, 'skip;').
transition_access( 18, [_, _, _, _] ).
r(p(pc(main-14-10), data(V4, V1, V3, V2)), p(pc(main-11-0), data(V4p, V1p, V3p, V2p)), [], [V4p = V4, V1p = V1, V3p = V3, V2p = V2], 19). % 
stmtsrc(19, 'skip;').
transition_access( 19, [_, _, _, _] ).
r(p(pc(main-8-8), data(V4, V1, V3, V2)), p(pc(main-5-0), data(V4p, V1p, V3p, V2p)), [], [V4p = V4, V1p = V1, V3p = V3, V2p = V2], 20). % 
stmtsrc(20, 'skip;').
transition_access( 20, [_, _, _, _] ).
% Atomic blocks
strengthening(p(pc(main-9-10), data(V4, V1, V3, V2)), [( 1)*V2 +( -1) >= 0, ( 1)*V3 +( 0) >= 0, ( 1)*V4 +( -2) >= 0,( 1)*V2 +( -1) >= 0, ( 1)*V3+( 1)*V2 +( -1) >= 0, ( 1)*V3 +( 0) >= 0, ( -1)*V3+( 1)*V2 +( 1) >= 0, ( 1)*V4+( 1)*V2 +( -3) >= 0, ( 1)*V4+( 1)*V3 +( -2) >= 0, ( 1)*V4 +( -2) >= 0,( 1)*V4+( 0)*V1+( 0)*V3+( 0)*V2 +( -2) >= 0, ( 0)*V4+( 0)*V1+( 1)*V3+( 0)*V2 +( 0) >= 0, ( 0)*V4+( 0)*V1+( 0)*V3+( 1)*V2 +( -1) >= 0, ( 0)*V4+( 0)*V1+( -1)*V3+( 1)*V2 +( 1) >= 0]).
strengthening(p(pc(main-1-8), data(V4, V1, V3, V2)), [( 1)*V2 +( -1) >= 0, ( 1)*V3 +( 0) >= 0,( 1)*V2 +( -1) >= 0, ( 1)*V3+( -1)*V2 +( 1) >= 0, ( 1)*V3+( 1)*V2 +( -1) >= 0, ( 1)*V3 +( 0) >= 0, ( -1)*V3+( 1)*V2 +( 0) >= 0,( 0)*V4+( 0)*V1+( 1)*V3+( -1)*V2 +( 1) >= 0, ( 0)*V4+( 0)*V1+( -1)*V3+( 2)*V2 +( -2) >= 0, ( 0)*V4+( 0)*V1+( -1)*V3+( 1)*V2 +( 0) >= 0]).
