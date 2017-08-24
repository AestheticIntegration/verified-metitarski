(*Some arithmetic rewritings that Metitarski uses.
  Not only during "arithmetic" steps but also introduced when pretty-printing.
  These will hopefully be picked up by automated proof methods in Isar proofs.*)

theory Arithmetic
  imports Main Real
begin
  
section\<open>Rewritings introduced by MT pretty printing\<close>  
  
lemma not_less [intro]:
 "\<not> y < (x::real) \<Longrightarrow> x \<le> y"
  by auto
  
lemma not_less_eq [intro]: "\<not> y \<le> (x::real) \<Longrightarrow> x < y"
  by auto
    
(*lemma "1 + (x::real) \<le> 0 \<Longrightarrow> x \<le> -1"
  by simp*)
    
(*lemma "(x::real) < x*(1+x*(-1))*(1+x) \<Longrightarrow> 0<x*(x*(x*(-1)))"
  sledgehammer [provers = z3 cvc4]
*)
end
  