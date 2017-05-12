:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V4, V5, V2, V1, V3)), []).
trans_preds(p(_, data(V4, V5, V2, V1, V3)), p(_, data(V4p, V5p, V2p, V1p, V3p)), []).
var2names(p(pc(_), data(V4, V5, V2, V1, V3)), [(V4, 'n'), (V5, 'k'), (V2, 'j'), (V1, 'i'), (V3, 'flag')]).
globals(p(pc(_), data(V4, V5, V2, V1, V3)), [], []).
% start location
start(pc(main-0-11)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-6-23)). % line 23
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V4, V5, V2, V1, V3), []).
% cfg loop exit relation
cfg_exit_relation([]).
% 22 transitions
r(p(pc(main-0-11), data(V4, V5, V2, V1, V3)), p(pc(main-2-0), data(V4p, V5p, V2p, V1p, V3p)), [], [V4p = V4, V5p = V5, V2p = V2, V1p = 0, V3p = V3], 1). % i := 0
stmtsrc(1, 'i=0;').
transition_access( 1, [_, _, _, w, _] ).
r(p(pc(main-2-0), data(V4, V5, V2, V1, V3)), p(pc(main-1-15), data(V4p, V5p, V2p, V1p, V3p)), [], [V4p = V4, V5p = V5, V2p = 0, V1p = V1, V3p = V3], 2). % j := 0
stmtsrc(2, 'j=0;').
transition_access( 2, [_, _, w, _, _] ).
r(p(pc(main-1-15), data(V4, V5, V2, V1, V3)), p(pc(main-4-16), data(V4p, V5p, V2p, V1p, V3p)), [(V3 = 1)], [V4p = V4, V5p = V5, V2p = V2, V1p = V1, V3p = V3], 3). % flag == 1
stmtsrc(3, 'assume(flag == 1);').
transition_access( 3, [_, _, _, _, r] ).
r(p(pc(main-4-16), data(V4, V5, V2, V1, V3)), p(pc(main-3-21), data(V4p, V5p, V2p, V1p, V3p)), [], [V4p = 1, V5p = V5, V2p = V2, V1p = V1, V3p = V3], 4). % n := 1
stmtsrc(4, 'n=1;').
transition_access( 4, [w, _, _, _, _] ).
r(p(pc(main-1-15), data(V4, V5, V2, V1, V3)), p(pc(main-5-18), data(V4p, V5p, V2p, V1p, V3p)), [(V3 +1 =< 1)], [V4p = V4, V5p = V5, V2p = V2, V1p = V1, V3p = V3], 5). % flag < 1
stmtsrc(5, 'assume(flag < 1);').
transition_access( 5, [_, _, _, _, r] ).
r(p(pc(main-1-15), data(V4, V5, V2, V1, V3)), p(pc(main-5-18), data(V4p, V5p, V2p, V1p, V3p)), [(V3 >= 1+ 1)], [V4p = V4, V5p = V5, V2p = V2, V1p = V1, V3p = V3], 6). % flag > 1
stmtsrc(6, 'assume(flag > 1);').
transition_access( 6, [_, _, _, _, r] ).
r(p(pc(main-5-18), data(V4, V5, V2, V1, V3)), p(pc(main-3-21), data(V4p, V5p, V2p, V1p, V3p)), [], [V4p = 2, V5p = V5, V2p = V2, V1p = V1, V3p = V3], 7). % n := 2
stmtsrc(7, 'n=2;').
transition_access( 7, [w, _, _, _, _] ).
r(p(pc(main-3-21), data(V4, V5, V2, V1, V3)), p(pc(main-6-23), data(V4p, V5p, V2p, V1p, V3p)), [], [V4p = V4, V5p = V5, V2p = V2, V1p = 0, V3p = V3], 8). % i := 0
stmtsrc(8, 'i=0;').
transition_access( 8, [_, _, _, w, _] ).
r(p(pc(main-6-23), data(V4, V5, V2, V1, V3)), p(pc(main-9-23), data(V4p, V5p, V2p, V1p, V3p)), [], [V4p = V4, V5p = V5, V2p = V2, V1p = V1, V3p = V3], 9). % 
stmtsrc(9, 'skip;').
transition_access( 9, [_, _, _, _, _] ).
r(p(pc(main-9-23), data(V4, V5, V2, V1, V3)), p(pc(main-10-25), data(V4p, V5p, V2p, V1p, V3p)), [(V1 =< V5)], [V4p = V4, V5p = V5, V2p = V2, V1p = V1, V3p = V3], 10). % i <= k
stmtsrc(10, 'assume(i <= k);').
transition_access( 10, [_, r, _, r, _] ).
r(p(pc(main-9-23), data(V4, V5, V2, V1, V3)), p(pc(main-11-23), data(V4p, V5p, V2p, V1p, V3p)), [(V1 >= 1+ V5)], [V4p = V4, V5p = V5, V2p = V2, V1p = V1, V3p = V3], 11). % i > k
stmtsrc(11, 'assume(i > k);').
transition_access( 11, [_, r, _, r, _] ).
r(p(pc(main-10-25), data(V4, V5, V2, V1, V3)), p(pc(main-12-0), data(V4p, V5p, V2p, V1p, V3p)), [], [V4p = V4, V5p = V5, V2p = V2, V1p = (V1 + 1), V3p = V3], 12). % i := i + 1
stmtsrc(12, 'i=i + 1;').
transition_access( 12, [_, _, _, w, _] ).
r(p(pc(main-12-0), data(V4, V5, V2, V1, V3)), p(pc(main-6-23), data(V4p, V5p, V2p, V1p, V3p)), [], [V4p = V4, V5p = V5, V2p = (V2 + V4), V1p = V1, V3p = V3], 13). % j := j + n
stmtsrc(13, 'j=j + n;').
transition_access( 13, [r, _, w, _, _] ).
r(p(pc(main-8-0), data(V4, V5, V2, V1, V3)), p(pc(main-7-27), data(V4p, V5p, V2p, V1p, V3p)), [], [V4p = V4, V5p = V5, V2p = V2, V1p = V1, V3p = V3], 14). % 
stmtsrc(14, 'skip;').
transition_access( 14, [_, _, _, _, _] ).
r(p(pc(main-7-27), data(V4, V5, V2, V1, V3)), p(pc(main-14-28), data(V4p, V5p, V2p, V1p, V3p)), [(V3 = 1)], [V4p = V4, V5p = V5, V2p = V2, V1p = V1, V3p = V3], 15). % flag == 1
stmtsrc(15, 'assume(flag == 1);').
transition_access( 15, [_, _, _, _, r] ).
r(p(pc(main-14-28), data(V4, V5, V2, V1, V3)), p(pc(main-err-0), data(V4p, V5p, V2p, V1p, V3p)), [(V2 +1 =< V1)], [V4p = V4, V5p = V5, V2p = V2, V1p = V1, V3p = V3], 16). % j < i
stmtsrc(16, 'assume(j < i);').
transition_access( 16, [_, _, r, r, _] ).
r(p(pc(main-14-28), data(V4, V5, V2, V1, V3)), p(pc(main-err-0), data(V4p, V5p, V2p, V1p, V3p)), [(V2 >= 1+ V1)], [V4p = V4, V5p = V5, V2p = V2, V1p = V1, V3p = V3], 17). % j > i
stmtsrc(17, 'assume(j > i);').
transition_access( 17, [_, _, r, r, _] ).
r(p(pc(main-14-28), data(V4, V5, V2, V1, V3)), p(pc(main-13-30), data(V4p, V5p, V2p, V1p, V3p)), [(V2 = V1)], [V4p = V4, V5p = V5, V2p = V2, V1p = V1, V3p = V3], 18). % j == i
stmtsrc(18, 'assume(j == i);').
transition_access( 18, [_, _, r, r, _] ).
r(p(pc(main-7-27), data(V4, V5, V2, V1, V3)), p(pc(main-13-30), data(V4p, V5p, V2p, V1p, V3p)), [(V3 +1 =< 1)], [V4p = V4, V5p = V5, V2p = V2, V1p = V1, V3p = V3], 19). % flag < 1
stmtsrc(19, 'assume(flag < 1);').
transition_access( 19, [_, _, _, _, r] ).
r(p(pc(main-7-27), data(V4, V5, V2, V1, V3)), p(pc(main-13-30), data(V4p, V5p, V2p, V1p, V3p)), [(V3 >= 1+ 1)], [V4p = V4, V5p = V5, V2p = V2, V1p = V1, V3p = V3], 20). % flag > 1
stmtsrc(20, 'assume(flag > 1);').
transition_access( 20, [_, _, _, _, r] ).
r(p(pc(main-13-30), data(V4, V5, V2, V1, V3)), p(pc(main-ret-0), data(V4p, V5p, V2p, V1p, V3p)), [], [V4p = V4, V5p = V5, V2p = V2, V1p = V1, V3p = V3], 21). % 
stmtsrc(21, 'skip;').
transition_access( 21, [_, _, _, _, _] ).
r(p(pc(main-11-23), data(V4, V5, V2, V1, V3)), p(pc(main-8-0), data(V4p, V5p, V2p, V1p, V3p)), [], [V4p = V4, V5p = V5, V2p = V2, V1p = V1, V3p = V3], 22). % 
stmtsrc(22, 'skip;').
transition_access( 22, [_, _, _, _, _] ).
% Atomic blocks
strengthening(p(pc(main-6-23), data(V4, V5, V2, V1, V3)), [( 1)*V1 +( 0) >= 0, ( 1)*V2 +( 0) >= 0, ( 1)*V4 +( -1) >= 0, ( -1)*V4 +( 2) >= 0,( 1)*V1 +( 0) >= 0, ( 1)*V2+( -1)*V1 +( 0) >= 0, ( 1)*V2+( 1)*V1 +( 0) >= 0, ( 1)*V2 +( 0) >= 0, ( 1)*V4+( 1)*V1 +( -1) >= 0, ( 1)*V4+( 1)*V2 +( -1) >= 0, ( 1)*V4 +( -1) >= 0, ( -1)*V4+( 1)*V1 +( 2) >= 0, ( -1)*V4+( 1)*V2 +( 2) >= 0, ( -1)*V4 +( 2) >= 0,1>=0]).
