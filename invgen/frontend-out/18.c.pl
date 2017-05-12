:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V1, V3, V2)), []).
trans_preds(p(_, data(V1, V3, V2)), p(_, data(V1p, V3p, V2p)), []).
var2names(p(pc(_), data(V1, V3, V2)), [(V1, 'j'), (V3, 'flag'), (V2, 'b')]).
globals(p(pc(_), data(V1, V3, V2)), [], []).
% start location
start(pc(main-0-11)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-1-11)). % line 11
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V1, V3, V2), []).
% cfg loop exit relation
cfg_exit_relation([]).
% 19 transitions
r(p(pc(main-0-11), data(V1, V3, V2)), p(pc(main-2-0), data(V1p, V3p, V2p)), [], [V1p = 0, V3p = V3, V2p = V2], 1). % j := 0
stmtsrc(1, 'j=0;').
transition_access( 1, [w, _, _] ).
r(p(pc(main-2-0), data(V1, V3, V2)), p(pc(main-1-11), data(V1p, V3p, V2p)), [], [V1p = V1, V3p = V3, V2p = 0], 2). % b := 0
stmtsrc(2, 'b=0;').
transition_access( 2, [_, _, w] ).
r(p(pc(main-1-11), data(V1, V3, V2)), p(pc(main-5-11), data(V1p, V3p, V2p)), [], [V1p = V1, V3p = V3, V2p = V2], 3). % 
stmtsrc(3, 'skip;').
transition_access( 3, [_, _, _] ).
r(p(pc(main-5-11), data(V1, V3, V2)), p(pc(main-6-12), data(V1p, V3p, V2p)), [(V2 +1 =< 100)], [V1p = V1, V3p = V3, V2p = V2], 4). % b < 100
stmtsrc(4, 'assume(b < 100);').
transition_access( 4, [_, _, r] ).
r(p(pc(main-5-11), data(V1, V3, V2)), p(pc(main-7-11), data(V1p, V3p, V2p)), [(V2 >= 100)], [V1p = V1, V3p = V3, V2p = V2], 5). % b >= 100
stmtsrc(5, 'assume(b >= 100);').
transition_access( 5, [_, _, r] ).
r(p(pc(main-6-12), data(V1, V3, V2)), p(pc(main-9-13), data(V1p, V3p, V2p)), [(V3 +1 =< 0)], [V1p = V1, V3p = V3, V2p = V2], 6). % flag < 0
stmtsrc(6, 'assume(flag < 0);').
transition_access( 6, [_, r, _] ).
r(p(pc(main-6-12), data(V1, V3, V2)), p(pc(main-9-13), data(V1p, V3p, V2p)), [(V3 >= 1+ 0)], [V1p = V1, V3p = V3, V2p = V2], 7). % flag > 0
stmtsrc(7, 'assume(flag > 0);').
transition_access( 7, [_, r, _] ).
r(p(pc(main-9-13), data(V1, V3, V2)), p(pc(main-8-11), data(V1p, V3p, V2p)), [], [V1p = (V1 + 1), V3p = V3, V2p = V2], 8). % j := j + 1
stmtsrc(8, 'j=j + 1;').
transition_access( 8, [w, _, _] ).
r(p(pc(main-6-12), data(V1, V3, V2)), p(pc(main-8-11), data(V1p, V3p, V2p)), [(V3 = 0)], [V1p = V1, V3p = V3, V2p = V2], 9). % flag == 0
stmtsrc(9, 'assume(flag == 0);').
transition_access( 9, [_, r, _] ).
r(p(pc(main-8-11), data(V1, V3, V2)), p(pc(main-1-11), data(V1p, V3p, V2p)), [], [V1p = V1, V3p = V3, V2p = (V2 + 1)], 10). % b := b + 1
stmtsrc(10, 'b=b + 1;').
transition_access( 10, [_, _, w] ).
r(p(pc(main-4-0), data(V1, V3, V2)), p(pc(main-3-17), data(V1p, V3p, V2p)), [], [V1p = V1, V3p = V3, V2p = V2], 11). % 
stmtsrc(11, 'skip;').
transition_access( 11, [_, _, _] ).
r(p(pc(main-3-17), data(V1, V3, V2)), p(pc(main-11-18), data(V1p, V3p, V2p)), [(V3 +1 =< 0)], [V1p = V1, V3p = V3, V2p = V2], 12). % flag < 0
stmtsrc(12, 'assume(flag < 0);').
transition_access( 12, [_, r, _] ).
r(p(pc(main-3-17), data(V1, V3, V2)), p(pc(main-11-18), data(V1p, V3p, V2p)), [(V3 >= 1+ 0)], [V1p = V1, V3p = V3, V2p = V2], 13). % flag > 0
stmtsrc(13, 'assume(flag > 0);').
transition_access( 13, [_, r, _] ).
r(p(pc(main-11-18), data(V1, V3, V2)), p(pc(main-err-0), data(V1p, V3p, V2p)), [(V1 +1 =< 100)], [V1p = V1, V3p = V3, V2p = V2], 14). % j < 100
stmtsrc(14, 'assume(j < 100);').
transition_access( 14, [r, _, _] ).
r(p(pc(main-11-18), data(V1, V3, V2)), p(pc(main-err-0), data(V1p, V3p, V2p)), [(V1 >= 1+ 100)], [V1p = V1, V3p = V3, V2p = V2], 15). % j > 100
stmtsrc(15, 'assume(j > 100);').
transition_access( 15, [r, _, _] ).
r(p(pc(main-11-18), data(V1, V3, V2)), p(pc(main-10-19), data(V1p, V3p, V2p)), [(V1 = 100)], [V1p = V1, V3p = V3, V2p = V2], 16). % j == 100
stmtsrc(16, 'assume(j == 100);').
transition_access( 16, [r, _, _] ).
r(p(pc(main-3-17), data(V1, V3, V2)), p(pc(main-10-19), data(V1p, V3p, V2p)), [(V3 = 0)], [V1p = V1, V3p = V3, V2p = V2], 17). % flag == 0
stmtsrc(17, 'assume(flag == 0);').
transition_access( 17, [_, r, _] ).
r(p(pc(main-10-19), data(V1, V3, V2)), p(pc(main-ret-0), data(V1p, V3p, V2p)), [], [V1p = V1, V3p = V3, V2p = V2], 18). % 
stmtsrc(18, 'skip;').
transition_access( 18, [_, _, _] ).
r(p(pc(main-7-11), data(V1, V3, V2)), p(pc(main-4-0), data(V1p, V3p, V2p)), [], [V1p = V1, V3p = V3, V2p = V2], 19). % 
stmtsrc(19, 'skip;').
transition_access( 19, [_, _, _] ).
% Atomic blocks
strengthening(p(pc(main-1-11), data(V1, V3, V2)), [( 1)*V2 +( 0) >= 0, ( -1)*V2 +( 100) >= 0, ( 1)*V1 +( 0) >= 0,( 1)*V2 +( 0) >= 0, ( -1)*V2 +( 100) >= 0, ( 1)*V1+( -1)*V2 +( 100) >= 0, ( 1)*V1+( 1)*V2 +( 0) >= 0, ( 1)*V1 +( 0) >= 0, ( -1)*V1+( -1)*V2 +( 200) >= 0, ( -1)*V1+( 1)*V2 +( 0) >= 0, ( -1)*V1 +( 100) >= 0,( -1)*V1+( 0)*V3+( 1)*V2 +( 0) >= 0, ( 1)*V1+( 0)*V3+( 0)*V2 +( 0) >= 0, ( 0)*V1+( 0)*V3+( -1)*V2 +( 100) >= 0]).
