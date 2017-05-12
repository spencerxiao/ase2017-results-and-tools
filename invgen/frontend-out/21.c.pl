:- multifile r/5,implicit_updates/0,var2names/2,preds/2,trans_preds/3,
 cube_size/1,start/1,error/1,refinement/1,cutpoint/1,invgen_template/2,
 invgen_template/1,cfg_exit_relation/1,stmtsrc/2,strengthening/2,globals/3,
 bound_var/2,bounding_vars/2,transition_access/2,atomic/3.
refinement(inter).
cube_size(1).
preds(p(_, data(V6, V3, V4, V5, V2, V1)), []).
trans_preds(p(_, data(V6, V3, V4, V5, V2, V1)), p(_, data(V6p, V3p, V4p, V5p, V2p, V1p)), []).
var2names(p(pc(_), data(V6, V3, V4, V5, V2, V1)), [(V6, 'v'), (V3, 'n'), (V4, 'k'), (V5, 'i'), (V2, 'c2'), (V1, 'c1')]).
globals(p(pc(_), data(V6, V3, V4, V5, V2, V1)), [], []).
% start location
start(pc(main-0-21)).
% error location
error(pc(main-err-0)).
% cutpoint locations
cutpoint(pc(main-1-22)). % line 22
% invariant templates
% bound var 
% bounding vars 
bounding_vars(data(V6, V3, V4, V5, V2, V1), []).
% cfg loop exit relation
cfg_exit_relation([]).
% 26 transitions
r(p(pc(main-0-21), data(V6, V3, V4, V5, V2, V1)), p(pc(main-2-0), data(V6p, V3p, V4p, V5p, V2p, V1p)), [], [V6p = V6, V3p = V3, V4p = V4, V5p = V5, V2p = V2, V1p = 4000], 1). % c1 := 4000
stmtsrc(1, 'c1=4000;').
transition_access( 1, [_, _, _, _, _, w] ).
r(p(pc(main-2-0), data(V6, V3, V4, V5, V2, V1)), p(pc(main-3-0), data(V6p, V3p, V4p, V5p, V2p, V1p)), [], [V6p = V6, V3p = V3, V4p = V4, V5p = V5, V2p = 2000, V1p = V1], 2). % c2 := 2000
stmtsrc(2, 'c2=2000;').
transition_access( 2, [_, _, _, _, w, _] ).
r(p(pc(main-3-0), data(V6, V3, V4, V5, V2, V1)), p(pc(main-4-0), data(V6p, V3p, V4p, V5p, V2p, V1p)), [], [V6p = V6, V3p =  _ , V4p = V4, V5p = V5, V2p = V2, V1p = V1], 3). % n := __BLAST_NONDET
stmtsrc(3, 'n=__BLAST_NONDET;').
transition_access( 3, [_, w, _, _, _, _] ).
r(p(pc(main-4-0), data(V6, V3, V4, V5, V2, V1)), p(pc(main-5-0), data(V6p, V3p, V4p, V5p, V2p, V1p)), [(V3 >= 1+ 0)], [V6p = V6, V3p = V3, V4p = V4, V5p = V5, V2p = V2, V1p = V1], 4). % n > 0
stmtsrc(4, 'assume(n > 0);').
transition_access( 4, [_, r, _, _, _, _] ).
r(p(pc(main-5-0), data(V6, V3, V4, V5, V2, V1)), p(pc(main-6-0), data(V6p, V3p, V4p, V5p, V2p, V1p)), [(V3 +1 =< 10)], [V6p = V6, V3p = V3, V4p = V4, V5p = V5, V2p = V2, V1p = V1], 5). % n < 10
stmtsrc(5, 'assume(n < 10);').
transition_access( 5, [_, r, _, _, _, _] ).
r(p(pc(main-6-0), data(V6, V3, V4, V5, V2, V1)), p(pc(main-7-0), data(V6p, V3p, V4p, V5p, V2p, V1p)), [], [V6p = V6, V3p = V3, V4p = 0, V5p = V5, V2p = V2, V1p = V1], 6). % k := 0
stmtsrc(6, 'k=0;').
transition_access( 6, [_, _, w, _, _, _] ).
r(p(pc(main-7-0), data(V6, V3, V4, V5, V2, V1)), p(pc(main-1-22), data(V6p, V3p, V4p, V5p, V2p, V1p)), [], [V6p = V6, V3p = V3, V4p = V4, V5p = 0, V2p = V2, V1p = V1], 7). % i := 0
stmtsrc(7, 'i=0;').
transition_access( 7, [_, _, _, w, _, _] ).
r(p(pc(main-1-22), data(V6, V3, V4, V5, V2, V1)), p(pc(main-10-22), data(V6p, V3p, V4p, V5p, V2p, V1p)), [], [V6p = V6, V3p = V3, V4p = V4, V5p = V5, V2p = V2, V1p = V1], 8). % 
stmtsrc(8, 'skip;').
transition_access( 8, [_, _, _, _, _, _] ).
r(p(pc(main-10-22), data(V6, V3, V4, V5, V2, V1)), p(pc(main-11-23), data(V6p, V3p, V4p, V5p, V2p, V1p)), [(V5 +1 =< V3)], [V6p = V6, V3p = V3, V4p = V4, V5p = V5, V2p = V2, V1p = V1], 9). % i < n
stmtsrc(9, 'assume(i < n);').
transition_access( 9, [_, r, _, r, _, _] ).
r(p(pc(main-10-22), data(V6, V3, V4, V5, V2, V1)), p(pc(main-12-22), data(V6p, V3p, V4p, V5p, V2p, V1p)), [(V5 >= V3)], [V6p = V6, V3p = V3, V4p = V4, V5p = V5, V2p = V2, V1p = V1], 10). % i >= n
stmtsrc(10, 'assume(i >= n);').
transition_access( 10, [_, r, _, r, _, _] ).
r(p(pc(main-11-23), data(V6, V3, V4, V5, V2, V1)), p(pc(main-13-24), data(V6p, V3p, V4p, V5p, V2p, V1p)), [], [V6p = V6, V3p = V3, V4p = V4, V5p = (V5 + 1), V2p = V2, V1p = V1], 11). % i := i + 1
stmtsrc(11, 'i=i + 1;').
transition_access( 11, [_, _, _, w, _, _] ).
