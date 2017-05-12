:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V2, V3, V1)), []).
trans_preds(p(_, data(V2, V3, V1)), p(_, data(V2p, V3p, V1p)), []).
var2names(p(pc(_), data(V2, V3, V1)), [(V2, 'm'), (V3, 'j'), (V1, 'a')]).
globals(p(pc(_), data(V2, V3, V1)), [], []).
% start location
start(pc(main-0-9)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-4-14)). % line 14
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V2, V3, V1), []).
% cfg loop exit relation
cfg_exit_relation([]).
% 20 transitions
r(p(pc(main-0-9), data(V2, V3, V1)), p(pc(main-1-12), data(V2p, V3p, V1p)), [], [V2p = V2, V3p = V3, V1p = 0], 1). % a := 0
stmtsrc(1, 'a=0;').
transition_access( 1, [_, _, w] ).
r(p(pc(main-1-12), data(V2, V3, V1)), p(pc(main-3-13), data(V2p, V3p, V1p)), [(V2 =< 0)], [V2p = V2, V3p = V3, V1p = V1], 2). % m <= 0
stmtsrc(2, 'assume(m <= 0);').
transition_access( 2, [r, _, _] ).
r(p(pc(main-3-13), data(V2, V3, V1)), p(pc(main-ret-0), data(V2p, V3p, V1p)), [], [V2p = V2, V3p = V3, V1p = V1], 3). % 
stmtsrc(3, 'skip;').
transition_access( 3, [_, _, _] ).
r(p(pc(main-1-12), data(V2, V3, V1)), p(pc(main-2-14), data(V2p, V3p, V1p)), [(V2 >= 1+ 0)], [V2p = V2, V3p = V3, V1p = V1], 4). % m > 0
stmtsrc(4, 'assume(m > 0);').
transition_access( 4, [r, _, _] ).
r(p(pc(main-2-14), data(V2, V3, V1)), p(pc(main-4-14), data(V2p, V3p, V1p)), [], [V2p = V2, V3p = 1, V1p = V1], 5). % j := 1
stmtsrc(5, 'j=1;').
transition_access( 5, [_, w, _] ).
r(p(pc(main-4-14), data(V2, V3, V1)), p(pc(main-7-14), data(V2p, V3p, V1p)), [], [V2p = V2, V3p = V3, V1p = V1], 6). % 
stmtsrc(6, 'skip;').
transition_access( 6, [_, _, _] ).
r(p(pc(main-7-14), data(V2, V3, V1)), p(pc(main-8-15), data(V2p, V3p, V1p)), [(V3 =< V2)], [V2p = V2, V3p = V3, V1p = V1], 7). % j <= m
stmtsrc(7, 'assume(j <= m);').
transition_access( 7, [r, r, _] ).
r(p(pc(main-7-14), data(V2, V3, V1)), p(pc(main-9-14), data(V2p, V3p, V1p)), [(V3 >= 1+ V2)], [V2p = V2, V3p = V3, V1p = V1], 8). % j > m
stmtsrc(8, 'assume(j > m);').
transition_access( 8, [r, r, _] ).
r(p(pc(main-8-15), data(V2, V3, V1)), p(pc(main-11-16), data(V2p, V3p, V1p)), [], [V2p = V2, V3p = V3, V1p = V1], 9). % 
stmtsrc(9, 'skip;').
transition_access( 9, [_, _, _] ).
r(p(pc(main-11-16), data(V2, V3, V1)), p(pc(main-10-14), data(V2p, V3p, V1p)), [], [V2p = V2, V3p = V3, V1p = (V1 + 1)], 10). % a := a + 1
stmtsrc(10, 'a=a + 1;').
transition_access( 10, [_, _, w] ).
r(p(pc(main-8-15), data(V2, V3, V1)), p(pc(main-12-18), data(V2p, V3p, V1p)), [], [V2p = V2, V3p = V3, V1p = V1], 11). % 
stmtsrc(11, 'skip;').
transition_access( 11, [_, _, _] ).
r(p(pc(main-12-18), data(V2, V3, V1)), p(pc(main-10-14), data(V2p, V3p, V1p)), [], [V2p = V2, V3p = V3, V1p = (V1 - 1)], 12). % a := a - 1
stmtsrc(12, 'a=a - 1;').
transition_access( 12, [_, _, w] ).
r(p(pc(main-10-14), data(V2, V3, V1)), p(pc(main-4-14), data(V2p, V3p, V1p)), [], [V2p = V2, V3p = (V3 + 1), V1p = V1], 13). % j := j + 1
stmtsrc(13, 'j=j + 1;').
transition_access( 13, [_, w, _] ).
r(p(pc(main-6-0), data(V2, V3, V1)), p(pc(main-5-21), data(V2p, V3p, V1p)), [], [V2p = V2, V3p = V3, V1p = V1], 14). % 
stmtsrc(14, 'skip;').
transition_access( 14, [_, _, _] ).
r(p(pc(main-5-21), data(V2, V3, V1)), p(pc(main-err-0), data(V2p, V3p, V1p)), [(V1 +1 =< (- V2))], [V2p = V2, V3p = V3, V1p = V1], 15). % a < - m
stmtsrc(15, 'assume(a < - m);').
transition_access( 15, [r, _, r] ).
r(p(pc(main-5-21), data(V2, V3, V1)), p(pc(main-14-0), data(V2p, V3p, V1p)), [(V1 >= (- V2))], [V2p = V2, V3p = V3, V1p = V1], 16). % a >= - m
stmtsrc(16, 'assume(a >= - m);').
transition_access( 16, [r, _, r] ).
r(p(pc(main-14-0), data(V2, V3, V1)), p(pc(main-err-0), data(V2p, V3p, V1p)), [(V1 >= 1+ V2)], [V2p = V2, V3p = V3, V1p = V1], 17). % a > m
stmtsrc(17, 'assume(a > m);').
transition_access( 17, [r, _, r] ).
r(p(pc(main-14-0), data(V2, V3, V1)), p(pc(main-13-22), data(V2p, V3p, V1p)), [(V1 =< V2)], [V2p = V2, V3p = V3, V1p = V1], 18). % a <= m
stmtsrc(18, 'assume(a <= m);').
transition_access( 18, [r, _, r] ).
r(p(pc(main-13-22), data(V2, V3, V1)), p(pc(main-ret-0), data(V2p, V3p, V1p)), [], [V2p = V2, V3p = V3, V1p = V1], 19). % 
stmtsrc(19, 'skip;').
transition_access( 19, [_, _, _] ).
r(p(pc(main-9-14), data(V2, V3, V1)), p(pc(main-6-0), data(V2p, V3p, V1p)), [], [V2p = V2, V3p = V3, V1p = V1], 20). % 
stmtsrc(20, 'skip;').
transition_access( 20, [_, _, _] ).
% Atomic blocks
strengthening(p(pc(main-4-14), data(V2, V3, V1)), [( 1)*V3 +( -1) >= 0, ( 1)*V2 +( -1) >= 0,( 1)*V3+( -1)*V1 +( -1) >= 0, ( 1)*V3+( 1)*V1 +( -1) >= 0, ( 1)*V3 +( -1) >= 0, ( 1)*V2+( -1)*V1 +( 0) >= 0, ( 1)*V2+( 1)*V1 +( 0) >= 0, ( 1)*V2+( -1)*V3 +( 1) >= 0, ( 1)*V2+( 1)*V3 +( -2) >= 0, ( 1)*V2 +( -1) >= 0,( 1)*V2+( -1)*V3+( 0)*V1 +( 1) >= 0, ( 0)*V2+( 1)*V3+( -1)*V1 +( -1) >= 0, ( 0)*V2+( 1)*V3+( 1)*V1 +( -1) >= 0, ( 1)*V2+( 0)*V3+( 0)*V1 +( -1) >= 0]).
