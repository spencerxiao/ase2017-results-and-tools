:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V2, V1, V3)), []).
trans_preds(p(_, data(V2, V1, V3)), p(_, data(V2p, V1p, V3p)), []).
var2names(p(pc(_), data(V2, V1, V3)), [(V2, 'k'), (V1, 'j'), (V3, 'flag')]).
globals(p(pc(_), data(V2, V1, V3)), [], []).
% start location
start(pc(main-0-10)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-1-12)). % line 12
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V2, V1, V3), []).
% cfg loop exit relation
cfg_exit_relation([]).
% 20 transitions
r(p(pc(main-0-10), data(V2, V1, V3)), p(pc(main-2-0), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = 2, V3p = V3], 1). % j := 2
stmtsrc(1, 'j=2;').
transition_access( 1, [_, w, _] ).
r(p(pc(main-2-0), data(V2, V1, V3)), p(pc(main-1-12), data(V2p, V1p, V3p)), [], [V2p = 0, V1p = V1, V3p = V3], 2). % k := 0
stmtsrc(2, 'k=0;').
transition_access( 2, [w, _, _] ).
r(p(pc(main-1-12), data(V2, V1, V3)), p(pc(main-5-12), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 3). % 
stmtsrc(3, 'skip;').
transition_access( 3, [_, _, _] ).
r(p(pc(main-5-12), data(V2, V1, V3)), p(pc(main-6-13), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 4). % 
stmtsrc(4, 'skip;').
transition_access( 4, [_, _, _] ).
r(p(pc(main-5-12), data(V2, V1, V3)), p(pc(main-7-12), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 5). % 
stmtsrc(5, 'skip;').
transition_access( 5, [_, _, _] ).
r(p(pc(main-6-13), data(V2, V1, V3)), p(pc(main-8-14), data(V2p, V1p, V3p)), [(V3 +1 =< 0)], [V2p = V2, V1p = V1, V3p = V3], 6). % flag < 0
stmtsrc(6, 'assume(flag < 0);').
transition_access( 6, [_, _, r] ).
r(p(pc(main-6-13), data(V2, V1, V3)), p(pc(main-8-14), data(V2p, V1p, V3p)), [(V3 >= 1+ 0)], [V2p = V2, V1p = V1, V3p = V3], 7). % flag > 0
stmtsrc(7, 'assume(flag > 0);').
transition_access( 7, [_, _, r] ).
r(p(pc(main-8-14), data(V2, V1, V3)), p(pc(main-1-12), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = (V1 + 4), V3p = V3], 8). % j := j + 4
stmtsrc(8, 'j=j + 4;').
transition_access( 8, [_, w, _] ).
r(p(pc(main-6-13), data(V2, V1, V3)), p(pc(main-9-17), data(V2p, V1p, V3p)), [(V3 = 0)], [V2p = V2, V1p = V1, V3p = V3], 9). % flag == 0
stmtsrc(9, 'assume(flag == 0);').
transition_access( 9, [_, _, r] ).
r(p(pc(main-9-17), data(V2, V1, V3)), p(pc(main-10-0), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = (V1 + 2), V3p = V3], 10). % j := j + 2
stmtsrc(10, 'j=j + 2;').
transition_access( 10, [_, w, _] ).
r(p(pc(main-10-0), data(V2, V1, V3)), p(pc(main-1-12), data(V2p, V1p, V3p)), [], [V2p = (V2 + 1), V1p = V1, V3p = V3], 11). % k := k + 1
stmtsrc(11, 'k=k + 1;').
transition_access( 11, [w, _, _] ).
r(p(pc(main-4-0), data(V2, V1, V3)), p(pc(main-3-20), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 12). % 
stmtsrc(12, 'skip;').
transition_access( 12, [_, _, _] ).
r(p(pc(main-3-20), data(V2, V1, V3)), p(pc(main-12-21), data(V2p, V1p, V3p)), [(V2 +1 =< 0)], [V2p = V2, V1p = V1, V3p = V3], 13). % k < 0
stmtsrc(13, 'assume(k < 0);').
transition_access( 13, [r, _, _] ).
r(p(pc(main-3-20), data(V2, V1, V3)), p(pc(main-12-21), data(V2p, V1p, V3p)), [(V2 >= 1+ 0)], [V2p = V2, V1p = V1, V3p = V3], 14). % k > 0
stmtsrc(14, 'assume(k > 0);').
transition_access( 14, [r, _, _] ).
r(p(pc(main-12-21), data(V2, V1, V3)), p(pc(main-err-0), data(V2p, V1p, V3p)), [(V1 +1 =< ((2 * V2) + 2))], [V2p = V2, V1p = V1, V3p = V3], 15). % j < 2 * k + 2
stmtsrc(15, 'assume(j < 2 * k + 2);').
transition_access( 15, [r, r, _] ).
r(p(pc(main-12-21), data(V2, V1, V3)), p(pc(main-err-0), data(V2p, V1p, V3p)), [(V1 >= 1+ ((2 * V2) + 2))], [V2p = V2, V1p = V1, V3p = V3], 16). % j > 2 * k + 2
stmtsrc(16, 'assume(j > 2 * k + 2);').
transition_access( 16, [r, r, _] ).
r(p(pc(main-12-21), data(V2, V1, V3)), p(pc(main-11-22), data(V2p, V1p, V3p)), [(V1 = ((2 * V2) + 2))], [V2p = V2, V1p = V1, V3p = V3], 17). % j == 2 * k + 2
stmtsrc(17, 'assume(j == 2 * k + 2);').
transition_access( 17, [r, r, _] ).
r(p(pc(main-3-20), data(V2, V1, V3)), p(pc(main-11-22), data(V2p, V1p, V3p)), [(V2 = 0)], [V2p = V2, V1p = V1, V3p = V3], 18). % k == 0
stmtsrc(18, 'assume(k == 0);').
transition_access( 18, [r, _, _] ).
r(p(pc(main-11-22), data(V2, V1, V3)), p(pc(main-ret-0), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 19). % 
stmtsrc(19, 'skip;').
transition_access( 19, [_, _, _] ).
r(p(pc(main-7-12), data(V2, V1, V3)), p(pc(main-4-0), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 20). % 
stmtsrc(20, 'skip;').
transition_access( 20, [_, _, _] ).
% Atomic blocks
strengthening(p(pc(main-1-12), data(V2, V1, V3)), [( 1)*V1 +( -2) >= 0, ( 1)*V2 +( 0) >= 0,( 1)*V1 +( -2) >= 0, ( 1)*V2+( 1)*V1 +( -2) >= 0, ( 1)*V2 +( 0) >= 0, ( -1)*V2+( 1)*V1 +( -2) >= 0,( 1)*V2+( 0)*V1+( 0)*V3 +( 0) >= 0, ( -2)*V2+( 1)*V1+( 0)*V3 +( -2) >= 0]).
