Indentifying the record when using double trailing @@

INPUT
=====
   input id pay  @@;

   1 2000 2 2345
   4 2880 3 2385 2 7555 1 3790
   7 4532


EXAMPLE OUTPUT (add line number)
--------------------------------

                         |  RULW
  WORK.WANT total obs=7  |
                         |
    LINE    ID     PAY   |
                         |
      1      1    2000   | * from line 1
      1      2    2345   |
                         |
      2      4    2880   | * from line 2
      2      3    2385   |
      2      2    7555   |
      2      1    3790   |
                         |
      3      7    4532   | * from line 3


PROCESS
=======

data want;
  retain line 1;
  infile cards line=lyn;
  informat id 3. pay 5.;
  input id pay  @@;
  if lyn=2 then line=line+1;
cards4;
1 2000 2 2345
4 2880 3 2385 2 7555 1 3790
7 4532
;;;;
run;quit;


OUTPUT
======

 WORK.WANT total obs=7

  LINE    ID     PAY

    1      1    2000
    1      2    2345
    2      4    2880
    2      3    2385
    2      2    7555
    2      1    3790
    3      7    4532

* see above for input data and solution;




