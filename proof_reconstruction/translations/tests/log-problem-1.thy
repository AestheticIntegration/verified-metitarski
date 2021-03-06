theory "log-problem-1"
  imports "../GenerateATP"
begin
  
lemma "\<forall>(X::real).((Not((X <= 1)) --> (1 <= ln((279/100 + ln(X))))))"  
  apply(tactic {*fn st => (writeln (isar_proof st [] @{context}); Seq.single st) *})
proof -
  { fix rr :: real
    have ff1: "- 379 / 50 < (- 1 + rr) / rr \<or> - 1 + rr \<le> - 379 / 50 * rr \<or> rr \<le> 0"
      using leq_right_mul_divide_pos by blast (* 8 ms *)
    have ff2: "- 437 / 150 < (- 1 + rr) / rr \<or> - 1 + rr \<le> - 437 / 150 * rr \<or> rr \<le> 0"
      using leq_right_mul_divide_pos by blast (* 4 ms *)
    have ff3: "- 279 / 100 < (- 1 + rr) / rr \<or> - 1 + rr \<le> - 279 / 100 * rr \<or> rr \<le> 0"
      using leq_right_mul_divide_pos by blast (* 0.0 ms *)
    have ff4: "379 / 50 + rr * (- 209441 / 10000) < (1 + rr * (- 2 + rr)) / rr \<or> 1 + rr * (- 2 + rr) \<le> (379 / 50 + rr * (- 209441 / 10000)) * rr \<or> rr \<le> 0"
      using leq_right_mul_divide_pos by blast (* 4 ms *)
    have ff5: "rr * (- 437 / 100 + rr * (87723 / 20000)) < (- 1 + rr) * (3 / 2 + rr * (- 3 / 2)) \<or> 0 \<le> 3 / 2 + rr * (- 3 / 2) \<or> rr * (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<le> - 1 + rr"
      using leq_right_divide_mul_neg by blast (* 4 ms *)
    have ff6: "(379 / 50 + rr * (- 209441 / 10000)) / (- 1 + rr) < (- 1 + rr) / rr \<or> (- 1 + rr) / rr * (- 1 + rr) \<le> 379 / 50 + rr * (- 209441 / 10000) \<or> - 1 + rr \<le> 0"
      using leq_left_mul_divide_pos by blast (* 4 ms *)
    have ff7: "- 1 + rr < (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) * rr \<or> (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<le> (- 1 + rr) / rr \<or> rr \<le> 0"
      using leq_right_divide_mul_pos by blast (* 4 ms *)
    have ff8: "\<And>r ra. ra < ln r \<or> \<not> lgen True ra (ln r)"
      using lgen_less_neg by auto (* 0.0 ms *)
    have "\<And>r ra. \<not> lgen True ra ((r - 1) / r) \<or> r \<le> 0 \<or> lgen True ra (ln r)"
      using ln_lower_bound_cf1 by blast (* 4 ms *)
    then have "\<And>r ra. ra < ln r \<or> \<not> lgen True ra ((r - 1) / r) \<or> r \<le> 0"
      using ff8 by metis (* 4 ms *)
    then have ff9: "\<And>r ra. (ra::real) < ln r \<or> r \<le> 0 \<or> (- 1 + r) / r \<le> ra"
      by mt_arith_rule (* failed *)
    then have ff10: "- 379 / 50 < ln rr \<or> (- 1 + rr) / rr \<le> - 379 / 50 \<or> rr \<le> 0"
      by blast (* 0.0 ms *)
    have ff11: "- 437 / 150 < ln rr \<or> (- 1 + rr) / rr \<le> - 437 / 150 \<or> rr \<le> 0"
      using ff9 by auto (* 4 ms *)
    have ff12: "- 279 / 100 < ln rr \<or> (- 1 + rr) / rr \<le> - 279 / 100 \<or> rr \<le> 0"
      using ff9 by blast (* 0.0 ms *)
    have ff13: "(379 / 50 + rr * (- 209441 / 10000)) / (- 1 + rr) < ln rr \<or> (- 1 + rr) / rr \<le> (379 / 50 + rr * (- 209441 / 10000)) / (- 1 + rr) \<or> rr \<le> 0"
      using ff9 by blast (* 0.0 ms *)
    have ff14: "\<And>r ra. \<not> lgen False ra (ln r) \<or> ra \<le> ln r"
      using lgen_le_neg by blast (* 0.0 ms *)
    have "\<And>r ra. \<not> lgen False ra ((r - 1) / r) \<or> r \<le> 0 \<or> lgen False ra (ln r)"
      using ln_lower_bound_cf1 by blast (* 0.0 ms *)
    then have "\<And>r ra. \<not> lgen False ra ((r - 1) / r) \<or> r \<le> 0 \<or> ra \<le> ln r"
      using ff14 by auto (* 4 ms *)
    then have ff15: "\<And>r ra. (- (1::real) + ra) / ra < r \<or> ra \<le> 0 \<or> r \<le> ln ra"
      by mt_arith_rule (* failed *)
    then have ff16: "(- 1 + rr) / rr < (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<or> (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<le> ln rr \<or> rr \<le> 0"
      by blast (* 4 ms *)
    have ff17: "1 + rr * - 1 < rr * (133641 / 10000) / (379 / 50 + ln rr) \<or> rr * (133641 / 10000) \<le> (1 + rr * - 1) * (379 / 50 + ln rr) \<or> 379 / 50 + ln rr \<le> 0"
      using leq_right_mul_divide_pos by blast (* 4 ms *)
    have ff18: "rr * (323 / 20000) < (- 1 + rr) * (- 437 / 100 + ln rr * (- 3 / 2)) \<or> 0 \<le> - 437 / 100 + ln rr * (- 3 / 2) \<or> rr * (323 / 20000) / (- 437 / 100 + ln rr * (- 3 / 2)) \<le> - 1 + rr"
      using leq_right_divide_mul_neg by blast (* 4 ms *)
    have ff19: "- 133641 / 10000 / (379 / 50 + ln rr) < (- 1 + rr) / rr \<or> - 1 + rr \<le> - 133641 / 10000 / (379 / 50 + ln rr) * rr \<or> rr \<le> 0"
      using leq_right_mul_divide_pos by blast (* 4 ms *)
    have ff20: "- 1 + rr < 323 / 20000 / (- 437 / 100 + ln rr * (- 3 / 2)) * rr \<or> 323 / 20000 / (- 437 / 100 + ln rr * (- 3 / 2)) \<le> (- 1 + rr) / rr \<or> rr \<le> 0"
      using leq_right_divide_mul_pos by blast (* 4 ms *)
    have ff21: "- 133641 / 10000 / (379 / 50 + ln rr) < ln rr \<or> (- 1 + rr) / rr \<le> - 133641 / 10000 / (379 / 50 + ln rr) \<or> rr \<le> 0"
      using ff9 by blast (* 4 ms *)
    have ff22: "(- 1 + rr) / rr < 323 / 20000 / (- 437 / 100 + ln rr * (- 3 / 2)) \<or> 323 / 20000 / (- 437 / 100 + ln rr * (- 3 / 2)) \<le> ln rr \<or> rr \<le> 0"
      using ff15 by blast (* 4 ms *)
    have ff23: "53521 / 4000 + ln rr * (239 / 20 + ln rr * (5 / 2)) < 1 * (133641 / 10000 + ln rr * (379 / 50 + ln rr)) \<or> 1 \<le> (53521 / 4000 + ln rr * (239 / 20 + ln rr * (5 / 2))) / (133641 / 10000 + ln rr * (379 / 50 + ln rr)) \<or> 133641 / 10000 + ln rr * (379 / 50 + ln rr) \<le> 0"
      using leq_right_divide_mul_pos by blast (* 4 ms *)
    have ff24: "\<And>r ra. \<not> lgen False ra (ln r) \<or> ra \<le> ln r"
      using lgen_le_neg by auto (* 0.0 ms *)
    have "\<And>r ra. \<not> lgen False ra (1 / 2 * (1 + 5 * r) * (r - 1) / (r * (2 + r))) \<or> r \<le> 0 \<or> lgen False ra (ln r)"
      using ln_lower_bound_cf3 by blast (* 4 ms *)
    then have "\<And>r ra. \<not> lgen False ra (1 / 2 * (1 + 5 * r) * (r - 1) / (r * (2 + r))) \<or> r \<le> 0 \<or> ra \<le> ln r"
      using ff24 by blast (* 4 ms *)
    then have "\<And>r ra. (- (1::real) / 2 + ra * (- 2 + ra * (5 / 2))) / (ra * (2 + ra)) < r \<or> ra \<le> 0 \<or> r \<le> ln ra"
      by mt_arith_rule (* failed *)
    then have ff25: "(- 1 / 2 + (279 / 100 + ln rr) * (- 2 + (279 / 100 + ln rr) * (5 / 2))) / ((279 / 100 + ln rr) * (2 + (279 / 100 + ln rr))) < 1 \<or> 1 \<le> ln (279 / 100 + ln rr) \<or> 279 / 100 + ln rr \<le> 0"
      by blast (* 4 ms *)
    have "\<not> 50 / 429 < rr \<or> \<not> rr \<le> 50 / 429"
      by simp (* 8 ms *)
    moreover
    { assume "\<not> rr \<le> 50 / 429"
      then have "\<not> 0 < rr \<and> \<not> rr \<le> 50 / 429 \<or> \<not> rr \<le> 0 \<and> \<not> rr \<le> 50 / 429"
        by force (* 4 ms *)
      moreover
      { assume "\<not> rr \<le> 0 \<and> \<not> rr \<le> 50 / 429"
        then have "\<not> - 1 + rr \<le> - 379 / 50 * rr \<and> \<not> rr \<le> 0"
          by mt_arith_rule (* 16 ms *)
        then have "\<not> (- 1 + rr) / rr \<le> - 379 / 50"
          using ff1 by simp (* 36 ms *)
        then have "150 / 587 < rr \<longrightarrow> \<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> rr \<le> 150 / 587"
          by auto (* 12 ms *)
        moreover
        { assume "\<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> rr \<le> 150 / 587"
          then have "\<not> 0 < rr \<and> \<not> rr \<le> 150 / 587 \<or> \<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> rr \<le> 0 \<and> \<not> rr \<le> 150 / 587"
            by force (* 8 ms *)
          moreover
          { assume "\<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> rr \<le> 0 \<and> \<not> rr \<le> 150 / 587"
            then have "\<not> - 1 + rr \<le> - 437 / 150 * rr \<and> \<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> rr \<le> 0"
              by mt_arith_rule (* 36 ms *)
            then have "\<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150"
              using ff2 by force (* 92 ms *)
            then have "100 / 379 < rr \<longrightarrow> \<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> rr \<le> 100 / 379"
              by auto (* 8 ms *)
            moreover
            { assume "\<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> rr \<le> 100 / 379"
              then have "\<not> 0 < rr \<and> \<not> rr \<le> 100 / 379 \<or> \<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> rr \<le> 0 \<and> \<not> rr \<le> 100 / 379"
                by auto (* 16 ms *)
              moreover
              { assume "\<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> rr \<le> 0 \<and> \<not> rr \<le> 100 / 379"
                then have "\<not> - 1 + rr \<le> - 279 / 100 * rr \<and> \<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> rr \<le> 0"
                  by mt_arith_rule (* 68 ms *)
                then have "\<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100"
                  using ff3 by simp (* 136 ms *)
                then have "0 < rr \<longrightarrow> \<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100 \<and> \<not> rr \<le> 0"
                  by fastforce (* 12 ms *)
                moreover
                { assume "\<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100 \<and> \<not> rr \<le> 0"
                  then have "\<not> - 1 < rr * (- 479 / 50 + rr * (219441 / 10000)) \<and> \<not> rr \<le> 0 \<or> \<not> rr * (- 479 / 50 + rr * (219441 / 10000)) \<le> - 1 \<and> \<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100 \<and> \<not> rr \<le> 0"
                    by simp (* 24 ms *)
                  moreover
                  { assume "\<not> rr * (- 479 / 50 + rr * (219441 / 10000)) \<le> - 1 \<and> \<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100 \<and> \<not> rr \<le> 0"
                    then have "\<not> 1 + rr * (- 2 + rr) \<le> (379 / 50 + rr * (- 209441 / 10000)) * rr \<and> \<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100 \<and> \<not> rr \<le> 0"
                      by mt_arith_rule (* 208 ms *)
                    then have "\<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100 \<and> \<not> (1 + rr * (- 2 + rr)) / rr \<le> 379 / 50 + rr * (- 209441 / 10000)"
                      using ff4 by auto (* 76 ms *)
                    then have "1 < rr \<longrightarrow> \<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100 \<and> \<not> (1 + rr * (- 2 + rr)) / rr \<le> 379 / 50 + rr * (- 209441 / 10000) \<and> \<not> rr \<le> 1"
                      by auto (* 12 ms *)
                    moreover
                    { assume "\<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100 \<and> \<not> (1 + rr * (- 2 + rr)) / rr \<le> 379 / 50 + rr * (- 209441 / 10000) \<and> \<not> rr \<le> 1"
                      then have "\<not> rr * (737 / 100 + rr * (- 117723 / 20000)) \<le> 3 / 2 \<and> \<not> rr \<le> 1 \<or> \<not> 3 / 2 < rr * (737 / 100 + rr * (- 117723 / 20000)) \<and> \<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100 \<and> \<not> (1 + rr * (- 2 + rr)) / rr \<le> 379 / 50 + rr * (- 209441 / 10000) \<and> \<not> rr \<le> 1"
                        by simp (* 40 ms *)
                      moreover
                      { assume "\<not> 3 / 2 < rr * (737 / 100 + rr * (- 117723 / 20000)) \<and> \<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100 \<and> \<not> (1 + rr * (- 2 + rr)) / rr \<le> 379 / 50 + rr * (- 209441 / 10000) \<and> \<not> rr \<le> 1"
                        then have "\<not> rr * (- 437 / 100 + rr * (87723 / 20000)) < (- 1 + rr) * (3 / 2 + rr * (- 3 / 2)) \<and> \<not> 0 \<le> 3 / 2 + rr * (- 3 / 2) \<and> \<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100 \<and> \<not> (1 + rr * (- 2 + rr)) / rr \<le> 379 / 50 + rr * (- 209441 / 10000)"
                          by mt_arith_rule (* 348 ms *)
                        then have "\<not> - 1 + rr < rr * (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100 \<and> \<not> (1 + rr * (- 2 + rr)) / rr \<le> 379 / 50 + rr * (- 209441 / 10000)"
                          using ff5 by auto (* 56 ms *)
                        then have "1 < rr \<longrightarrow> \<not> - 1 + rr < rr * (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100 \<and> \<not> (1 + rr * (- 2 + rr)) / rr \<le> 379 / 50 + rr * (- 209441 / 10000) \<and> \<not> rr \<le> 1"
                          by auto (* 20 ms *)
                        moreover
                        { assume "\<not> - 1 + rr < rr * (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100 \<and> \<not> (1 + rr * (- 2 + rr)) / rr \<le> 379 / 50 + rr * (- 209441 / 10000) \<and> \<not> rr \<le> 1"
                          then have "\<not> - 1 + rr < rr * (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> (- 1 + rr) / rr * (- 1 + rr) \<le> 379 / 50 + rr * (- 209441 / 10000) \<and> \<not> - 1 + rr \<le> 0 \<and> \<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100"
                            by mt_arith_rule (* 416 ms *)
                          then have "\<not> - 1 + rr < rr * (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100 \<and> \<not> (- 1 + rr) / rr \<le> (379 / 50 + rr * (- 209441 / 10000)) / (- 1 + rr)"
                            using ff6 by auto (* 56 ms *)
                          then have "0 < rr \<longrightarrow> \<not> - 1 + rr < rr * (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100 \<and> \<not> (- 1 + rr) / rr \<le> (379 / 50 + rr * (- 209441 / 10000)) / (- 1 + rr) \<and> \<not> rr \<le> 0"
                            by simp (* 16 ms *)
                          moreover
                          { assume "\<not> - 1 + rr < rr * (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100 \<and> \<not> (- 1 + rr) / rr \<le> (379 / 50 + rr * (- 209441 / 10000)) / (- 1 + rr) \<and> \<not> rr \<le> 0"
                            then have "\<not> - 1 + rr < (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) * rr \<and> \<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100 \<and> \<not> (- 1 + rr) / rr \<le> (379 / 50 + rr * (- 209441 / 10000)) / (- 1 + rr) \<and> \<not> rr \<le> 0"
                              by mt_arith_rule (* 688 ms *)
                            then have "\<not> (- 1 + rr) / rr < (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100 \<and> \<not> (- 1 + rr) / rr \<le> (379 / 50 + rr * (- 209441 / 10000)) / (- 1 + rr)"
                              using ff7 by auto (* 48 ms *)
                            then have "0 < rr \<longrightarrow> \<not> (- 1 + rr) / rr < (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100 \<and> \<not> (- 1 + rr) / rr \<le> (379 / 50 + rr * (- 209441 / 10000)) / (- 1 + rr) \<and> \<not> rr \<le> 0"
                              by auto (* 28 ms *)
                            moreover
                            { assume "\<not> (- 1 + rr) / rr < (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> (- 1 + rr) / rr \<le> - 379 / 50 \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100 \<and> \<not> (- 1 + rr) / rr \<le> (379 / 50 + rr * (- 209441 / 10000)) / (- 1 + rr) \<and> \<not> rr \<le> 0"
                              then have "\<not> (- 1 + rr) / rr < (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100 \<and> \<not> (- 1 + rr) / rr \<le> (379 / 50 + rr * (- 209441 / 10000)) / (- 1 + rr) \<and> \<not> ln rr \<le> - 379 / 50"
                                using ff10 by simp (* 36 ms *)
                              then have "0 < rr \<longrightarrow> \<not> (- 1 + rr) / rr < (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100 \<and> \<not> (- 1 + rr) / rr \<le> (379 / 50 + rr * (- 209441 / 10000)) / (- 1 + rr) \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> rr \<le> 0"
                                by fastforce (* 28 ms *)
                              moreover
                              { assume "\<not> (- 1 + rr) / rr < (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> (- 1 + rr) / rr \<le> - 437 / 150 \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100 \<and> \<not> (- 1 + rr) / rr \<le> (379 / 50 + rr * (- 209441 / 10000)) / (- 1 + rr) \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> rr \<le> 0"
                                then have "\<not> (- 1 + rr) / rr < (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100 \<and> \<not> (- 1 + rr) / rr \<le> (379 / 50 + rr * (- 209441 / 10000)) / (- 1 + rr) \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150"
                                  using ff11 by force (* 52 ms *)
                                then have "0 < rr \<longrightarrow> \<not> (- 1 + rr) / rr < (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100 \<and> \<not> (- 1 + rr) / rr \<le> (379 / 50 + rr * (- 209441 / 10000)) / (- 1 + rr) \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> rr \<le> 0"
                                  by force (* 12 ms *)
                                moreover
                                { assume "\<not> (- 1 + rr) / rr < (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> (- 1 + rr) / rr \<le> - 279 / 100 \<and> \<not> (- 1 + rr) / rr \<le> (379 / 50 + rr * (- 209441 / 10000)) / (- 1 + rr) \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> rr \<le> 0"
                                  then have "\<not> (- 1 + rr) / rr < (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> (- 1 + rr) / rr \<le> (379 / 50 + rr * (- 209441 / 10000)) / (- 1 + rr) \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100"
                                    using ff12 by force (* 48 ms *)
                                  then have "0 < rr \<longrightarrow> \<not> (- 1 + rr) / rr < (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> (- 1 + rr) / rr \<le> (379 / 50 + rr * (- 209441 / 10000)) / (- 1 + rr) \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100 \<and> \<not> rr \<le> 0"
                                    by fastforce (* 12 ms *)
                                  moreover
                                  { assume "\<not> (- 1 + rr) / rr < (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> (- 1 + rr) / rr \<le> (379 / 50 + rr * (- 209441 / 10000)) / (- 1 + rr) \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100 \<and> \<not> rr \<le> 0"
                                    then have "\<not> (- 1 + rr) / rr < (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100 \<and> \<not> ln rr \<le> (379 / 50 + rr * (- 209441 / 10000)) / (- 1 + rr)"
                                      using ff13 by auto (* 40 ms *)
                                    then have "1 < rr \<longrightarrow> \<not> (- 1 + rr) / rr < (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100 \<and> \<not> ln rr \<le> (379 / 50 + rr * (- 209441 / 10000)) / (- 1 + rr) \<and> \<not> rr \<le> 1"
                                      by simp (* 16 ms *)
                                    moreover
                                    { assume "\<not> (- 1 + rr) / rr < (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100 \<and> \<not> ln rr \<le> (379 / 50 + rr * (- 209441 / 10000)) / (- 1 + rr) \<and> \<not> rr \<le> 1"
                                      then have "\<not> (- 1 + rr) / rr < (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> ln rr * (- 1 + rr) \<le> 379 / 50 + rr * (- 209441 / 10000) \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100"
                                        by mt_arith_rule (* 448 ms *)
                                      then have "0 < rr \<longrightarrow> \<not> (- 1 + rr) / rr < (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> ln rr * (- 1 + rr) \<le> 379 / 50 + rr * (- 209441 / 10000) \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100 \<and> \<not> rr \<le> 0"
                                        by fastforce (* 20 ms *)
                                      moreover
                                      { assume "\<not> (- 1 + rr) / rr < (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> ln rr * (- 1 + rr) \<le> 379 / 50 + rr * (- 209441 / 10000) \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100 \<and> \<not> rr \<le> 0"
                                        then have "\<not> ln rr < (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> ln rr * (- 1 + rr) \<le> 379 / 50 + rr * (- 209441 / 10000) \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100"
                                          using ff16 by auto (* 60 ms *)
                                        then have "1 < rr \<longrightarrow> \<not> ln rr < (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> ln rr * (- 1 + rr) \<le> 379 / 50 + rr * (- 209441 / 10000) \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100 \<and> \<not> rr \<le> 1"
                                          by auto (* 16 ms *)
                                        moreover
                                        { assume "\<not> ln rr < (- 437 / 100 + rr * (87723 / 20000)) / (3 / 2 + rr * (- 3 / 2)) \<and> \<not> ln rr * (- 1 + rr) \<le> 379 / 50 + rr * (- 209441 / 10000) \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100 \<and> \<not> rr \<le> 1"
                                          then have "\<not> - 437 / 100 + rr * (87723 / 20000) < ln rr * (3 / 2 + rr * (- 3 / 2)) \<and> \<not> ln rr * (- 1 + rr) \<le> 379 / 50 + rr * (- 209441 / 10000) \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100"
                                            by mt_arith_rule (* 188 ms *)
                                          then have "\<not> - 437 / 100 + rr * (87723 / 20000) < ln rr * (3 / 2 + rr * (- 3 / 2)) \<and> \<not> rr * (133641 / 10000) \<le> (1 + rr * - 1) * (379 / 50 + ln rr) \<and> \<not> 379 / 50 + ln rr \<le> 0 \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100"
                                            by mt_arith_rule (* 124 ms *)
                                          then have "\<not> - 437 / 100 + rr * (87723 / 20000) < ln rr * (3 / 2 + rr * (- 3 / 2)) \<and> \<not> rr * (133641 / 10000) / (379 / 50 + ln rr) \<le> 1 + rr * - 1 \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100"
                                            using ff17 by simp (* 60 ms *)
                                          then have "\<not> rr * (323 / 20000) < (- 1 + rr) * (- 437 / 100 + ln rr * (- 3 / 2)) \<and> \<not> 0 \<le> - 437 / 100 + ln rr * (- 3 / 2) \<and> \<not> rr * (133641 / 10000) / (379 / 50 + ln rr) \<le> 1 + rr * - 1 \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100"
                                            by mt_arith_rule (* 220 ms *)
                                          then have "\<not> - 1 + rr < rr * (323 / 20000) / (- 437 / 100 + ln rr * (- 3 / 2)) \<and> \<not> rr * (133641 / 10000) / (379 / 50 + ln rr) \<le> 1 + rr * - 1 \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100"
                                            using ff18 by simp (* 84 ms *)
                                          then have "0 < rr \<longrightarrow> \<not> - 1 + rr < rr * (323 / 20000) / (- 437 / 100 + ln rr * (- 3 / 2)) \<and> \<not> rr * (133641 / 10000) / (379 / 50 + ln rr) \<le> 1 + rr * - 1 \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100 \<and> \<not> rr \<le> 0"
                                            by force (* 44 ms *)
                                          moreover
                                          { assume "\<not> - 1 + rr < rr * (323 / 20000) / (- 437 / 100 + ln rr * (- 3 / 2)) \<and> \<not> rr * (133641 / 10000) / (379 / 50 + ln rr) \<le> 1 + rr * - 1 \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100 \<and> \<not> rr \<le> 0"
                                            then have "\<not> - 1 + rr < rr * (323 / 20000) / (- 437 / 100 + ln rr * (- 3 / 2)) \<and> \<not> - 1 + rr \<le> - 133641 / 10000 / (379 / 50 + ln rr) * rr \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100 \<and> \<not> rr \<le> 0"
                                              by mt_arith_rule (* 380 ms *)
                                            then have "\<not> - 1 + rr < rr * (323 / 20000) / (- 437 / 100 + ln rr * (- 3 / 2)) \<and> \<not> (- 1 + rr) / rr \<le> - 133641 / 10000 / (379 / 50 + ln rr) \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100"
                                              using ff19 by auto (* 84 ms *)
                                            then have "0 < rr \<longrightarrow> \<not> - 1 + rr < rr * (323 / 20000) / (- 437 / 100 + ln rr * (- 3 / 2)) \<and> \<not> (- 1 + rr) / rr \<le> - 133641 / 10000 / (379 / 50 + ln rr) \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100 \<and> \<not> rr \<le> 0"
                                              by force (* 24 ms *)
                                            moreover
                                            { assume "\<not> - 1 + rr < rr * (323 / 20000) / (- 437 / 100 + ln rr * (- 3 / 2)) \<and> \<not> (- 1 + rr) / rr \<le> - 133641 / 10000 / (379 / 50 + ln rr) \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100 \<and> \<not> rr \<le> 0"
                                              then have "\<not> - 1 + rr < 323 / 20000 / (- 437 / 100 + ln rr * (- 3 / 2)) * rr \<and> \<not> (- 1 + rr) / rr \<le> - 133641 / 10000 / (379 / 50 + ln rr) \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100 \<and> \<not> rr \<le> 0"
                                                by mt_arith_rule (* 248 ms *)
                                              then have "\<not> (- 1 + rr) / rr < 323 / 20000 / (- 437 / 100 + ln rr * (- 3 / 2)) \<and> \<not> (- 1 + rr) / rr \<le> - 133641 / 10000 / (379 / 50 + ln rr) \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100"
                                                using ff20 by auto (* 88 ms *)
                                              then have "0 < rr \<longrightarrow> \<not> (- 1 + rr) / rr < 323 / 20000 / (- 437 / 100 + ln rr * (- 3 / 2)) \<and> \<not> (- 1 + rr) / rr \<le> - 133641 / 10000 / (379 / 50 + ln rr) \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100 \<and> \<not> rr \<le> 0"
                                                by fastforce (* 28 ms *)
                                              moreover
                                              { assume "\<not> (- 1 + rr) / rr < 323 / 20000 / (- 437 / 100 + ln rr * (- 3 / 2)) \<and> \<not> (- 1 + rr) / rr \<le> - 133641 / 10000 / (379 / 50 + ln rr) \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100 \<and> \<not> rr \<le> 0"
                                                then have "\<not> (- 1 + rr) / rr < 323 / 20000 / (- 437 / 100 + ln rr * (- 3 / 2)) \<and> \<not> ln rr \<le> - 379 / 50 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100 \<and> \<not> ln rr \<le> - 133641 / 10000 / (379 / 50 + ln rr)"
                                                  using ff21 by simp (* 88 ms *)
                                                then have "\<not> (- 1 + rr) / rr < 323 / 20000 / (- 437 / 100 + ln rr * (- 3 / 2)) \<and> \<not> ln rr * (379 / 50 + ln rr) \<le> - 133641 / 10000 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100"
                                                  by mt_arith_rule (* 788 ms *)
                                                then have "0 < rr \<longrightarrow> \<not> (- 1 + rr) / rr < 323 / 20000 / (- 437 / 100 + ln rr * (- 3 / 2)) \<and> \<not> ln rr * (379 / 50 + ln rr) \<le> - 133641 / 10000 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100 \<and> \<not> rr \<le> 0"
                                                  by fastforce (* 28 ms *)
                                                moreover
                                                { assume "\<not> (- 1 + rr) / rr < 323 / 20000 / (- 437 / 100 + ln rr * (- 3 / 2)) \<and> \<not> ln rr * (379 / 50 + ln rr) \<le> - 133641 / 10000 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100 \<and> \<not> rr \<le> 0"
                                                  then have "\<not> ln rr < 323 / 20000 / (- 437 / 100 + ln rr * (- 3 / 2)) \<and> \<not> ln rr * (379 / 50 + ln rr) \<le> - 133641 / 10000 \<and> \<not> ln rr \<le> - 437 / 150 \<and> \<not> ln rr \<le> - 279 / 100"
                                                    using ff22 by auto (* 76 ms *)
                                                  then have "\<not> 323 / 20000 < ln rr * (- 437 / 100 + ln rr * (- 3 / 2)) \<and> \<not> ln rr * (379 / 50 + ln rr) \<le> - 133641 / 10000 \<and> \<not> ln rr \<le> - 279 / 100"
                                                    by mt_arith_rule (* 152 ms *)
                                                  then have "\<not> 53521 / 4000 + ln rr * (239 / 20 + ln rr * (5 / 2)) < 1 * (133641 / 10000 + ln rr * (379 / 50 + ln rr)) \<and> \<not> 133641 / 10000 + ln rr * (379 / 50 + ln rr) \<le> 0 \<and> \<not> ln rr \<le> - 279 / 100"
                                                    by mt_arith_rule (* 240 ms *)
                                                  then have "\<not> (53521 / 4000 + ln rr * (239 / 20 + ln rr * (5 / 2))) / (133641 / 10000 + ln rr * (379 / 50 + ln rr)) < 1 \<and> \<not> ln rr \<le> - 279 / 100"
                                                    using ff23 by fastforce (* 188 ms *)
                                                  then have "\<not> (- 1 / 2 + (279 / 100 + ln rr) * (- 2 + (279 / 100 + ln rr) * (5 / 2))) / ((279 / 100 + ln rr) * (2 + (279 / 100 + ln rr))) < 1 \<and> \<not> 279 / 100 + ln rr \<le> 0"
                                                    by mt_arith_rule (* 1.1 s *)
                                                  then have "\<not> ln (279 / 100 + ln rr) < 1"
                                                    using ff25 by fastforce (* 28 ms *)
                                                  then have "\<not> ln (279 / 100 + ln rr) < 1 \<or> \<not> 1 < rr"
                                                    by metis (* 4 ms *) }
                                                ultimately have "0 < rr \<longrightarrow> \<not> ln (279 / 100 + ln rr) < 1 \<or> \<not> 1 < rr"
                                                  by metis (* 24 ms *) }
                                              ultimately have "0 < rr \<longrightarrow> \<not> ln (279 / 100 + ln rr) < 1 \<or> \<not> 1 < rr"
                                                by metis (* 44 ms *) }
                                            ultimately have "0 < rr \<longrightarrow> \<not> ln (279 / 100 + ln rr) < 1 \<or> \<not> 1 < rr"
                                              by metis (* 28 ms *) }
                                          ultimately have "0 < rr \<longrightarrow> \<not> ln (279 / 100 + ln rr) < 1 \<or> \<not> 1 < rr"
                                            by metis (* 32 ms *) }
                                        ultimately have "0 < rr \<and> 1 < rr \<longrightarrow> \<not> ln (279 / 100 + ln rr) < 1 \<or> \<not> 1 < rr"
                                          by metis (* 32 ms *) }
                                      ultimately have "0 < rr \<and> 1 < rr \<longrightarrow> \<not> ln (279 / 100 + ln rr) < 1 \<or> \<not> 1 < rr"
                                        by metis (* 40 ms *) }
                                    ultimately have "0 < rr \<and> 1 < rr \<longrightarrow> \<not> ln (279 / 100 + ln rr) < 1 \<or> \<not> 1 < rr"
                                      by metis (* 48 ms *) }
                                  ultimately have "0 < rr \<and> 1 < rr \<longrightarrow> \<not> ln (279 / 100 + ln rr) < 1 \<or> \<not> 1 < rr"
                                    by metis (* 64 ms *) }
                                ultimately have "0 < rr \<and> 1 < rr \<longrightarrow> \<not> ln (279 / 100 + ln rr) < 1 \<or> \<not> 1 < rr"
                                  by metis (* 68 ms *) }
                              ultimately have "0 < rr \<and> 1 < rr \<longrightarrow> \<not> ln (279 / 100 + ln rr) < 1 \<or> \<not> 1 < rr"
                                by metis (* 96 ms *) }
                            ultimately have "0 < rr \<and> 1 < rr \<longrightarrow> \<not> ln (279 / 100 + ln rr) < 1 \<or> \<not> 1 < rr"
                              by metis (* 88 ms *) }
                          ultimately have "0 < rr \<and> 1 < rr \<longrightarrow> \<not> ln (279 / 100 + ln rr) < 1 \<or> \<not> 1 < rr"
                            by metis (* 72 ms *) }
                        ultimately have "0 < rr \<and> 1 < rr \<longrightarrow> \<not> ln (279 / 100 + ln rr) < 1 \<or> \<not> 1 < rr"
                          by metis (* 60 ms *) }
                      moreover
                      { assume "\<not> rr * (737 / 100 + rr * (- 117723 / 20000)) \<le> 3 / 2 \<and> \<not> rr \<le> 1"
                        then have "\<not> 1 < rr"
                          by sos (* 64 ms *) }
                      ultimately have "0 < rr \<and> 1 < rr \<longrightarrow> \<not> ln (279 / 100 + ln rr) < 1 \<or> \<not> 1 < rr"
                        by metis (* 128 ms *) }
                    ultimately have "0 < rr \<and> 1 < rr \<longrightarrow> \<not> ln (279 / 100 + ln rr) < 1 \<or> \<not> 1 < rr"
                      by metis (* 52 ms *) }
                  moreover
                  { assume "\<not> - 1 < rr * (- 479 / 50 + rr * (219441 / 10000)) \<and> \<not> rr \<le> 0"
                    then have "\<not> 1 < rr"
                      by sos (* 68 ms *) }
                  ultimately have "0 < rr \<and> 1 < rr \<longrightarrow> \<not> ln (279 / 100 + ln rr) < 1 \<or> \<not> 1 < rr"
                    by metis (* 96 ms *) }
                ultimately have "0 < rr \<and> 1 < rr \<longrightarrow> \<not> ln (279 / 100 + ln rr) < 1 \<or> \<not> 1 < rr"
                  by metis (* 44 ms *)
                moreover
                { assume "\<not> 0 < rr"
                  then have "\<not> 1 < rr"
                    by sos (* 12 ms *) }
                ultimately have "1 < rr \<longrightarrow> \<not> ln (279 / 100 + ln rr) < 1 \<or> \<not> 1 < rr"
                  by metis (* 12 ms *) }
              moreover
              { assume "\<not> 0 < rr \<and> \<not> rr \<le> 100 / 379"
                then have "\<not> 1 < rr"
                  by sos (* 8 ms *) }
              ultimately have "1 < rr \<longrightarrow> \<not> ln (279 / 100 + ln rr) < 1 \<or> \<not> 1 < rr"
                by metis (* 44 ms *) }
            moreover
            { assume "\<not> 100 / 379 < rr"
              then have "\<not> 1 < rr"
                by sos (* 20 ms *) }
            ultimately have "1 < rr \<longrightarrow> \<not> ln (279 / 100 + ln rr) < 1 \<or> \<not> 1 < rr"
              by metis (* 28 ms *) }
          moreover
          { assume "\<not> 0 < rr \<and> \<not> rr \<le> 150 / 587"
            then have "\<not> 1 < rr"
              by sos (* 8 ms *) }
          ultimately have "1 < rr \<longrightarrow> \<not> ln (279 / 100 + ln rr) < 1 \<or> \<not> 1 < rr"
            by metis (* 20 ms *) }
        moreover
        { assume "\<not> 150 / 587 < rr"
          then have "\<not> 1 < rr"
            by sos (* 40 ms *) }
        ultimately have "1 < rr \<longrightarrow> \<not> ln (279 / 100 + ln rr) < 1 \<or> \<not> 1 < rr"
          by metis (* 16 ms *) }
      moreover
      { assume "\<not> 0 < rr \<and> \<not> rr \<le> 50 / 429"
        then have "\<not> 1 < rr"
          by sos (* 16 ms *) }
      ultimately have "1 < rr \<longrightarrow> \<not> ln (279 / 100 + ln rr) < 1 \<or> \<not> 1 < rr"
        by metis (* 16 ms *) }
    moreover
    { assume "\<not> 50 / 429 < rr"
      then have "\<not> 1 < rr"
        by sos (* 40 ms *) }
    ultimately have "1 < rr \<longrightarrow> \<not> ln (279 / 100 + ln rr) < 1 \<or> \<not> 1 < rr"
      by metis (* 8 ms *)
    moreover
    { assume "\<not> 1 < rr"
      then have "\<not> ln (279 / 100 + ln rr) < 1 \<or> \<not> 1 < rr"
        by metis (* 4 ms *) }
    ultimately have "\<not> ln (279 / 100 + ln rr) < 1 \<or> \<not> 1 < rr"
      by metis (* 4 ms *) }
  then have "\<forall>r. \<not> (1::real) < r \<or> \<not> ln (279 / 100 + ln r) < 1"
    by blast (* 0.0 ms *)
  then show ?thesis
    by auto (* 4 ms *)
qed    
end
  