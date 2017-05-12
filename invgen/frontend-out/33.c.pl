:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V1, V4, V3, V2, V5)), []).
trans_preds(p(_, data(V1, V4, V3, V2, V5)), p(_, data(V1p, V4p, V3p, V2p, V5p)), []).
var2names(p(pc(_), data(V1, V4, V3, V2, V5)), [(V1, 'z'), (V4, 'y'), (V3, 'x'), (V2, 'k'), (V5, 'c')]).
globals(p(pc(_), data(V1, V4, V3, V2, V5)), [], []).
% start location
start(pc(main-0-8)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-10-27)). % line 27
cutpoint(pc(main-9-13)). % line 13
cutpoint(pc(main-1-10)). % line 10
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V1, V4, V3, V2, V5), []).
% cfg loop exit relation
cfg_exit_relation([(pc(main-10-27), pc(main-1-10)), (pc(main-9-13), pc(main-10-27))]).
% 35 transitions
r(p(pc(main-0-8), data(V1, V4, V3, V2, V5)), p(pc(main-2-0), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V2, V4p = V4, V3p = V3, V2p = V2, V5p = V5], 1). % z := k
stmtsrc(1, 'z=k;').
transition_access( 1, [w, _, _, r, _] ).
r(p(pc(main-2-0), data(V1, V4, V3, V2, V5)), p(pc(main-3-0), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V1, V4p = V4, V3p = 0, V2p = V2, V5p = V5], 2). % x := 0
stmtsrc(2, 'x=0;').
transition_access( 2, [_, _, w, _, _] ).
r(p(pc(main-3-0), data(V1, V4, V3, V2, V5)), p(pc(main-1-10), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V1, V4p = 0, V3p = V3, V2p = V2, V5p = V5], 3). % y := 0
stmtsrc(3, 'y=0;').
transition_access( 3, [_, w, _, _, _] ).
r(p(pc(main-1-10), data(V1, V4, V3, V2, V5)), p(pc(main-6-10), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V1, V4p = V4, V3p = V3, V2p = V2, V5p = V5], 4). % 
stmtsrc(4, 'skip;').
transition_access( 4, [_, _, _, _, _] ).
r(p(pc(main-6-10), data(V1, V4, V3, V2, V5)), p(pc(main-7-12), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V1, V4p = V4, V3p = V3, V2p = V2, V5p = V5], 5). % 
stmtsrc(5, 'skip;').
transition_access( 5, [_, _, _, _, _] ).
r(p(pc(main-6-10), data(V1, V4, V3, V2, V5)), p(pc(main-8-10), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V1, V4p = V4, V3p = V3, V2p = V2, V5p = V5], 6). % 
stmtsrc(6, 'skip;').
transition_access( 6, [_, _, _, _, _] ).
r(p(pc(main-7-12), data(V1, V4, V3, V2, V5)), p(pc(main-9-13), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V1, V4p = V4, V3p = V3, V2p = V2, V5p = 0], 7). % c := 0
stmtsrc(7, 'c=0;').
transition_access( 7, [_, _, _, _, w] ).
r(p(pc(main-9-13), data(V1, V4, V3, V2, V5)), p(pc(main-12-13), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V1, V4p = V4, V3p = V3, V2p = V2, V5p = V5], 8). % 
stmtsrc(8, 'skip;').
transition_access( 8, [_, _, _, _, _] ).
r(p(pc(main-12-13), data(V1, V4, V3, V2, V5)), p(pc(main-13-15), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V1, V4p = V4, V3p = V3, V2p = V2, V5p = V5], 9). % 
stmtsrc(9, 'skip;').
transition_access( 9, [_, _, _, _, _] ).
r(p(pc(main-12-13), data(V1, V4, V3, V2, V5)), p(pc(main-14-13), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V1, V4p = V4, V3p = V3, V2p = V2, V5p = V5], 10). % 
stmtsrc(10, 'skip;').
transition_access( 10, [_, _, _, _, _] ).
r(p(pc(main-13-15), data(V1, V4, V3, V2, V5)), p(pc(main-15-19), data(V1p, V4p, V3p, V2p, V5p)), [(V1 = ((V2 + V4) - V5))], [V1p = V1, V4p = V4, V3p = V3, V2p = V2, V5p = V5], 11). % z == (k + y) - c
stmtsrc(11, 'assume(z == (k + y) - c);').
transition_access( 11, [r, r, _, r, r] ).
r(p(pc(main-15-19), data(V1, V4, V3, V2, V5)), p(pc(main-17-0), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V1, V4p = V4, V3p = (V3 + 1), V2p = V2, V5p = V5], 12). % x := x + 1
stmtsrc(12, 'x=x + 1;').
transition_access( 12, [_, _, w, _, _] ).
r(p(pc(main-17-0), data(V1, V4, V3, V2, V5)), p(pc(main-18-0), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V1, V4p = (V4 + 1), V3p = V3, V2p = V2, V5p = V5], 13). % y := y + 1
stmtsrc(13, 'y=y + 1;').
transition_access( 13, [_, w, _, _, _] ).
r(p(pc(main-18-0), data(V1, V4, V3, V2, V5)), p(pc(main-9-13), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V1, V4p = V4, V3p = V3, V2p = V2, V5p = (V5 + 1)], 14). % c := c + 1
stmtsrc(14, 'c=c + 1;').
transition_access( 14, [_, _, _, _, w] ).
r(p(pc(main-13-15), data(V1, V4, V3, V2, V5)), p(pc(main-16-24), data(V1p, V4p, V3p, V2p, V5p)), [(V1 +1 =< ((V2 + V4) - V5))], [V1p = V1, V4p = V4, V3p = V3, V2p = V2, V5p = V5], 15). % z < (k + y) - c
stmtsrc(15, 'assume(z < (k + y) - c);').
transition_access( 15, [r, r, _, r, r] ).
r(p(pc(main-13-15), data(V1, V4, V3, V2, V5)), p(pc(main-16-24), data(V1p, V4p, V3p, V2p, V5p)), [(V1 >= 1+ ((V2 + V4) - V5))], [V1p = V1, V4p = V4, V3p = V3, V2p = V2, V5p = V5], 16). % z > (k + y) - c
stmtsrc(16, 'assume(z > (k + y) - c);').
transition_access( 16, [r, r, _, r, r] ).
r(p(pc(main-16-24), data(V1, V4, V3, V2, V5)), p(pc(main-19-0), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V1, V4p = V4, V3p = (V3 + 1), V2p = V2, V5p = V5], 17). % x := x + 1
stmtsrc(17, 'x=x + 1;').
transition_access( 17, [_, _, w, _, _] ).
r(p(pc(main-19-0), data(V1, V4, V3, V2, V5)), p(pc(main-20-0), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V1, V4p = (V4 - 1), V3p = V3, V2p = V2, V5p = V5], 18). % y := y - 1
stmtsrc(18, 'y=y - 1;').
transition_access( 18, [_, w, _, _, _] ).
r(p(pc(main-20-0), data(V1, V4, V3, V2, V5)), p(pc(main-9-13), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V1, V4p = V4, V3p = V3, V2p = V2, V5p = (V5 + 1)], 19). % c := c + 1
stmtsrc(19, 'c=c + 1;').
transition_access( 19, [_, _, _, _, w] ).
r(p(pc(main-11-0), data(V1, V4, V3, V2, V5)), p(pc(main-10-27), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V1, V4p = V4, V3p = V3, V2p = V2, V5p = V5], 20). % 
stmtsrc(20, 'skip;').
transition_access( 20, [_, _, _, _, _] ).
r(p(pc(main-10-27), data(V1, V4, V3, V2, V5)), p(pc(main-23-27), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V1, V4p = V4, V3p = V3, V2p = V2, V5p = V5], 21). % 
stmtsrc(21, 'skip;').
transition_access( 21, [_, _, _, _, _] ).
r(p(pc(main-23-27), data(V1, V4, V3, V2, V5)), p(pc(main-24-30), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V1, V4p = V4, V3p = V3, V2p = V2, V5p = V5], 22). % 
stmtsrc(22, 'skip;').
transition_access( 22, [_, _, _, _, _] ).
r(p(pc(main-23-27), data(V1, V4, V3, V2, V5)), p(pc(main-25-27), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V1, V4p = V4, V3p = V3, V2p = V2, V5p = V5], 23). % 
stmtsrc(23, 'skip;').
transition_access( 23, [_, _, _, _, _] ).
r(p(pc(main-24-30), data(V1, V4, V3, V2, V5)), p(pc(main-26-0), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V1, V4p = V4, V3p = (V3 - 1), V2p = V2, V5p = V5], 24). % x := x - 1
stmtsrc(24, 'x=x - 1;').
transition_access( 24, [_, _, w, _, _] ).
r(p(pc(main-26-0), data(V1, V4, V3, V2, V5)), p(pc(main-10-27), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V1, V4p = (V4 - 1), V3p = V3, V2p = V2, V5p = V5], 25). % y := y - 1
stmtsrc(25, 'y=y - 1;').
transition_access( 25, [_, w, _, _, _] ).
r(p(pc(main-22-0), data(V1, V4, V3, V2, V5)), p(pc(main-21-32), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V1, V4p = V4, V3p = V3, V2p = V2, V5p = V5], 26). % 
stmtsrc(26, 'skip;').
transition_access( 26, [_, _, _, _, _] ).
r(p(pc(main-21-32), data(V1, V4, V3, V2, V5)), p(pc(main-1-10), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = (V2 + V4), V4p = V4, V3p = V3, V2p = V2, V5p = V5], 27). % z := k + y
stmtsrc(27, 'z=k + y;').
transition_access( 27, [w, r, _, r, _] ).
r(p(pc(main-5-0), data(V1, V4, V3, V2, V5)), p(pc(main-4-34), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V1, V4p = V4, V3p = V3, V2p = V2, V5p = V5], 28). % 
stmtsrc(28, 'skip;').
transition_access( 28, [_, _, _, _, _] ).
r(p(pc(main-4-34), data(V1, V4, V3, V2, V5)), p(pc(main-err-0), data(V1p, V4p, V3p, V2p, V5p)), [(V3 +1 =< V4)], [V1p = V1, V4p = V4, V3p = V3, V2p = V2, V5p = V5], 29). % x < y
stmtsrc(29, 'assume(x < y);').
transition_access( 29, [_, r, r, _, _] ).
r(p(pc(main-4-34), data(V1, V4, V3, V2, V5)), p(pc(main-err-0), data(V1p, V4p, V3p, V2p, V5p)), [(V3 >= 1+ V4)], [V1p = V1, V4p = V4, V3p = V3, V2p = V2, V5p = V5], 30). % x > y
stmtsrc(30, 'assume(x > y);').
transition_access( 30, [_, r, r, _, _] ).
r(p(pc(main-4-34), data(V1, V4, V3, V2, V5)), p(pc(main-27-35), data(V1p, V4p, V3p, V2p, V5p)), [(V3 = V4)], [V1p = V1, V4p = V4, V3p = V3, V2p = V2, V5p = V5], 31). % x == y
stmtsrc(31, 'assume(x == y);').
transition_access( 31, [_, r, r, _, _] ).
r(p(pc(main-27-35), data(V1, V4, V3, V2, V5)), p(pc(main-ret-0), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V1, V4p = V4, V3p = V3, V2p = V2, V5p = V5], 32). % 
stmtsrc(32, 'skip;').
transition_access( 32, [_, _, _, _, _] ).
r(p(pc(main-25-27), data(V1, V4, V3, V2, V5)), p(pc(main-22-0), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V1, V4p = V4, V3p = V3, V2p = V2, V5p = V5], 33). % 
stmtsrc(33, 'skip;').
transition_access( 33, [_, _, _, _, _] ).
r(p(pc(main-14-13), data(V1, V4, V3, V2, V5)), p(pc(main-11-0), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V1, V4p = V4, V3p = V3, V2p = V2, V5p = V5], 34). % 
stmtsrc(34, 'skip;').
transition_access( 34, [_, _, _, _, _] ).
r(p(pc(main-8-10), data(V1, V4, V3, V2, V5)), p(pc(main-5-0), data(V1p, V4p, V3p, V2p, V5p)), [], [V1p = V1, V4p = V4, V3p = V3, V2p = V2, V5p = V5], 35). % 
stmtsrc(35, 'skip;').
transition_access( 35, [_, _, _, _, _] ).
% Atomic blocks
strengthening(p(pc(main-10-27), data(V1, V4, V3, V2, V5)), [( 1)*V5 +( 0) >= 0,( 1)*V5 +( 0) >= 0, ( -1)*V4+( 1)*V3 +( 0) >= 0,( 0)*V1+( -1)*V4+( 1)*V3+( 0)*V2+( 0)*V5 +( 0) >= 0]).
strengthening(p(pc(main-9-13), data(V1, V4, V3, V2, V5)), [( 1)*V5 +( 0) >= 0,( 1)*V5 +( 0) >= 0, ( -1)*V4+( 1)*V3 +( 0) >= 0,( -1)*V1+( 0)*V4+( 1)*V3+( 1)*V2+( -1)*V5 +( 0) >= 0, ( 1)*V1+( -1)*V4+( 0)*V3+( -1)*V2+( 1)*V5 +( 0) >= 0, ( -1)*V1+( 1)*V4+( 0)*V3+( 1)*V2+( 1)*V5 +( 0) >= 0]).
strengthening(p(pc(main-1-10), data(V1, V4, V3, V2, V5)), [1>=0,( -1)*V4+( 1)*V3 +( 0) >= 0,( -1)*V1+( 1)*V4+( 0)*V3+( 1)*V2+( 0)*V5 +( 0) = 0, ( 0)*V1+( -1)*V4+( 1)*V3+( 0)*V2+( 0)*V5 +( 0) >= 0]).
