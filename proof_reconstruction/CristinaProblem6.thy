theory CristinaProblem6
  imports Main
begin

datatype creature = socrates 
                   |other
fun man :: "creature \<Rightarrow> bool" where
   ax20: "man socrates = True"
 |"man other = False"
   
definition mortal :: "creature \<Rightarrow> bool" where
  ax10: "mortal x = man x"
  
  
lemma "mortal socrates"
(*Proof generated by tstp_parsing.ML*)
proof -
  have refute_0_00: "\<not> man socrates \<or> mortal socrates"
    using ax10 by metis
  then have refute_0_10: "man socrates"
    using ax20 by metis
  show  neg_goal0: "mortal socrates"
    using refute_0_10 refute_0_00 by metis
qed
  
end
  