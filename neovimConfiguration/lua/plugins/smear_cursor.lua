return {
  "sphamba/smear-cursor.nvim",
  opts = {
    -- Configurație inspirată de comportamentul cursorului din Kitty
    stiffness = 0.4,                      -- Valoare mai mică pentru un efect de smear mai pronunțat, similar cu Kitty
    cursor_color = "#FFFFFF",             -- Alb pur, similar cu setarea implicită din Kitty
    cursor_opacity = 0.9,                 -- Opacitate ridicată ca în Kitty
    
    -- Efectul de "smear" similar cu cel din Kitty
    trailing_stiffness = 0.3,             -- Mai elastic pentru un efect mai fluid, ca în Kitty
    trailing_exponent = 1.8,              -- Valoare mai mică pentru o "coadă" mai lungă și mai fluidă
    
    -- Comportament în modul Insert mai potrivit pentru Kitty
    stiffness_insert_mode = 0.5,          -- Efect moderat în modul Insert
    trailing_stiffness_insert_mode = 0.5, -- Trail moderat în modul Insert
    
    -- Optimizări pentru a imita comportamentul Kitty
    distance_stop_animating = 0.2,        -- Animație mai lungă înainte de oprire
    never_draw_over_target = false,       -- Desenare peste cursor permisă pentru fluiditate
    hide_target_hack = false,             -- Dezactivat pentru un comportament mai natural
    gamma = 0.9,                          -- Valoare apropiată de 1 pentru o luminozitate naturală
    
    -- Parametri specifici pentru a imita efectul Kitty
    fps_limit = 144,                      -- Limită de FPS mai mare pentru fluiditate
  },
}
