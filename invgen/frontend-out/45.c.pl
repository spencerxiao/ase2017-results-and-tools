:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), []).
trans_preds(p(_, data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(_, data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), []).
var2names(p(pc(_), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), [(V9, 'z'), (V2, 'y'), (V1, 'x'), (V8, 'w'), (V3, 'j'), (V4, 'i'), (V7, 'flag'), (V6, 'd'), (V5, 'c')]).
globals(p(pc(_), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), [], []).
% start location
start(pc(main-0-11)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-25-31)). % line 31
cutpoint(pc(main-20-30)). % line 30
cutpoint(pc(main-1-12)). % line 12
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V9, V2, V1, V8, V3, V4, V7, V6, V5), []).
% cfg loop exit relation
cfg_exit_relation([(pc(main-25-31), pc(main-20-30)), (pc(main-1-12), pc(main-20-30))]).
% 49 transitions
r(p(pc(main-0-11), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-2-0), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [], [V9p = V9, V2p = V2, V1p = 0, V8p = V8, V3p = V3, V4p = V4, V7p = V7, V6p = V6, V5p = V5], 1). % x := 0
stmtsrc(1, 'x=0;').
transition_access( 1, [_, _, w, _, _, _, _, _, _] ).
r(p(pc(main-2-0), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-3-0), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [], [V9p = V9, V2p = 0, V1p = V1, V8p = V8, V3p = V3, V4p = V4, V7p = V7, V6p = V6, V5p = V5], 2). % y := 0
stmtsrc(2, 'y=0;').
transition_access( 2, [_, w, _, _, _, _, _, _, _] ).
r(p(pc(main-3-0), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-4-0), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [], [V9p = V9, V2p = V2, V1p = V1, V8p = V8, V3p = 0, V4p = V4, V7p = V7, V6p = V6, V5p = V5], 3). % j := 0
stmtsrc(3, 'j=0;').
transition_access( 3, [_, _, _, _, w, _, _, _, _] ).
r(p(pc(main-4-0), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-5-0), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [], [V9p = V9, V2p = V2, V1p = V1, V8p = V8, V3p = V3, V4p = 0, V7p = V7, V6p = V6, V5p = V5], 4). % i := 0
stmtsrc(4, 'i=0;').
transition_access( 4, [_, _, _, _, _, w, _, _, _] ).
r(p(pc(main-5-0), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-6-0), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [], [V9p = V9, V2p = V2, V1p = V1, V8p = V8, V3p = V3, V4p = V4, V7p = V7, V6p = V6, V5p = 0], 5). % c := 0
stmtsrc(5, 'c=0;').
transition_access( 5, [_, _, _, _, _, _, _, _, w] ).
r(p(pc(main-6-0), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-1-12), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [], [V9p = V9, V2p = V2, V1p = V1, V8p = V8, V3p = V3, V4p = V4, V7p = V7, V6p = 1, V5p = V5], 6). % d := 1
stmtsrc(6, 'd=1;').
transition_access( 6, [_, _, _, _, _, _, _, w, _] ).
r(p(pc(main-1-12), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-9-12), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [], [V9p = V9, V2p = V2, V1p = V1, V8p = V8, V3p = V3, V4p = V4, V7p = V7, V6p = V6, V5p = V5], 7). % 
stmtsrc(7, 'skip;').
transition_access( 7, [_, _, _, _, _, _, _, _, _] ).
r(p(pc(main-9-12), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-10-17), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [], [V9p = V9, V2p = V2, V1p = V1, V8p = V8, V3p = V3, V4p = V4, V7p = V7, V6p = V6, V5p = V5], 8). % 
stmtsrc(8, 'skip;').
transition_access( 8, [_, _, _, _, _, _, _, _, _] ).
r(p(pc(main-9-12), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-11-12), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [], [V9p = V9, V2p = V2, V1p = V1, V8p = V8, V3p = V3, V4p = V4, V7p = V7, V6p = V6, V5p = V5], 9). % 
stmtsrc(9, 'skip;').
transition_access( 9, [_, _, _, _, _, _, _, _, _] ).
r(p(pc(main-10-17), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-13-0), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [], [V9p = V9, V2p = V2, V1p = (V1 + 1), V8p = V8, V3p = V3, V4p = V4, V7p = V7, V6p = V6, V5p = V5], 10). % x := x + 1
stmtsrc(10, 'x=x + 1;').
transition_access( 10, [_, _, w, _, _, _, _, _, _] ).
r(p(pc(main-13-0), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-14-0), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [], [V9p = V9, V2p = (V2 + 1), V1p = V1, V8p = V8, V3p = V3, V4p = V4, V7p = V7, V6p = V6, V5p = V5], 11). % y := y + 1
stmtsrc(11, 'y=y + 1;').
transition_access( 11, [_, w, _, _, _, _, _, _, _] ).
r(p(pc(main-14-0), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-15-0), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [], [V9p = V9, V2p = V2, V1p = V1, V8p = V8, V3p = V3, V4p = (V4 + V1), V7p = V7, V6p = V6, V5p = V5], 12). % i := i + x
stmtsrc(12, 'i=i + x;').
transition_access( 12, [_, _, r, _, _, w, _, _, _] ).
r(p(pc(main-15-0), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-12-18), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [], [V9p = V9, V2p = V2, V1p = V1, V8p = V8, V3p = (V3 + V2), V4p = V4, V7p = V7, V6p = V6, V5p = V5], 13). % j := j + y
stmtsrc(13, 'j=j + y;').
transition_access( 13, [_, r, _, _, w, _, _, _, _] ).
r(p(pc(main-12-18), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-16-20), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [(V7 +1 =< 0)], [V9p = V9, V2p = V2, V1p = V1, V8p = V8, V3p = V3, V4p = V4, V7p = V7, V6p = V6, V5p = V5], 14). % flag < 0
stmtsrc(14, 'assume(flag < 0);').
transition_access( 14, [_, _, _, _, _, _, r, _, _] ).
r(p(pc(main-12-18), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-16-20), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [(V7 >= 1+ 0)], [V9p = V9, V2p = V2, V1p = V1, V8p = V8, V3p = V3, V4p = V4, V7p = V7, V6p = V6, V5p = V5], 15). % flag > 0
stmtsrc(15, 'assume(flag > 0);').
transition_access( 15, [_, _, _, _, _, _, r, _, _] ).
r(p(pc(main-16-20), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-1-12), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [], [V9p = V9, V2p = V2, V1p = V1, V8p = V8, V3p = (V3 + 1), V4p = V4, V7p = V7, V6p = V6, V5p = V5], 16). % j := j + 1
stmtsrc(16, 'j=j + 1;').
transition_access( 16, [_, _, _, _, w, _, _, _, _] ).
r(p(pc(main-12-18), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-1-12), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [(V7 = 0)], [V9p = V9, V2p = V2, V1p = V1, V8p = V8, V3p = V3, V4p = V4, V7p = V7, V6p = V6, V5p = V5], 17). % flag == 0
stmtsrc(17, 'assume(flag == 0);').
transition_access( 17, [_, _, _, _, _, _, r, _, _] ).
r(p(pc(main-8-0), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-7-23), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [], [V9p = V9, V2p = V2, V1p = V1, V8p = V8, V3p = V3, V4p = V4, V7p = V7, V6p = V6, V5p = V5], 18). % 
stmtsrc(18, 'skip;').
transition_access( 18, [_, _, _, _, _, _, _, _, _] ).
r(p(pc(main-7-23), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-18-24), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [(V3 >= V4)], [V9p = V9, V2p = V2, V1p = V1, V8p = V8, V3p = V3, V4p = V4, V7p = V7, V6p = V6, V5p = V5], 19). % j >= i
stmtsrc(19, 'assume(j >= i);').
transition_access( 19, [_, _, _, _, r, r, _, _, _] ).
r(p(pc(main-18-24), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-17-29), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [], [V9p = V9, V2p = V2, V1p = V2, V8p = V8, V3p = V3, V4p = V4, V7p = V7, V6p = V6, V5p = V5], 20). % x := y
stmtsrc(20, 'x=y;').
transition_access( 20, [_, r, w, _, _, _, _, _, _] ).
r(p(pc(main-7-23), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-19-26), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [(V3 +1 =< V4)], [V9p = V9, V2p = V2, V1p = V1, V8p = V8, V3p = V3, V4p = V4, V7p = V7, V6p = V6, V5p = V5], 21). % j < i
stmtsrc(21, 'assume(j < i);').
transition_access( 21, [_, _, _, _, r, r, _, _, _] ).
r(p(pc(main-19-26), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-17-29), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [], [V9p = V9, V2p = V2, V1p = (V2 + 1), V8p = V8, V3p = V3, V4p = V4, V7p = V7, V6p = V6, V5p = V5], 22). % x := y + 1
stmtsrc(22, 'x=y + 1;').
transition_access( 22, [_, r, w, _, _, _, _, _, _] ).
r(p(pc(main-17-29), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-21-0), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [], [V9p = V9, V2p = V2, V1p = V1, V8p = 1, V3p = V3, V4p = V4, V7p = V7, V6p = V6, V5p = V5], 23). % w := 1
stmtsrc(23, 'w=1;').
transition_access( 23, [_, _, _, w, _, _, _, _, _] ).
r(p(pc(main-21-0), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-20-30), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [], [V9p = 0, V2p = V2, V1p = V1, V8p = V8, V3p = V3, V4p = V4, V7p = V7, V6p = V6, V5p = V5], 24). % z := 0
stmtsrc(24, 'z=0;').
transition_access( 24, [w, _, _, _, _, _, _, _, _] ).
r(p(pc(main-20-30), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-24-30), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [], [V9p = V9, V2p = V2, V1p = V1, V8p = V8, V3p = V3, V4p = V4, V7p = V7, V6p = V6, V5p = V5], 25). % 
stmtsrc(25, 'skip;').
transition_access( 25, [_, _, _, _, _, _, _, _, _] ).
r(p(pc(main-24-30), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-25-31), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [], [V9p = V9, V2p = V2, V1p = V1, V8p = V8, V3p = V3, V4p = V4, V7p = V7, V6p = V6, V5p = V5], 26). % 
stmtsrc(26, 'skip;').
transition_access( 26, [_, _, _, _, _, _, _, _, _] ).
r(p(pc(main-24-30), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-26-30), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [], [V9p = V9, V2p = V2, V1p = V1, V8p = V8, V3p = V3, V4p = V4, V7p = V7, V6p = V6, V5p = V5], 27). % 
stmtsrc(27, 'skip;').
transition_access( 27, [_, _, _, _, _, _, _, _, _] ).
r(p(pc(main-25-31), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-29-31), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [], [V9p = V9, V2p = V2, V1p = V1, V8p = V8, V3p = V3, V4p = V4, V7p = V7, V6p = V6, V5p = V5], 28). % 
stmtsrc(28, 'skip;').
transition_access( 28, [_, _, _, _, _, _, _, _, _] ).
r(p(pc(main-29-31), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-30-32), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [], [V9p = V9, V2p = V2, V1p = V1, V8p = V8, V3p = V3, V4p = V4, V7p = V7, V6p = V6, V5p = V5], 29). % 
stmtsrc(29, 'skip;').
transition_access( 29, [_, _, _, _, _, _, _, _, _] ).
r(p(pc(main-29-31), data(V9, V2, V1, V8, V3, V4, V7, V6, V5)), p(pc(main-31-31), data(V9p, V2p, V1p, V8p, V3p, V4p, V7p, V6p, V5p)), [], [V9p = V9, V2p = V2, V1p = V1, V8p = V8, V3p = V3, V4p = V4, V7p = V7, V6p = V6, V5p = V5], 30). % 
stmtsrc(30, 'skip;').
transition_access( 30, [_, _, _, _, _, _, _, _, _] ).
