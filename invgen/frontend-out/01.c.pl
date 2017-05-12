:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V2, V1, V4, V3)), []).
trans_preds(p(_, data(V2, V1, V4, V3)), p(_, data(V2p, V1p, V4p, V3p)), []).
var2names(p(pc(_), data(V2, V1, V4, V3)), [(V2, 'y'), (V1, 'x'), (V4, 't2'), (V3, 't1')]).
globals(p(pc(_), data(V2, V1, V4, V3)), [], []).
% start location
start(pc(main-0-10)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-1-11)). % line 11
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V2, V1, V4, V3), []).
% cfg loop exit relation
cfg_exit_relation([]).
% 14 transitions
r(p(pc(main-0-10), data(V2, V1, V4, V3)), p(pc(main-2-0), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = 1, V4p = V4, V3p = V3], 1). % x := 1
stmtsrc(1, 'x=1;').
transition_access( 1, [_, w, _, _] ).
r(p(pc(main-2-0), data(V2, V1, V4, V3)), p(pc(main-1-11), data(V2p, V1p, V4p, V3p)), [], [V2p = 1, V1p = V1, V4p = V4, V3p = V3], 2). % y := 1
stmtsrc(2, 'y=1;').
transition_access( 2, [w, _, _, _] ).
r(p(pc(main-1-11), data(V2, V1, V4, V3)), p(pc(main-5-11), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 3). % 
stmtsrc(3, 'skip;').
transition_access( 3, [_, _, _, _] ).
r(p(pc(main-5-11), data(V2, V1, V4, V3)), p(pc(main-6-15), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 4). % 
stmtsrc(4, 'skip;').
transition_access( 4, [_, _, _, _] ).
r(p(pc(main-5-11), data(V2, V1, V4, V3)), p(pc(main-7-11), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 5). % 
stmtsrc(5, 'skip;').
transition_access( 5, [_, _, _, _] ).
r(p(pc(main-6-15), data(V2, V1, V4, V3)), p(pc(main-8-0), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = V1, V4p = V4, V3p = V1], 6). % t1 := x
stmtsrc(6, 't1=x;').
transition_access( 6, [_, r, _, w] ).
r(p(pc(main-8-0), data(V2, V1, V4, V3)), p(pc(main-9-0), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = V1, V4p = V2, V3p = V3], 7). % t2 := y
stmtsrc(7, 't2=y;').
transition_access( 7, [r, _, w, _] ).
r(p(pc(main-9-0), data(V2, V1, V4, V3)), p(pc(main-10-0), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = (V3 + V4), V4p = V4, V3p = V3], 8). % x := t1 + t2
stmtsrc(8, 'x=t1 + t2;').
transition_access( 8, [_, w, r, r] ).
r(p(pc(main-10-0), data(V2, V1, V4, V3)), p(pc(main-1-11), data(V2p, V1p, V4p, V3p)), [], [V2p = (V3 + V4), V1p = V1, V4p = V4, V3p = V3], 9). % y := t1 + t2
stmtsrc(9, 'y=t1 + t2;').
transition_access( 9, [w, _, r, r] ).
r(p(pc(main-4-0), data(V2, V1, V4, V3)), p(pc(main-3-17), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 10). % 
stmtsrc(10, 'skip;').
transition_access( 10, [_, _, _, _] ).
r(p(pc(main-3-17), data(V2, V1, V4, V3)), p(pc(main-err-0), data(V2p, V1p, V4p, V3p)), [(V2 +1 =< 1)], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 11). % y < 1
stmtsrc(11, 'assume(y < 1);').
transition_access( 11, [r, _, _, _] ).
r(p(pc(main-3-17), data(V2, V1, V4, V3)), p(pc(main-11-18), data(V2p, V1p, V4p, V3p)), [(V2 >= 1)], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 12). % y >= 1
stmtsrc(12, 'assume(y >= 1);').
transition_access( 12, [r, _, _, _] ).
r(p(pc(main-11-18), data(V2, V1, V4, V3)), p(pc(main-ret-0), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 13). % 
stmtsrc(13, 'skip;').
transition_access( 13, [_, _, _, _] ).
r(p(pc(main-7-11), data(V2, V1, V4, V3)), p(pc(main-4-0), data(V2p, V1p, V4p, V3p)), [], [V2p = V2, V1p = V1, V4p = V4, V3p = V3], 14). % 
stmtsrc(14, 'skip;').
transition_access( 14, [_, _, _, _] ).
% Atomic blocks
strengthening(p(pc(main-1-11), data(V2, V1, V4, V3)), [( 1)*V1 +( -1) >= 0, ( 1)*V2 +( -1) >= 0,( 1)*V1 +( -1) >= 0, ( 1)*V2+( 1)*V1 +( -2) >= 0, ( 1)*V2 +( -1) >= 0,( -1)*V2+( 1)*V1+( 0)*V4+( 0)*V3 +( 0) = 0, ( 1)*V2+( 0)*V1+( 0)*V4+( 0)*V3 +( -1) >= 0]).
