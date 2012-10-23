class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :state_id
      t.integer :city_id
      t.integer :locality_id
      t.float :longitude
      t.float :latitude
      t.float :altitude
      t.float :pobtot
      t.float :pobmas, default: 0
      t.float :pobfem, default: 0
      t.float :p0a2, default: 0
      t.float :p0a2_m, default: 0
      t.float :p0a2_f, default: 0
      t.float :p3ymas, default: 0
      t.float :p3ymas_m, default: 0
      t.float :p3ymas_f, default: 0
      t.float :p5ymas, default: 0
      t.float :p5ymas_m, default: 0
      t.float :p5ymas_f, default: 0
      t.float :p12ymas, default: 0
      t.float :p12ymas_m, default: 0
      t.float :p12ymas_f, default: 0
      t.float :p15ymas, default: 0
      t.float :p15ymas_m, default: 0
      t.float :p15ymas_f, default: 0
      t.float :p18ymas, default: 0
      t.float :p18ymas_m, default: 0
      t.float :p18ymas_f, default: 0
      t.float :p3a5, default: 0
      t.float :p3a5_m, default: 0
      t.float :p3a5_f, default: 0
      t.float :p6a11, default: 0
      t.float :p6a11_m, default: 0
      t.float :p6a11_f, default: 0
      t.float :p8a14, default: 0
      t.float :p8a14_m, default: 0
      t.float :p8a14_f, default: 0
      t.float :p12a14, default: 0
      t.float :p12a14_m, default: 0
      t.float :p12a14_f, default: 0
      t.float :p15a17, default: 0
      t.float :p15a17_m, default: 0
      t.float :p15a17_f, default: 0
      t.float :p18a24, default: 0
      t.float :p18a24_m, default: 0
      t.float :p18a24_f, default: 0
      t.float :p15a49_f, default: 0
      t.float :p60ymas, default: 0
      t.float :p60ymas_m, default: 0
      t.float :p60ymas_f, default: 0
      t.float :rel_h_m, default: 0
      t.float :p0a14, default: 0
      t.float :p15a64, default: 0
      t.float :p65ymas, default: 0
      t.float :prom_hnv, default: 0
      t.float :pnacent, default: 0
      t.float :pnacent_m, default: 0
      t.float :pnacent_f, default: 0
      t.float :pnacoe, default: 0
      t.float :pnacoe_m, default: 0
      t.float :pnacoe_f, default: 0
      t.float :pres2005, default: 0
      t.float :pres2005_m, default: 0
      t.float :pres2005_f, default: 0
      t.float :presoe05, default: 0
      t.float :presoe05_m, default: 0
      t.float :presoe05_f, default: 0
      t.float :p3ym_hli, default: 0
      t.float :p3ym_hli_m, default: 0
      t.float :p3ym_hli_f, default: 0
      t.float :p3hlinhe, default: 0
      t.float :p3hlinhe_m, default: 0
      t.float :p3hlinhe_f, default: 0
      t.float :p3hli_he, default: 0
      t.float :p3hli_he_m, default: 0
      t.float :p3hli_he_f, default: 0
      t.float :p5hli, default: 0
      t.float :p5hli_nhe, default: 0
      t.float :p5hli_he, default: 0
      t.float :phog_ind, default: 0
      t.float :pcon_lim, default: 0
      t.float :pclim_mot, default: 0
      t.float :pclim_vis, default: 0
      t.float :pclim_leng, default: 0
      t.float :pclim_aud, default: 0
      t.float :pclim_mot2, default: 0
      t.float :pclim_men, default: 0
      t.float :pclim_men2, default: 0
      t.float :psin_lim, default: 0
      t.float :p3a5_noa, default: 0
      t.float :p3a5_noa_m, default: 0
      t.float :p3a5_noa_f, default: 0
      t.float :p6a11_noa, default: 0
      t.float :p6a11_noa_m, default: 0
      t.float :p6a11_noa_f, default: 0
      t.float :p12a14noa, default: 0
      t.float :p12a14noa_m, default: 0
      t.float :p12a14noa_f, default: 0
      t.float :p15a17a, default: 0
      t.float :p15a17a_m, default: 0
      t.float :p15a17a_f, default: 0
      t.float :p18a24a, default: 0
      t.float :p18a24a_m, default: 0
      t.float :p18a24a_f, default: 0
      t.float :p8a14an, default: 0
      t.float :p8a14an_m, default: 0
      t.float :p8a14an_f, default: 0
      t.float :p15ym_an, default: 0
      t.float :p15ym_an_m, default: 0
      t.float :p15ym_an_f, default: 0
      t.float :p15ym_se, default: 0
      t.float :p15ym_se_m, default: 0
      t.float :p15ym_se_f, default: 0
      t.float :p15pri_in, default: 0
      t.float :p15pri_in_m, default: 0
      t.float :p15pri_in_f, default: 0
      t.float :p15pri_co, default: 0
      t.float :p15pri_com, default: 0
      t.float :p15pri_cof, default: 0
      t.float :p15sec_in, default: 0
      t.float :p15sec_in_m, default: 0
      t.float :p15sec_in_f, default: 0
      t.float :p15sec_co, default: 0
      t.float :p15sec_co_m, default: 0
      t.float :p15sec_co_f, default: 0
      t.float :p18ym_pb, default: 0
      t.float :p18ym_pb_m, default: 0
      t.float :p18ym_pb_f, default: 0
      t.float :graproes, default: 0
      t.float :graproes_m, default: 0
      t.float :graproes_f, default: 0
      t.float :pea, default: 0
      t.float :pea_m, default: 0
      t.float :pea_f, default: 0
      t.float :pe_inac, default: 0
      t.float :pe_inac_m, default: 0
      t.float :pe_inac_f, default: 0
      t.float :pocupada, default: 0
      t.float :pocupada_m, default: 0
      t.float :pocupada_f, default: 0
      t.float :pdesocup, default: 0
      t.float :pdesocup_m, default: 0
      t.float :pdesocup_f, default: 0
      t.float :psinder, default: 0
      t.float :pder_ss, default: 0
      t.float :pder_imss, default: 0
      t.float :pder_iste, default: 0
      t.float :pder_istee, default: 0
      t.float :pder_segp, default: 0
      t.float :p12ym_solt, default: 0
      t.float :p12ym_casa, default: 0
      t.float :p12ym_sepa, default: 0
      t.float :pcatolica, default: 0
      t.float :pncatolica, default: 0
      t.float :potras_rel, default: 0
      t.float :psin_religion, default: 0
      t.float :tothog, default: 0
      t.float :hogjef_m, default: 0
      t.float :hogjef_f, default: 0
      t.float :pobhog, default: 0
      t.float :phogjef_m, default: 0
      t.float :phogjef_f, default: 0
      t.float :vivitot, default: 0
      t.float :vivihab, default: 0
      t.float :vivipar, default: 0
      t.float :vivipar_hab, default: 0
      t.float :tviviparhab, default: 0
      t.float :vivipar_des, default: 0
      t.float :vivipar_ut, default: 0
      t.float :ocupvivivpar, default: 0
      t.float :prom_ocup, default: 0
      t.float :pro_ocup_c, default: 0
      t.float :vph_pisodt, default: 0
      t.float :vph_pisoti, default: 0
      t.float :vph_1dor, default: 0
      t.float :vph_2ymasd, default: 0
      t.float :vph_1cuart, default: 0
      t.float :vph_2cuart, default: 0
      t.float :vph_3ymascuart, default: 0
      t.float :vph_c_elec, default: 0
      t.float :vph_s_elec, default: 0
      t.float :vph_aguadv, default: 0
      t.float :vph_aguafv, default: 0
      t.float :vph_excsa, default: 0
      t.float :vph_drenaj, default: 0
      t.float :vph_nodren, default: 0
      t.float :vph_c_serv, default: 0
      t.float :vph_snbien, default: 0
      t.float :vph_radio, default: 0
      t.float :vph_tv, default: 0
      t.float :vph_refri, default: 0
      t.float :vph_lavad, default: 0
      t.float :vph_auto, default: 0
      t.float :vph_pc, default: 0
      t.float :vph_tel, default: 0
      t.float :vph_cell, default: 0
      t.float :vph_inter, default: 0
      t.float :tam_loc, default: 0
      t.timestamps
    end
  end
end