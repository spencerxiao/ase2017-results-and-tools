:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V5, V4, V3, V7, V14, V10, V9, V6, V8, V13, V12, V11, V2, V1)), []).
trans_preds(p(_, data(V5, V4, V3, V7, V14, V10, V9, V6, V8, V13, V12, V11, V2, V1)), p(_, data(V5p, V4p, V3p, V7p, V14p, V10p, V9p, V6p, V8p, V13p, V12p, V11p, V2p, V1p)), []).
var2names(p(pc(_), data(V5, V4, V3, V7, V14, V10, V9, V6, V8, V13, V12, V11, V2, V1)), [(V5, 'z'), (V4, 'y'), (V3, 'x'), (V7, 'w'), (V14, 'tmp'), (V10, 'k'), (V9, 'j___0'), (V6, 'j'), (V8, 'i'), (V13, 'flag'), (V12, 'd'), (V11, 'c'), (V2, 'b'), (V1, 'a')]).
globals(p(pc(_), data(V5, V4, V3, V7, V14, V10, V9, V6, V8, V13, V12, V11, V2, V1)), [], []).
% start location
start(pc(main-0-13)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-37-54)). % line 54
cutpoint(pc(main-24-35)). % line 35
cutpoint(pc(main-13-20)). % line 20
cutpoint(pc(main-1-15)). % line 15
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V5, V4, V3, V7, V14, V10, V9, V6, V8, V13, V12, V11, V2, V1), []).
% cfg loop exit relation
cfg_exit_relation([(pc(main-24-35), pc(main-1-15)), (pc(main-13-20), pc(main-24-35)), (pc(main-1-15), pc(main-37-54))]).
% 71 transitions
r(p(pc(main-0-13), data(V5, V4, V3, V7, V14, V10, V9, V6, V8, V13, V12, V11, V2, V1)), p(pc(main-2-0), data(V5p, V4p, V3p, V7p, V14p, V10p, V9p, V6p, V8p, V13p, V12p, V11p, V2p, V1p)), [], [V5p = V5, V4p = V4, V3p = V3, V7p = V7, V14p = V14, V10p = V10, V9p = V9, V6p = V6, V8p = V8, V13p = V13, V12p = V12, V11p = V11, V2p = V2, V1p = 0], 1). % a := 0
stmtsrc(1, 'a=0;').
transition_access( 1, [_, _, _, _, _, _, _, _, _, _, _, _, _, w] ).
r(p(pc(main-2-0), data(V5, V4, V3, V7, V14, V10, V9, V6, V8, V13, V12, V11, V2, V1)), p(pc(main-3-0), data(V5p, V4p, V3p, V7p, V14p, V10p, V9p, V6p, V8p, V13p, V12p, V11p, V2p, V1p)), [], [V5p = V5, V4p = V4, V3p = V3, V7p = V7, V14p = V14, V10p = V10, V9p = V9, V6p = V6, V8p = V8, V13p = V13, V12p = V12, V11p = V11, V2p = 0, V1p = V1], 2). % b := 0
stmtsrc(2, 'b=0;').
transition_access( 2, [_, _, _, _, _, _, _, _, _, _, _, _, w, _] ).
r(p(pc(main-3-0), data(V5, V4, V3, V7, V14, V10, V9, V6, V8, V13, V12, V11, V2, V1)), p(pc(main-4-0), data(V5p, V4p, V3p, V7p, V14p, V10p, V9p, V6p, V8p, V13p, V12p, V11p, V2p, V1p)), [], [V5p = V5, V4p = V4, V3p = 0, V7p = V7, V14p = V14, V10p = V10, V9p = V9, V6p = V6, V8p = V8, V13p = V13, V12p = V12, V11p = V11, V2p = V2, V1p = V1], 3). % x := 0
stmtsrc(3, 'x=0;').
transition_access( 3, [_, _, w, _, _, _, _, _, _, _, _, _, _, _] ).
r(p(pc(main-4-0), data(V5, V4, V3, V7, V14, V10, V9, V6, V8, V13, V12, V11, V2, V1)), p(pc(main-5-0), data(V5p, V4p, V3p, V7p, V14p, V10p, V9p, V6p, V8p, V13p, V12p, V11p, V2p, V1p)), [], [V5p = V5, V4p = 0, V3p = V3, V7p = V7, V14p = V14, V10p = V10, V9p = V9, V6p = V6, V8p = V8, V13p = V13, V12p = V12, V11p = V11, V2p = V2, V1p = V1], 4). % y := 0
stmtsrc(4, 'y=0;').
transition_access( 4, [_, w, _, _, _, _, _, _, _, _, _, _, _, _] ).
r(p(pc(main-5-0), data(V5, V4, V3, V7, V14, V10, V9, V6, V8, V13, V12, V11, V2, V1)), p(pc(main-6-0), data(V5p, V4p, V3p, V7p, V14p, V10p, V9p, V6p, V8p, V13p, V12p, V11p, V2p, V1p)), [], [V5p = 0, V4p = V4, V3p = V3, V7p = V7, V14p = V14, V10p = V10, V9p = V9, V6p = V6, V8p = V8, V13p = V13, V12p = V12, V11p = V11, V2p = V2, V1p = V1], 5). % z := 0
stmtsrc(5, 'z=0;').
transition_access( 5, [w, _, _, _, _, _, _, _, _, _, _, _, _, _] ).
r(p(pc(main-6-0), data(V5, V4, V3, V7, V14, V10, V9, V6, V8, V13, V12, V11, V2, V1)), p(pc(main-7-0), data(V5p, V4p, V3p, V7p, V14p, V10p, V9p, V6p, V8p, V13p, V12p, V11p, V2p, V1p)), [], [V5p = V5, V4p = V4, V3p = V3, V7p = V7, V14p = V14, V10p = V10, V9p = V9, V6p = 0, V8p = V8, V13p = V13, V12p = V12, V11p = V11, V2p = V2, V1p = V1], 6). % j := 0
stmtsrc(6, 'j=0;').
transition_access( 6, [_, _, _, _, _, _, _, w, _, _, _, _, _, _] ).
r(p(pc(main-7-0), data(V5, V4, V3, V7, V14, V10, V9, V6, V8, V13, V12, V11, V2, V1)), p(pc(main-1-15), data(V5p, V4p, V3p, V7p, V14p, V10p, V9p, V6p, V8p, V13p, V12p, V11p, V2p, V1p)), [], [V5p = V5, V4p = V4, V3p = V3, V7p = 0, V14p = V14, V10p = V10, V9p = V9, V6p = V6, V8p = V8, V13p = V13, V12p = V12, V11p = V11, V2p = V2, V1p = V1], 7). % w := 0
stmtsrc(7, 'w=0;').
transition_access( 7, [_, _, _, w, _, _, _, _, _, _, _, _, _, _] ).
r(p(pc(main-1-15), data(V5, V4, V3, V7, V14, V10, V9, V6, V8, V13, V12, V11, V2, V1)), p(pc(main-10-15), data(V5p, V4p, V3p, V7p, V14p, V10p, V9p, V6p, V8p, V13p, V12p, V11p, V2p, V1p)), [], [V5p = V5, V4p = V4, V3p = V3, V7p = V7, V14p = V14, V10p = V10, V9p = V9, V6p = V6, V8p = V8, V13p = V13, V12p = V12, V11p = V11, V2p = V2, V1p = V1], 8). % 
stmtsrc(8, 'skip;').
transition_access( 8, [_, _, _, _, _, _, _, _, _, _, _, _, _, _] ).
r(p(pc(main-10-15), data(V5, V4, V3, V7, V14, V10, V9, V6, V8, V13, V12, V11, V2, V1)), p(pc(main-11-19), data(V5p, V4p, V3p, V7p, V14p, V10p, V9p, V6p, V8p, V13p, V12p, V11p, V2p, V1p)), [], [V5p = V5, V4p = V4, V3p = V3, V7p = V7, V14p = V14, V10p = V10, V9p = V9, V6p = V6, V8p = V8, V13p = V13, V12p = V12, V11p = V11, V2p = V2, V1p = V1], 9). % 
stmtsrc(9, 'skip;').
transition_access( 9, [_, _, _, _, _, _, _, _, _, _, _, _, _, _] ).
r(p(pc(main-10-15), data(V5, V4, V3, V7, V14, V10, V9, V6, V8, V13, V12, V11, V2, V1)), p(pc(main-12-15), data(V5p, V4p, V3p, V7p, V14p, V10p, V9p, V6p, V8p, V13p, V12p, V11p, V2p, V1p)), [], [V5p = V5, V4p = V4, V3p = V3, V7p = V7, V14p = V14, V10p = V10, V9p = V9, V6p = V6, V8p = V8, V13p = V13, V12p = V12, V11p = V11, V2p = V2, V1p = V1], 10). % 
stmtsrc(10, 'skip;').
transition_access( 10, [_, _, _, _, _, _, _, _, _, _, _, _, _, _] ).
r(p(pc(main-11-19), data(V5, V4, V3, V7, V14, V10, V9, V6, V8, V13, V12, V11, V2, V1)), p(pc(main-14-0), data(V5p, V4p, V3p, V7p, V14p, V10p, V9p, V6p, V8p, V13p, V12p, V11p, V2p, V1p)), [], [V5p = V5, V4p = V4, V3p = V3, V7p = V7, V14p = V14, V10p = V10, V9p = V9, V6p = V6, V8p = V5, V13p = V13, V12p = V12, V11p = V11, V2p = V2, V1p = V1], 11). % i := z
stmtsrc(11, 'i=z;').
transition_access( 11, [r, _, _, _, _, _, _, _, w, _, _, _, _, _] ).
r(p(pc(main-14-0), data(V5, V4, V3, V7, V14, V10, V9, V6, V8, V13, V12, V11, V2, V1)), p(pc(main-15-0), data(V5p, V4p, V3p, V7p, V14p, V10p, V9p, V6p, V8p, V13p, V12p, V11p, V2p, V1p)), [], [V5p = V5, V4p = V4, V3p = V3, V7p = V7, V14p = V14, V10p = V10, V9p = V7, V6p = V6, V8p = V8, V13p = V13, V12p = V12, V11p = V11, V2p = V2, V1p = V1], 12). % j___0 := w
stmtsrc(12, 'j___0=w;').
transition_access( 12, [_, _, _, r, _, _, w, _, _, _, _, _, _, _] ).
r(p(pc(main-15-0), data(V5, V4, V3, V7, V14, V10, V9, V6, V8, V13, V12, V11, V2, V1)), p(pc(main-13-20), data(V5p, V4p, V3p, V7p, V14p, V10p, V9p, V6p, V8p, V13p, V12p, V11p, V2p, V1p)), [], [V5p = V5, V4p = V4, V3p = V3, V7p = V7, V14p = V14, V10p = 0, V9p = V9, V6p = V6, V8p = V8, V13p = V13, V12p = V12, V11p = V11, V2p = V2, V1p = V1], 13). % k := 0
stmtsrc(13, 'k=0;').
transition_access( 13, [_, _, _, _, _, w, _, _, _, _, _, _, _, _] ).
r(p(pc(main-13-20), data(V5, V4, V3, V7, V14, V10, V9, V6, V8, V13, V12, V11, V2, V1)), p(pc(main-18-20), data(V5p, V4p, V3p, V7p, V14p, V10p, V9p, V6p, V8p, V13p, V12p, V11p, V2p, V1p)), [], [V5p = V5, V4p = V4, V3p = V3, V7p = V7, V14p = V14, V10p = V10, V9p = V9, V6p = V6, V8p = V8, V13p = V13, V12p = V12, V11p = V11, V2p = V2, V1p = V1], 14). % 
stmtsrc(14, 'skip;').
transition_access( 14, [_, _, _, _, _, _, _, _, _, _, _, _, _, _] ).
r(p(pc(main-18-20), data(V5, V4, V3, V7, V14, V10, V9, V6, V8, V13, V12, V11, V2, V1)), p(pc(main-19-23), data(V5p, V4p, V3p, V7p, V14p, V10p, V9p, V6p, V8p, V13p, V12p, V11p, V2p, V1p)), [(V8 +1 =< V9)], [V5p = V5, V4p = V4, V3p = V3, V7p = V7, V14p = V14, V10p = V10, V9p = V9, V6p = V6, V8p = V8, V13p = V13, V12p = V12, V11p = V11, V2p = V2, V1p = V1], 15). % i < j___0
stmtsrc(15, 'assume(i < j___0);').
transition_access( 15, [_, _, _, _, _, _, r, _, r, _, _, _, _, _] ).
r(p(pc(main-18-20), data(V5, V4, V3, V7, V14, V10, V9, V6, V8, V13, V12, V11, V2, V1)), p(pc(main-20-20), data(V5p, V4p, V3p, V7p, V14p, V10p, V9p, V6p, V8p, V13p, V12p, V11p, V2p, V1p)), [(V8 >= V9)], [V5p = V5, V4p = V4, V3p = V3, V7p = V7, V14p = V14, V10p = V10, V9p = V9, V6p = V6, V8p = V8, V13p = V13, V12p = V12, V11p = V11, V2p = V2, V1p = V1], 16). % i >= j___0
stmtsrc(16, 'assume(i >= j___0);').
transition_access( 16, [_, _, _, _, _, _, r, _, r, _, _, _, _, _] ).
r(p(pc(main-19-23), data(V5, V4, V3, V7, V14, V10, V9, V6, V8, V13, V12, V11, V2, V1)), p(pc(main-21-0), data(V5p, V4p, V3p, V7p, V14p, V10p, V9p, V6p, V8p, V13p, V12p, V11p, V2p, V1p)), [], [V5p = V5, V4p = V4, V3p = V3, V7p = V7, V14p = V14, V10p = (V10 + 1), V9p = V9, V6p = V6, V8p = V8, V13p = V13, V12p = V12, V11p = V11, V2p = V2, V1p = V1], 17). % k := k + 1
stmtsrc(17, 'k=k + 1;').
transition_access( 17, [_, _, _, _, _, w, _, _, _, _, _, _, _, _] ).
r(p(pc(main-21-0), data(V5, V4, V3, V7, V14, V10, V9, V6, V8, V13, V12, V11, V2, V1)), p(pc(main-13-20), data(V5p, V4p, V3p, V7p, V14p, V10p, V9p, V6p, V8p, V13p, V12p, V11p, V2p, V1p)), [], [V5p = V5, V4p = V4, V3p = V3, V7p = V7, V14p = V14, V10p = V10, V9p = V9, V6p = V6, V8p = (V8 + 1), V13p = V13, V12p = V12, V11p = V11, V2p = V2, V1p = V1], 18). % i := i + 1
stmtsrc(18, 'i=i + 1;').
transition_access( 18, [_, _, _, _, _, _, _, _, w, _, _, _, _, _] ).
r(p(pc(main-17-0), data(V5, V4, V3, V7, V14, V10, V9, V6, V8, V13, V12, V11, V2, V1)), p(pc(main-16-27), data(V5p, V4p, V3p, V7p, V14p, V10p, V9p, V6p, V8p, V13p, V12p, V11p, V2p, V1p)), [], [V5p = V5, V4p = V4, V3p = V3, V7p = V7, V14p = V14, V10p = V10, V9p = V9, V6p = V6, V8p = V8, V13p = V13, V12p = V12, V11p = V11, V2p = V2, V1p = V1], 19). % 
stmtsrc(19, 'skip;').
transition_access( 19, [_, _, _, _, _, _, _, _, _, _, _, _, _, _] ).
r(p(pc(main-16-27), data(V5, V4, V3, V7, V14, V10, V9, V6, V8, V13, V12, V11, V2, V1)), p(pc(main-23-0), data(V5p, V4p, V3p, V7p, V14p, V10p, V9p, V6p, V8p, V13p, V12p, V11p, V2p, V1p)), [], [V5p = V5, V4p = V4, V3p = V5, V7p = V7, V14p = V14, V10p = V10, V9p = V9, V6p = V6, V8p = V8, V13p = V13, V12p = V12, V11p = V11, V2p = V2, V1p = V1], 20). % x := z
stmtsrc(20, 'x=z;').
transition_access( 20, [r, _, w, _, _, _, _, _, _, _, _, _, _, _] ).
r(p(pc(main-23-0), data(V5, V4, V3, V7, V14, V10, V9, V6, V8, V13, V12, V11, V2, V1)), p(pc(main-22-29), data(V5p, V4p, V3p, V7p, V14p, V10p, V9p, V6p, V8p, V13p, V12p, V11p, V2p, V1p)), [], [V5p = V5, V4p = V10, V3p = V3, V7p = V7, V14p = V14, V10p = V10, V9p = V9, V6p = V6, V8p = V8, V13p = V13, V12p = V12, V11p = V11, V2p = V2, V1p = V1], 21). % y := k
stmtsrc(21, 'y=k;').
transition_access( 21, [_, w, _, _, _, r, _, _, _, _, _, _, _, _] ).
