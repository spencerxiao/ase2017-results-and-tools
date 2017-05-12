:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V7, V6, V1, V2, V5, V4, V3)), []).
trans_preds(p(_, data(V7, V6, V1, V2, V5, V4, V3)), p(_, data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), []).
var2names(p(pc(_), data(V7, V6, V1, V2, V5, V4, V3)), [(V7, 'y'), (V6, 'x'), (V1, 't'), (V2, 's'), (V5, 'flag'), (V4, 'b'), (V3, 'a')]).
globals(p(pc(_), data(V7, V6, V1, V2, V5, V4, V3)), [], []).
% start location
start(pc(main-0-10)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-18-27)). % line 27
cutpoint(pc(main-1-11)). % line 11
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V7, V6, V1, V2, V5, V4, V3), []).
% cfg loop exit relation
cfg_exit_relation([(pc(main-1-11), pc(main-18-27))]).
% 35 transitions
r(p(pc(main-0-10), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-2-0), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [], [V7p = V7, V6p = V6, V1p = 0, V2p = V2, V5p = V5, V4p = V4, V3p = V3], 1). % t := 0
stmtsrc(1, 't=0;').
transition_access( 1, [_, _, w, _, _, _, _] ).
r(p(pc(main-2-0), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-3-0), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [], [V7p = V7, V6p = V6, V1p = V1, V2p = 0, V5p = V5, V4p = V4, V3p = V3], 2). % s := 0
stmtsrc(2, 's=0;').
transition_access( 2, [_, _, _, w, _, _, _] ).
r(p(pc(main-3-0), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-4-0), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [], [V7p = V7, V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = 0], 3). % a := 0
stmtsrc(3, 'a=0;').
transition_access( 3, [_, _, _, _, _, _, w] ).
r(p(pc(main-4-0), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-1-11), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [], [V7p = V7, V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = 0, V3p = V3], 4). % b := 0
stmtsrc(4, 'b=0;').
transition_access( 4, [_, _, _, _, _, w, _] ).
r(p(pc(main-1-11), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-7-11), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [], [V7p = V7, V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = V3], 5). % 
stmtsrc(5, 'skip;').
transition_access( 5, [_, _, _, _, _, _, _] ).
r(p(pc(main-7-11), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-8-15), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [], [V7p = V7, V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = V3], 6). % 
stmtsrc(6, 'skip;').
transition_access( 6, [_, _, _, _, _, _, _] ).
r(p(pc(main-7-11), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-9-11), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [], [V7p = V7, V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = V3], 7). % 
stmtsrc(7, 'skip;').
transition_access( 7, [_, _, _, _, _, _, _] ).
r(p(pc(main-8-15), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-11-0), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [], [V7p = V7, V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = (V3 + 1)], 8). % a := a + 1
stmtsrc(8, 'a=a + 1;').
transition_access( 8, [_, _, _, _, _, _, w] ).
r(p(pc(main-11-0), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-12-0), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [], [V7p = V7, V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = (V4 + 1), V3p = V3], 9). % b := b + 1
stmtsrc(9, 'b=b + 1;').
transition_access( 9, [_, _, _, _, _, w, _] ).
r(p(pc(main-12-0), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-13-0), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [], [V7p = V7, V6p = V6, V1p = V1, V2p = (V2 + V3), V5p = V5, V4p = V4, V3p = V3], 10). % s := s + a
stmtsrc(10, 's=s + a;').
transition_access( 10, [_, _, _, w, _, _, r] ).
r(p(pc(main-13-0), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-10-16), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [], [V7p = V7, V6p = V6, V1p = (V1 + V4), V2p = V2, V5p = V5, V4p = V4, V3p = V3], 11). % t := t + b
stmtsrc(11, 't=t + b;').
transition_access( 11, [_, _, w, _, _, r, _] ).
r(p(pc(main-10-16), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-14-17), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [(V5 +1 =< 0)], [V7p = V7, V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = V3], 12). % flag < 0
stmtsrc(12, 'assume(flag < 0);').
transition_access( 12, [_, _, _, _, r, _, _] ).
r(p(pc(main-10-16), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-14-17), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [(V5 >= 1+ 0)], [V7p = V7, V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = V3], 13). % flag > 0
stmtsrc(13, 'assume(flag > 0);').
transition_access( 13, [_, _, _, _, r, _, _] ).
r(p(pc(main-14-17), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-1-11), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [], [V7p = V7, V6p = V6, V1p = (V1 + V3), V2p = V2, V5p = V5, V4p = V4, V3p = V3], 14). % t := t + a
stmtsrc(14, 't=t + a;').
transition_access( 14, [_, _, w, _, _, _, r] ).
r(p(pc(main-10-16), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-1-11), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [(V5 = 0)], [V7p = V7, V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = V3], 15). % flag == 0
stmtsrc(15, 'assume(flag == 0);').
transition_access( 15, [_, _, _, _, r, _, _] ).
r(p(pc(main-6-0), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-5-21), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [], [V7p = V7, V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = V3], 16). % 
stmtsrc(16, 'skip;').
transition_access( 16, [_, _, _, _, _, _, _] ).
r(p(pc(main-5-21), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-15-22), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [], [V7p = V7, V6p = 1, V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = V3], 17). % x := 1
stmtsrc(17, 'x=1;').
transition_access( 17, [_, w, _, _, _, _, _] ).
r(p(pc(main-15-22), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-17-23), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [(V5 +1 =< 0)], [V7p = V7, V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = V3], 18). % flag < 0
stmtsrc(18, 'assume(flag < 0);').
transition_access( 18, [_, _, _, _, r, _, _] ).
r(p(pc(main-15-22), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-17-23), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [(V5 >= 1+ 0)], [V7p = V7, V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = V3], 19). % flag > 0
stmtsrc(19, 'assume(flag > 0);').
transition_access( 19, [_, _, _, _, r, _, _] ).
r(p(pc(main-17-23), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-16-26), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [], [V7p = V7, V6p = ((V1 - (2 * V2)) + 2), V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = V3], 20). % x := (t - 2 * s) + 2
stmtsrc(20, 'x=(t - 2 * s) + 2;').
transition_access( 20, [_, w, r, r, _, _, _] ).
r(p(pc(main-15-22), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-16-26), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [(V5 = 0)], [V7p = V7, V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = V3], 21). % flag == 0
stmtsrc(21, 'assume(flag == 0);').
transition_access( 21, [_, _, _, _, r, _, _] ).
r(p(pc(main-16-26), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-18-27), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [], [V7p = 0, V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = V3], 22). % y := 0
stmtsrc(22, 'y=0;').
transition_access( 22, [w, _, _, _, _, _, _] ).
r(p(pc(main-18-27), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-21-27), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [], [V7p = V7, V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = V3], 23). % 
stmtsrc(23, 'skip;').
transition_access( 23, [_, _, _, _, _, _, _] ).
r(p(pc(main-21-27), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-22-28), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [(V7 =< V6)], [V7p = V7, V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = V3], 24). % y <= x
stmtsrc(24, 'assume(y <= x);').
transition_access( 24, [r, r, _, _, _, _, _] ).
r(p(pc(main-21-27), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-23-27), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [(V7 >= 1+ V6)], [V7p = V7, V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = V3], 25). % y > x
stmtsrc(25, 'assume(y > x);').
transition_access( 25, [r, r, _, _, _, _, _] ).
r(p(pc(main-22-28), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-24-29), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [], [V7p = V7, V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = V3], 26). % 
stmtsrc(26, 'skip;').
transition_access( 26, [_, _, _, _, _, _, _] ).
r(p(pc(main-24-29), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-18-27), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [], [V7p = (V7 + 1), V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = V3], 27). % y := y + 1
stmtsrc(27, 'y=y + 1;').
transition_access( 27, [w, _, _, _, _, _, _] ).
r(p(pc(main-22-28), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-25-31), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [], [V7p = V7, V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = V3], 28). % 
stmtsrc(28, 'skip;').
transition_access( 28, [_, _, _, _, _, _, _] ).
r(p(pc(main-25-31), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-18-27), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [], [V7p = (V7 + 2), V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = V3], 29). % y := y + 2
stmtsrc(29, 'y=y + 2;').
transition_access( 29, [w, _, _, _, _, _, _] ).
r(p(pc(main-20-0), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-19-33), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [], [V7p = V7, V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = V3], 30). % 
stmtsrc(30, 'skip;').
transition_access( 30, [_, _, _, _, _, _, _] ).
r(p(pc(main-19-33), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-err-0), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [(V7 >= 1+ 4)], [V7p = V7, V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = V3], 31). % y > 4
stmtsrc(31, 'assume(y > 4);').
transition_access( 31, [r, _, _, _, _, _, _] ).
r(p(pc(main-19-33), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-26-34), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [(V7 =< 4)], [V7p = V7, V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = V3], 32). % y <= 4
stmtsrc(32, 'assume(y <= 4);').
transition_access( 32, [r, _, _, _, _, _, _] ).
r(p(pc(main-26-34), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-ret-0), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [], [V7p = V7, V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = V3], 33). % 
stmtsrc(33, 'skip;').
transition_access( 33, [_, _, _, _, _, _, _] ).
r(p(pc(main-23-27), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-20-0), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [], [V7p = V7, V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = V3], 34). % 
stmtsrc(34, 'skip;').
transition_access( 34, [_, _, _, _, _, _, _] ).
r(p(pc(main-9-11), data(V7, V6, V1, V2, V5, V4, V3)), p(pc(main-6-0), data(V7p, V6p, V1p, V2p, V5p, V4p, V3p)), [], [V7p = V7, V6p = V6, V1p = V1, V2p = V2, V5p = V5, V4p = V4, V3p = V3], 35). % 
stmtsrc(35, 'skip;').
transition_access( 35, [_, _, _, _, _, _, _] ).
% Atomic blocks
strengthening(p(pc(main-18-27), data(V7, V6, V1, V2, V5, V4, V3)), [( 1)*V3 +( 0) >= 0, ( 1)*V4 +( 0) >= 0, ( 1)*V2 +( 0) >= 0, ( 1)*V1 +( 0) >= 0, ( 1)*V7 +( 0) >= 0,( 1)*V3 +( 0) >= 0, ( 1)*V4+( -1)*V3 +( 0) >= 0, ( 1)*V4+( 1)*V3 +( 0) >= 0, ( 1)*V4 +( 0) >= 0, ( -1)*V4+( 1)*V3 +( 0) >= 0, ( 1)*V2+( -1)*V3 +( 0) >= 0, ( 1)*V2+( 1)*V3 +( 0) >= 0, ( 1)*V2+( -1)*V4 +( 0) >= 0, ( 1)*V2+( 1)*V4 +( 0) >= 0, ( 1)*V2 +( 0) >= 0, ( 1)*V1+( -1)*V3 +( 0) >= 0, ( 1)*V1+( 1)*V3 +( 0) >= 0, ( 1)*V1+( -1)*V4 +( 0) >= 0, ( 1)*V1+( 1)*V4 +( 0) >= 0, ( 1)*V1+( 1)*V2 +( 0) >= 0, ( 1)*V1 +( 0) >= 0, ( -1)*V6+( 1)*V1 +( 2) >= 0, ( 1)*V7+( 1)*V3 +( 0) >= 0, ( 1)*V7+( 1)*V4 +( 0) >= 0, ( 1)*V7+( 1)*V2 +( 0) >= 0, ( 1)*V7+( 1)*V1 +( 0) >= 0, ( 1)*V7 +( 0) >= 0, ( -1)*V7+( 1)*V1 +( 4) >= 0,( 0)*V7+( 0)*V6+( 0)*V1+( 0)*V2+( 0)*V5+( -1)*V4+( 1)*V3 +( 0) = 0, ( 1)*V7+( 0)*V6+( 0)*V1+( 0)*V2+( 0)*V5+( 0)*V4+( 0)*V3 +( 0) >= 0]).
strengthening(p(pc(main-1-11), data(V7, V6, V1, V2, V5, V4, V3)), [( 1)*V3 +( 0) >= 0, ( 1)*V4 +( 0) >= 0, ( 1)*V2 +( 0) >= 0, ( 1)*V1 +( 0) >= 0,( 1)*V3 +( 0) >= 0, ( 1)*V4+( -1)*V3 +( 0) >= 0, ( 1)*V4+( 1)*V3 +( 0) >= 0, ( 1)*V4 +( 0) >= 0, ( -1)*V4+( 1)*V3 +( 0) >= 0, ( 1)*V2+( -1)*V3 +( 0) >= 0, ( 1)*V2+( 1)*V3 +( 0) >= 0, ( 1)*V2+( -1)*V4 +( 0) >= 0, ( 1)*V2+( 1)*V4 +( 0) >= 0, ( 1)*V2 +( 0) >= 0, ( 1)*V1+( -1)*V3 +( 0) >= 0, ( 1)*V1+( 1)*V3 +( 0) >= 0, ( 1)*V1+( -1)*V4 +( 0) >= 0, ( 1)*V1+( 1)*V4 +( 0) >= 0, ( 1)*V1+( 1)*V2 +( 0) >= 0, ( 1)*V1 +( 0) >= 0,( 0)*V7+( 0)*V6+( 0)*V1+( 0)*V2+( 0)*V5+( -1)*V4+( 1)*V3 +( 0) = 0]).
