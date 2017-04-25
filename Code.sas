proc sql;
create table Analysis2014 as
select * from Health2014
where self_employed not like '%Yes';
quit;

proc sql;
delete from Analysis2014
where Age < 18 or Age > 75;
quit;

proc sql;
delete from Analysis2014
where Country not like '%United States%';
quit;

proc freq data = work.Analysis2014;
tables Gender;
run;

data work.Analysis2014;
set work.Analysis2014;
Male = . ;
if Gender = 'Cis Male' or Gender = 'M' or Gender = 'Mail' or Gender = 'Make' or Gender = 'Male' or Gender = 'Male (CI' or Gender = 'Male-ish' or Gender = 'Man' or Gender = 'cis male' or Gender = 'm' or Gender = 'maile' or Gender = 'male' or Gender = 'msle' then Male = 1;
else Male = 0;
run;

proc freq data =work.Analysis2014;
tables Male;
run;

data work.Analysis2014;
set work.Analysis2014;
OGender = . ;
if Gender ='Trans wo' or Gender = 'Trans-fe' or Gender = 'non-bina' or Gender = 'queer/sh'or Gender = 'Genderqu' then OGender = 1;
else OGender = 0;
run;

proc sql;
delete from Analysis2014
where OGender = 1;
quit;

proc freq data =work.Analysis2014;
tables OGender;
run;

proc freq data =work.Analysis2014;
tables family_history;
run;

data work.Analysis2014;
set work.Analysis2014;
Family_Hist = . ;
if family_history = 'Yes' then Family_Hist = 1;
if family_history = 'No' then Family_Hist = 0;
run;

proc freq data =work.Analysis2014;
tables Family_Hist;
run;

proc freq data =work.Analysis2014;
tables work_interfere;
run;

data work.Analysis2014;
set work.Analysis2014;
if work_interfere = 'Often' or work_interfere = 'Sometimes' then Work_Int = 1;
else Work_Int = 0;
run;

proc freq data =work.Analysis2014;
tables Work_Int;
run;

proc freq data =work.Analysis2014;
tables remote_work;
run;

data work.Analysis2014;
set work.Analysis2014;
if remote_work = 'Yes' then Remote_Wrk = 1;
else Remote_Wrk = 0;
run;

proc freq data =work.Analysis2014;
tables Remote_Wrk;
run;

data work.Analysis2014;
set work.Analysis2014;
if treatment = 'Yes' then Treatmnt = 1;
else Treatmnt = 0;
run;

proc freq data =work.Analysis2014;
tables Treatmnt;
run;

proc freq data =work.Analysis2014;
tables tech_company;
run;

data work.Analysis2014;
set work.Analysis2014;
if tech_company = 'Yes' then Tech_Comp = 1;
else Tech_Comp = 0;
run;

proc freq data =work.Analysis2014;
tables benefits;
run;

data work.Analysis2014;
set work.Analysis2014;
if benefits = 'Yes' then Benefit = 1;
else Benefit = 0;
run;

proc freq data =work.Analysis2014;
tables Benefit;
run;

proc freq data =work.Analysis2014;
tables care_options;
run;

data work.Analysis2014;
set work.Analysis2014;
if care_options = 'Yes' then Care_Option = 1;
else Care_Option = 0;
run;

proc freq data =work.Analysis2014;
tables Care_Option;
run;

proc freq data =work.Analysis2014;
tables wellness_program;
run;

data work.Analysis2014;
set work.Analysis2014;
if wellness_program = 'Yes' then Wellness_Prog = 1;
else Wellness_Prog = 0;
run;

proc freq data =work.Analysis2014;
tables Wellness_Prog;
run;

proc freq data =work.Analysis2014;
tables seek_help;
run;

data work.Analysis2014;
set work.Analysis2014;
if seek_help = 'Yes' then Seek_Hlp = 1;
else Seek_Hlp = 0;
run;

proc freq data =work.Analysis2014;
tables anonymity;
run;

data work.Analysis2014;
set work.Analysis2014;
if anonymity = 'Yes' then Anonym = 1;
else Anonym = 0;
run;

proc freq data =work.Analysis2014;
tables Anonym;
run;

proc freq data =work.Analysis2014;
tables leave;
run;

data work.Analysis2014;
set work.Analysis2014;
Leave_easy = .;
if leave = 'Very easy' then Leave_easy = 5;
else if leave = 'Somewhat easy' then Leave_easy = 4;
else if leave = "Don't know" then Leave_easy = 3;
else if leave = 'Somewhat difficult' then Leave_easy = 2;
else if leave = 'Very difficult' then Leave_easy = 1;
run;

proc freq data =work.Analysis2014;
tables Leave_easy;
run;

proc freq data =work.Analysis2014;
tables mental_health_consequence;
run;

data work.Analysis2014;
set work.Analysis2014;
if mental_health_consequence = 'No' then mental_conseq = 0;
else mental_conseq = 1;
run;

proc freq data =work.Analysis2014;
tables mental_conseq;
run;

proc freq data =work.Analysis2014;
tables phys_health_consequence;
run;

data work.Analysis2014;
set work.Analysis2014;
if phys_health_consequence = 'No' then phys_conseq = 0;
else phys_conseq = 1;
run;

proc freq data =work.Analysis2014;
tables phys_conseq;
run;

proc freq data =work.Analysis2014;
tables coworkers;
run;

data work.Analysis2014;
set work.Analysis2014;
if coworkers = 'No' then cowork = 0;
else cowork = 1;
run;

proc freq data =work.Analysis2014;
tables cowork;
run;

proc freq data =work.Analysis2014;
tables supervisor;
run;

data work.Analysis2014;
set work.Analysis2014;
if supervisor = 'No' then superv = 0;
else superv = 1;
run;

proc freq data =work.Analysis2014;
tables superv;
run;

proc freq data =work.Analysis2014;
tables mental_health_interview;
run;

data work.Analysis2014;
set work.Analysis2014;
if mental_health_interview = 'Yes' then mental_interv = 1;
else mental_interv = 0;
run;

proc freq data =work.Analysis2014;
tables mental_interv;
run;

proc freq data =work.Analysis2014;
tables phys_health_interview;
run;

data work.Analysis2014;
set work.Analysis2014;
if phys_health_interview = 'Yes' then phys_interv = 1;
else phys_interv = 0;
run;

proc freq data =work.Analysis2014;
tables phys_interv;
run;

proc freq data =work.Analysis2014;
tables mental_vs_physical;
run;

data work.Analysis2014;
set work.Analysis2014;
if mental_vs_physical = 'Yes' then ment_vs_phys = 1;
else ment_vs_phys = 0;
run;

proc freq data =work.Analysis2014;
tables ment_vs_phys;
run;

proc freq data =work.Analysis2014;
tables obs_consequence;
run;

data work.Analysis2014;
set work.Analysis2014;
if obs_consequence = 'Yes' then obs_conseq = 1;
else obs_conseq = 0;
run;

proc freq data =work.Analysis2014;
tables obs_conseq;
run;

proc corr data = work.Analysis2014;
var Treatmnt Age Male Remote_Wrk Family_Hist Benefit Care_Option Wellness_Prog Seek_Hlp Anonym Leave_easy ;
run;

proc reg data = work.Analysis2014;
model Treatmnt = Age Male Remote_Wrk Family_Hist Benefit Care_Option Wellness_Prog Seek_Hlp Anonym Leave_easy /vif;
run;

proc corr alpha data=Analysis2014;
var Benefit Care_Option;
run;

proc corr alpha data=Analysis2014;
var Wellness_Prog Seek_Hlp;
run;

proc factor METHOD=p ROTATE=v CORR RES n=8 data=Analysis2014;

var Age Male Remote_Wrk Family_Hist Benefit Care_Option Wellness_Prog Seek_Hlp Anonym Leave_easy;
run;

proc factor METHOD=p ROTATE=v CORR RES n=8 data=Analysis2014 out=Analysis2014;

var Age Male Remote_Wrk Family_Hist Benefit Care_Option Wellness_Prog Seek_Hlp Anonym Leave_easy;
run;

data work.Analysis2014;
set work.Analysis2014;
rename Factor1=WP_SH Factor2=Ben_CO;
run;

proc logistic data = work.Analysis2014 descending;
model Treatmnt = Age Male Remote_Wrk Family_Hist Ben_CO WP_SH Anonym Leave_easy;
run;


proc gchart data=Coeff;
axis1 stagger label=none;
footnote h=.02 in ' ';
vbar Variable/ sumvar=Odds maxis=axis1;
run;
