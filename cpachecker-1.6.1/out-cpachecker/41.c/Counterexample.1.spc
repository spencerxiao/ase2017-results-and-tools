CONTROL AUTOMATON ErrorPath1

INITIAL STATE ARG0;

STATE USEFIRST ARG0 :
    MATCH "" -> GOTO ARG30;
    TRUE -> STOP;

STATE USEFIRST ARG30 :
    MATCH "extern int __VERIFIER_nondet_int();" -> GOTO ARG31_1_1;
STATE USEFIRST ARG31_0_1 :
    MATCH "extern int __VERIFIER_nondet_int();" -> GOTO ARG31_1_1;
STATE USEFIRST ARG31_1_1 :
    MATCH "void __VERIFIER_assume(int i)" -> GOTO ARG31_2_1;
STATE USEFIRST ARG31_2_1 :
    MATCH "int main(int n, int flag)" -> GOTO ARG31_3_1;
STATE USEFIRST ARG31_3_1 :
    MATCH "" -> ASSUME {flag == (1);n == (0);} GOTO ARG31;
    TRUE -> STOP;

STATE USEFIRST ARG31 :
    MATCH "__VERIFIER_assume(n>=0);" -> ASSUME {n == (0);flag == (1);} GOTO ARG32;
    TRUE -> STOP;

STATE USEFIRST ARG32 :
    MATCH "" -> ASSUME {i == (1);} GOTO ARG33;
    TRUE -> STOP;

STATE USEFIRST ARG33 :
    MATCH "" -> ASSUME {i == (1);} GOTO ARG60;
    TRUE -> STOP;

STATE USEFIRST ARG60 :
    MATCH "[!(i == 0)]" -> GOTO ARG62;
    TRUE -> STOP;

STATE USEFIRST ARG62 :
    MATCH "return;" -> GOTO ARG63;
    TRUE -> STOP;

STATE USEFIRST ARG63 :
    MATCH "" -> GOTO ARG64;
    TRUE -> STOP;

STATE USEFIRST ARG64 :
    MATCH "int k = 1;" -> ASSUME {k == (1);} GOTO ARG67;
    TRUE -> STOP;

STATE USEFIRST ARG67 :
    MATCH "[!(flag == 0)]" -> GOTO ARG69;
    MATCH "[flag == 0]" -> GOTO ARG73;
    TRUE -> STOP;

STATE USEFIRST ARG69 :
    MATCH "k = __VERIFIER_nondet_int();" -> ASSUME {k == (-2);} GOTO ARG70;
    TRUE -> STOP;

STATE USEFIRST ARG70 :
    MATCH "assume(k>=0);" -> GOTO ARG71;
    TRUE -> STOP;

STATE USEFIRST ARG71 :
    MATCH "" -> GOTO ARG73;
    TRUE -> STOP;

STATE USEFIRST ARG73 :
    MATCH "int i = 0, j = 0;" -> GOTO ARG74_1_2;
STATE USEFIRST ARG74_0_2 :
    MATCH "int i = 0, j = 0;" -> GOTO ARG74_1_2;
STATE USEFIRST ARG74_1_2 :
    MATCH "int i = 0, j = 0;" -> ASSUME {j == (0);i == (0);} GOTO ARG74;
    TRUE -> STOP;

STATE USEFIRST ARG74 :
    MATCH "" -> GOTO ARG76;
    TRUE -> STOP;

STATE USEFIRST ARG76 :
    MATCH "[i <= n]" -> GOTO ARG77;
    TRUE -> STOP;

STATE USEFIRST ARG77 :
    MATCH "i++;" -> GOTO ARG84_1_3;
STATE USEFIRST ARG84_0_3 :
    MATCH "i++;" -> GOTO ARG84_1_3;
STATE USEFIRST ARG84_1_3 :
    MATCH "i++;" -> GOTO ARG84_2_3;
STATE USEFIRST ARG84_2_3 :
    MATCH "i++;" -> GOTO ARG84_3_3;
STATE USEFIRST ARG84_3_3 :
    MATCH "j+=i;" -> ASSUME {i == (1);j == (1);} GOTO ARG84;
    TRUE -> STOP;

STATE USEFIRST ARG84 :
    MATCH "" -> GOTO ARG86;
    TRUE -> STOP;

STATE USEFIRST ARG86 :
    MATCH "[!(i <= n)]" -> GOTO ARG88;
    TRUE -> STOP;

STATE USEFIRST ARG88 :
    MATCH "int z = k + i + j;" -> ASSUME {z == (0);} GOTO ARG89;
    TRUE -> STOP;

STATE USEFIRST ARG89 :
    MATCH "[!(z > (2 * n))]" -> GOTO ARG91;
    TRUE -> STOP;

STATE USEFIRST ARG91 :
    MATCH "ERROR: goto ERROR;" -> ERROR;
    TRUE -> STOP;

STATE USEFIRST ARG93 :
    TRUE -> STOP;

END AUTOMATON