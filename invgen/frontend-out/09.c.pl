:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V4, V3, V6, V1, V5, V2)), []).
trans_preds(p(_, data(V4, V3, V6, V1, V5, V2)), p(_, data(V4p, V3p, V6p, V1p, V5p, V2p)), []).
var2names(p(pc(_), data(V4, V3, V6, V1, V5, V2)), [(V4, 't'), (V3, 'pvlen'), (V6, 'n'), (V1, 'k'), (V5, 'j'), (V2, 'i')]).
globals(p(pc(_), data(V4, V3, V6, V1, V5, V2)), [], []).
% start location
start(pc(main-0-14)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-22-35)). % line 35
cutpoint(pc(main-11-31)). % line 31
cutpoint(pc(main-10-26)). % line 26
cutpoint(pc(main-1-17)). % line 17
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V4, V3, V6, V1, V5, V2), []).
% cfg loop exit relation
cfg_exit_relation([(pc(main-11-31), pc(main-22-35)), (pc(main-10-26), pc(main-11-31)), (pc(main-1-17), pc(main-10-26))]).
% 38 transitions
r(p(pc(main-0-14), data(V4, V3, V6, V1, V5, V2)), p(pc(main-2-0), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = 0, V5p = V5, V2p = V2], 1). % k := 0
stmtsrc(1, 'k=0;').
transition_access( 1, [_, _, _, w, _, _] ).
r(p(pc(main-2-0), data(V4, V3, V6, V1, V5, V2)), p(pc(main-1-17), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = 0], 2). % i := 0
stmtsrc(2, 'i=0;').
transition_access( 2, [_, _, _, _, _, w] ).
r(p(pc(main-1-17), data(V4, V3, V6, V1, V5, V2)), p(pc(main-5-17), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = V2], 3). % 
stmtsrc(3, 'skip;').
transition_access( 3, [_, _, _, _, _, _] ).
r(p(pc(main-5-17), data(V4, V3, V6, V1, V5, V2)), p(pc(main-6-18), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = V2], 4). % 
stmtsrc(4, 'skip;').
transition_access( 4, [_, _, _, _, _, _] ).
r(p(pc(main-5-17), data(V4, V3, V6, V1, V5, V2)), p(pc(main-7-17), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = V2], 5). % 
stmtsrc(5, 'skip;').
transition_access( 5, [_, _, _, _, _, _] ).
r(p(pc(main-6-18), data(V4, V3, V6, V1, V5, V2)), p(pc(main-1-17), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = (V2 + 1)], 6). % i := i + 1
stmtsrc(6, 'i=i + 1;').
transition_access( 6, [_, _, _, _, _, w] ).
r(p(pc(main-4-0), data(V4, V3, V6, V1, V5, V2)), p(pc(main-3-19), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = V2], 7). % 
stmtsrc(7, 'skip;').
transition_access( 7, [_, _, _, _, _, _] ).
r(p(pc(main-3-19), data(V4, V3, V6, V1, V5, V2)), p(pc(main-9-20), data(V4p, V3p, V6p, V1p, V5p, V2p)), [(V2 >= 1+ V3)], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = V2], 8). % i > pvlen
stmtsrc(8, 'assume(i > pvlen);').
transition_access( 8, [_, r, _, _, _, r] ).
r(p(pc(main-9-20), data(V4, V3, V6, V1, V5, V2)), p(pc(main-8-24), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V2, V6p = V6, V1p = V1, V5p = V5, V2p = V2], 9). % pvlen := i
stmtsrc(9, 'pvlen=i;').
transition_access( 9, [_, w, _, _, _, r] ).
r(p(pc(main-3-19), data(V4, V3, V6, V1, V5, V2)), p(pc(main-8-24), data(V4p, V3p, V6p, V1p, V5p, V2p)), [(V2 =< V3)], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = V2], 10). % i <= pvlen
stmtsrc(10, 'assume(i <= pvlen);').
transition_access( 10, [_, r, _, _, _, r] ).
r(p(pc(main-8-24), data(V4, V3, V6, V1, V5, V2)), p(pc(main-10-26), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = 0], 11). % i := 0
stmtsrc(11, 'i=0;').
transition_access( 11, [_, _, _, _, _, w] ).
r(p(pc(main-10-26), data(V4, V3, V6, V1, V5, V2)), p(pc(main-13-26), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = V2], 12). % 
stmtsrc(12, 'skip;').
transition_access( 12, [_, _, _, _, _, _] ).
r(p(pc(main-13-26), data(V4, V3, V6, V1, V5, V2)), p(pc(main-14-29), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = V2], 13). % 
stmtsrc(13, 'skip;').
transition_access( 13, [_, _, _, _, _, _] ).
r(p(pc(main-13-26), data(V4, V3, V6, V1, V5, V2)), p(pc(main-15-26), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = V2], 14). % 
stmtsrc(14, 'skip;').
transition_access( 14, [_, _, _, _, _, _] ).
r(p(pc(main-14-29), data(V4, V3, V6, V1, V5, V2)), p(pc(main-16-0), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V2, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = V2], 15). % t := i
stmtsrc(15, 't=i;').
transition_access( 15, [w, _, _, _, _, r] ).
r(p(pc(main-16-0), data(V4, V3, V6, V1, V5, V2)), p(pc(main-17-0), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = (V2 + 1)], 16). % i := i + 1
stmtsrc(16, 'i=i + 1;').
transition_access( 16, [_, _, _, _, _, w] ).
r(p(pc(main-17-0), data(V4, V3, V6, V1, V5, V2)), p(pc(main-10-26), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = (V1 + 1), V5p = V5, V2p = V2], 17). % k := k + 1
stmtsrc(17, 'k=k + 1;').
transition_access( 17, [_, _, _, w, _, _] ).
r(p(pc(main-12-0), data(V4, V3, V6, V1, V5, V2)), p(pc(main-11-31), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = V2], 18). % 
stmtsrc(18, 'skip;').
transition_access( 18, [_, _, _, _, _, _] ).
r(p(pc(main-11-31), data(V4, V3, V6, V1, V5, V2)), p(pc(main-20-31), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = V2], 19). % 
stmtsrc(19, 'skip;').
transition_access( 19, [_, _, _, _, _, _] ).
r(p(pc(main-20-31), data(V4, V3, V6, V1, V5, V2)), p(pc(main-11-31), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = V2], 20). % 
stmtsrc(20, 'skip;').
transition_access( 20, [_, _, _, _, _, _] ).
r(p(pc(main-20-31), data(V4, V3, V6, V1, V5, V2)), p(pc(main-21-31), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = V2], 21). % 
stmtsrc(21, 'skip;').
transition_access( 21, [_, _, _, _, _, _] ).
r(p(pc(main-19-0), data(V4, V3, V6, V1, V5, V2)), p(pc(main-18-34), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = V2], 22). % 
stmtsrc(22, 'skip;').
transition_access( 22, [_, _, _, _, _, _] ).
r(p(pc(main-18-34), data(V4, V3, V6, V1, V5, V2)), p(pc(main-23-0), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = 0, V2p = V2], 23). % j := 0
stmtsrc(23, 'j=0;').
transition_access( 23, [_, _, _, _, w, _] ).
r(p(pc(main-23-0), data(V4, V3, V6, V1, V5, V2)), p(pc(main-22-35), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V2, V1p = V1, V5p = V5, V2p = V2], 24). % n := i
stmtsrc(24, 'n=i;').
transition_access( 24, [_, _, w, _, _, r] ).
r(p(pc(main-22-35), data(V4, V3, V6, V1, V5, V2)), p(pc(main-26-39), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = V2], 25). % 
stmtsrc(25, 'skip;').
transition_access( 25, [_, _, _, _, _, _] ).
r(p(pc(main-26-39), data(V4, V3, V6, V1, V5, V2)), p(pc(main-err-0), data(V4p, V3p, V6p, V1p, V5p, V2p)), [(V1 +1 =< 0)], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = V2], 26). % k < 0
stmtsrc(26, 'assume(k < 0);').
transition_access( 26, [_, _, _, r, _, _] ).
r(p(pc(main-26-39), data(V4, V3, V6, V1, V5, V2)), p(pc(main-28-0), data(V4p, V3p, V6p, V1p, V5p, V2p)), [(V1 >= 0)], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = V2], 27). % k >= 0
stmtsrc(27, 'assume(k >= 0);').
transition_access( 27, [_, _, _, r, _, _] ).
r(p(pc(main-28-0), data(V4, V3, V6, V1, V5, V2)), p(pc(main-29-0), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = (V1 - 1), V5p = V5, V2p = V2], 28). % k := k - 1
stmtsrc(28, 'k=k - 1;').
transition_access( 28, [_, _, _, w, _, _] ).
r(p(pc(main-29-0), data(V4, V3, V6, V1, V5, V2)), p(pc(main-30-0), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = (V2 - 1)], 29). % i := i - 1
stmtsrc(29, 'i=i - 1;').
transition_access( 29, [_, _, _, _, _, w] ).
r(p(pc(main-30-0), data(V4, V3, V6, V1, V5, V2)), p(pc(main-27-40), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = (V5 + 1), V2p = V2], 30). % j := j + 1
stmtsrc(30, 'j=j + 1;').
transition_access( 30, [_, _, _, _, w, _] ).
r(p(pc(main-27-40), data(V4, V3, V6, V1, V5, V2)), p(pc(main-22-35), data(V4p, V3p, V6p, V1p, V5p, V2p)), [(V5 +1 =< V6)], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = V2], 31). % j < n
stmtsrc(31, 'assume(j < n);').
transition_access( 31, [_, _, r, _, r, _] ).
r(p(pc(main-27-40), data(V4, V3, V6, V1, V5, V2)), p(pc(main-31-42), data(V4p, V3p, V6p, V1p, V5p, V2p)), [(V5 >= V6)], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = V2], 32). % j >= n
stmtsrc(32, 'assume(j >= n);').
transition_access( 32, [_, _, r, _, r, _] ).
r(p(pc(main-25-0), data(V4, V3, V6, V1, V5, V2)), p(pc(main-24-45), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = V2], 33). % 
stmtsrc(33, 'skip;').
transition_access( 33, [_, _, _, _, _, _] ).
r(p(pc(main-24-45), data(V4, V3, V6, V1, V5, V2)), p(pc(main-ret-0), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = V2], 34). % 
stmtsrc(34, 'skip;').
transition_access( 34, [_, _, _, _, _, _] ).
r(p(pc(main-31-42), data(V4, V3, V6, V1, V5, V2)), p(pc(main-25-0), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = V2], 35). % 
stmtsrc(35, 'skip;').
transition_access( 35, [_, _, _, _, _, _] ).
r(p(pc(main-21-31), data(V4, V3, V6, V1, V5, V2)), p(pc(main-19-0), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = V2], 36). % 
stmtsrc(36, 'skip;').
transition_access( 36, [_, _, _, _, _, _] ).
r(p(pc(main-15-26), data(V4, V3, V6, V1, V5, V2)), p(pc(main-12-0), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = V2], 37). % 
stmtsrc(37, 'skip;').
transition_access( 37, [_, _, _, _, _, _] ).
r(p(pc(main-7-17), data(V4, V3, V6, V1, V5, V2)), p(pc(main-4-0), data(V4p, V3p, V6p, V1p, V5p, V2p)), [], [V4p = V4, V3p = V3, V6p = V6, V1p = V1, V5p = V5, V2p = V2], 38). % 
stmtsrc(38, 'skip;').
transition_access( 38, [_, _, _, _, _, _] ).
% Atomic blocks
strengthening(p(pc(main-22-35), data(V4, V3, V6, V1, V5, V2)), [( 1)*V5 +( 0) >= 0, ( 1)*V1 +( 1) >= 0, ( 1)*V6 +( 0) >= 0, ( 1)*V3 +( 0) >= 0,( 1)*V2 +( 1) >= 0, ( 1)*V5+( 1)*V2 +( 0) >= 0, ( 1)*V5 +( 0) >= 0, ( 1)*V1+( -1)*V2 +( 0) >= 0, ( 1)*V1+( 1)*V2 +( 2) >= 0, ( 1)*V1+( 1)*V5 +( 0) >= 0, ( 1)*V1 +( 1) >= 0, ( -1)*V1+( 1)*V2 +( 0) >= 0, ( 1)*V6+( -1)*V2 +( 0) >= 0, ( 1)*V6+( 1)*V2 +( 0) >= 0, ( 1)*V6+( -1)*V5 +( 0) >= 0, ( 1)*V6+( 1)*V5 +( 0) >= 0, ( 1)*V6+( -1)*V1 +( 0) >= 0, ( 1)*V6+( 1)*V1 +( 0) >= 0, ( 1)*V6 +( 0) >= 0, ( 1)*V3+( 1)*V2 +( 1) >= 0, ( 1)*V3+( 1)*V5 +( 0) >= 0, ( 1)*V3+( 1)*V1 +( 1) >= 0, ( 1)*V3+( 1)*V6 +( 0) >= 0, ( 1)*V3 +( 0) >= 0,( 0)*V4+( 0)*V3+( -1)*V6+( 1)*V1+( 1)*V5+( 0)*V2 +( 0) = 0, ( 0)*V4+( 0)*V3+( 0)*V6+( -1)*V1+( 0)*V5+( 1)*V2 +( 0) = 0, ( 0)*V4+( 1)*V3+( 0)*V6+( 0)*V1+( 0)*V5+( 0)*V2 +( 0) >= 0, ( 0)*V4+( 0)*V3+( 0)*V6+( 1)*V1+( 0)*V5+( 0)*V2 +( 0) >= 0, ( 0)*V4+( 0)*V3+( 1)*V6+( -1)*V1+( 0)*V5+( 0)*V2 +( 0) >= 0]).
strengthening(p(pc(main-11-31), data(V4, V3, V6, V1, V5, V2)), [( 1)*V2 +( 0) >= 0, ( 1)*V1 +( 0) >= 0, ( 1)*V3 +( 0) >= 0,( 1)*V2 +( 0) >= 0, ( 1)*V1+( -1)*V2 +( 0) >= 0, ( 1)*V1+( 1)*V2 +( 0) >= 0, ( 1)*V1 +( 0) >= 0, ( -1)*V1+( 1)*V2 +( 0) >= 0, ( 1)*V3+( 1)*V2 +( 0) >= 0, ( 1)*V3+( 1)*V1 +( 0) >= 0, ( 1)*V3 +( 0) >= 0,( 0)*V4+( 0)*V3+( 0)*V6+( -1)*V1+( 0)*V5+( 1)*V2 +( 0) = 0, ( 0)*V4+( 1)*V3+( 0)*V6+( 0)*V1+( 0)*V5+( 0)*V2 +( 0) >= 0, ( 0)*V4+( 0)*V3+( 0)*V6+( 1)*V1+( 0)*V5+( 0)*V2 +( 0) >= 0]).
strengthening(p(pc(main-10-26), data(V4, V3, V6, V1, V5, V2)), [( 1)*V2 +( 0) >= 0, ( 1)*V1 +( 0) >= 0, ( 1)*V3 +( 0) >= 0,( 1)*V2 +( 0) >= 0, ( 1)*V1+( -1)*V2 +( 0) >= 0, ( 1)*V1+( 1)*V2 +( 0) >= 0, ( 1)*V1 +( 0) >= 0, ( -1)*V1+( 1)*V2 +( 0) >= 0, ( 1)*V3+( 1)*V2 +( 0) >= 0, ( 1)*V3+( 1)*V1 +( 0) >= 0, ( 1)*V3 +( 0) >= 0,( 0)*V4+( 0)*V3+( 0)*V6+( -1)*V1+( 0)*V5+( 1)*V2 +( 0) = 0, ( 0)*V4+( 1)*V3+( 0)*V6+( 0)*V1+( 0)*V5+( 0)*V2 +( 0) >= 0, ( 0)*V4+( 0)*V3+( 0)*V6+( 1)*V1+( 0)*V5+( 0)*V2 +( 0) >= 0]).
strengthening(p(pc(main-1-17), data(V4, V3, V6, V1, V5, V2)), [( 1)*V2 +( 0) >= 0, ( 1)*V1 +( 0) = 0,( 1)*V2 +( 0) >= 0, ( 1)*V1+( 1)*V2 +( 0) >= 0, ( 1)*V1 +( 0) >= 0, ( -1)*V1+( 1)*V2 +( 0) >= 0, ( -1)*V1 +( 0) >= 0,( 0)*V4+( 0)*V3+( 0)*V6+( 1)*V1+( 0)*V5+( 0)*V2 +( 0) = 0, ( 0)*V4+( 0)*V3+( 0)*V6+( 0)*V1+( 0)*V5+( 1)*V2 +( 0) >= 0]).
