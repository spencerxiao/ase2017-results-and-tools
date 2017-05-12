:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V7, V1, V4, V2, V6, V5, V3)), []).
trans_preds(p(_, data(V7, V1, V4, V2, V6, V5, V3)), p(_, data(V7p, V1p, V4p, V2p, V6p, V5p, V3p)), []).
var2names(p(pc(_), data(V7, V1, V4, V2, V6, V5, V3)), [(V7, 'z'), (V1, 'n'), (V4, 'm'), (V2, 'k'), (V6, 'j'), (V5, 'i'), (V3, 'flag')]).
globals(p(pc(_), data(V7, V1, V4, V2, V6, V5, V3)), [], []).
% start location
start(pc(main-0-9)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-6-16)). % line 16
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V7, V1, V4, V2, V6, V5, V3), []).
% cfg loop exit relation
cfg_exit_relation([]).
% 20 transitions
r(p(pc(main-0-9), data(V7, V1, V4, V2, V6, V5, V3)), p(pc(main-2-0), data(V7p, V1p, V4p, V2p, V6p, V5p, V3p)), [(V1 >= 0)], [V7p = V7, V1p = V1, V4p = V4, V2p = V2, V6p = V6, V5p = V5, V3p = V3], 1). % n >= 0
stmtsrc(1, 'assume(n >= 0);').
transition_access( 1, [_, r, _, _, _, _, _] ).
r(p(pc(main-2-0), data(V7, V1, V4, V2, V6, V5, V3)), p(pc(main-1-11), data(V7p, V1p, V4p, V2p, V6p, V5p, V3p)), [], [V7p = V7, V1p = V1, V4p = V4, V2p = 1, V6p = V6, V5p = V5, V3p = V3], 2). % k := 1
stmtsrc(2, 'k=1;').
transition_access( 2, [_, _, _, w, _, _, _] ).
r(p(pc(main-1-11), data(V7, V1, V4, V2, V6, V5, V3)), p(pc(main-4-13), data(V7p, V1p, V4p, V2p, V6p, V5p, V3p)), [(V3 +1 =< 0)], [V7p = V7, V1p = V1, V4p = V4, V2p = V2, V6p = V6, V5p = V5, V3p = V3], 3). % flag < 0
stmtsrc(3, 'assume(flag < 0);').
transition_access( 3, [_, _, _, _, _, _, r] ).
r(p(pc(main-1-11), data(V7, V1, V4, V2, V6, V5, V3)), p(pc(main-4-13), data(V7p, V1p, V4p, V2p, V6p, V5p, V3p)), [(V3 >= 1+ 0)], [V7p = V7, V1p = V1, V4p = V4, V2p = V2, V6p = V6, V5p = V5, V3p = V3], 4). % flag > 0
stmtsrc(4, 'assume(flag > 0);').
transition_access( 4, [_, _, _, _, _, _, r] ).
r(p(pc(main-4-13), data(V7, V1, V4, V2, V6, V5, V3)), p(pc(main-5-0), data(V7p, V1p, V4p, V2p, V6p, V5p, V3p)), [], [V7p = V7, V1p = V1, V4p = V4, V2p = V4, V6p = V6, V5p = V5, V3p = V3], 5). % k := m
stmtsrc(5, 'k=m;').
transition_access( 5, [_, _, r, w, _, _, _] ).
r(p(pc(main-5-0), data(V7, V1, V4, V2, V6, V5, V3)), p(pc(main-3-15), data(V7p, V1p, V4p, V2p, V6p, V5p, V3p)), [(V2 >= 0)], [V7p = V7, V1p = V1, V4p = V4, V2p = V2, V6p = V6, V5p = V5, V3p = V3], 6). % k >= 0
stmtsrc(6, 'assume(k >= 0);').
transition_access( 6, [_, _, _, r, _, _, _] ).
r(p(pc(main-1-11), data(V7, V1, V4, V2, V6, V5, V3)), p(pc(main-3-15), data(V7p, V1p, V4p, V2p, V6p, V5p, V3p)), [(V3 = 0)], [V7p = V7, V1p = V1, V4p = V4, V2p = V2, V6p = V6, V5p = V5, V3p = V3], 7). % flag == 0
stmtsrc(7, 'assume(flag == 0);').
transition_access( 7, [_, _, _, _, _, _, r] ).
r(p(pc(main-3-15), data(V7, V1, V4, V2, V6, V5, V3)), p(pc(main-7-0), data(V7p, V1p, V4p, V2p, V6p, V5p, V3p)), [], [V7p = V7, V1p = V1, V4p = V4, V2p = V2, V6p = V6, V5p = 0, V3p = V3], 8). % i := 0
stmtsrc(8, 'i=0;').
transition_access( 8, [_, _, _, _, _, w, _] ).
r(p(pc(main-7-0), data(V7, V1, V4, V2, V6, V5, V3)), p(pc(main-6-16), data(V7p, V1p, V4p, V2p, V6p, V5p, V3p)), [], [V7p = V7, V1p = V1, V4p = V4, V2p = V2, V6p = 0, V5p = V5, V3p = V3], 9). % j := 0
stmtsrc(9, 'j=0;').
transition_access( 9, [_, _, _, _, w, _, _] ).
r(p(pc(main-6-16), data(V7, V1, V4, V2, V6, V5, V3)), p(pc(main-10-16), data(V7p, V1p, V4p, V2p, V6p, V5p, V3p)), [], [V7p = V7, V1p = V1, V4p = V4, V2p = V2, V6p = V6, V5p = V5, V3p = V3], 10). % 
stmtsrc(10, 'skip;').
transition_access( 10, [_, _, _, _, _, _, _] ).
r(p(pc(main-10-16), data(V7, V1, V4, V2, V6, V5, V3)), p(pc(main-11-18), data(V7p, V1p, V4p, V2p, V6p, V5p, V3p)), [(V5 =< V1)], [V7p = V7, V1p = V1, V4p = V4, V2p = V2, V6p = V6, V5p = V5, V3p = V3], 11). % i <= n
stmtsrc(11, 'assume(i <= n);').
transition_access( 11, [_, r, _, _, _, r, _] ).
r(p(pc(main-10-16), data(V7, V1, V4, V2, V6, V5, V3)), p(pc(main-12-16), data(V7p, V1p, V4p, V2p, V6p, V5p, V3p)), [(V5 >= 1+ V1)], [V7p = V7, V1p = V1, V4p = V4, V2p = V2, V6p = V6, V5p = V5, V3p = V3], 12). % i > n
stmtsrc(12, 'assume(i > n);').
transition_access( 12, [_, r, _, _, _, r, _] ).
r(p(pc(main-11-18), data(V7, V1, V4, V2, V6, V5, V3)), p(pc(main-13-0), data(V7p, V1p, V4p, V2p, V6p, V5p, V3p)), [], [V7p = V7, V1p = V1, V4p = V4, V2p = V2, V6p = V6, V5p = (V5 + 1), V3p = V3], 13). % i := i + 1
stmtsrc(13, 'i=i + 1;').
transition_access( 13, [_, _, _, _, _, w, _] ).
r(p(pc(main-13-0), data(V7, V1, V4, V2, V6, V5, V3)), p(pc(main-6-16), data(V7p, V1p, V4p, V2p, V6p, V5p, V3p)), [], [V7p = V7, V1p = V1, V4p = V4, V2p = V2, V6p = (V6 + V5), V5p = V5, V3p = V3], 14). % j := j + i
stmtsrc(14, 'j=j + i;').
transition_access( 14, [_, _, _, _, w, r, _] ).
r(p(pc(main-9-0), data(V7, V1, V4, V2, V6, V5, V3)), p(pc(main-8-21), data(V7p, V1p, V4p, V2p, V6p, V5p, V3p)), [], [V7p = V7, V1p = V1, V4p = V4, V2p = V2, V6p = V6, V5p = V5, V3p = V3], 15). % 
stmtsrc(15, 'skip;').
transition_access( 15, [_, _, _, _, _, _, _] ).
r(p(pc(main-8-21), data(V7, V1, V4, V2, V6, V5, V3)), p(pc(main-15-0), data(V7p, V1p, V4p, V2p, V6p, V5p, V3p)), [], [V7p = ((V2 + V5) + V6), V1p = V1, V4p = V4, V2p = V2, V6p = V6, V5p = V5, V3p = V3], 16). % z := (k + i) + j
stmtsrc(16, 'z=(k + i) + j;').
transition_access( 16, [w, _, _, r, r, r, _] ).
r(p(pc(main-15-0), data(V7, V1, V4, V2, V6, V5, V3)), p(pc(main-err-0), data(V7p, V1p, V4p, V2p, V6p, V5p, V3p)), [(V7 =< (2 * V1))], [V7p = V7, V1p = V1, V4p = V4, V2p = V2, V6p = V6, V5p = V5, V3p = V3], 17). % z <= 2 * n
stmtsrc(17, 'assume(z <= 2 * n);').
transition_access( 17, [r, r, _, _, _, _, _] ).
r(p(pc(main-15-0), data(V7, V1, V4, V2, V6, V5, V3)), p(pc(main-14-22), data(V7p, V1p, V4p, V2p, V6p, V5p, V3p)), [(V7 >= 1+ (2 * V1))], [V7p = V7, V1p = V1, V4p = V4, V2p = V2, V6p = V6, V5p = V5, V3p = V3], 18). % z > 2 * n
stmtsrc(18, 'assume(z > 2 * n);').
transition_access( 18, [r, r, _, _, _, _, _] ).
r(p(pc(main-14-22), data(V7, V1, V4, V2, V6, V5, V3)), p(pc(main-ret-0), data(V7p, V1p, V4p, V2p, V6p, V5p, V3p)), [], [V7p = V7, V1p = V1, V4p = V4, V2p = V2, V6p = V6, V5p = V5, V3p = V3], 19). % 
stmtsrc(19, 'skip;').
transition_access( 19, [_, _, _, _, _, _, _] ).
r(p(pc(main-12-16), data(V7, V1, V4, V2, V6, V5, V3)), p(pc(main-9-0), data(V7p, V1p, V4p, V2p, V6p, V5p, V3p)), [], [V7p = V7, V1p = V1, V4p = V4, V2p = V2, V6p = V6, V5p = V5, V3p = V3], 20). % 
stmtsrc(20, 'skip;').
transition_access( 20, [_, _, _, _, _, _, _] ).
% Atomic blocks
strengthening(p(pc(main-6-16), data(V7, V1, V4, V2, V6, V5, V3)), [( 1)*V5 +( 0) >= 0, ( 1)*V6 +( 0) >= 0, ( 1)*V2 +( 0) >= 0, ( 1)*V1 +( 0) >= 0,( 1)*V5 +( 0) >= 0, ( 1)*V6+( -1)*V5 +( 0) >= 0, ( 1)*V6+( 1)*V5 +( 0) >= 0, ( 1)*V6 +( 0) >= 0, ( 1)*V2+( 1)*V5 +( 0) >= 0, ( 1)*V2+( 1)*V6 +( 0) >= 0, ( 1)*V2 +( 0) >= 0, ( 1)*V1+( -1)*V5 +( 1) >= 0, ( 1)*V1+( 1)*V5 +( 0) >= 0, ( 1)*V1+( 1)*V6 +( 0) >= 0, ( 1)*V1+( 1)*V2 +( 0) >= 0, ( 1)*V1 +( 0) >= 0,( 0)*V7+( 0)*V1+( 0)*V4+( 1)*V2+( 0)*V6+( 0)*V5+( 0)*V3 +( 0) >= 0, ( 0)*V7+( 1)*V1+( 0)*V4+( 0)*V2+( 0)*V6+( -1)*V5+( 0)*V3 +( 1) >= 0]).
