theory Isar
  imports Main
begin

ML_file "~/Documents/internship/verified-metitarski/proof_reconstruction/tstp_input.ML"  
(*ML_file "~/Documents/internship/verified-metitarski/proof_reconstruction/tstp_parsing.ML"*)

ML\<open>
ATP_Satallax.atp_proof_of_tstplike_proof "1" [("2", [ATP_Problem.Class_Decl("3", "4", [])])] 
    (TSTP_Input.read "Documents/internship/verified-metitarski/problems/cristina-problem-5.tstpout") 
\<close>
  
ML\<open>Sledgehammer_Prover_ATP.run_atp   Sledgehammer_Prover.Try   ""\<close>  
  
end
  