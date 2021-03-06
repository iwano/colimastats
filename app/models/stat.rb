class Stat < ActiveRecord::Base
  attr_accessible :state_id, :city_id, :locality_id, :longitude, :latitude, 
  :altitude, :pobtot, :pobmas, :pobfem, :p0a2, :p0a2_m, :p0a2_f, :p3ymas, 
  :p3ymas_m, :p3ymas_f, :p5ymas, :p5ymas_m, :p5ymas_f, :p12ymas, :p12ymas_m, 
  :p12ymas_f, :p15ymas, :p15ymas_m, :p15ymas_f, :p18ymas, :p18ymas_m, :p18ymas_f, 
  :p3a5, :p3a5_m, :p3a5_f, :p6a11, :p6a11_m, :p6a11_f, :p8a14, :p8a14_m, :p8a14_f, 
  :p12a14, :p12a14_m, :p12a14_f, :p15a17, :p15a17_m, :p15a17_f, :p18a24, :p18a24_m, 
  :p18a24_f, :p15a49_f, :p60ymas, :p60ymas_m, :p60ymas_f, :rel_h_m, :p0a14, 
  :p15a64, :p65ymas, :prom_hnv, :pnacent, :pnacent_m, :pnacent_f, :pnacoe, 
  :pnacoe_m, :pnacoe_f, :pres2005, :pres2005_m, :pres2005_f, :presoe05, :presoe05_m, 
  :presoe05_f, :p3ym_hli, :p3ym_hli_m, :p3ym_hli_f, :p3hlinhe, :p3hlinhe_m, 
  :p3hlinhe_f, :p3hli_he, :p3hli_he_m, :p3hli_he_f, :p5hli, :p5hli_nhe, :p5hli_he, 
  :phog_ind, :pcon_lim, :pclim_mot, :pclim_vis, :pclim_leng, :pclim_aud, :pclim_mot2, 
  :pclim_men, :pclim_men2, :psin_lim, :p3a5_noa, :p3a5_noa_m, :p3a5_noa_f, :p6a11_noa, 
  :p6a11_noa_m, :p6a11_noa_f, :p12a14noa, :p12a14noa_m, :p12a14noa_f, :p15a17a, :p15a17a_m, 
  :p15a17a_f, :p18a24a, :p18a24a_m, :p18a24a_f, :p8a14an, :p8a14an_m, :p8a14an_f, :p15ym_an, 
  :p15ym_an_m, :p15ym_an_f, :p15ym_se, :p15ym_se_m, :p15ym_se_f, :p15pri_in, :p15pri_in_m, 
  :p15pri_in_f, :p15pri_co, :p15pri_com, :p15pri_cof, :p15sec_in, :p15sec_in_m, :p15sec_in_f, 
  :p15sec_co, :p15sec_co_m, :p15sec_co_f, :p18ym_pb, :p18ym_pb_m, :p18ym_pb_f, :graproes, 
  :graproes_m, :graproes_f, :pea, :pea_m, :pea_f, :pe_inac, :pe_inac_m, :pe_inac_f, :pocupada, 
  :pocupada_m, :pocupada_f, :pdesocup, :pdesocup_m, :pdesocup_f, :psinder, :pder_ss, :pder_imss, 
  :pder_iste, :pder_istee, :pder_segp, :p12ym_solt, :p12ym_casa, :p12ym_sepa, :pcatolica, 
  :pncatolica, :potras_rel, :psin_religion, :tothog, :hogjef_m, :hogjef_f, :pobhog, :phogjef_m, 
  :phogjef_f, :vivitot, :vivihab, :vivipar, :vivipar_hab, :tviviparhab, :vivipar_des, :vivipar_ut, 
  :ocupvivivpar, :prom_ocup, :pro_ocup_c, :vph_pisodt, :vph_pisoti, :vph_1dor, :vph_2ymasd, 
  :vph_1cuart, :vph_2cuart, :vph_3ymascuart, :vph_c_elec, :vph_s_elec, :vph_aguadv, :vph_aguafv, 
  :vph_excsa, :vph_drenaj, :vph_nodren, :vph_c_serv, :vph_snbien, :vph_radio, :vph_tv, :vph_refri, 
  :vph_lavad, :vph_auto, :vph_pc, :vph_tel, :vph_cell, :vph_inter, :tam_loc, :locality_number

  has_one :locality
  belongs_to :state
  belongs_to :city
end
