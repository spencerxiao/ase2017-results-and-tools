:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V2, V1, V3)), []).
trans_preds(p(_, data(V2, V1, V3)), p(_, data(V2p, V1p, V3p)), []).
var2names(p(pc(_), data(V2, V1, V3)), [(V2, 'y'), (V1, 'x'), (V3, 'tmp')]).
globals(p(pc(_), data(V2, V1, V3)), [], []).
% start location
start(pc(main-0-10)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-1-11)). % line 11
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V2, V1, V3), []).
% cfg loop exit relation
cfg_exit_relation([]).
% 31 transitions
r(p(pc(main-0-10), data(V2, V1, V3)), p(pc(main-2-0), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = 0, V3p = V3], 1). % x := 0
stmtsrc(1, 'x=0;').
transition_access( 1, [_, w, _] ).
r(p(pc(main-2-0), data(V2, V1, V3)), p(pc(main-1-11), data(V2p, V1p, V3p)), [], [V2p = 0, V1p = V1, V3p = V3], 2). % y := 0
stmtsrc(2, 'y=0;').
transition_access( 2, [w, _, _] ).
r(p(pc(main-1-11), data(V2, V1, V3)), p(pc(main-5-11), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 3). % 
stmtsrc(3, 'skip;').
transition_access( 3, [_, _, _] ).
r(p(pc(main-5-11), data(V2, V1, V3)), p(pc(main-6-12), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 4). % 
stmtsrc(4, 'skip;').
transition_access( 4, [_, _, _] ).
r(p(pc(main-5-11), data(V2, V1, V3)), p(pc(main-7-11), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 5). % 
stmtsrc(5, 'skip;').
transition_access( 5, [_, _, _] ).
r(p(pc(main-6-12), data(V2, V1, V3)), p(pc(main-8-14), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 6). % 
stmtsrc(6, 'skip;').
transition_access( 6, [_, _, _] ).
r(p(pc(main-8-14), data(V2, V1, V3)), p(pc(main-10-0), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = (V1 + 1), V3p = V3], 7). % x := x + 1
stmtsrc(7, 'x=x + 1;').
transition_access( 7, [_, w, _] ).
r(p(pc(main-10-0), data(V2, V1, V3)), p(pc(main-1-11), data(V2p, V1p, V3p)), [], [V2p = (V2 + 100), V1p = V1, V3p = V3], 8). % y := y + 100
stmtsrc(8, 'y=y + 100;').
transition_access( 8, [w, _, _] ).
r(p(pc(main-6-12), data(V2, V1, V3)), p(pc(main-9-16), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 9). % 
stmtsrc(9, 'skip;').
transition_access( 9, [_, _, _] ).
r(p(pc(main-9-16), data(V2, V1, V3)), p(pc(main-11-17), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 10). % 
stmtsrc(10, 'skip;').
transition_access( 10, [_, _, _] ).
r(p(pc(main-11-17), data(V2, V1, V3)), p(pc(main-13-19), data(V2p, V1p, V3p)), [(V1 >= 4)], [V2p = V2, V1p = V1, V3p = V3], 11). % x >= 4
stmtsrc(11, 'assume(x >= 4);').
transition_access( 11, [_, r, _] ).
r(p(pc(main-13-19), data(V2, V1, V3)), p(pc(main-14-0), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = (V1 + 1), V3p = V3], 12). % x := x + 1
stmtsrc(12, 'x=x + 1;').
transition_access( 12, [_, w, _] ).
r(p(pc(main-14-0), data(V2, V1, V3)), p(pc(main-12-21), data(V2p, V1p, V3p)), [], [V2p = (V2 + 1), V1p = V1, V3p = V3], 13). % y := y + 1
stmtsrc(13, 'y=y + 1;').
transition_access( 13, [w, _, _] ).
r(p(pc(main-11-17), data(V2, V1, V3)), p(pc(main-12-21), data(V2p, V1p, V3p)), [(V1 +1 =< 4)], [V2p = V2, V1p = V1, V3p = V3], 14). % x < 4
stmtsrc(14, 'assume(x < 4);').
transition_access( 14, [_, r, _] ).
r(p(pc(main-12-21), data(V2, V1, V3)), p(pc(main-15-22), data(V2p, V1p, V3p)), [(V1 +1 =< 0)], [V2p = V2, V1p = V1, V3p = V3], 15). % x < 0
stmtsrc(15, 'assume(x < 0);').
transition_access( 15, [_, r, _] ).
r(p(pc(main-15-22), data(V2, V1, V3)), p(pc(main-1-11), data(V2p, V1p, V3p)), [], [V2p = (V2 - 1), V1p = V1, V3p = V3], 16). % y := y - 1
stmtsrc(16, 'y=y - 1;').
transition_access( 16, [w, _, _] ).
r(p(pc(main-12-21), data(V2, V1, V3)), p(pc(main-1-11), data(V2p, V1p, V3p)), [(V1 >= 0)], [V2p = V2, V1p = V1, V3p = V3], 17). % x >= 0
stmtsrc(17, 'assume(x >= 0);').
transition_access( 17, [_, r, _] ).
r(p(pc(main-9-16), data(V2, V1, V3)), p(pc(main-1-11), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 18). % 
stmtsrc(18, 'skip;').
transition_access( 18, [_, _, _] ).
r(p(pc(main-4-0), data(V2, V1, V3)), p(pc(main-3-27), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 19). % 
stmtsrc(19, 'skip;').
transition_access( 19, [_, _, _] ).
r(p(pc(main-3-27), data(V2, V1, V3)), p(pc(main-17-27), data(V2p, V1p, V3p)), [(V1 +1 =< 4)], [V2p = V2, V1p = V1, V3p = V3], 20). % x < 4
stmtsrc(20, 'assume(x < 4);').
transition_access( 20, [_, r, _] ).
r(p(pc(main-17-27), data(V2, V1, V3)), p(pc(main-16-27), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = 1], 21). % tmp := 1
stmtsrc(21, 'tmp=1;').
transition_access( 21, [_, _, w] ).
r(p(pc(main-3-27), data(V2, V1, V3)), p(pc(main-18-27), data(V2p, V1p, V3p)), [(V1 >= 4)], [V2p = V2, V1p = V1, V3p = V3], 22). % x >= 4
stmtsrc(22, 'assume(x >= 4);').
transition_access( 22, [_, r, _] ).
r(p(pc(main-18-27), data(V2, V1, V3)), p(pc(main-19-27), data(V2p, V1p, V3p)), [(V2 >= 1+ 2)], [V2p = V2, V1p = V1, V3p = V3], 23). % y > 2
stmtsrc(23, 'assume(y > 2);').
transition_access( 23, [r, _, _] ).
r(p(pc(main-19-27), data(V2, V1, V3)), p(pc(main-16-27), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = 1], 24). % tmp := 1
stmtsrc(24, 'tmp=1;').
transition_access( 24, [_, _, w] ).
r(p(pc(main-18-27), data(V2, V1, V3)), p(pc(main-20-27), data(V2p, V1p, V3p)), [(V2 =< 2)], [V2p = V2, V1p = V1, V3p = V3], 25). % y <= 2
stmtsrc(25, 'assume(y <= 2);').
transition_access( 25, [r, _, _] ).
r(p(pc(main-20-27), data(V2, V1, V3)), p(pc(main-16-27), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = 0], 26). % tmp := 0
stmtsrc(26, 'tmp=0;').
transition_access( 26, [_, _, w] ).
r(p(pc(main-16-27), data(V2, V1, V3)), p(pc(main-err-0), data(V2p, V1p, V3p)), [(V3 = 0)], [V2p = V2, V1p = V1, V3p = V3], 27). % tmp == 0
stmtsrc(27, 'assume(tmp == 0);').
transition_access( 27, [_, _, r] ).
r(p(pc(main-16-27), data(V2, V1, V3)), p(pc(main-21-28), data(V2p, V1p, V3p)), [(V3 +1 =< 0)], [V2p = V2, V1p = V1, V3p = V3], 28). % tmp < 0
stmtsrc(28, 'assume(tmp < 0);').
transition_access( 28, [_, _, r] ).
r(p(pc(main-16-27), data(V2, V1, V3)), p(pc(main-21-28), data(V2p, V1p, V3p)), [(V3 >= 1+ 0)], [V2p = V2, V1p = V1, V3p = V3], 29). % tmp > 0
stmtsrc(29, 'assume(tmp > 0);').
transition_access( 29, [_, _, r] ).
r(p(pc(main-21-28), data(V2, V1, V3)), p(pc(main-ret-0), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 30). % 
stmtsrc(30, 'skip;').
transition_access( 30, [_, _, _] ).
r(p(pc(main-7-11), data(V2, V1, V3)), p(pc(main-4-0), data(V2p, V1p, V3p)), [], [V2p = V2, V1p = V1, V3p = V3], 31). % 
stmtsrc(31, 'skip;').
transition_access( 31, [_, _, _] ).
% Atomic blocks
strengthening(p(pc(main-1-11), data(V2, V1, V3)), [( 1)*V1 +( 0) >= 0, ( 1)*V2 +( 0) >= 0,( 1)*V1 +( 0) >= 0, ( 1)*V2+( -1)*V1 +( 0) >= 0, ( 1)*V2+( 1)*V1 +( 0) >= 0, ( 1)*V2 +( 0) >= 0,( -1)*V2+( 100)*V1+( 0)*V3 +( 0) >= 0]).
