:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V1, V2, V4, V3)), []).
trans_preds(p(_, data(V1, V2, V4, V3)), p(_, data(V1p, V2p, V4p, V3p)), []).
var2names(p(pc(_), data(V1, V2, V4, V3)), [(V1, 'n'), (V2, 'i'), (V4, 'b'), (V3, 'a')]).
globals(p(pc(_), data(V1, V2, V4, V3)), [], []).
% start location
start(pc(main-0-12)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-1-13)). % line 13
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V1, V2, V4, V3), []).
% cfg loop exit relation
cfg_exit_relation([]).
% 20 transitions
r(p(pc(main-0-12), data(V1, V2, V4, V3)), p(pc(main-2-0), data(V1p, V2p, V4p, V3p)), [(V1 >= 0)], [V1p = V1, V2p = V2, V4p = V4, V3p = V3], 1). % n >= 0
stmtsrc(1, 'assume(n >= 0);').
transition_access( 1, [r, _, _, _] ).
r(p(pc(main-2-0), data(V1, V2, V4, V3)), p(pc(main-3-0), data(V1p, V2p, V4p, V3p)), [], [V1p = V1, V2p = 0, V4p = V4, V3p = V3], 2). % i := 0
stmtsrc(2, 'i=0;').
transition_access( 2, [_, w, _, _] ).
r(p(pc(main-3-0), data(V1, V2, V4, V3)), p(pc(main-4-0), data(V1p, V2p, V4p, V3p)), [], [V1p = V1, V2p = V2, V4p = V4, V3p = 0], 3). % a := 0
stmtsrc(3, 'a=0;').
transition_access( 3, [_, _, _, w] ).
r(p(pc(main-4-0), data(V1, V2, V4, V3)), p(pc(main-1-13), data(V1p, V2p, V4p, V3p)), [], [V1p = V1, V2p = V2, V4p = 0, V3p = V3], 4). % b := 0
stmtsrc(4, 'b=0;').
transition_access( 4, [_, _, w, _] ).
r(p(pc(main-1-13), data(V1, V2, V4, V3)), p(pc(main-7-13), data(V1p, V2p, V4p, V3p)), [], [V1p = V1, V2p = V2, V4p = V4, V3p = V3], 5). % 
stmtsrc(5, 'skip;').
transition_access( 5, [_, _, _, _] ).
r(p(pc(main-7-13), data(V1, V2, V4, V3)), p(pc(main-8-14), data(V1p, V2p, V4p, V3p)), [(V2 +1 =< V1)], [V1p = V1, V2p = V2, V4p = V4, V3p = V3], 6). % i < n
stmtsrc(6, 'assume(i < n);').
transition_access( 6, [r, r, _, _] ).
r(p(pc(main-7-13), data(V1, V2, V4, V3)), p(pc(main-9-13), data(V1p, V2p, V4p, V3p)), [(V2 >= V1)], [V1p = V1, V2p = V2, V4p = V4, V3p = V3], 7). % i >= n
stmtsrc(7, 'assume(i >= n);').
transition_access( 7, [r, r, _, _] ).
r(p(pc(main-8-14), data(V1, V2, V4, V3)), p(pc(main-11-16), data(V1p, V2p, V4p, V3p)), [], [V1p = V1, V2p = V2, V4p = V4, V3p = V3], 8). % 
stmtsrc(8, 'skip;').
transition_access( 8, [_, _, _, _] ).
r(p(pc(main-11-16), data(V1, V2, V4, V3)), p(pc(main-13-0), data(V1p, V2p, V4p, V3p)), [], [V1p = V1, V2p = V2, V4p = V4, V3p = (V3 + 1)], 9). % a := a + 1
stmtsrc(9, 'a=a + 1;').
transition_access( 9, [_, _, _, w] ).
r(p(pc(main-13-0), data(V1, V2, V4, V3)), p(pc(main-10-21), data(V1p, V2p, V4p, V3p)), [], [V1p = V1, V2p = V2, V4p = (V4 + 2), V3p = V3], 10). % b := b + 2
stmtsrc(10, 'b=b + 2;').
transition_access( 10, [_, _, w, _] ).
r(p(pc(main-8-14), data(V1, V2, V4, V3)), p(pc(main-12-19), data(V1p, V2p, V4p, V3p)), [], [V1p = V1, V2p = V2, V4p = V4, V3p = V3], 11). % 
stmtsrc(11, 'skip;').
transition_access( 11, [_, _, _, _] ).
r(p(pc(main-12-19), data(V1, V2, V4, V3)), p(pc(main-14-0), data(V1p, V2p, V4p, V3p)), [], [V1p = V1, V2p = V2, V4p = V4, V3p = (V3 + 2)], 12). % a := a + 2
stmtsrc(12, 'a=a + 2;').
transition_access( 12, [_, _, _, w] ).
r(p(pc(main-14-0), data(V1, V2, V4, V3)), p(pc(main-10-21), data(V1p, V2p, V4p, V3p)), [], [V1p = V1, V2p = V2, V4p = (V4 + 1), V3p = V3], 13). % b := b + 1
stmtsrc(13, 'b=b + 1;').
transition_access( 13, [_, _, w, _] ).
r(p(pc(main-10-21), data(V1, V2, V4, V3)), p(pc(main-1-13), data(V1p, V2p, V4p, V3p)), [], [V1p = V1, V2p = (V2 + 1), V4p = V4, V3p = V3], 14). % i := i + 1
stmtsrc(14, 'i=i + 1;').
transition_access( 14, [_, w, _, _] ).
r(p(pc(main-6-0), data(V1, V2, V4, V3)), p(pc(main-5-23), data(V1p, V2p, V4p, V3p)), [], [V1p = V1, V2p = V2, V4p = V4, V3p = V3], 15). % 
stmtsrc(15, 'skip;').
transition_access( 15, [_, _, _, _] ).
r(p(pc(main-5-23), data(V1, V2, V4, V3)), p(pc(main-err-0), data(V1p, V2p, V4p, V3p)), [((V3 + V4) +1 =< (3 * V1))], [V1p = V1, V2p = V2, V4p = V4, V3p = V3], 16). % a + b < 3 * n
stmtsrc(16, 'assume(a + b < 3 * n);').
transition_access( 16, [r, _, r, r] ).
r(p(pc(main-5-23), data(V1, V2, V4, V3)), p(pc(main-err-0), data(V1p, V2p, V4p, V3p)), [((V3 + V4) >= 1+ (3 * V1))], [V1p = V1, V2p = V2, V4p = V4, V3p = V3], 17). % a + b > 3 * n
stmtsrc(17, 'assume(a + b > 3 * n);').
transition_access( 17, [r, _, r, r] ).
r(p(pc(main-5-23), data(V1, V2, V4, V3)), p(pc(main-15-24), data(V1p, V2p, V4p, V3p)), [((V3 + V4) = (3 * V1))], [V1p = V1, V2p = V2, V4p = V4, V3p = V3], 18). % a + b == 3 * n
stmtsrc(18, 'assume(a + b == 3 * n);').
transition_access( 18, [r, _, r, r] ).
r(p(pc(main-15-24), data(V1, V2, V4, V3)), p(pc(main-ret-0), data(V1p, V2p, V4p, V3p)), [], [V1p = V1, V2p = V2, V4p = V4, V3p = V3], 19). % 
stmtsrc(19, 'skip;').
transition_access( 19, [_, _, _, _] ).
r(p(pc(main-9-13), data(V1, V2, V4, V3)), p(pc(main-6-0), data(V1p, V2p, V4p, V3p)), [], [V1p = V1, V2p = V2, V4p = V4, V3p = V3], 20). % 
stmtsrc(20, 'skip;').
transition_access( 20, [_, _, _, _] ).
% Atomic blocks
strengthening(p(pc(main-1-13), data(V1, V2, V4, V3)), [( 1)*V3 +( 0) >= 0, ( 1)*V4 +( 0) >= 0, ( 1)*V2 +( 0) >= 0, ( 1)*V1 +( 0) >= 0,( 1)*V3 +( 0) >= 0, ( 1)*V4+( 1)*V3 +( 0) >= 0, ( 1)*V4 +( 0) >= 0, ( 1)*V2+( 1)*V3 +( 0) >= 0, ( 1)*V2+( 1)*V4 +( 0) >= 0, ( 1)*V2 +( 0) >= 0, ( -1)*V2+( 1)*V3 +( 0) >= 0, ( -1)*V2+( 1)*V4 +( 0) >= 0, ( 1)*V1+( 1)*V3 +( 0) >= 0, ( 1)*V1+( 1)*V4 +( 0) >= 0, ( 1)*V1+( -1)*V2 +( 1) >= 0, ( 1)*V1+( 1)*V2 +( 0) >= 0, ( 1)*V1 +( 0) >= 0,( 0)*V1+( -3)*V2+( 1)*V4+( 1)*V3 +( 0) = 0, ( 0)*V1+( -1)*V2+( 1)*V4+( 0)*V3 +( 0) >= 0, ( 1)*V1+( -1)*V2+( 0)*V4+( 0)*V3 +( 1) >= 0, ( 0)*V1+( 2)*V2+( -1)*V4+( 0)*V3 +( 0) >= 0, ( 2)*V1+( -1)*V2+( 0)*V4+( 0)*V3 +( 0) >= 0]).
