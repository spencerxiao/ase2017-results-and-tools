:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V2, V1, V4, V3)), []).
trans_preds(p(_, data(V2, V1, V4, V3)), p(_, data(V2p, V1p, V4p, V3p)), []).
var2names(p(pc(_), data(V2, V1, V4, V3)), [(V2, 'y'), (V1, 'x'), (V4, 'j'), (V3, 'i')]).
globals(p(pc(_), data(V2, V1, V4, V3)), [], []).
% start location
start(pc(main-0-9)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-8-13)). % line 13
cutpoint(pc(main-1-11)). % line 11
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V2, V1, V4, V3), []).
% cfg loop exit relation
cfg_exit_relation([(pc(main-8-13), pc(main-1-11))]).
% 27 transitions
r(p(pc(main-0-9), data(V2, V1, V4, V3)), p(pc(main-2-0), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = 0, V4p = V4, V3p = V3], 1). % x := 0
stmtsrc(1, 'x=0;').
transition_access( 1, [_, w, _, _] ).
r(p(pc(main-2-0), data(V2, V1, V4, V3)), p(pc(main-3-0), data(V2p, V1p, V4p, V3p)), [], [V2p = 0, V1p = V1, V4p = V4, V3p = V3], 2). % y := 0
stmtsrc(2, 'y=0;').
transition_access( 2, [w, _, _, _] ).
r(p(pc(main-3-0), data(V2, V1, V4, V3)), p(pc(main-4-0), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = V1, V4p = V4, V3p = 0], 3). % i := 0
stmtsrc(3, 'i=0;').
transition_access( 3, [_, _, _, w] ).
r(p(pc(main-4-0), data(V2, V1, V4, V3)), p(pc(main-1-11), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = V1, V4p = 0, V3p = V3], 4). % j := 0
stmtsrc(4, 'j=0;').
transition_access( 4, [_, _, w, _] ).
r(p(pc(main-1-11), data(V2, V1, V4, V3)), p(pc(main-7-11), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 5). % 
stmtsrc(5, 'skip;').
transition_access( 5, [_, _, _, _] ).
r(p(pc(main-7-11), data(V2, V1, V4, V3)), p(pc(main-8-13), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 6). % 
stmtsrc(6, 'skip;').
transition_access( 6, [_, _, _, _] ).
r(p(pc(main-7-11), data(V2, V1, V4, V3)), p(pc(main-9-11), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 7). % 
stmtsrc(7, 'skip;').
transition_access( 7, [_, _, _, _] ).
r(p(pc(main-8-13), data(V2, V1, V4, V3)), p(pc(main-12-13), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 8). % 
stmtsrc(8, 'skip;').
transition_access( 8, [_, _, _, _] ).
r(p(pc(main-12-13), data(V2, V1, V4, V3)), p(pc(main-13-15), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 9). % 
stmtsrc(9, 'skip;').
transition_access( 9, [_, _, _, _] ).
r(p(pc(main-12-13), data(V2, V1, V4, V3)), p(pc(main-14-13), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 10). % 
stmtsrc(10, 'skip;').
transition_access( 10, [_, _, _, _] ).
r(p(pc(main-13-15), data(V2, V1, V4, V3)), p(pc(main-15-16), data(V2p, V1p, V4p, V3p)), [(V1 = V2)], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 11). % x == y
stmtsrc(11, 'assume(x == y);').
transition_access( 11, [r, r, _, _] ).
r(p(pc(main-15-16), data(V2, V1, V4, V3)), p(pc(main-8-13), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = V1, V4p = V4, V3p = (V3 + 1)], 12). % i := i + 1
stmtsrc(12, 'i=i + 1;').
transition_access( 12, [_, _, _, w] ).
r(p(pc(main-13-15), data(V2, V1, V4, V3)), p(pc(main-16-18), data(V2p, V1p, V4p, V3p)), [(V1 +1 =< V2)], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 13). % x < y
stmtsrc(13, 'assume(x < y);').
transition_access( 13, [r, r, _, _] ).
r(p(pc(main-13-15), data(V2, V1, V4, V3)), p(pc(main-16-18), data(V2p, V1p, V4p, V3p)), [(V1 >= 1+ V2)], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 14). % x > y
stmtsrc(14, 'assume(x > y);').
transition_access( 14, [r, r, _, _] ).
r(p(pc(main-16-18), data(V2, V1, V4, V3)), p(pc(main-8-13), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = V1, V4p = (V4 + 1), V3p = V3], 15). % j := j + 1
stmtsrc(15, 'j=j + 1;').
transition_access( 15, [_, _, w, _] ).
r(p(pc(main-11-0), data(V2, V1, V4, V3)), p(pc(main-10-20), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 16). % 
stmtsrc(16, 'skip;').
transition_access( 16, [_, _, _, _] ).
r(p(pc(main-10-20), data(V2, V1, V4, V3)), p(pc(main-17-23), data(V2p, V1p, V4p, V3p)), [(V3 >= V4)], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 17). % i >= j
stmtsrc(17, 'assume(i >= j);').
transition_access( 17, [_, _, r, r] ).
r(p(pc(main-17-23), data(V2, V1, V4, V3)), p(pc(main-19-0), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = (V1 + 1), V4p = V4, V3p = V3], 18). % x := x + 1
stmtsrc(18, 'x=x + 1;').
transition_access( 18, [_, w, _, _] ).
r(p(pc(main-19-0), data(V2, V1, V4, V3)), p(pc(main-1-11), data(V2p, V1p, V4p, V3p)), [], [V2p = (V2 + 1), V1p = V1, V4p = V4, V3p = V3], 19). % y := y + 1
stmtsrc(19, 'y=y + 1;').
transition_access( 19, [w, _, _, _] ).
r(p(pc(main-10-20), data(V2, V1, V4, V3)), p(pc(main-18-26), data(V2p, V1p, V4p, V3p)), [(V3 +1 =< V4)], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 20). % i < j
stmtsrc(20, 'assume(i < j);').
transition_access( 20, [_, _, r, r] ).
r(p(pc(main-18-26), data(V2, V1, V4, V3)), p(pc(main-1-11), data(V2p, V1p, V4p, V3p)), [], [V2p = (V2 + 1), V1p = V1, V4p = V4, V3p = V3], 21). % y := y + 1
stmtsrc(21, 'y=y + 1;').
transition_access( 21, [w, _, _, _] ).
r(p(pc(main-6-0), data(V2, V1, V4, V3)), p(pc(main-5-29), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 22). % 
stmtsrc(22, 'skip;').
transition_access( 22, [_, _, _, _] ).
r(p(pc(main-5-29), data(V2, V1, V4, V3)), p(pc(main-err-0), data(V2p, V1p, V4p, V3p)), [(V3 +1 =< V4)], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 23). % i < j
stmtsrc(23, 'assume(i < j);').
transition_access( 23, [_, _, r, r] ).
r(p(pc(main-5-29), data(V2, V1, V4, V3)), p(pc(main-20-30), data(V2p, V1p, V4p, V3p)), [(V3 >= V4)], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 24). % i >= j
stmtsrc(24, 'assume(i >= j);').
transition_access( 24, [_, _, r, r] ).
r(p(pc(main-20-30), data(V2, V1, V4, V3)), p(pc(main-ret-0), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 25). % 
stmtsrc(25, 'skip;').
transition_access( 25, [_, _, _, _] ).
r(p(pc(main-14-13), data(V2, V1, V4, V3)), p(pc(main-11-0), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 26). % 
stmtsrc(26, 'skip;').
transition_access( 26, [_, _, _, _] ).
r(p(pc(main-9-11), data(V2, V1, V4, V3)), p(pc(main-6-0), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 27). % 
stmtsrc(27, 'skip;').
transition_access( 27, [_, _, _, _] ).
% Atomic blocks
strengthening(p(pc(main-8-13), data(V2, V1, V4, V3)), [( 1)*V3 +( 0) >= 0, ( 1)*V4 +( 0) >= 0, ( 1)*V1 +( 0) >= 0, ( 1)*V2 +( 0) >= 0,( 1)*V3 +( 0) >= 0, ( 1)*V4+( 1)*V3 +( 0) >= 0, ( 1)*V4 +( 0) >= 0, ( 1)*V1+( 1)*V3 +( 0) >= 0, ( 1)*V1+( 1)*V4 +( 0) >= 0, ( 1)*V1 +( 0) >= 0, ( 1)*V2+( 1)*V3 +( 0) >= 0, ( 1)*V2+( 1)*V4 +( 0) >= 0, ( 1)*V2+( -1)*V1 +( 0) >= 0, ( 1)*V2+( 1)*V1 +( 0) >= 0, ( 1)*V2 +( 0) >= 0,( 1)*V2+( -1)*V1+( 0)*V4+( 0)*V3 +( 0) >= 0, ( 0)*V2+( 0)*V1+( 0)*V4+( 1)*V3 +( 0) >= 0]).
strengthening(p(pc(main-1-11), data(V2, V1, V4, V3)), [( 1)*V3 +( 0) >= 0, ( 1)*V4 +( 0) >= 0, ( 1)*V1 +( 0) >= 0, ( 1)*V2 +( 0) >= 0,( 1)*V3 +( 0) >= 0, ( 1)*V4+( 1)*V3 +( 0) >= 0, ( 1)*V4 +( 0) >= 0, ( 1)*V1+( 1)*V3 +( 0) >= 0, ( 1)*V1+( 1)*V4 +( 0) >= 0, ( 1)*V1 +( 0) >= 0, ( 1)*V2+( 1)*V3 +( 0) >= 0, ( 1)*V2+( 1)*V4 +( 0) >= 0, ( 1)*V2+( -1)*V1 +( 0) >= 0, ( 1)*V2+( 1)*V1 +( 0) >= 0, ( 1)*V2 +( 0) >= 0,( 0)*V2+( 0)*V1+( 0)*V4+( 1)*V3 +( 0) >= 0, ( 1)*V2+( -1)*V1+( 0)*V4+( 0)*V3 +( 0) >= 0]).
