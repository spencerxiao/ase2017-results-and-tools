:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V2, V1, V3, V4, V5)), []).
trans_preds(p(_, data(V2, V1, V3, V4, V5)), p(_, data(V2p, V1p, V3p, V4p, V5p)), []).
var2names(p(pc(_), data(V2, V1, V3, V4, V5)), [(V2, 'y'), (V1, 'x'), (V3, 'j'), (V4, 'i'), (V5, 'flag')]).
globals(p(pc(_), data(V2, V1, V3, V4, V5)), [], []).
% start location
start(pc(main-0-11)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-1-14)). % line 14
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V2, V1, V3, V4, V5), []).
% cfg loop exit relation
cfg_exit_relation([]).
% 20 transitions
r(p(pc(main-0-11), data(V2, V1, V3, V4, V5)), p(pc(main-2-0), data(V2p, V1p, V3p, V4p, V5p)), [], [V2p = V2, V1p = 0, V3p = V3, V4p = V4, V5p = V5], 1). % x := 0
stmtsrc(1, 'x=0;').
transition_access( 1, [_, w, _, _, _] ).
r(p(pc(main-2-0), data(V2, V1, V3, V4, V5)), p(pc(main-3-0), data(V2p, V1p, V3p, V4p, V5p)), [], [V2p = 0, V1p = V1, V3p = V3, V4p = V4, V5p = V5], 2). % y := 0
stmtsrc(2, 'y=0;').
transition_access( 2, [w, _, _, _, _] ).
r(p(pc(main-3-0), data(V2, V1, V3, V4, V5)), p(pc(main-4-0), data(V2p, V1p, V3p, V4p, V5p)), [], [V2p = V2, V1p = V1, V3p = 0, V4p = V4, V5p = V5], 3). % j := 0
stmtsrc(3, 'j=0;').
transition_access( 3, [_, _, w, _, _] ).
r(p(pc(main-4-0), data(V2, V1, V3, V4, V5)), p(pc(main-1-14), data(V2p, V1p, V3p, V4p, V5p)), [], [V2p = V2, V1p = V1, V3p = V3, V4p = 0, V5p = V5], 4). % i := 0
stmtsrc(4, 'i=0;').
transition_access( 4, [_, _, _, w, _] ).
r(p(pc(main-1-14), data(V2, V1, V3, V4, V5)), p(pc(main-7-14), data(V2p, V1p, V3p, V4p, V5p)), [], [V2p = V2, V1p = V1, V3p = V3, V4p = V4, V5p = V5], 5). % 
stmtsrc(5, 'skip;').
transition_access( 5, [_, _, _, _, _] ).
r(p(pc(main-7-14), data(V2, V1, V3, V4, V5)), p(pc(main-8-19), data(V2p, V1p, V3p, V4p, V5p)), [], [V2p = V2, V1p = V1, V3p = V3, V4p = V4, V5p = V5], 6). % 
stmtsrc(6, 'skip;').
transition_access( 6, [_, _, _, _, _] ).
r(p(pc(main-7-14), data(V2, V1, V3, V4, V5)), p(pc(main-9-14), data(V2p, V1p, V3p, V4p, V5p)), [], [V2p = V2, V1p = V1, V3p = V3, V4p = V4, V5p = V5], 7). % 
stmtsrc(7, 'skip;').
transition_access( 7, [_, _, _, _, _] ).
r(p(pc(main-8-19), data(V2, V1, V3, V4, V5)), p(pc(main-11-0), data(V2p, V1p, V3p, V4p, V5p)), [], [V2p = V2, V1p = (V1 + 1), V3p = V3, V4p = V4, V5p = V5], 8). % x := x + 1
stmtsrc(8, 'x=x + 1;').
transition_access( 8, [_, w, _, _, _] ).
r(p(pc(main-11-0), data(V2, V1, V3, V4, V5)), p(pc(main-12-0), data(V2p, V1p, V3p, V4p, V5p)), [], [V2p = (V2 + 1), V1p = V1, V3p = V3, V4p = V4, V5p = V5], 9). % y := y + 1
stmtsrc(9, 'y=y + 1;').
transition_access( 9, [w, _, _, _, _] ).
r(p(pc(main-12-0), data(V2, V1, V3, V4, V5)), p(pc(main-13-0), data(V2p, V1p, V3p, V4p, V5p)), [], [V2p = V2, V1p = V1, V3p = V3, V4p = (V4 + V1), V5p = V5], 10). % i := i + x
stmtsrc(10, 'i=i + x;').
transition_access( 10, [_, r, _, w, _] ).
r(p(pc(main-13-0), data(V2, V1, V3, V4, V5)), p(pc(main-10-20), data(V2p, V1p, V3p, V4p, V5p)), [], [V2p = V2, V1p = V1, V3p = (V3 + V2), V4p = V4, V5p = V5], 11). % j := j + y
stmtsrc(11, 'j=j + y;').
transition_access( 11, [r, _, w, _, _] ).
r(p(pc(main-10-20), data(V2, V1, V3, V4, V5)), p(pc(main-14-20), data(V2p, V1p, V3p, V4p, V5p)), [(V5 +1 =< 0)], [V2p = V2, V1p = V1, V3p = V3, V4p = V4, V5p = V5], 12). % flag < 0
stmtsrc(12, 'assume(flag < 0);').
transition_access( 12, [_, _, _, _, r] ).
r(p(pc(main-10-20), data(V2, V1, V3, V4, V5)), p(pc(main-14-20), data(V2p, V1p, V3p, V4p, V5p)), [(V5 >= 1+ 0)], [V2p = V2, V1p = V1, V3p = V3, V4p = V4, V5p = V5], 13). % flag > 0
stmtsrc(13, 'assume(flag > 0);').
transition_access( 13, [_, _, _, _, r] ).
r(p(pc(main-14-20), data(V2, V1, V3, V4, V5)), p(pc(main-1-14), data(V2p, V1p, V3p, V4p, V5p)), [], [V2p = V2, V1p = V1, V3p = (V3 + 1), V4p = V4, V5p = V5], 14). % j := j + 1
stmtsrc(14, 'j=j + 1;').
transition_access( 14, [_, _, w, _, _] ).
r(p(pc(main-10-20), data(V2, V1, V3, V4, V5)), p(pc(main-1-14), data(V2p, V1p, V3p, V4p, V5p)), [(V5 = 0)], [V2p = V2, V1p = V1, V3p = V3, V4p = V4, V5p = V5], 15). % flag == 0
stmtsrc(15, 'assume(flag == 0);').
transition_access( 15, [_, _, _, _, r] ).
r(p(pc(main-6-0), data(V2, V1, V3, V4, V5)), p(pc(main-5-22), data(V2p, V1p, V3p, V4p, V5p)), [], [V2p = V2, V1p = V1, V3p = V3, V4p = V4, V5p = V5], 16). % 
stmtsrc(16, 'skip;').
transition_access( 16, [_, _, _, _, _] ).
r(p(pc(main-5-22), data(V2, V1, V3, V4, V5)), p(pc(main-err-0), data(V2p, V1p, V3p, V4p, V5p)), [(V3 +1 =< V4)], [V2p = V2, V1p = V1, V3p = V3, V4p = V4, V5p = V5], 17). % j < i
stmtsrc(17, 'assume(j < i);').
transition_access( 17, [_, _, r, r, _] ).
r(p(pc(main-5-22), data(V2, V1, V3, V4, V5)), p(pc(main-15-24), data(V2p, V1p, V3p, V4p, V5p)), [(V3 >= V4)], [V2p = V2, V1p = V1, V3p = V3, V4p = V4, V5p = V5], 18). % j >= i
stmtsrc(18, 'assume(j >= i);').
transition_access( 18, [_, _, r, r, _] ).
r(p(pc(main-15-24), data(V2, V1, V3, V4, V5)), p(pc(main-ret-0), data(V2p, V1p, V3p, V4p, V5p)), [], [V2p = V2, V1p = V1, V3p = V3, V4p = V4, V5p = V5], 19). % 
stmtsrc(19, 'skip;').
transition_access( 19, [_, _, _, _, _] ).
r(p(pc(main-9-14), data(V2, V1, V3, V4, V5)), p(pc(main-6-0), data(V2p, V1p, V3p, V4p, V5p)), [], [V2p = V2, V1p = V1, V3p = V3, V4p = V4, V5p = V5], 20). % 
stmtsrc(20, 'skip;').
transition_access( 20, [_, _, _, _, _] ).
% Atomic blocks
strengthening(p(pc(main-1-14), data(V2, V1, V3, V4, V5)), [( 1)*V4 +( 0) >= 0, ( 1)*V3 +( 0) >= 0, ( 1)*V1 +( 0) >= 0, ( 1)*V2 +( 0) >= 0,( 1)*V4 +( 0) >= 0, ( 1)*V3+( 1)*V4 +( 0) >= 0, ( 1)*V3 +( 0) >= 0, ( 1)*V1+( 1)*V4 +( 0) >= 0, ( 1)*V1+( 1)*V3 +( 0) >= 0, ( 1)*V1 +( 0) >= 0, ( -1)*V1+( 1)*V4 +( 0) >= 0, ( -1)*V1+( 1)*V3 +( 0) >= 0, ( 1)*V2+( 1)*V4 +( 0) >= 0, ( 1)*V2+( 1)*V3 +( 0) >= 0, ( 1)*V2+( -1)*V1 +( 0) >= 0, ( 1)*V2+( 1)*V1 +( 0) >= 0, ( 1)*V2 +( 0) >= 0, ( -1)*V2+( 1)*V4 +( 0) >= 0, ( -1)*V2+( 1)*V3 +( 0) >= 0, ( -1)*V2+( 1)*V1 +( 0) >= 0,( -1)*V2+( 1)*V1+( 0)*V3+( 0)*V4+( 0)*V5 +( 0) = 0, ( 0)*V2+( -2)*V1+( 0)*V3+( 1)*V4+( 0)*V5 +( 1) >= 0, ( 0)*V2+( -3)*V1+( 0)*V3+( 1)*V4+( 0)*V5 +( 3) >= 0, ( 0)*V2+( 1)*V1+( -1)*V3+( 1)*V4+( 0)*V5 +( 0) >= 0, ( 0)*V2+( -1)*V1+( 0)*V3+( 1)*V4+( 0)*V5 +( 0) >= 0, ( 0)*V2+( 0)*V1+( 1)*V3+( -1)*V4+( 0)*V5 +( 0) >= 0]).
