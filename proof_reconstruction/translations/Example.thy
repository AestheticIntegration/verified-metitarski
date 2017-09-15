theory Example
  imports Main Real Transcendental
    "~/Documents/internship/verified-metitarski/isabelle-proofs/AxiomsGeneral"
    "~~/src/HOL/Library/Sum_of_Squares"
    "~~/src/HOL/Eisbach/Eisbach"
begin
 
declare[[ML_print_depth=50]]  
  
ML
\<open>@{term "\<And>(X_000043::real) X_000044. X_000044 < - 1 + X_000043"}\<close>

ML
\<open>@{term "\<forall>(X_000043::real) X_000044. X_000044 < - 1 + X_000043"}\<close>  
 

lemma refute_28_lemm: "(- 1 + X_000050) / X_000050 < X_000051 \<or> X_000050 \<le> 0 \<or> X_000051 \<le> ln X_000050"
  sorry    
  
lemma "abs-problem-1": "\<forall>(X::real).(0\<le>X \<longrightarrow> abs(ln(1+X)-X) \<le> X^2)"
proof -
  {fix rr :: real
   have refute_28: "(- 1 + X_000050) / X_000050 < X_000051 \<or> X_000050 \<le> 0 \<or> X_000051 \<le> ln X_000050"
     sorry
   have refute_30_neg: "\<not> (- 1 + (1 + rr)) / (1 + rr) < rr * (1 + rr * - 1) \<and> \<not> 1 + rr \<le> 0 \<and> \<not> rr \<le> ln (1 + rr)"    
     sorry
   then have refute_24_neg: "\<not> ln (1 + rr) < rr * (1 + rr * - 1) \<and> \<not> rr \<le> ln (1 + rr)"
     using refute_28_lemm by fastforce
 }
   then show ?thesis
     sorry
 qed
   
lemma "\<forall>(X::real).(0\<le>X \<longrightarrow> abs(ln(1+X)-X) \<le> X^2)"
proof -
  {
    fix rr :: real
    assume "\<not> 0 < rr * (rr * (rr * - 1)) \<and> \<not> rr \<le> - 1"
    then have "\<not> rr < rr * (1 + rr * - 1) * (1 + rr) \<and> \<not> 1 + rr \<le> 0"
(*    sledgehammer [max_facts = 25, isar_proof] (add: algebra_simps)*)
     by(simp add: algebra_simps)
(*      sledgehammer[max_facts = 25]
      by (smt mult.commute mult.left_commute semiring_normalization_rules(2))*)
(*      by (smt mult.commute mult.left_commute semiring_normalization_rules(2)) ()*)
(*      by (smt mult.assoc mult.commute mult_minus_right semiring_normalization_rules(2)) *)
  }
  then show ?thesis
     sorry
 qed
  
(* Making a custom MT simpset*)   
named_theorems metitarski_simps "arithmetic simplification rules used by Metitarski"
 
declare power2_eq_square[metitarski_simps]    
  
lemma "\<forall>(X::real).(0\<le>X \<longrightarrow> abs(ln(1+X)-X) \<le> X^2)"
proof -
  {
    fix rr :: real
    assume "\<not> rr * rr < \<bar>rr * - 1 + ln (1 + rr)\<bar>"
    then have "\<not> rr\<^sup>2 < \<bar>ln (1 + rr) - rr\<bar>"
      by (force simp add: metitarski_simps)
  }
  then show ?thesis
     sorry
qed  

lemma "1 / 2 * (1 + 5 * (X_000060::real)) * (X_000060 - 1) = - 1 / 2 + X_000060 * (- 2 + X_000060 * (5 / 2))"  
  apply(simp add: algebra_simps divide_simps)
  done
    
 
(* Eisbach *)
method mt_arith = ((simp add: divide_simps split: if_splits); use nothing in sos)
  
notepad
begin
  fix rr :: real
  assume assm: "\<not> rr < 0 \<and> \<not> rr * (3 + rr * (5 / 2)) / (3 + rr * (4 + rr)) < rr * 2 / (2 + rr) \<and> \<not> rr \<le> - 1"
  then have "\<not> rr < 0 \<and> \<not> (- 1 / 2 + (1 + rr) * (- 2 + (1 + rr) * (5 / 2))) / ((1 + rr) * (2 + (1 + rr))) < rr * 2 / (2 + rr) \<and> \<not> 1 + rr \<le> 0" 
    by mt_arith
end      
        
notepad
begin  
  have " \<And>r ra X.\<not> (1 / 2 * (ra + 5) * (ra - 1) / (2 * ra + 1)) \<le> r \<or> r \<le> 0 \<or> ra \<le> (X::real)"  
    sorry
  then have " \<And>r ra X. (r::real) < (- 5 / 2 + ra * (2 + ra * (1 / 2))) / (1 + ra * 2) \<or> r \<le> 0 \<or> ra \<le> (X::real)"
    apply(subgoal_tac "\<forall>ra. (1 / 2 * (ra + 5) * (ra - 1) / (2 * ra + 1)) = 
      (- 5 / 2 + ra * (2 + ra * (1 / 2))) / (1 + ra * 2)")  
    
    apply (simp add: divide_simps)
    apply (atomize)    (*need to get rid of \<And> to apply if_splits*)
    apply (simp  split: if_splits)
      apply(sos)
    sorry
      
(*        
    using [[simp_trace_new mode=full]]
    using [[simp_break "?x \<or> ?y"]]
*)
end      
   
notepad
begin
  have "\<And>r ra. \<not> lgen False (1 / 2 * (ra + 5) * (ra - 1) / (2 * ra + 1)) r "  
    sorry
  then have "\<And>r ra. (r::real) < (- 5 / 2 + ra * (2 + ra * (1 / 2))) / (1 + ra * 2)"
    using [[simp_trace_new mode=full]]
    apply - 
    apply (simp  add: arith)
    sorry
end    

method mt_algebra = (simp; fail | simp add: field_simps)  
  
notepad
begin
  fix rr :: real
  assume "\<not> 0 < rr * rr \<and> \<not> rr \<le> - 1"
  then have "\<not> rr < rr * (1 + rr) \<and> \<not> 1 + rr \<le> 0"
    by mt_algebra
end  
  
notepad
begin
  fix rr :: real
  assume "\<not> ln (1 + rr) < rr * (1 + rr * - 2) \<and> \<not> rr \<le> ln (1 + rr)"
  then have "\<not> rr * (rr * 2) < - (rr * - 1 + ln (1 + rr)) \<and> \<not> 0 \<le> rr * - 1 + ln (1 + rr)"
    by mt_algebra   
end
  
notepad
begin
  fix rr :: real
  have "rr * (3 + rr * (5 / 2)) / (3 + rr * (4 + rr) + ln 2) = 
    (- 1 / 2 + (1 + rr) * (- 2 + (1 + rr) * (5 / 2))) / ((1 + rr) * (2 + (1 + rr)) + ln 2)"
    by(algebra)  
end  
  
  
notepad
begin
  fix rr :: real
  assume assm: "\<not> rr < 0 \<and> \<not> rr * (3 + rr * (5 / 2)) / (3 + rr * (4 + rr)) < rr * 2 / (2 + rr) \<and> \<not> rr \<le> - 1"
  then have "\<not> rr < 0 \<and> \<not> (- 1 / 2 + (1 + rr) * (- 2 + (1 + rr) * (5 / 2))) / ((1 + rr) * (2 + (1 + rr))) < rr * 2 / (2 + rr) \<and> \<not> 1 + rr \<le> 0"
    apply(subgoal_tac "rr * (3 + rr * (5 / 2)) / (3 + rr * (4 + rr)) = 
    (- 1 / 2 + (1 + rr) * (- 2 + (1 + rr) * (5 / 2))) / ((1 + rr) * (2 + (1 + rr)))")
     apply(auto)
      apply(algebra)
    done
end  
  
notepad
begin
  fix rr :: real
  assume assm: "\<not> rr < 0 \<and> \<not> rr * (3 + rr * (5 / 2)) / (3 + rr * (4 + rr)) < rr * 2 / (2 + rr) \<and> \<not> rr \<le> - 1"
  then have "\<not> rr < 0 \<and> \<not> (- 1 / 2 + (1 + rr) * (- 2 + (1 + rr) * (5 / 2))) / ((1 + rr) * (2 + (1 + rr))) < rr * 2 / (2 + rr) \<and> \<not> 1 + rr \<le> 0"
    apply ( -, use nothing in rule)
     apply(mt_algebra)
    apply(use nothing in rule)
     apply(drule conjE, assumption)
      back
     apply(drule conjE, assumption)
       
       apply(match premises in "\<not> a < b" for a :: real and b :: real \<Rightarrow> 
          \<open>match conclusion in "\<not> a' < b" for a' :: real \<Rightarrow> 
            \<open>rule ssubst [where ?s=a and ?t=a'], (algebra|simp)\<close>\<close>)
       apply(match premises in "\<not> a < b" for a :: real and b :: real \<Rightarrow> 
          \<open>match conclusion in "\<not> a < b'" for b' :: real \<Rightarrow> 
            \<open>rule ssubst [where ?s=b and ?t=b'], (algebra|simp)\<close>\<close>)   
       apply(assumption)
      apply(mt_algebra)
      done
        
end
  
end