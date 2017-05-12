:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V2, V1, V6, V4, V3, V5, V7)), []).
trans_preds(p(_, data(V2, V1, V6, V4, V3, V5, V7)), p(_, data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), []).
var2names(p(pc(_), data(V2, V1, V6, V4, V3, V5, V7)), [(V2, 'y'), (V1, 'x'), (V6, 'n'), (V4, 'm'), (V3, 'k'), (V5, 'j'), (V7, 'i')]).
globals(p(pc(_), data(V2, V1, V6, V4, V3, V5, V7)), [], []).
% start location
start(pc(main-0-8)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-1-9)). % line 9
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V2, V1, V6, V4, V3, V5, V7), []).
% cfg loop exit relation
cfg_exit_relation([]).
% 29 transitions
r(p(pc(main-0-8), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-2-0), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [((V1 + V2) = V3)], [V2p = V2, V1p = V1, V6p = V6, V4p = V4, V3p = V3, V5p = V5, V7p = V7], 1). % x + y == k
stmtsrc(1, 'assume(x + y == k);').
transition_access( 1, [r, r, _, _, r, _, _] ).
r(p(pc(main-2-0), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-3-0), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [], [V2p = V2, V1p = V1, V6p = V6, V4p = 0, V3p = V3, V5p = V5, V7p = V7], 2). % m := 0
stmtsrc(2, 'm=0;').
transition_access( 2, [_, _, _, w, _, _, _] ).
r(p(pc(main-3-0), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-1-9), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [], [V2p = V2, V1p = V1, V6p = V6, V4p = V4, V3p = V3, V5p = 0, V7p = V7], 3). % j := 0
stmtsrc(3, 'j=0;').
transition_access( 3, [_, _, _, _, _, w, _] ).
r(p(pc(main-1-9), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-6-9), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [], [V2p = V2, V1p = V1, V6p = V6, V4p = V4, V3p = V3, V5p = V5, V7p = V7], 4). % 
stmtsrc(4, 'skip;').
transition_access( 4, [_, _, _, _, _, _, _] ).
r(p(pc(main-6-9), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-7-10), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [(V5 +1 =< V6)], [V2p = V2, V1p = V1, V6p = V6, V4p = V4, V3p = V3, V5p = V5, V7p = V7], 5). % j < n
stmtsrc(5, 'assume(j < n);').
transition_access( 5, [_, _, r, _, _, r, _] ).
r(p(pc(main-6-9), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-8-9), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [(V5 >= V6)], [V2p = V2, V1p = V1, V6p = V6, V4p = V4, V3p = V3, V5p = V5, V7p = V7], 6). % j >= n
stmtsrc(6, 'assume(j >= n);').
transition_access( 6, [_, _, r, _, _, r, _] ).
r(p(pc(main-7-10), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-10-13), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [(V5 = V7)], [V2p = V2, V1p = V1, V6p = V6, V4p = V4, V3p = V3, V5p = V5, V7p = V7], 7). % j == i
stmtsrc(7, 'assume(j == i);').
transition_access( 7, [_, _, _, _, _, r, r] ).
r(p(pc(main-10-13), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-12-0), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [], [V2p = V2, V1p = (V1 + 1), V6p = V6, V4p = V4, V3p = V3, V5p = V5, V7p = V7], 8). % x := x + 1
stmtsrc(8, 'x=x + 1;').
transition_access( 8, [_, w, _, _, _, _, _] ).
r(p(pc(main-12-0), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-9-19), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [], [V2p = (V2 - 1), V1p = V1, V6p = V6, V4p = V4, V3p = V3, V5p = V5, V7p = V7], 9). % y := y - 1
stmtsrc(9, 'y=y - 1;').
transition_access( 9, [w, _, _, _, _, _, _] ).
r(p(pc(main-7-10), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-11-17), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [(V5 +1 =< V7)], [V2p = V2, V1p = V1, V6p = V6, V4p = V4, V3p = V3, V5p = V5, V7p = V7], 10). % j < i
stmtsrc(10, 'assume(j < i);').
transition_access( 10, [_, _, _, _, _, r, r] ).
r(p(pc(main-7-10), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-11-17), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [(V5 >= 1+ V7)], [V2p = V2, V1p = V1, V6p = V6, V4p = V4, V3p = V3, V5p = V5, V7p = V7], 11). % j > i
stmtsrc(11, 'assume(j > i);').
transition_access( 11, [_, _, _, _, _, r, r] ).
r(p(pc(main-11-17), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-13-0), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [], [V2p = (V2 + 1), V1p = V1, V6p = V6, V4p = V4, V3p = V3, V5p = V5, V7p = V7], 12). % y := y + 1
stmtsrc(12, 'y=y + 1;').
transition_access( 12, [w, _, _, _, _, _, _] ).
r(p(pc(main-13-0), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-9-19), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [], [V2p = V2, V1p = (V1 - 1), V6p = V6, V4p = V4, V3p = V3, V5p = V5, V7p = V7], 13). % x := x - 1
stmtsrc(13, 'x=x - 1;').
transition_access( 13, [_, w, _, _, _, _, _] ).
r(p(pc(main-9-19), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-15-20), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [], [V2p = V2, V1p = V1, V6p = V6, V4p = V4, V3p = V3, V5p = V5, V7p = V7], 14). % 
stmtsrc(14, 'skip;').
transition_access( 14, [_, _, _, _, _, _, _] ).
r(p(pc(main-15-20), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-14-21), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [], [V2p = V2, V1p = V1, V6p = V6, V4p = V5, V3p = V3, V5p = V5, V7p = V7], 15). % m := j
stmtsrc(15, 'm=j;').
transition_access( 15, [_, _, _, w, _, r, _] ).
r(p(pc(main-9-19), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-14-21), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [], [V2p = V2, V1p = V1, V6p = V6, V4p = V4, V3p = V3, V5p = V5, V7p = V7], 16). % 
stmtsrc(16, 'skip;').
transition_access( 16, [_, _, _, _, _, _, _] ).
r(p(pc(main-14-21), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-1-9), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [], [V2p = V2, V1p = V1, V6p = V6, V4p = V4, V3p = V3, V5p = (V5 + 1), V7p = V7], 17). % j := j + 1
stmtsrc(17, 'j=j + 1;').
transition_access( 17, [_, _, _, _, _, w, _] ).
r(p(pc(main-5-0), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-4-23), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [], [V2p = V2, V1p = V1, V6p = V6, V4p = V4, V3p = V3, V5p = V5, V7p = V7], 18). % 
stmtsrc(18, 'skip;').
transition_access( 18, [_, _, _, _, _, _, _] ).
r(p(pc(main-4-23), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-err-0), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [((V1 + V2) +1 =< V3)], [V2p = V2, V1p = V1, V6p = V6, V4p = V4, V3p = V3, V5p = V5, V7p = V7], 19). % x + y < k
stmtsrc(19, 'assume(x + y < k);').
transition_access( 19, [r, r, _, _, r, _, _] ).
r(p(pc(main-4-23), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-err-0), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [((V1 + V2) >= 1+ V3)], [V2p = V2, V1p = V1, V6p = V6, V4p = V4, V3p = V3, V5p = V5, V7p = V7], 20). % x + y > k
stmtsrc(20, 'assume(x + y > k);').
transition_access( 20, [r, r, _, _, r, _, _] ).
r(p(pc(main-4-23), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-16-24), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [((V1 + V2) = V3)], [V2p = V2, V1p = V1, V6p = V6, V4p = V4, V3p = V3, V5p = V5, V7p = V7], 21). % x + y == k
stmtsrc(21, 'assume(x + y == k);').
transition_access( 21, [r, r, _, _, r, _, _] ).
r(p(pc(main-16-24), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-18-27), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [(V6 >= 1+ 0)], [V2p = V2, V1p = V1, V6p = V6, V4p = V4, V3p = V3, V5p = V5, V7p = V7], 22). % n > 0
stmtsrc(22, 'assume(n > 0);').
transition_access( 22, [_, _, r, _, _, _, _] ).
r(p(pc(main-18-27), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-err-0), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [(0 >= 1+ V4)], [V2p = V2, V1p = V1, V6p = V6, V4p = V4, V3p = V3, V5p = V5, V7p = V7], 23). % 0 > m
stmtsrc(23, 'assume(0 > m);').
transition_access( 23, [_, _, _, r, _, _, _] ).
r(p(pc(main-18-27), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-19-0), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [(0 =< V4)], [V2p = V2, V1p = V1, V6p = V6, V4p = V4, V3p = V3, V5p = V5, V7p = V7], 24). % 0 <= m
stmtsrc(24, 'assume(0 <= m);').
transition_access( 24, [_, _, _, r, _, _, _] ).
r(p(pc(main-19-0), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-err-0), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [(V4 >= V6)], [V2p = V2, V1p = V1, V6p = V6, V4p = V4, V3p = V3, V5p = V5, V7p = V7], 25). % m >= n
stmtsrc(25, 'assume(m >= n);').
transition_access( 25, [_, _, r, r, _, _, _] ).
r(p(pc(main-19-0), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-17-30), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [(V4 +1 =< V6)], [V2p = V2, V1p = V1, V6p = V6, V4p = V4, V3p = V3, V5p = V5, V7p = V7], 26). % m < n
stmtsrc(26, 'assume(m < n);').
transition_access( 26, [_, _, r, r, _, _, _] ).
r(p(pc(main-16-24), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-17-30), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [(V6 =< 0)], [V2p = V2, V1p = V1, V6p = V6, V4p = V4, V3p = V3, V5p = V5, V7p = V7], 27). % n <= 0
stmtsrc(27, 'assume(n <= 0);').
transition_access( 27, [_, _, r, _, _, _, _] ).
r(p(pc(main-17-30), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-ret-0), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [], [V2p = V2, V1p = V1, V6p = V6, V4p = V4, V3p = V3, V5p = V5, V7p = V7], 28). % 
stmtsrc(28, 'skip;').
transition_access( 28, [_, _, _, _, _, _, _] ).
r(p(pc(main-8-9), data(V2, V1, V6, V4, V3, V5, V7)), p(pc(main-5-0), data(V2p, V1p, V6p, V4p, V3p, V5p, V7p)), [], [V2p = V2, V1p = V1, V6p = V6, V4p = V4, V3p = V3, V5p = V5, V7p = V7], 29). % 
stmtsrc(29, 'skip;').
transition_access( 29, [_, _, _, _, _, _, _] ).
% Atomic blocks
strengthening(p(pc(main-1-9), data(V2, V1, V6, V4, V3, V5, V7)), [( 1)*V5 +( 0) >= 0, ( 1)*V4 +( 0) >= 0,( 1)*V5 +( 0) >= 0, ( 1)*V4+( 1)*V5 +( 0) >= 0, ( 1)*V4 +( 0) >= 0, ( -1)*V4+( 1)*V5 +( 0) >= 0,( -1)*V2+( -1)*V1+( 0)*V6+( 0)*V4+( 1)*V3+( 0)*V5+( 0)*V7 +( 0) = 0, ( 0)*V2+( 0)*V1+( 0)*V6+( 1)*V4+( 0)*V3+( 0)*V5+( 0)*V7 +( 0) >= 0, ( 0)*V2+( 0)*V1+( 0)*V6+( -1)*V4+( 0)*V3+( 1)*V5+( 0)*V7 +( 0) >= 0]).
