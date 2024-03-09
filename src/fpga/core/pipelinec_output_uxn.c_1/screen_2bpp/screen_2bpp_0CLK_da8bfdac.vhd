-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 73
entity screen_2bpp_0CLK_da8bfdac is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(11 downto 0);
 x1 : in unsigned(15 downto 0);
 y1 : in unsigned(15 downto 0);
 color : in unsigned(3 downto 0);
 fx : in unsigned(0 downto 0);
 fy : in unsigned(0 downto 0);
 ram_addr : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out screen_blit_result_t);
end screen_2bpp_0CLK_da8bfdac;
architecture arch of screen_2bpp_0CLK_da8bfdac is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal blending : uint8_t_80 := (
0 => to_unsigned(0, 8),
1 => to_unsigned(0, 8),
2 => to_unsigned(0, 8),
3 => to_unsigned(0, 8),
4 => to_unsigned(1, 8),
5 => to_unsigned(0, 8),
6 => to_unsigned(1, 8),
7 => to_unsigned(1, 8),
8 => to_unsigned(2, 8),
9 => to_unsigned(2, 8),
10 => to_unsigned(0, 8),
11 => to_unsigned(2, 8),
12 => to_unsigned(3, 8),
13 => to_unsigned(3, 8),
14 => to_unsigned(3, 8),
15 => to_unsigned(0, 8),
16 => to_unsigned(0, 8),
17 => to_unsigned(1, 8),
18 => to_unsigned(2, 8),
19 => to_unsigned(3, 8),
20 => to_unsigned(0, 8),
21 => to_unsigned(1, 8),
22 => to_unsigned(2, 8),
23 => to_unsigned(3, 8),
24 => to_unsigned(0, 8),
25 => to_unsigned(1, 8),
26 => to_unsigned(2, 8),
27 => to_unsigned(3, 8),
28 => to_unsigned(0, 8),
29 => to_unsigned(1, 8),
30 => to_unsigned(2, 8),
31 => to_unsigned(3, 8),
32 => to_unsigned(1, 8),
33 => to_unsigned(2, 8),
34 => to_unsigned(3, 8),
35 => to_unsigned(1, 8),
36 => to_unsigned(1, 8),
37 => to_unsigned(2, 8),
38 => to_unsigned(3, 8),
39 => to_unsigned(1, 8),
40 => to_unsigned(1, 8),
41 => to_unsigned(2, 8),
42 => to_unsigned(3, 8),
43 => to_unsigned(1, 8),
44 => to_unsigned(1, 8),
45 => to_unsigned(2, 8),
46 => to_unsigned(3, 8),
47 => to_unsigned(1, 8),
48 => to_unsigned(2, 8),
49 => to_unsigned(3, 8),
50 => to_unsigned(1, 8),
51 => to_unsigned(2, 8),
52 => to_unsigned(2, 8),
53 => to_unsigned(3, 8),
54 => to_unsigned(1, 8),
55 => to_unsigned(2, 8),
56 => to_unsigned(2, 8),
57 => to_unsigned(3, 8),
58 => to_unsigned(1, 8),
59 => to_unsigned(2, 8),
60 => to_unsigned(2, 8),
61 => to_unsigned(3, 8),
62 => to_unsigned(1, 8),
63 => to_unsigned(2, 8),
64 => to_unsigned(0, 8),
65 => to_unsigned(1, 8),
66 => to_unsigned(1, 8),
67 => to_unsigned(1, 8),
68 => to_unsigned(1, 8),
69 => to_unsigned(0, 8),
70 => to_unsigned(1, 8),
71 => to_unsigned(1, 8),
72 => to_unsigned(1, 8),
73 => to_unsigned(1, 8),
74 => to_unsigned(0, 8),
75 => to_unsigned(1, 8),
76 => to_unsigned(1, 8),
77 => to_unsigned(1, 8),
78 => to_unsigned(1, 8),
79 => to_unsigned(0, 8),
others => to_unsigned(0, 8))
;
signal x : unsigned(15 downto 0) := to_unsigned(0, 16);
signal y : unsigned(15 downto 0) := to_unsigned(0, 16);
signal opaque : unsigned(0 downto 0) := to_unsigned(0, 1);
signal c : unsigned(15 downto 0) := to_unsigned(0, 16);
signal ch : unsigned(7 downto 0) := to_unsigned(0, 8);
signal color8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : screen_blit_result_t := screen_blit_result_t_NULL;
signal phase_minus_two : unsigned(11 downto 0) := to_unsigned(0, 12);
signal phase7_downto_4 : unsigned(3 downto 0) := to_unsigned(0, 4);
signal phase7_downto_3 : unsigned(4 downto 0) := to_unsigned(0, 5);
signal phase2_downto_0 : unsigned(2 downto 0) := to_unsigned(0, 3);
signal phase7_downto_3_u8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal sprite_rows : uint8_t_16 := (others => to_unsigned(0, 8));
signal is_in_bounds : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_new_row : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_blending : uint8_t_80;
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);
signal REG_COMB_opaque : unsigned(0 downto 0);
signal REG_COMB_c : unsigned(15 downto 0);
signal REG_COMB_ch : unsigned(7 downto 0);
signal REG_COMB_color8 : unsigned(7 downto 0);
signal REG_COMB_result : screen_blit_result_t;
signal REG_COMB_phase_minus_two : unsigned(11 downto 0);
signal REG_COMB_phase7_downto_4 : unsigned(3 downto 0);
signal REG_COMB_phase7_downto_3 : unsigned(4 downto 0);
signal REG_COMB_phase2_downto_0 : unsigned(2 downto 0);
signal REG_COMB_phase7_downto_3_u8 : unsigned(7 downto 0);
signal REG_COMB_sprite_rows : uint8_t_16;
signal REG_COMB_is_in_bounds : unsigned(0 downto 0);
signal REG_COMB_is_new_row : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_MINUS[uxn_device_h_l69_c20_aad5]
signal BIN_OP_MINUS_uxn_device_h_l69_c20_aad5_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l69_c20_aad5_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l69_c20_aad5_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l71_c6_db59]
signal BIN_OP_EQ_uxn_device_h_l71_c6_db59_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l71_c6_db59_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l71_c6_db59_return_output : unsigned(0 downto 0);

-- sprite_rows_MUX[uxn_device_h_l71_c2_a1e6]
signal sprite_rows_MUX_uxn_device_h_l71_c2_a1e6_cond : unsigned(0 downto 0);
signal sprite_rows_MUX_uxn_device_h_l71_c2_a1e6_iftrue : uint8_t_16;
signal sprite_rows_MUX_uxn_device_h_l71_c2_a1e6_iffalse : uint8_t_16;
signal sprite_rows_MUX_uxn_device_h_l71_c2_a1e6_return_output : uint8_t_16;

-- VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60[uxn_device_h_l72_c3_b41c]
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_b41c_elem_val : unsigned(7 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_b41c_ref_toks_0 : uint8_t_16;
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_b41c_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_b41c_return_output : uint8_t_array_16_t;

-- BIN_OP_EQ[uxn_device_h_l75_c6_7045]
signal BIN_OP_EQ_uxn_device_h_l75_c6_7045_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l75_c6_7045_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l75_c6_7045_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l75_c2_f9db]
signal x_MUX_uxn_device_h_l75_c2_f9db_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l75_c2_f9db_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l75_c2_f9db_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l75_c2_f9db_return_output : unsigned(15 downto 0);

-- opaque_MUX[uxn_device_h_l75_c2_f9db]
signal opaque_MUX_uxn_device_h_l75_c2_f9db_cond : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l75_c2_f9db_iftrue : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l75_c2_f9db_iffalse : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l75_c2_f9db_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l75_c2_f9db]
signal y_MUX_uxn_device_h_l75_c2_f9db_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l75_c2_f9db_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l75_c2_f9db_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l75_c2_f9db_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l76_c21_5564]
signal BIN_OP_PLUS_uxn_device_h_l76_c21_5564_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l76_c21_5564_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l76_c21_5564_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l76_c12_4f46]
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_4f46_ref_toks_0 : uint8_t_80;
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_4f46_var_dim_0 : unsigned(6 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_4f46_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l77_c13_2a6a]
signal MUX_uxn_device_h_l77_c13_2a6a_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l77_c13_2a6a_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l77_c13_2a6a_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l77_c13_2a6a_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l77_c7_96f3]
signal BIN_OP_PLUS_uxn_device_h_l77_c7_96f3_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l77_c7_96f3_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l77_c7_96f3_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l78_c13_220e]
signal MUX_uxn_device_h_l78_c13_220e_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l78_c13_220e_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l78_c13_220e_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l78_c13_220e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l78_c7_4783]
signal BIN_OP_PLUS_uxn_device_h_l78_c7_4783_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l78_c7_4783_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l78_c7_4783_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l81_c6_e21b]
signal BIN_OP_EQ_uxn_device_h_l81_c6_e21b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c6_e21b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c6_e21b_return_output : unsigned(0 downto 0);

-- c_MUX[uxn_device_h_l81_c2_47f9]
signal c_MUX_uxn_device_h_l81_c2_47f9_cond : unsigned(0 downto 0);
signal c_MUX_uxn_device_h_l81_c2_47f9_iftrue : unsigned(15 downto 0);
signal c_MUX_uxn_device_h_l81_c2_47f9_iffalse : unsigned(15 downto 0);
signal c_MUX_uxn_device_h_l81_c2_47f9_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l81_c2_47f9]
signal result_is_vram_write_MUX_uxn_device_h_l81_c2_47f9_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c2_47f9_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c2_47f9_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c2_47f9_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l81_c2_47f9]
signal result_u16_addr_MUX_uxn_device_h_l81_c2_47f9_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l81_c2_47f9_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l81_c2_47f9_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l81_c2_47f9_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_device_h_l81_c2_47f9]
signal result_u8_value_MUX_uxn_device_h_l81_c2_47f9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l81_c2_47f9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l81_c2_47f9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l81_c2_47f9_return_output : unsigned(7 downto 0);

-- result_is_blit_done_MUX[uxn_device_h_l81_c2_47f9]
signal result_is_blit_done_MUX_uxn_device_h_l81_c2_47f9_cond : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l81_c2_47f9_iftrue : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l81_c2_47f9_iffalse : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l81_c2_47f9_return_output : unsigned(0 downto 0);

-- is_new_row_MUX[uxn_device_h_l81_c2_47f9]
signal is_new_row_MUX_uxn_device_h_l81_c2_47f9_cond : unsigned(0 downto 0);
signal is_new_row_MUX_uxn_device_h_l81_c2_47f9_iftrue : unsigned(0 downto 0);
signal is_new_row_MUX_uxn_device_h_l81_c2_47f9_iffalse : unsigned(0 downto 0);
signal is_new_row_MUX_uxn_device_h_l81_c2_47f9_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l81_c2_47f9]
signal x_MUX_uxn_device_h_l81_c2_47f9_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l81_c2_47f9_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c2_47f9_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c2_47f9_return_output : unsigned(15 downto 0);

-- is_in_bounds_MUX[uxn_device_h_l81_c2_47f9]
signal is_in_bounds_MUX_uxn_device_h_l81_c2_47f9_cond : unsigned(0 downto 0);
signal is_in_bounds_MUX_uxn_device_h_l81_c2_47f9_iftrue : unsigned(0 downto 0);
signal is_in_bounds_MUX_uxn_device_h_l81_c2_47f9_iffalse : unsigned(0 downto 0);
signal is_in_bounds_MUX_uxn_device_h_l81_c2_47f9_return_output : unsigned(0 downto 0);

-- ch_MUX[uxn_device_h_l81_c2_47f9]
signal ch_MUX_uxn_device_h_l81_c2_47f9_cond : unsigned(0 downto 0);
signal ch_MUX_uxn_device_h_l81_c2_47f9_iftrue : unsigned(7 downto 0);
signal ch_MUX_uxn_device_h_l81_c2_47f9_iffalse : unsigned(7 downto 0);
signal ch_MUX_uxn_device_h_l81_c2_47f9_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l81_c2_47f9]
signal y_MUX_uxn_device_h_l81_c2_47f9_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l81_c2_47f9_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c2_47f9_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c2_47f9_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l85_c21_fd9c]
signal BIN_OP_PLUS_uxn_device_h_l85_c21_fd9c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l85_c21_fd9c_right : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l85_c21_fd9c_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l87_c16_c9fe]
signal BIN_OP_EQ_uxn_device_h_l87_c16_c9fe_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l87_c16_c9fe_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l87_c16_c9fe_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l87_c16_c9d7]
signal MUX_uxn_device_h_l87_c16_c9d7_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l87_c16_c9d7_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l87_c16_c9d7_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l87_c16_c9d7_return_output : unsigned(0 downto 0);

-- c_MUX[uxn_device_h_l88_c3_db26]
signal c_MUX_uxn_device_h_l88_c3_db26_cond : unsigned(0 downto 0);
signal c_MUX_uxn_device_h_l88_c3_db26_iftrue : unsigned(15 downto 0);
signal c_MUX_uxn_device_h_l88_c3_db26_iffalse : unsigned(15 downto 0);
signal c_MUX_uxn_device_h_l88_c3_db26_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l89_c31_b5e4]
signal BIN_OP_PLUS_uxn_device_h_l89_c31_b5e4_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l89_c31_b5e4_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l89_c31_b5e4_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l89_c19_660a]
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c19_660a_ref_toks_0 : uint8_t_16;
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c19_660a_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c19_660a_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_device_h_l90_c4_e4de]
signal CONST_SL_8_uxn_device_h_l90_c4_e4de_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_device_h_l90_c4_e4de_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l91_c32_657d]
signal BIN_OP_MINUS_uxn_device_h_l91_c32_657d_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l91_c32_657d_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l91_c32_657d_return_output : unsigned(7 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l91_c20_98d6]
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l91_c20_98d6_ref_toks_0 : uint8_t_16;
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l91_c20_98d6_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l91_c20_98d6_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l91_c4_fdda]
signal BIN_OP_OR_uxn_device_h_l91_c4_fdda_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l91_c4_fdda_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l91_c4_fdda_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l93_c27_8acc]
signal MUX_uxn_device_h_l93_c27_8acc_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l93_c27_8acc_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l93_c27_8acc_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l93_c27_8acc_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l93_c21_9ac1]
signal BIN_OP_PLUS_uxn_device_h_l93_c21_9ac1_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l93_c21_9ac1_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l93_c21_9ac1_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l93_c7_daeb]
signal MUX_uxn_device_h_l93_c7_daeb_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l93_c7_daeb_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l93_c7_daeb_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l93_c7_daeb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l94_c19_9f33]
signal BIN_OP_EQ_uxn_device_h_l94_c19_9f33_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l94_c19_9f33_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l94_c19_9f33_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l94_c19_ae58]
signal MUX_uxn_device_h_l94_c19_ae58_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l94_c19_ae58_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l94_c19_ae58_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l94_c19_ae58_return_output : unsigned(0 downto 0);

-- CONST_SL_1[uxn_device_h_l96_c3_da31]
signal CONST_SL_1_uxn_device_h_l96_c3_da31_x : unsigned(7 downto 0);
signal CONST_SL_1_uxn_device_h_l96_c3_da31_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l97_c3_6817]
signal BIN_OP_OR_uxn_device_h_l97_c3_6817_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l97_c3_6817_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l97_c3_6817_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_device_h_l98_c22_a460]
signal CONST_SL_8_uxn_device_h_l98_c22_a460_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_device_h_l98_c22_a460_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l98_c22_619a]
signal BIN_OP_PLUS_uxn_device_h_l98_c22_619a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l98_c22_619a_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l98_c22_619a_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l99_c52_2d65]
signal BIN_OP_EQ_uxn_device_h_l99_c52_2d65_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c52_2d65_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c52_2d65_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l99_c52_b904]
signal MUX_uxn_device_h_l99_c52_b904_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l99_c52_b904_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l99_c52_b904_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l99_c52_b904_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l99_c42_9e3e]
signal BIN_OP_OR_uxn_device_h_l99_c42_9e3e_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l99_c42_9e3e_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l99_c42_9e3e_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l99_c26_6635]
signal BIN_OP_AND_uxn_device_h_l99_c26_6635_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l99_c26_6635_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l99_c26_6635_return_output : unsigned(0 downto 0);

-- CONST_SL_4[uxn_device_h_l100_c40_c6f5]
signal CONST_SL_4_uxn_device_h_l100_c40_c6f5_x : unsigned(7 downto 0);
signal CONST_SL_4_uxn_device_h_l100_c40_c6f5_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l100_c30_ae02]
signal BIN_OP_PLUS_uxn_device_h_l100_c30_ae02_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l100_c30_ae02_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l100_c30_ae02_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l100_c21_328e]
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_328e_ref_toks_0 : uint8_t_80;
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_328e_var_dim_0 : unsigned(6 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_328e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l101_c7_b7ba]
signal BIN_OP_EQ_uxn_device_h_l101_c7_b7ba_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c7_b7ba_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c7_b7ba_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l101_c41_964b]
signal BIN_OP_MINUS_uxn_device_h_l101_c41_964b_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l101_c41_964b_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l101_c41_964b_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l101_c51_5ecf]
signal BIN_OP_PLUS_uxn_device_h_l101_c51_5ecf_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l101_c51_5ecf_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l101_c51_5ecf_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l101_c35_1b24]
signal MUX_uxn_device_h_l101_c35_1b24_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l101_c35_1b24_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l101_c35_1b24_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l101_c35_1b24_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l101_c7_ac13]
signal MUX_uxn_device_h_l101_c7_ac13_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l101_c7_ac13_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l101_c7_ac13_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l101_c7_ac13_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l102_c25_ebf8]
signal BIN_OP_EQ_uxn_device_h_l102_c25_ebf8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l102_c25_ebf8_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l102_c25_ebf8_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l102_c25_0954]
signal MUX_uxn_device_h_l102_c25_0954_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l102_c25_0954_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l102_c25_0954_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l102_c25_0954_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l103_c14_c1bc]
signal BIN_OP_PLUS_uxn_device_h_l103_c14_c1bc_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l103_c14_c1bc_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l103_c14_c1bc_return_output : unsigned(16 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l103_c24_ec44]
signal BIN_OP_MINUS_uxn_device_h_l103_c24_ec44_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l103_c24_ec44_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l103_c24_ec44_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l103_c8_4d36]
signal MUX_uxn_device_h_l103_c8_4d36_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l103_c8_4d36_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l103_c8_4d36_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l103_c8_4d36_return_output : unsigned(15 downto 0);

-- CONST_SR_1[uxn_device_h_l104_c3_64f3]
signal CONST_SR_1_uxn_device_h_l104_c3_64f3_x : unsigned(15 downto 0);
signal CONST_SR_1_uxn_device_h_l104_c3_64f3_return_output : unsigned(15 downto 0);

function uint12_7_4( x : unsigned) return unsigned is
--variable x : unsigned(11 downto 0);
  variable return_output : unsigned(3 downto 0);
begin
return_output := unsigned(std_logic_vector(x(7 downto 4)));
return return_output;
end function;

function uint12_7_3( x : unsigned) return unsigned is
--variable x : unsigned(11 downto 0);
  variable return_output : unsigned(4 downto 0);
begin
return_output := unsigned(std_logic_vector(x(7 downto 3)));
return return_output;
end function;

function uint12_2_0( x : unsigned) return unsigned is
--variable x : unsigned(11 downto 0);
  variable return_output : unsigned(2 downto 0);
begin
return_output := unsigned(std_logic_vector(x(2 downto 0)));
return return_output;
end function;

function CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5( ref_toks_0 : uint8_t_array_16_t) return uint8_t_16 is
 
  variable base : uint8_t_16; 
  variable return_output : uint8_t_16;
begin
      base(0) := ref_toks_0.data(0);
      base(3) := ref_toks_0.data(3);
      base(9) := ref_toks_0.data(9);
      base(6) := ref_toks_0.data(6);
      base(12) := ref_toks_0.data(12);
      base(15) := ref_toks_0.data(15);
      base(4) := ref_toks_0.data(4);
      base(1) := ref_toks_0.data(1);
      base(7) := ref_toks_0.data(7);
      base(10) := ref_toks_0.data(10);
      base(13) := ref_toks_0.data(13);
      base(2) := ref_toks_0.data(2);
      base(5) := ref_toks_0.data(5);
      base(8) := ref_toks_0.data(8);
      base(14) := ref_toks_0.data(14);
      base(11) := ref_toks_0.data(11);

      return_output := base;
      return return_output; 
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function uint16_15_8( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);
begin
return_output := unsigned(std_logic_vector(x(15 downto 8)));
return return_output;
end function;

function uint16_8_8( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(8- i);
      end loop;
return return_output;
end function;

function uint16_0_0( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(0- i);
      end loop;
return return_output;
end function;

function CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_0cf6( ref_toks_0 : screen_blit_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return screen_blit_result_t is
 
  variable base : screen_blit_result_t; 
  variable return_output : screen_blit_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.u16_addr := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_blit_done := ref_toks_4;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_MINUS_uxn_device_h_l69_c20_aad5
BIN_OP_MINUS_uxn_device_h_l69_c20_aad5 : entity work.BIN_OP_MINUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l69_c20_aad5_left,
BIN_OP_MINUS_uxn_device_h_l69_c20_aad5_right,
BIN_OP_MINUS_uxn_device_h_l69_c20_aad5_return_output);

-- BIN_OP_EQ_uxn_device_h_l71_c6_db59
BIN_OP_EQ_uxn_device_h_l71_c6_db59 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l71_c6_db59_left,
BIN_OP_EQ_uxn_device_h_l71_c6_db59_right,
BIN_OP_EQ_uxn_device_h_l71_c6_db59_return_output);

-- sprite_rows_MUX_uxn_device_h_l71_c2_a1e6
sprite_rows_MUX_uxn_device_h_l71_c2_a1e6 : entity work.MUX_uint1_t_uint8_t_16_uint8_t_16_0CLK_de264c78 port map (
sprite_rows_MUX_uxn_device_h_l71_c2_a1e6_cond,
sprite_rows_MUX_uxn_device_h_l71_c2_a1e6_iftrue,
sprite_rows_MUX_uxn_device_h_l71_c2_a1e6_iffalse,
sprite_rows_MUX_uxn_device_h_l71_c2_a1e6_return_output);

-- VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_b41c
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_b41c : entity work.VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_0CLK_6481cb28 port map (
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_b41c_elem_val,
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_b41c_ref_toks_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_b41c_var_dim_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_b41c_return_output);

-- BIN_OP_EQ_uxn_device_h_l75_c6_7045
BIN_OP_EQ_uxn_device_h_l75_c6_7045 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l75_c6_7045_left,
BIN_OP_EQ_uxn_device_h_l75_c6_7045_right,
BIN_OP_EQ_uxn_device_h_l75_c6_7045_return_output);

-- x_MUX_uxn_device_h_l75_c2_f9db
x_MUX_uxn_device_h_l75_c2_f9db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l75_c2_f9db_cond,
x_MUX_uxn_device_h_l75_c2_f9db_iftrue,
x_MUX_uxn_device_h_l75_c2_f9db_iffalse,
x_MUX_uxn_device_h_l75_c2_f9db_return_output);

-- opaque_MUX_uxn_device_h_l75_c2_f9db
opaque_MUX_uxn_device_h_l75_c2_f9db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opaque_MUX_uxn_device_h_l75_c2_f9db_cond,
opaque_MUX_uxn_device_h_l75_c2_f9db_iftrue,
opaque_MUX_uxn_device_h_l75_c2_f9db_iffalse,
opaque_MUX_uxn_device_h_l75_c2_f9db_return_output);

-- y_MUX_uxn_device_h_l75_c2_f9db
y_MUX_uxn_device_h_l75_c2_f9db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l75_c2_f9db_cond,
y_MUX_uxn_device_h_l75_c2_f9db_iftrue,
y_MUX_uxn_device_h_l75_c2_f9db_iffalse,
y_MUX_uxn_device_h_l75_c2_f9db_return_output);

-- BIN_OP_PLUS_uxn_device_h_l76_c21_5564
BIN_OP_PLUS_uxn_device_h_l76_c21_5564 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l76_c21_5564_left,
BIN_OP_PLUS_uxn_device_h_l76_c21_5564_right,
BIN_OP_PLUS_uxn_device_h_l76_c21_5564_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_4f46
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_4f46 : entity work.VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_0CLK_4b00ae23 port map (
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_4f46_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_4f46_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_4f46_return_output);

-- MUX_uxn_device_h_l77_c13_2a6a
MUX_uxn_device_h_l77_c13_2a6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l77_c13_2a6a_cond,
MUX_uxn_device_h_l77_c13_2a6a_iftrue,
MUX_uxn_device_h_l77_c13_2a6a_iffalse,
MUX_uxn_device_h_l77_c13_2a6a_return_output);

-- BIN_OP_PLUS_uxn_device_h_l77_c7_96f3
BIN_OP_PLUS_uxn_device_h_l77_c7_96f3 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l77_c7_96f3_left,
BIN_OP_PLUS_uxn_device_h_l77_c7_96f3_right,
BIN_OP_PLUS_uxn_device_h_l77_c7_96f3_return_output);

-- MUX_uxn_device_h_l78_c13_220e
MUX_uxn_device_h_l78_c13_220e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l78_c13_220e_cond,
MUX_uxn_device_h_l78_c13_220e_iftrue,
MUX_uxn_device_h_l78_c13_220e_iffalse,
MUX_uxn_device_h_l78_c13_220e_return_output);

-- BIN_OP_PLUS_uxn_device_h_l78_c7_4783
BIN_OP_PLUS_uxn_device_h_l78_c7_4783 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l78_c7_4783_left,
BIN_OP_PLUS_uxn_device_h_l78_c7_4783_right,
BIN_OP_PLUS_uxn_device_h_l78_c7_4783_return_output);

-- BIN_OP_EQ_uxn_device_h_l81_c6_e21b
BIN_OP_EQ_uxn_device_h_l81_c6_e21b : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l81_c6_e21b_left,
BIN_OP_EQ_uxn_device_h_l81_c6_e21b_right,
BIN_OP_EQ_uxn_device_h_l81_c6_e21b_return_output);

-- c_MUX_uxn_device_h_l81_c2_47f9
c_MUX_uxn_device_h_l81_c2_47f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
c_MUX_uxn_device_h_l81_c2_47f9_cond,
c_MUX_uxn_device_h_l81_c2_47f9_iftrue,
c_MUX_uxn_device_h_l81_c2_47f9_iffalse,
c_MUX_uxn_device_h_l81_c2_47f9_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l81_c2_47f9
result_is_vram_write_MUX_uxn_device_h_l81_c2_47f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l81_c2_47f9_cond,
result_is_vram_write_MUX_uxn_device_h_l81_c2_47f9_iftrue,
result_is_vram_write_MUX_uxn_device_h_l81_c2_47f9_iffalse,
result_is_vram_write_MUX_uxn_device_h_l81_c2_47f9_return_output);

-- result_u16_addr_MUX_uxn_device_h_l81_c2_47f9
result_u16_addr_MUX_uxn_device_h_l81_c2_47f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l81_c2_47f9_cond,
result_u16_addr_MUX_uxn_device_h_l81_c2_47f9_iftrue,
result_u16_addr_MUX_uxn_device_h_l81_c2_47f9_iffalse,
result_u16_addr_MUX_uxn_device_h_l81_c2_47f9_return_output);

-- result_u8_value_MUX_uxn_device_h_l81_c2_47f9
result_u8_value_MUX_uxn_device_h_l81_c2_47f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l81_c2_47f9_cond,
result_u8_value_MUX_uxn_device_h_l81_c2_47f9_iftrue,
result_u8_value_MUX_uxn_device_h_l81_c2_47f9_iffalse,
result_u8_value_MUX_uxn_device_h_l81_c2_47f9_return_output);

-- result_is_blit_done_MUX_uxn_device_h_l81_c2_47f9
result_is_blit_done_MUX_uxn_device_h_l81_c2_47f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_blit_done_MUX_uxn_device_h_l81_c2_47f9_cond,
result_is_blit_done_MUX_uxn_device_h_l81_c2_47f9_iftrue,
result_is_blit_done_MUX_uxn_device_h_l81_c2_47f9_iffalse,
result_is_blit_done_MUX_uxn_device_h_l81_c2_47f9_return_output);

-- is_new_row_MUX_uxn_device_h_l81_c2_47f9
is_new_row_MUX_uxn_device_h_l81_c2_47f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_new_row_MUX_uxn_device_h_l81_c2_47f9_cond,
is_new_row_MUX_uxn_device_h_l81_c2_47f9_iftrue,
is_new_row_MUX_uxn_device_h_l81_c2_47f9_iffalse,
is_new_row_MUX_uxn_device_h_l81_c2_47f9_return_output);

-- x_MUX_uxn_device_h_l81_c2_47f9
x_MUX_uxn_device_h_l81_c2_47f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l81_c2_47f9_cond,
x_MUX_uxn_device_h_l81_c2_47f9_iftrue,
x_MUX_uxn_device_h_l81_c2_47f9_iffalse,
x_MUX_uxn_device_h_l81_c2_47f9_return_output);

-- is_in_bounds_MUX_uxn_device_h_l81_c2_47f9
is_in_bounds_MUX_uxn_device_h_l81_c2_47f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_in_bounds_MUX_uxn_device_h_l81_c2_47f9_cond,
is_in_bounds_MUX_uxn_device_h_l81_c2_47f9_iftrue,
is_in_bounds_MUX_uxn_device_h_l81_c2_47f9_iffalse,
is_in_bounds_MUX_uxn_device_h_l81_c2_47f9_return_output);

-- ch_MUX_uxn_device_h_l81_c2_47f9
ch_MUX_uxn_device_h_l81_c2_47f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ch_MUX_uxn_device_h_l81_c2_47f9_cond,
ch_MUX_uxn_device_h_l81_c2_47f9_iftrue,
ch_MUX_uxn_device_h_l81_c2_47f9_iffalse,
ch_MUX_uxn_device_h_l81_c2_47f9_return_output);

-- y_MUX_uxn_device_h_l81_c2_47f9
y_MUX_uxn_device_h_l81_c2_47f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l81_c2_47f9_cond,
y_MUX_uxn_device_h_l81_c2_47f9_iftrue,
y_MUX_uxn_device_h_l81_c2_47f9_iffalse,
y_MUX_uxn_device_h_l81_c2_47f9_return_output);

-- BIN_OP_PLUS_uxn_device_h_l85_c21_fd9c
BIN_OP_PLUS_uxn_device_h_l85_c21_fd9c : entity work.BIN_OP_PLUS_uint16_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l85_c21_fd9c_left,
BIN_OP_PLUS_uxn_device_h_l85_c21_fd9c_right,
BIN_OP_PLUS_uxn_device_h_l85_c21_fd9c_return_output);

-- BIN_OP_EQ_uxn_device_h_l87_c16_c9fe
BIN_OP_EQ_uxn_device_h_l87_c16_c9fe : entity work.BIN_OP_EQ_uint3_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l87_c16_c9fe_left,
BIN_OP_EQ_uxn_device_h_l87_c16_c9fe_right,
BIN_OP_EQ_uxn_device_h_l87_c16_c9fe_return_output);

-- MUX_uxn_device_h_l87_c16_c9d7
MUX_uxn_device_h_l87_c16_c9d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l87_c16_c9d7_cond,
MUX_uxn_device_h_l87_c16_c9d7_iftrue,
MUX_uxn_device_h_l87_c16_c9d7_iffalse,
MUX_uxn_device_h_l87_c16_c9d7_return_output);

-- c_MUX_uxn_device_h_l88_c3_db26
c_MUX_uxn_device_h_l88_c3_db26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
c_MUX_uxn_device_h_l88_c3_db26_cond,
c_MUX_uxn_device_h_l88_c3_db26_iftrue,
c_MUX_uxn_device_h_l88_c3_db26_iffalse,
c_MUX_uxn_device_h_l88_c3_db26_return_output);

-- BIN_OP_PLUS_uxn_device_h_l89_c31_b5e4
BIN_OP_PLUS_uxn_device_h_l89_c31_b5e4 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l89_c31_b5e4_left,
BIN_OP_PLUS_uxn_device_h_l89_c31_b5e4_right,
BIN_OP_PLUS_uxn_device_h_l89_c31_b5e4_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c19_660a
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c19_660a : entity work.VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_0CLK_e799c7f1 port map (
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c19_660a_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c19_660a_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c19_660a_return_output);

-- CONST_SL_8_uxn_device_h_l90_c4_e4de
CONST_SL_8_uxn_device_h_l90_c4_e4de : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_device_h_l90_c4_e4de_x,
CONST_SL_8_uxn_device_h_l90_c4_e4de_return_output);

-- BIN_OP_MINUS_uxn_device_h_l91_c32_657d
BIN_OP_MINUS_uxn_device_h_l91_c32_657d : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l91_c32_657d_left,
BIN_OP_MINUS_uxn_device_h_l91_c32_657d_right,
BIN_OP_MINUS_uxn_device_h_l91_c32_657d_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l91_c20_98d6
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l91_c20_98d6 : entity work.VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_0CLK_e799c7f1 port map (
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l91_c20_98d6_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l91_c20_98d6_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l91_c20_98d6_return_output);

-- BIN_OP_OR_uxn_device_h_l91_c4_fdda
BIN_OP_OR_uxn_device_h_l91_c4_fdda : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l91_c4_fdda_left,
BIN_OP_OR_uxn_device_h_l91_c4_fdda_right,
BIN_OP_OR_uxn_device_h_l91_c4_fdda_return_output);

-- MUX_uxn_device_h_l93_c27_8acc
MUX_uxn_device_h_l93_c27_8acc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l93_c27_8acc_cond,
MUX_uxn_device_h_l93_c27_8acc_iftrue,
MUX_uxn_device_h_l93_c27_8acc_iffalse,
MUX_uxn_device_h_l93_c27_8acc_return_output);

-- BIN_OP_PLUS_uxn_device_h_l93_c21_9ac1
BIN_OP_PLUS_uxn_device_h_l93_c21_9ac1 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l93_c21_9ac1_left,
BIN_OP_PLUS_uxn_device_h_l93_c21_9ac1_right,
BIN_OP_PLUS_uxn_device_h_l93_c21_9ac1_return_output);

-- MUX_uxn_device_h_l93_c7_daeb
MUX_uxn_device_h_l93_c7_daeb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l93_c7_daeb_cond,
MUX_uxn_device_h_l93_c7_daeb_iftrue,
MUX_uxn_device_h_l93_c7_daeb_iffalse,
MUX_uxn_device_h_l93_c7_daeb_return_output);

-- BIN_OP_EQ_uxn_device_h_l94_c19_9f33
BIN_OP_EQ_uxn_device_h_l94_c19_9f33 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l94_c19_9f33_left,
BIN_OP_EQ_uxn_device_h_l94_c19_9f33_right,
BIN_OP_EQ_uxn_device_h_l94_c19_9f33_return_output);

-- MUX_uxn_device_h_l94_c19_ae58
MUX_uxn_device_h_l94_c19_ae58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l94_c19_ae58_cond,
MUX_uxn_device_h_l94_c19_ae58_iftrue,
MUX_uxn_device_h_l94_c19_ae58_iffalse,
MUX_uxn_device_h_l94_c19_ae58_return_output);

-- CONST_SL_1_uxn_device_h_l96_c3_da31
CONST_SL_1_uxn_device_h_l96_c3_da31 : entity work.CONST_SL_1_uint8_t_0CLK_de264c78 port map (
CONST_SL_1_uxn_device_h_l96_c3_da31_x,
CONST_SL_1_uxn_device_h_l96_c3_da31_return_output);

-- BIN_OP_OR_uxn_device_h_l97_c3_6817
BIN_OP_OR_uxn_device_h_l97_c3_6817 : entity work.BIN_OP_OR_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l97_c3_6817_left,
BIN_OP_OR_uxn_device_h_l97_c3_6817_right,
BIN_OP_OR_uxn_device_h_l97_c3_6817_return_output);

-- CONST_SL_8_uxn_device_h_l98_c22_a460
CONST_SL_8_uxn_device_h_l98_c22_a460 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_device_h_l98_c22_a460_x,
CONST_SL_8_uxn_device_h_l98_c22_a460_return_output);

-- BIN_OP_PLUS_uxn_device_h_l98_c22_619a
BIN_OP_PLUS_uxn_device_h_l98_c22_619a : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l98_c22_619a_left,
BIN_OP_PLUS_uxn_device_h_l98_c22_619a_right,
BIN_OP_PLUS_uxn_device_h_l98_c22_619a_return_output);

-- BIN_OP_EQ_uxn_device_h_l99_c52_2d65
BIN_OP_EQ_uxn_device_h_l99_c52_2d65 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l99_c52_2d65_left,
BIN_OP_EQ_uxn_device_h_l99_c52_2d65_right,
BIN_OP_EQ_uxn_device_h_l99_c52_2d65_return_output);

-- MUX_uxn_device_h_l99_c52_b904
MUX_uxn_device_h_l99_c52_b904 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l99_c52_b904_cond,
MUX_uxn_device_h_l99_c52_b904_iftrue,
MUX_uxn_device_h_l99_c52_b904_iffalse,
MUX_uxn_device_h_l99_c52_b904_return_output);

-- BIN_OP_OR_uxn_device_h_l99_c42_9e3e
BIN_OP_OR_uxn_device_h_l99_c42_9e3e : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l99_c42_9e3e_left,
BIN_OP_OR_uxn_device_h_l99_c42_9e3e_right,
BIN_OP_OR_uxn_device_h_l99_c42_9e3e_return_output);

-- BIN_OP_AND_uxn_device_h_l99_c26_6635
BIN_OP_AND_uxn_device_h_l99_c26_6635 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l99_c26_6635_left,
BIN_OP_AND_uxn_device_h_l99_c26_6635_right,
BIN_OP_AND_uxn_device_h_l99_c26_6635_return_output);

-- CONST_SL_4_uxn_device_h_l100_c40_c6f5
CONST_SL_4_uxn_device_h_l100_c40_c6f5 : entity work.CONST_SL_4_uint8_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_device_h_l100_c40_c6f5_x,
CONST_SL_4_uxn_device_h_l100_c40_c6f5_return_output);

-- BIN_OP_PLUS_uxn_device_h_l100_c30_ae02
BIN_OP_PLUS_uxn_device_h_l100_c30_ae02 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l100_c30_ae02_left,
BIN_OP_PLUS_uxn_device_h_l100_c30_ae02_right,
BIN_OP_PLUS_uxn_device_h_l100_c30_ae02_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_328e
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_328e : entity work.VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_0CLK_4b00ae23 port map (
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_328e_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_328e_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_328e_return_output);

-- BIN_OP_EQ_uxn_device_h_l101_c7_b7ba
BIN_OP_EQ_uxn_device_h_l101_c7_b7ba : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l101_c7_b7ba_left,
BIN_OP_EQ_uxn_device_h_l101_c7_b7ba_right,
BIN_OP_EQ_uxn_device_h_l101_c7_b7ba_return_output);

-- BIN_OP_MINUS_uxn_device_h_l101_c41_964b
BIN_OP_MINUS_uxn_device_h_l101_c41_964b : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l101_c41_964b_left,
BIN_OP_MINUS_uxn_device_h_l101_c41_964b_right,
BIN_OP_MINUS_uxn_device_h_l101_c41_964b_return_output);

-- BIN_OP_PLUS_uxn_device_h_l101_c51_5ecf
BIN_OP_PLUS_uxn_device_h_l101_c51_5ecf : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l101_c51_5ecf_left,
BIN_OP_PLUS_uxn_device_h_l101_c51_5ecf_right,
BIN_OP_PLUS_uxn_device_h_l101_c51_5ecf_return_output);

-- MUX_uxn_device_h_l101_c35_1b24
MUX_uxn_device_h_l101_c35_1b24 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l101_c35_1b24_cond,
MUX_uxn_device_h_l101_c35_1b24_iftrue,
MUX_uxn_device_h_l101_c35_1b24_iffalse,
MUX_uxn_device_h_l101_c35_1b24_return_output);

-- MUX_uxn_device_h_l101_c7_ac13
MUX_uxn_device_h_l101_c7_ac13 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l101_c7_ac13_cond,
MUX_uxn_device_h_l101_c7_ac13_iftrue,
MUX_uxn_device_h_l101_c7_ac13_iffalse,
MUX_uxn_device_h_l101_c7_ac13_return_output);

-- BIN_OP_EQ_uxn_device_h_l102_c25_ebf8
BIN_OP_EQ_uxn_device_h_l102_c25_ebf8 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l102_c25_ebf8_left,
BIN_OP_EQ_uxn_device_h_l102_c25_ebf8_right,
BIN_OP_EQ_uxn_device_h_l102_c25_ebf8_return_output);

-- MUX_uxn_device_h_l102_c25_0954
MUX_uxn_device_h_l102_c25_0954 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l102_c25_0954_cond,
MUX_uxn_device_h_l102_c25_0954_iftrue,
MUX_uxn_device_h_l102_c25_0954_iffalse,
MUX_uxn_device_h_l102_c25_0954_return_output);

-- BIN_OP_PLUS_uxn_device_h_l103_c14_c1bc
BIN_OP_PLUS_uxn_device_h_l103_c14_c1bc : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l103_c14_c1bc_left,
BIN_OP_PLUS_uxn_device_h_l103_c14_c1bc_right,
BIN_OP_PLUS_uxn_device_h_l103_c14_c1bc_return_output);

-- BIN_OP_MINUS_uxn_device_h_l103_c24_ec44
BIN_OP_MINUS_uxn_device_h_l103_c24_ec44 : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l103_c24_ec44_left,
BIN_OP_MINUS_uxn_device_h_l103_c24_ec44_right,
BIN_OP_MINUS_uxn_device_h_l103_c24_ec44_return_output);

-- MUX_uxn_device_h_l103_c8_4d36
MUX_uxn_device_h_l103_c8_4d36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l103_c8_4d36_cond,
MUX_uxn_device_h_l103_c8_4d36_iftrue,
MUX_uxn_device_h_l103_c8_4d36_iffalse,
MUX_uxn_device_h_l103_c8_4d36_return_output);

-- CONST_SR_1_uxn_device_h_l104_c3_64f3
CONST_SR_1_uxn_device_h_l104_c3_64f3 : entity work.CONST_SR_1_uint16_t_0CLK_de264c78 port map (
CONST_SR_1_uxn_device_h_l104_c3_64f3_x,
CONST_SR_1_uxn_device_h_l104_c3_64f3_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 x1,
 y1,
 color,
 fx,
 fy,
 ram_addr,
 previous_ram_read,
 -- Registers
 blending,
 x,
 y,
 opaque,
 c,
 ch,
 color8,
 result,
 phase_minus_two,
 phase7_downto_4,
 phase7_downto_3,
 phase2_downto_0,
 phase7_downto_3_u8,
 sprite_rows,
 is_in_bounds,
 is_new_row,
 -- All submodule outputs
 BIN_OP_MINUS_uxn_device_h_l69_c20_aad5_return_output,
 BIN_OP_EQ_uxn_device_h_l71_c6_db59_return_output,
 sprite_rows_MUX_uxn_device_h_l71_c2_a1e6_return_output,
 VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_b41c_return_output,
 BIN_OP_EQ_uxn_device_h_l75_c6_7045_return_output,
 x_MUX_uxn_device_h_l75_c2_f9db_return_output,
 opaque_MUX_uxn_device_h_l75_c2_f9db_return_output,
 y_MUX_uxn_device_h_l75_c2_f9db_return_output,
 BIN_OP_PLUS_uxn_device_h_l76_c21_5564_return_output,
 VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_4f46_return_output,
 MUX_uxn_device_h_l77_c13_2a6a_return_output,
 BIN_OP_PLUS_uxn_device_h_l77_c7_96f3_return_output,
 MUX_uxn_device_h_l78_c13_220e_return_output,
 BIN_OP_PLUS_uxn_device_h_l78_c7_4783_return_output,
 BIN_OP_EQ_uxn_device_h_l81_c6_e21b_return_output,
 c_MUX_uxn_device_h_l81_c2_47f9_return_output,
 result_is_vram_write_MUX_uxn_device_h_l81_c2_47f9_return_output,
 result_u16_addr_MUX_uxn_device_h_l81_c2_47f9_return_output,
 result_u8_value_MUX_uxn_device_h_l81_c2_47f9_return_output,
 result_is_blit_done_MUX_uxn_device_h_l81_c2_47f9_return_output,
 is_new_row_MUX_uxn_device_h_l81_c2_47f9_return_output,
 x_MUX_uxn_device_h_l81_c2_47f9_return_output,
 is_in_bounds_MUX_uxn_device_h_l81_c2_47f9_return_output,
 ch_MUX_uxn_device_h_l81_c2_47f9_return_output,
 y_MUX_uxn_device_h_l81_c2_47f9_return_output,
 BIN_OP_PLUS_uxn_device_h_l85_c21_fd9c_return_output,
 BIN_OP_EQ_uxn_device_h_l87_c16_c9fe_return_output,
 MUX_uxn_device_h_l87_c16_c9d7_return_output,
 c_MUX_uxn_device_h_l88_c3_db26_return_output,
 BIN_OP_PLUS_uxn_device_h_l89_c31_b5e4_return_output,
 VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c19_660a_return_output,
 CONST_SL_8_uxn_device_h_l90_c4_e4de_return_output,
 BIN_OP_MINUS_uxn_device_h_l91_c32_657d_return_output,
 VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l91_c20_98d6_return_output,
 BIN_OP_OR_uxn_device_h_l91_c4_fdda_return_output,
 MUX_uxn_device_h_l93_c27_8acc_return_output,
 BIN_OP_PLUS_uxn_device_h_l93_c21_9ac1_return_output,
 MUX_uxn_device_h_l93_c7_daeb_return_output,
 BIN_OP_EQ_uxn_device_h_l94_c19_9f33_return_output,
 MUX_uxn_device_h_l94_c19_ae58_return_output,
 CONST_SL_1_uxn_device_h_l96_c3_da31_return_output,
 BIN_OP_OR_uxn_device_h_l97_c3_6817_return_output,
 CONST_SL_8_uxn_device_h_l98_c22_a460_return_output,
 BIN_OP_PLUS_uxn_device_h_l98_c22_619a_return_output,
 BIN_OP_EQ_uxn_device_h_l99_c52_2d65_return_output,
 MUX_uxn_device_h_l99_c52_b904_return_output,
 BIN_OP_OR_uxn_device_h_l99_c42_9e3e_return_output,
 BIN_OP_AND_uxn_device_h_l99_c26_6635_return_output,
 CONST_SL_4_uxn_device_h_l100_c40_c6f5_return_output,
 BIN_OP_PLUS_uxn_device_h_l100_c30_ae02_return_output,
 VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_328e_return_output,
 BIN_OP_EQ_uxn_device_h_l101_c7_b7ba_return_output,
 BIN_OP_MINUS_uxn_device_h_l101_c41_964b_return_output,
 BIN_OP_PLUS_uxn_device_h_l101_c51_5ecf_return_output,
 MUX_uxn_device_h_l101_c35_1b24_return_output,
 MUX_uxn_device_h_l101_c7_ac13_return_output,
 BIN_OP_EQ_uxn_device_h_l102_c25_ebf8_return_output,
 MUX_uxn_device_h_l102_c25_0954_return_output,
 BIN_OP_PLUS_uxn_device_h_l103_c14_c1bc_return_output,
 BIN_OP_MINUS_uxn_device_h_l103_c24_ec44_return_output,
 MUX_uxn_device_h_l103_c8_4d36_return_output,
 CONST_SR_1_uxn_device_h_l104_c3_64f3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : screen_blit_result_t;
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_x1 : unsigned(15 downto 0);
 variable VAR_y1 : unsigned(15 downto 0);
 variable VAR_color : unsigned(3 downto 0);
 variable VAR_fx : unsigned(0 downto 0);
 variable VAR_fy : unsigned(0 downto 0);
 variable VAR_ram_addr : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_color8_uxn_device_h_l64_c2_69ad : unsigned(7 downto 0);
 variable VAR_uint12_7_4_uxn_device_h_l65_c20_a388_return_output : unsigned(3 downto 0);
 variable VAR_phase7_downto_3_uxn_device_h_l66_c2_2c24 : unsigned(4 downto 0);
 variable VAR_uint12_7_3_uxn_device_h_l66_c20_cc53_return_output : unsigned(4 downto 0);
 variable VAR_uint12_2_0_uxn_device_h_l67_c20_c433_return_output : unsigned(2 downto 0);
 variable VAR_phase7_downto_3_u8_uxn_device_h_l68_c2_7160 : unsigned(7 downto 0);
 variable VAR_phase_minus_two_uxn_device_h_l69_c2_a114 : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_aad5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_aad5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_aad5_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l71_c6_db59_left : unsigned(3 downto 0);
 variable VAR_uint12_7_4_uxn_device_h_l71_c6_9dd9_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l71_c6_db59_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l71_c6_db59_return_output : unsigned(0 downto 0);
 variable VAR_sprite_rows_MUX_uxn_device_h_l71_c2_a1e6_iftrue : uint8_t_16;
 variable VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5_uxn_device_h_l71_c2_a1e6_return_output : uint8_t_16;
 variable VAR_sprite_rows_MUX_uxn_device_h_l71_c2_a1e6_iffalse : uint8_t_16;
 variable VAR_sprite_rows_MUX_uxn_device_h_l71_c2_a1e6_return_output : uint8_t_16;
 variable VAR_sprite_rows_MUX_uxn_device_h_l71_c2_a1e6_cond : unsigned(0 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_b41c_return_output : uint8_t_array_16_t;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_b41c_elem_val : unsigned(7 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_b41c_ref_toks_0 : uint8_t_16;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_b41c_var_dim_0 : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l75_c6_7045_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l75_c6_7045_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l75_c6_7045_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c2_f9db_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l77_c3_6376 : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c2_f9db_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c2_f9db_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c2_f9db_cond : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l75_c2_f9db_iftrue : unsigned(0 downto 0);
 variable VAR_opaque_uxn_device_h_l76_c3_f541 : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l75_c2_f9db_iffalse : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l75_c2_f9db_return_output : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l75_c2_f9db_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c2_f9db_iftrue : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l78_c3_8806 : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c2_f9db_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c2_f9db_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c2_f9db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_5564_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_5564_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_5564_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_4f46_var_dim_0 : unsigned(6 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_4f46_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_4f46_ref_toks_0 : uint8_t_80;
 variable VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_96f3_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l77_c13_2a6a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l77_c13_2a6a_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l77_c13_2a6a_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l77_c13_2a6a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_96f3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_96f3_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_4783_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l78_c13_220e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l78_c13_220e_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l78_c13_220e_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l78_c13_220e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_4783_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_4783_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e21b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e21b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e21b_return_output : unsigned(0 downto 0);
 variable VAR_c_MUX_uxn_device_h_l81_c2_47f9_iftrue : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l81_c2_47f9_iffalse : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l81_c2_47f9_return_output : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l81_c2_47f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_47f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_47f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_47f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_47f9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_47f9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l85_c3_0c2d : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_47f9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l98_c3_b1f7 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_47f9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_47f9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l81_c2_47f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l83_c3_d607 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l81_c2_47f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l81_c2_47f9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l81_c2_47f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_47f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_47f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_47f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_47f9_cond : unsigned(0 downto 0);
 variable VAR_is_new_row_MUX_uxn_device_h_l81_c2_47f9_iftrue : unsigned(0 downto 0);
 variable VAR_is_new_row_MUX_uxn_device_h_l81_c2_47f9_iffalse : unsigned(0 downto 0);
 variable VAR_is_new_row_MUX_uxn_device_h_l81_c2_47f9_return_output : unsigned(0 downto 0);
 variable VAR_is_new_row_MUX_uxn_device_h_l81_c2_47f9_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c2_47f9_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c2_47f9_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c2_47f9_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c2_47f9_cond : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_47f9_iftrue : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_47f9_iffalse : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_47f9_return_output : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_47f9_cond : unsigned(0 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l81_c2_47f9_iftrue : unsigned(7 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l81_c2_47f9_iffalse : unsigned(7 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l81_c2_47f9_return_output : unsigned(7 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l81_c2_47f9_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c2_47f9_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c2_47f9_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c2_47f9_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c2_47f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_fd9c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_fd9c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_fd9c_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l87_c16_c9d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l87_c16_c9fe_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l87_c16_c9fe_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l87_c16_c9fe_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l87_c16_c9d7_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l87_c16_c9d7_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l87_c16_c9d7_return_output : unsigned(0 downto 0);
 variable VAR_c_MUX_uxn_device_h_l88_c3_db26_iftrue : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l88_c3_db26_iffalse : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l88_c3_db26_return_output : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l88_c3_db26_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l89_c31_b5e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l89_c31_b5e4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l89_c31_b5e4_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c19_660a_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c19_660a_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c19_660a_ref_toks_0 : uint8_t_16;
 variable VAR_CAST_TO_uint16_t_uxn_device_h_l89_c8_e43a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_device_h_l90_c4_e4de_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_device_h_l90_c4_e4de_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c4_fdda_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l91_c32_657d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l91_c32_657d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l91_c32_657d_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l91_c20_98d6_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l91_c20_98d6_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l91_c20_98d6_ref_toks_0 : uint8_t_16;
 variable VAR_CAST_TO_uint16_t_uxn_device_h_l91_c9_0ef2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c4_fdda_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l91_c4_fdda_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l93_c7_daeb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l93_c7_daeb_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l93_c7_daeb_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l93_c21_9ac1_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l93_c27_8acc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l93_c27_8acc_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l93_c27_8acc_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l93_c27_8acc_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l93_c21_9ac1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l93_c21_9ac1_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l93_c7_daeb_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l94_c19_ae58_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l94_c19_9f33_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_device_h_l94_c19_4dc2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l94_c19_9f33_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l94_c19_9f33_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l94_c19_ae58_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l94_c19_ae58_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l94_c19_ae58_return_output : unsigned(0 downto 0);
 variable VAR_ch_uxn_device_h_l95_c3_3b77 : unsigned(7 downto 0);
 variable VAR_uint16_8_8_uxn_device_h_l95_c8_a6b2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SL_1_uxn_device_h_l96_c3_da31_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SL_1_uxn_device_h_l96_c3_da31_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l97_c3_6817_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l97_c3_6817_right : unsigned(0 downto 0);
 variable VAR_uint16_0_0_uxn_device_h_l97_c9_b005_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l97_c3_6817_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SL_8_uxn_device_h_l98_c22_a460_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l98_c22_619a_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_device_h_l98_c22_a460_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l98_c22_619a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l98_c22_619a_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l99_c26_6635_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l99_c42_9e3e_left : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l99_c52_b904_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c52_2d65_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c52_2d65_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c52_2d65_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l99_c52_b904_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l99_c52_b904_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l99_c52_b904_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l99_c42_9e3e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l99_c42_9e3e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l99_c26_6635_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l99_c26_6635_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l100_c30_ae02_left : unsigned(7 downto 0);
 variable VAR_CONST_SL_4_uxn_device_h_l100_c40_c6f5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l100_c30_ae02_right : unsigned(7 downto 0);
 variable VAR_CONST_SL_4_uxn_device_h_l100_c40_c6f5_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l100_c30_ae02_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_328e_var_dim_0 : unsigned(6 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_328e_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_328e_ref_toks_0 : uint8_t_80;
 variable VAR_MUX_uxn_device_h_l101_c7_ac13_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c7_b7ba_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c7_b7ba_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c7_b7ba_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l101_c7_ac13_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l101_c7_ac13_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l101_c35_1b24_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l101_c35_1b24_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l101_c35_1b24_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l101_c41_964b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l101_c41_964b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l101_c41_964b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l101_c51_5ecf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l101_c51_5ecf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l101_c51_5ecf_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l101_c35_1b24_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l101_c7_ac13_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l102_c25_0954_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l102_c25_ebf8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l102_c25_ebf8_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l102_c25_ebf8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l102_c25_0954_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l102_c25_0954_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l102_c25_0954_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c8_4d36_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c8_4d36_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c8_4d36_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l103_c14_c1bc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l103_c14_c1bc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l103_c14_c1bc_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l103_c24_ec44_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l103_c24_ec44_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l103_c24_ec44_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c8_4d36_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l104_c3_64f3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l104_c3_64f3_x : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_0cf6_uxn_device_h_l107_l42_DUPLICATE_1ad7_return_output : screen_blit_result_t;
 -- State registers comb logic variables
variable REG_VAR_blending : uint8_t_80;
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
variable REG_VAR_opaque : unsigned(0 downto 0);
variable REG_VAR_c : unsigned(15 downto 0);
variable REG_VAR_ch : unsigned(7 downto 0);
variable REG_VAR_color8 : unsigned(7 downto 0);
variable REG_VAR_result : screen_blit_result_t;
variable REG_VAR_phase_minus_two : unsigned(11 downto 0);
variable REG_VAR_phase7_downto_4 : unsigned(3 downto 0);
variable REG_VAR_phase7_downto_3 : unsigned(4 downto 0);
variable REG_VAR_phase2_downto_0 : unsigned(2 downto 0);
variable REG_VAR_phase7_downto_3_u8 : unsigned(7 downto 0);
variable REG_VAR_sprite_rows : uint8_t_16;
variable REG_VAR_is_in_bounds : unsigned(0 downto 0);
variable REG_VAR_is_new_row : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_blending := blending;
  REG_VAR_x := x;
  REG_VAR_y := y;
  REG_VAR_opaque := opaque;
  REG_VAR_c := c;
  REG_VAR_ch := ch;
  REG_VAR_color8 := color8;
  REG_VAR_result := result;
  REG_VAR_phase_minus_two := phase_minus_two;
  REG_VAR_phase7_downto_4 := phase7_downto_4;
  REG_VAR_phase7_downto_3 := phase7_downto_3;
  REG_VAR_phase2_downto_0 := phase2_downto_0;
  REG_VAR_phase7_downto_3_u8 := phase7_downto_3_u8;
  REG_VAR_sprite_rows := sprite_rows;
  REG_VAR_is_in_bounds := is_in_bounds;
  REG_VAR_is_new_row := is_new_row;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_device_h_l78_c13_220e_iffalse := to_unsigned(0, 16);
     VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_aad5_right := to_unsigned(2, 2);
     VAR_BIN_OP_MINUS_uxn_device_h_l91_c32_657d_right := to_unsigned(2, 8);
     VAR_MUX_uxn_device_h_l99_c52_b904_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l103_c14_c1bc_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l103_c24_ec44_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e21b_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l101_c51_5ecf_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l77_c13_2a6a_iffalse := to_unsigned(7, 16);
     VAR_MUX_uxn_device_h_l78_c13_220e_iftrue := to_unsigned(7, 16);
     VAR_MUX_uxn_device_h_l102_c25_0954_iffalse := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_47f9_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l94_c19_ae58_iftrue := to_unsigned(1, 1);
     VAR_result_u8_value_uxn_device_h_l83_c3_d607 := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l81_c2_47f9_iftrue := VAR_result_u8_value_uxn_device_h_l83_c3_d607;
     VAR_MUX_uxn_device_h_l77_c13_2a6a_iftrue := to_unsigned(0, 16);
     VAR_MUX_uxn_device_h_l87_c16_c9d7_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l93_c27_8acc_iffalse := to_unsigned(7, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l89_c31_b5e4_right := to_unsigned(6, 8);
     VAR_MUX_uxn_device_h_l93_c27_8acc_iftrue := to_unsigned(0, 16);
     VAR_BIN_OP_EQ_uxn_device_h_l101_c7_b7ba_right := to_unsigned(7, 3);
     VAR_MUX_uxn_device_h_l102_c25_0954_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l102_c25_ebf8_right := to_unsigned(79, 12);
     VAR_MUX_uxn_device_h_l87_c16_c9d7_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l94_c19_ae58_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l94_c19_9f33_right := to_unsigned(0, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l99_c52_2d65_right := to_unsigned(0, 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_5564_left := to_unsigned(64, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l75_c6_7045_right := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l101_c41_964b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l87_c16_c9fe_right := to_unsigned(0, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l71_c6_db59_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l99_c52_b904_iftrue := to_unsigned(0, 1);
     VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_47f9_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_x1 := x1;
     VAR_y1 := y1;
     VAR_color := color;
     VAR_fx := fx;
     VAR_fy := fy;
     VAR_ram_addr := ram_addr;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_328e_ref_toks_0 := blending;
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_4f46_ref_toks_0 := blending;
     REG_VAR_blending := blending;
     VAR_c_MUX_uxn_device_h_l81_c2_47f9_iftrue := c;
     VAR_c_MUX_uxn_device_h_l88_c3_db26_iffalse := c;
     VAR_ch_MUX_uxn_device_h_l81_c2_47f9_iftrue := ch;
     VAR_color8_uxn_device_h_l64_c2_69ad := resize(VAR_color, 8);
     VAR_MUX_uxn_device_h_l103_c8_4d36_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l77_c13_2a6a_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l93_c27_8acc_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l101_c35_1b24_cond := VAR_fy;
     VAR_MUX_uxn_device_h_l78_c13_220e_cond := VAR_fy;
     VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_47f9_iftrue := is_in_bounds;
     VAR_is_new_row_MUX_uxn_device_h_l81_c2_47f9_iftrue := is_new_row;
     VAR_opaque_MUX_uxn_device_h_l75_c2_f9db_iffalse := opaque;
     VAR_BIN_OP_EQ_uxn_device_h_l102_c25_ebf8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l75_c6_7045_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_aad5_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_fd9c_right := VAR_phase;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_b41c_elem_val := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_fd9c_left := VAR_ram_addr;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_b41c_ref_toks_0 := sprite_rows;
     VAR_sprite_rows_MUX_uxn_device_h_l71_c2_a1e6_iffalse := sprite_rows;
     VAR_x_MUX_uxn_device_h_l75_c2_f9db_iffalse := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_96f3_left := VAR_x1;
     VAR_BIN_OP_PLUS_uxn_device_h_l93_c21_9ac1_left := VAR_x1;
     VAR_y_MUX_uxn_device_h_l75_c2_f9db_iffalse := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_4783_left := VAR_y1;
     VAR_BIN_OP_PLUS_uxn_device_h_l100_c30_ae02_left := VAR_color8_uxn_device_h_l64_c2_69ad;
     VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_5564_right := VAR_color8_uxn_device_h_l64_c2_69ad;
     REG_VAR_color8 := VAR_color8_uxn_device_h_l64_c2_69ad;
     -- BIN_OP_EQ[uxn_device_h_l102_c25_ebf8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l102_c25_ebf8_left <= VAR_BIN_OP_EQ_uxn_device_h_l102_c25_ebf8_left;
     BIN_OP_EQ_uxn_device_h_l102_c25_ebf8_right <= VAR_BIN_OP_EQ_uxn_device_h_l102_c25_ebf8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l102_c25_ebf8_return_output := BIN_OP_EQ_uxn_device_h_l102_c25_ebf8_return_output;

     -- MUX[uxn_device_h_l93_c27_8acc] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l93_c27_8acc_cond <= VAR_MUX_uxn_device_h_l93_c27_8acc_cond;
     MUX_uxn_device_h_l93_c27_8acc_iftrue <= VAR_MUX_uxn_device_h_l93_c27_8acc_iftrue;
     MUX_uxn_device_h_l93_c27_8acc_iffalse <= VAR_MUX_uxn_device_h_l93_c27_8acc_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l93_c27_8acc_return_output := MUX_uxn_device_h_l93_c27_8acc_return_output;

     -- BIN_OP_EQ[uxn_device_h_l75_c6_7045] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l75_c6_7045_left <= VAR_BIN_OP_EQ_uxn_device_h_l75_c6_7045_left;
     BIN_OP_EQ_uxn_device_h_l75_c6_7045_right <= VAR_BIN_OP_EQ_uxn_device_h_l75_c6_7045_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l75_c6_7045_return_output := BIN_OP_EQ_uxn_device_h_l75_c6_7045_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l85_c21_fd9c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l85_c21_fd9c_left <= VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_fd9c_left;
     BIN_OP_PLUS_uxn_device_h_l85_c21_fd9c_right <= VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_fd9c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_fd9c_return_output := BIN_OP_PLUS_uxn_device_h_l85_c21_fd9c_return_output;

     -- uint12_2_0[uxn_device_h_l67_c20_c433] LATENCY=0
     VAR_uint12_2_0_uxn_device_h_l67_c20_c433_return_output := uint12_2_0(
     VAR_phase);

     -- MUX[uxn_device_h_l78_c13_220e] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l78_c13_220e_cond <= VAR_MUX_uxn_device_h_l78_c13_220e_cond;
     MUX_uxn_device_h_l78_c13_220e_iftrue <= VAR_MUX_uxn_device_h_l78_c13_220e_iftrue;
     MUX_uxn_device_h_l78_c13_220e_iffalse <= VAR_MUX_uxn_device_h_l78_c13_220e_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l78_c13_220e_return_output := MUX_uxn_device_h_l78_c13_220e_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l76_c21_5564] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l76_c21_5564_left <= VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_5564_left;
     BIN_OP_PLUS_uxn_device_h_l76_c21_5564_right <= VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_5564_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_5564_return_output := BIN_OP_PLUS_uxn_device_h_l76_c21_5564_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l69_c20_aad5] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l69_c20_aad5_left <= VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_aad5_left;
     BIN_OP_MINUS_uxn_device_h_l69_c20_aad5_right <= VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_aad5_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_aad5_return_output := BIN_OP_MINUS_uxn_device_h_l69_c20_aad5_return_output;

     -- MUX[uxn_device_h_l77_c13_2a6a] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l77_c13_2a6a_cond <= VAR_MUX_uxn_device_h_l77_c13_2a6a_cond;
     MUX_uxn_device_h_l77_c13_2a6a_iftrue <= VAR_MUX_uxn_device_h_l77_c13_2a6a_iftrue;
     MUX_uxn_device_h_l77_c13_2a6a_iffalse <= VAR_MUX_uxn_device_h_l77_c13_2a6a_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l77_c13_2a6a_return_output := MUX_uxn_device_h_l77_c13_2a6a_return_output;

     -- uint12_7_3[uxn_device_h_l66_c20_cc53] LATENCY=0
     VAR_uint12_7_3_uxn_device_h_l66_c20_cc53_return_output := uint12_7_3(
     VAR_phase);

     -- uint12_7_4[uxn_device_h_l65_c20_a388] LATENCY=0
     VAR_uint12_7_4_uxn_device_h_l65_c20_a388_return_output := uint12_7_4(
     VAR_phase);

     -- Submodule level 1
     VAR_MUX_uxn_device_h_l102_c25_0954_cond := VAR_BIN_OP_EQ_uxn_device_h_l102_c25_ebf8_return_output;
     VAR_opaque_MUX_uxn_device_h_l75_c2_f9db_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c6_7045_return_output;
     VAR_x_MUX_uxn_device_h_l75_c2_f9db_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c6_7045_return_output;
     VAR_y_MUX_uxn_device_h_l75_c2_f9db_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c6_7045_return_output;
     VAR_phase_minus_two_uxn_device_h_l69_c2_a114 := VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_aad5_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_4f46_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_5564_return_output, 7);
     VAR_result_u16_addr_uxn_device_h_l85_c3_0c2d := resize(VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_fd9c_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_96f3_right := VAR_MUX_uxn_device_h_l77_c13_2a6a_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_4783_right := VAR_MUX_uxn_device_h_l78_c13_220e_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l93_c21_9ac1_right := VAR_MUX_uxn_device_h_l93_c27_8acc_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l101_c7_b7ba_left := VAR_uint12_2_0_uxn_device_h_l67_c20_c433_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l87_c16_c9fe_left := VAR_uint12_2_0_uxn_device_h_l67_c20_c433_return_output;
     REG_VAR_phase2_downto_0 := VAR_uint12_2_0_uxn_device_h_l67_c20_c433_return_output;
     VAR_phase7_downto_3_uxn_device_h_l66_c2_2c24 := VAR_uint12_7_3_uxn_device_h_l66_c20_cc53_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e21b_left := VAR_uint12_7_4_uxn_device_h_l65_c20_a388_return_output;
     REG_VAR_phase7_downto_4 := VAR_uint12_7_4_uxn_device_h_l65_c20_a388_return_output;
     REG_VAR_phase7_downto_3 := VAR_phase7_downto_3_uxn_device_h_l66_c2_2c24;
     VAR_phase7_downto_3_u8_uxn_device_h_l68_c2_7160 := resize(VAR_phase7_downto_3_uxn_device_h_l66_c2_2c24, 8);
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_b41c_var_dim_0 := resize(VAR_phase_minus_two_uxn_device_h_l69_c2_a114, 4);
     REG_VAR_phase_minus_two := VAR_phase_minus_two_uxn_device_h_l69_c2_a114;
     VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_47f9_iftrue := VAR_result_u16_addr_uxn_device_h_l85_c3_0c2d;
     VAR_BIN_OP_MINUS_uxn_device_h_l91_c32_657d_left := VAR_phase7_downto_3_u8_uxn_device_h_l68_c2_7160;
     VAR_BIN_OP_PLUS_uxn_device_h_l89_c31_b5e4_left := VAR_phase7_downto_3_u8_uxn_device_h_l68_c2_7160;
     REG_VAR_phase7_downto_3_u8 := VAR_phase7_downto_3_u8_uxn_device_h_l68_c2_7160;
     -- uint12_7_4[uxn_device_h_l71_c6_9dd9] LATENCY=0
     VAR_uint12_7_4_uxn_device_h_l71_c6_9dd9_return_output := uint12_7_4(
     VAR_phase_minus_two_uxn_device_h_l69_c2_a114);

     -- MUX[uxn_device_h_l102_c25_0954] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l102_c25_0954_cond <= VAR_MUX_uxn_device_h_l102_c25_0954_cond;
     MUX_uxn_device_h_l102_c25_0954_iftrue <= VAR_MUX_uxn_device_h_l102_c25_0954_iftrue;
     MUX_uxn_device_h_l102_c25_0954_iffalse <= VAR_MUX_uxn_device_h_l102_c25_0954_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l102_c25_0954_return_output := MUX_uxn_device_h_l102_c25_0954_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l77_c7_96f3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l77_c7_96f3_left <= VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_96f3_left;
     BIN_OP_PLUS_uxn_device_h_l77_c7_96f3_right <= VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_96f3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_96f3_return_output := BIN_OP_PLUS_uxn_device_h_l77_c7_96f3_return_output;

     -- BIN_OP_EQ[uxn_device_h_l81_c6_e21b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l81_c6_e21b_left <= VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e21b_left;
     BIN_OP_EQ_uxn_device_h_l81_c6_e21b_right <= VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e21b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e21b_return_output := BIN_OP_EQ_uxn_device_h_l81_c6_e21b_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l91_c32_657d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l91_c32_657d_left <= VAR_BIN_OP_MINUS_uxn_device_h_l91_c32_657d_left;
     BIN_OP_MINUS_uxn_device_h_l91_c32_657d_right <= VAR_BIN_OP_MINUS_uxn_device_h_l91_c32_657d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l91_c32_657d_return_output := BIN_OP_MINUS_uxn_device_h_l91_c32_657d_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l93_c21_9ac1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l93_c21_9ac1_left <= VAR_BIN_OP_PLUS_uxn_device_h_l93_c21_9ac1_left;
     BIN_OP_PLUS_uxn_device_h_l93_c21_9ac1_right <= VAR_BIN_OP_PLUS_uxn_device_h_l93_c21_9ac1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l93_c21_9ac1_return_output := BIN_OP_PLUS_uxn_device_h_l93_c21_9ac1_return_output;

     -- VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60[uxn_device_h_l72_c3_b41c] LATENCY=0
     -- Inputs
     VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_b41c_elem_val <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_b41c_elem_val;
     VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_b41c_ref_toks_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_b41c_ref_toks_0;
     VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_b41c_var_dim_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_b41c_var_dim_0;
     -- Outputs
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_b41c_return_output := VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_b41c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l87_c16_c9fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l87_c16_c9fe_left <= VAR_BIN_OP_EQ_uxn_device_h_l87_c16_c9fe_left;
     BIN_OP_EQ_uxn_device_h_l87_c16_c9fe_right <= VAR_BIN_OP_EQ_uxn_device_h_l87_c16_c9fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l87_c16_c9fe_return_output := BIN_OP_EQ_uxn_device_h_l87_c16_c9fe_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l76_c12_4f46] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_4f46_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_4f46_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_4f46_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_4f46_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_4f46_return_output := VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_4f46_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l78_c7_4783] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l78_c7_4783_left <= VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_4783_left;
     BIN_OP_PLUS_uxn_device_h_l78_c7_4783_right <= VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_4783_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_4783_return_output := BIN_OP_PLUS_uxn_device_h_l78_c7_4783_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l89_c31_b5e4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l89_c31_b5e4_left <= VAR_BIN_OP_PLUS_uxn_device_h_l89_c31_b5e4_left;
     BIN_OP_PLUS_uxn_device_h_l89_c31_b5e4_right <= VAR_BIN_OP_PLUS_uxn_device_h_l89_c31_b5e4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l89_c31_b5e4_return_output := BIN_OP_PLUS_uxn_device_h_l89_c31_b5e4_return_output;

     -- BIN_OP_EQ[uxn_device_h_l101_c7_b7ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l101_c7_b7ba_left <= VAR_BIN_OP_EQ_uxn_device_h_l101_c7_b7ba_left;
     BIN_OP_EQ_uxn_device_h_l101_c7_b7ba_right <= VAR_BIN_OP_EQ_uxn_device_h_l101_c7_b7ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l101_c7_b7ba_return_output := BIN_OP_EQ_uxn_device_h_l101_c7_b7ba_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l101_c7_ac13_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c7_b7ba_return_output;
     VAR_c_MUX_uxn_device_h_l81_c2_47f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e21b_return_output;
     VAR_ch_MUX_uxn_device_h_l81_c2_47f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e21b_return_output;
     VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_47f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e21b_return_output;
     VAR_is_new_row_MUX_uxn_device_h_l81_c2_47f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e21b_return_output;
     VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_47f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e21b_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_47f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e21b_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_47f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e21b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l81_c2_47f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e21b_return_output;
     VAR_x_MUX_uxn_device_h_l81_c2_47f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e21b_return_output;
     VAR_y_MUX_uxn_device_h_l81_c2_47f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e21b_return_output;
     VAR_MUX_uxn_device_h_l87_c16_c9d7_cond := VAR_BIN_OP_EQ_uxn_device_h_l87_c16_c9fe_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l91_c20_98d6_var_dim_0 := resize(VAR_BIN_OP_MINUS_uxn_device_h_l91_c32_657d_return_output, 4);
     VAR_x_uxn_device_h_l77_c3_6376 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_96f3_return_output, 16);
     VAR_y_uxn_device_h_l78_c3_8806 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_4783_return_output, 16);
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c19_660a_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l89_c31_b5e4_return_output, 4);
     VAR_MUX_uxn_device_h_l93_c7_daeb_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l93_c21_9ac1_return_output, 16);
     VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_47f9_iffalse := VAR_MUX_uxn_device_h_l102_c25_0954_return_output;
     VAR_opaque_uxn_device_h_l76_c3_f541 := resize(VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_4f46_return_output, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l71_c6_db59_left := VAR_uint12_7_4_uxn_device_h_l71_c6_9dd9_return_output;
     VAR_opaque_MUX_uxn_device_h_l75_c2_f9db_iftrue := VAR_opaque_uxn_device_h_l76_c3_f541;
     VAR_x_MUX_uxn_device_h_l75_c2_f9db_iftrue := VAR_x_uxn_device_h_l77_c3_6376;
     VAR_y_MUX_uxn_device_h_l75_c2_f9db_iftrue := VAR_y_uxn_device_h_l78_c3_8806;
     -- y_MUX[uxn_device_h_l75_c2_f9db] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l75_c2_f9db_cond <= VAR_y_MUX_uxn_device_h_l75_c2_f9db_cond;
     y_MUX_uxn_device_h_l75_c2_f9db_iftrue <= VAR_y_MUX_uxn_device_h_l75_c2_f9db_iftrue;
     y_MUX_uxn_device_h_l75_c2_f9db_iffalse <= VAR_y_MUX_uxn_device_h_l75_c2_f9db_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l75_c2_f9db_return_output := y_MUX_uxn_device_h_l75_c2_f9db_return_output;

     -- BIN_OP_EQ[uxn_device_h_l71_c6_db59] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l71_c6_db59_left <= VAR_BIN_OP_EQ_uxn_device_h_l71_c6_db59_left;
     BIN_OP_EQ_uxn_device_h_l71_c6_db59_right <= VAR_BIN_OP_EQ_uxn_device_h_l71_c6_db59_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l71_c6_db59_return_output := BIN_OP_EQ_uxn_device_h_l71_c6_db59_return_output;

     -- opaque_MUX[uxn_device_h_l75_c2_f9db] LATENCY=0
     -- Inputs
     opaque_MUX_uxn_device_h_l75_c2_f9db_cond <= VAR_opaque_MUX_uxn_device_h_l75_c2_f9db_cond;
     opaque_MUX_uxn_device_h_l75_c2_f9db_iftrue <= VAR_opaque_MUX_uxn_device_h_l75_c2_f9db_iftrue;
     opaque_MUX_uxn_device_h_l75_c2_f9db_iffalse <= VAR_opaque_MUX_uxn_device_h_l75_c2_f9db_iffalse;
     -- Outputs
     VAR_opaque_MUX_uxn_device_h_l75_c2_f9db_return_output := opaque_MUX_uxn_device_h_l75_c2_f9db_return_output;

     -- x_MUX[uxn_device_h_l75_c2_f9db] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l75_c2_f9db_cond <= VAR_x_MUX_uxn_device_h_l75_c2_f9db_cond;
     x_MUX_uxn_device_h_l75_c2_f9db_iftrue <= VAR_x_MUX_uxn_device_h_l75_c2_f9db_iftrue;
     x_MUX_uxn_device_h_l75_c2_f9db_iffalse <= VAR_x_MUX_uxn_device_h_l75_c2_f9db_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l75_c2_f9db_return_output := x_MUX_uxn_device_h_l75_c2_f9db_return_output;

     -- sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5[uxn_device_h_l71_c2_a1e6] LATENCY=0
     VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5_uxn_device_h_l71_c2_a1e6_return_output := CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5(
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_b41c_return_output);

     -- result_is_blit_done_MUX[uxn_device_h_l81_c2_47f9] LATENCY=0
     -- Inputs
     result_is_blit_done_MUX_uxn_device_h_l81_c2_47f9_cond <= VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_47f9_cond;
     result_is_blit_done_MUX_uxn_device_h_l81_c2_47f9_iftrue <= VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_47f9_iftrue;
     result_is_blit_done_MUX_uxn_device_h_l81_c2_47f9_iffalse <= VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_47f9_iffalse;
     -- Outputs
     VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_47f9_return_output := result_is_blit_done_MUX_uxn_device_h_l81_c2_47f9_return_output;

     -- MUX[uxn_device_h_l87_c16_c9d7] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l87_c16_c9d7_cond <= VAR_MUX_uxn_device_h_l87_c16_c9d7_cond;
     MUX_uxn_device_h_l87_c16_c9d7_iftrue <= VAR_MUX_uxn_device_h_l87_c16_c9d7_iftrue;
     MUX_uxn_device_h_l87_c16_c9d7_iffalse <= VAR_MUX_uxn_device_h_l87_c16_c9d7_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l87_c16_c9d7_return_output := MUX_uxn_device_h_l87_c16_c9d7_return_output;

     -- Submodule level 3
     VAR_sprite_rows_MUX_uxn_device_h_l71_c2_a1e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l71_c6_db59_return_output;
     VAR_MUX_uxn_device_h_l93_c7_daeb_cond := VAR_MUX_uxn_device_h_l87_c16_c9d7_return_output;
     VAR_c_MUX_uxn_device_h_l88_c3_db26_cond := VAR_MUX_uxn_device_h_l87_c16_c9d7_return_output;
     VAR_is_new_row_MUX_uxn_device_h_l81_c2_47f9_iffalse := VAR_MUX_uxn_device_h_l87_c16_c9d7_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l99_c42_9e3e_left := VAR_opaque_MUX_uxn_device_h_l75_c2_f9db_return_output;
     REG_VAR_opaque := VAR_opaque_MUX_uxn_device_h_l75_c2_f9db_return_output;
     VAR_sprite_rows_MUX_uxn_device_h_l71_c2_a1e6_iftrue := VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5_uxn_device_h_l71_c2_a1e6_return_output;
     VAR_MUX_uxn_device_h_l93_c7_daeb_iffalse := VAR_x_MUX_uxn_device_h_l75_c2_f9db_return_output;
     VAR_x_MUX_uxn_device_h_l81_c2_47f9_iftrue := VAR_x_MUX_uxn_device_h_l75_c2_f9db_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l101_c41_964b_left := VAR_y_MUX_uxn_device_h_l75_c2_f9db_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l101_c51_5ecf_left := VAR_y_MUX_uxn_device_h_l75_c2_f9db_return_output;
     VAR_CONST_SL_8_uxn_device_h_l98_c22_a460_x := VAR_y_MUX_uxn_device_h_l75_c2_f9db_return_output;
     VAR_MUX_uxn_device_h_l101_c7_ac13_iffalse := VAR_y_MUX_uxn_device_h_l75_c2_f9db_return_output;
     VAR_y_MUX_uxn_device_h_l81_c2_47f9_iftrue := VAR_y_MUX_uxn_device_h_l75_c2_f9db_return_output;
     -- sprite_rows_MUX[uxn_device_h_l71_c2_a1e6] LATENCY=0
     -- Inputs
     sprite_rows_MUX_uxn_device_h_l71_c2_a1e6_cond <= VAR_sprite_rows_MUX_uxn_device_h_l71_c2_a1e6_cond;
     sprite_rows_MUX_uxn_device_h_l71_c2_a1e6_iftrue <= VAR_sprite_rows_MUX_uxn_device_h_l71_c2_a1e6_iftrue;
     sprite_rows_MUX_uxn_device_h_l71_c2_a1e6_iffalse <= VAR_sprite_rows_MUX_uxn_device_h_l71_c2_a1e6_iffalse;
     -- Outputs
     VAR_sprite_rows_MUX_uxn_device_h_l71_c2_a1e6_return_output := sprite_rows_MUX_uxn_device_h_l71_c2_a1e6_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l101_c41_964b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l101_c41_964b_left <= VAR_BIN_OP_MINUS_uxn_device_h_l101_c41_964b_left;
     BIN_OP_MINUS_uxn_device_h_l101_c41_964b_right <= VAR_BIN_OP_MINUS_uxn_device_h_l101_c41_964b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l101_c41_964b_return_output := BIN_OP_MINUS_uxn_device_h_l101_c41_964b_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l101_c51_5ecf] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l101_c51_5ecf_left <= VAR_BIN_OP_PLUS_uxn_device_h_l101_c51_5ecf_left;
     BIN_OP_PLUS_uxn_device_h_l101_c51_5ecf_right <= VAR_BIN_OP_PLUS_uxn_device_h_l101_c51_5ecf_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l101_c51_5ecf_return_output := BIN_OP_PLUS_uxn_device_h_l101_c51_5ecf_return_output;

     -- CONST_SL_8[uxn_device_h_l98_c22_a460] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_device_h_l98_c22_a460_x <= VAR_CONST_SL_8_uxn_device_h_l98_c22_a460_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_device_h_l98_c22_a460_return_output := CONST_SL_8_uxn_device_h_l98_c22_a460_return_output;

     -- is_new_row_MUX[uxn_device_h_l81_c2_47f9] LATENCY=0
     -- Inputs
     is_new_row_MUX_uxn_device_h_l81_c2_47f9_cond <= VAR_is_new_row_MUX_uxn_device_h_l81_c2_47f9_cond;
     is_new_row_MUX_uxn_device_h_l81_c2_47f9_iftrue <= VAR_is_new_row_MUX_uxn_device_h_l81_c2_47f9_iftrue;
     is_new_row_MUX_uxn_device_h_l81_c2_47f9_iffalse <= VAR_is_new_row_MUX_uxn_device_h_l81_c2_47f9_iffalse;
     -- Outputs
     VAR_is_new_row_MUX_uxn_device_h_l81_c2_47f9_return_output := is_new_row_MUX_uxn_device_h_l81_c2_47f9_return_output;

     -- MUX[uxn_device_h_l93_c7_daeb] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l93_c7_daeb_cond <= VAR_MUX_uxn_device_h_l93_c7_daeb_cond;
     MUX_uxn_device_h_l93_c7_daeb_iftrue <= VAR_MUX_uxn_device_h_l93_c7_daeb_iftrue;
     MUX_uxn_device_h_l93_c7_daeb_iffalse <= VAR_MUX_uxn_device_h_l93_c7_daeb_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l93_c7_daeb_return_output := MUX_uxn_device_h_l93_c7_daeb_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l101_c35_1b24_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l101_c41_964b_return_output;
     VAR_MUX_uxn_device_h_l101_c35_1b24_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l101_c51_5ecf_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l98_c22_619a_left := VAR_CONST_SL_8_uxn_device_h_l98_c22_a460_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l103_c24_ec44_left := VAR_MUX_uxn_device_h_l93_c7_daeb_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l103_c14_c1bc_left := VAR_MUX_uxn_device_h_l93_c7_daeb_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l98_c22_619a_right := VAR_MUX_uxn_device_h_l93_c7_daeb_return_output;
     REG_VAR_is_new_row := VAR_is_new_row_MUX_uxn_device_h_l81_c2_47f9_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c19_660a_ref_toks_0 := VAR_sprite_rows_MUX_uxn_device_h_l71_c2_a1e6_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l91_c20_98d6_ref_toks_0 := VAR_sprite_rows_MUX_uxn_device_h_l71_c2_a1e6_return_output;
     REG_VAR_sprite_rows := VAR_sprite_rows_MUX_uxn_device_h_l71_c2_a1e6_return_output;
     -- BIN_OP_MINUS[uxn_device_h_l103_c24_ec44] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l103_c24_ec44_left <= VAR_BIN_OP_MINUS_uxn_device_h_l103_c24_ec44_left;
     BIN_OP_MINUS_uxn_device_h_l103_c24_ec44_right <= VAR_BIN_OP_MINUS_uxn_device_h_l103_c24_ec44_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l103_c24_ec44_return_output := BIN_OP_MINUS_uxn_device_h_l103_c24_ec44_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l98_c22_619a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l98_c22_619a_left <= VAR_BIN_OP_PLUS_uxn_device_h_l98_c22_619a_left;
     BIN_OP_PLUS_uxn_device_h_l98_c22_619a_right <= VAR_BIN_OP_PLUS_uxn_device_h_l98_c22_619a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l98_c22_619a_return_output := BIN_OP_PLUS_uxn_device_h_l98_c22_619a_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l91_c20_98d6] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l91_c20_98d6_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l91_c20_98d6_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l91_c20_98d6_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l91_c20_98d6_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l91_c20_98d6_return_output := VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l91_c20_98d6_return_output;

     -- MUX[uxn_device_h_l101_c35_1b24] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l101_c35_1b24_cond <= VAR_MUX_uxn_device_h_l101_c35_1b24_cond;
     MUX_uxn_device_h_l101_c35_1b24_iftrue <= VAR_MUX_uxn_device_h_l101_c35_1b24_iftrue;
     MUX_uxn_device_h_l101_c35_1b24_iffalse <= VAR_MUX_uxn_device_h_l101_c35_1b24_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l101_c35_1b24_return_output := MUX_uxn_device_h_l101_c35_1b24_return_output;

     -- uint16_15_8[uxn_device_h_l94_c19_4dc2] LATENCY=0
     VAR_uint16_15_8_uxn_device_h_l94_c19_4dc2_return_output := uint16_15_8(
     VAR_MUX_uxn_device_h_l93_c7_daeb_return_output);

     -- BIN_OP_PLUS[uxn_device_h_l103_c14_c1bc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l103_c14_c1bc_left <= VAR_BIN_OP_PLUS_uxn_device_h_l103_c14_c1bc_left;
     BIN_OP_PLUS_uxn_device_h_l103_c14_c1bc_right <= VAR_BIN_OP_PLUS_uxn_device_h_l103_c14_c1bc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l103_c14_c1bc_return_output := BIN_OP_PLUS_uxn_device_h_l103_c14_c1bc_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l89_c19_660a] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c19_660a_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c19_660a_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c19_660a_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c19_660a_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c19_660a_return_output := VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c19_660a_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_device_h_l103_c8_4d36_iffalse := VAR_BIN_OP_MINUS_uxn_device_h_l103_c24_ec44_return_output;
     VAR_MUX_uxn_device_h_l103_c8_4d36_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l103_c14_c1bc_return_output, 16);
     VAR_result_u16_addr_uxn_device_h_l98_c3_b1f7 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l98_c22_619a_return_output, 16);
     VAR_MUX_uxn_device_h_l101_c7_ac13_iftrue := VAR_MUX_uxn_device_h_l101_c35_1b24_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l94_c19_9f33_left := VAR_uint16_15_8_uxn_device_h_l94_c19_4dc2_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_47f9_iffalse := VAR_result_u16_addr_uxn_device_h_l98_c3_b1f7;
     -- BIN_OP_EQ[uxn_device_h_l94_c19_9f33] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l94_c19_9f33_left <= VAR_BIN_OP_EQ_uxn_device_h_l94_c19_9f33_left;
     BIN_OP_EQ_uxn_device_h_l94_c19_9f33_right <= VAR_BIN_OP_EQ_uxn_device_h_l94_c19_9f33_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l94_c19_9f33_return_output := BIN_OP_EQ_uxn_device_h_l94_c19_9f33_return_output;

     -- CAST_TO_uint16_t[uxn_device_h_l89_c8_e43a] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_device_h_l89_c8_e43a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c19_660a_return_output);

     -- MUX[uxn_device_h_l103_c8_4d36] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l103_c8_4d36_cond <= VAR_MUX_uxn_device_h_l103_c8_4d36_cond;
     MUX_uxn_device_h_l103_c8_4d36_iftrue <= VAR_MUX_uxn_device_h_l103_c8_4d36_iftrue;
     MUX_uxn_device_h_l103_c8_4d36_iffalse <= VAR_MUX_uxn_device_h_l103_c8_4d36_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l103_c8_4d36_return_output := MUX_uxn_device_h_l103_c8_4d36_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l81_c2_47f9] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l81_c2_47f9_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_47f9_cond;
     result_u16_addr_MUX_uxn_device_h_l81_c2_47f9_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_47f9_iftrue;
     result_u16_addr_MUX_uxn_device_h_l81_c2_47f9_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_47f9_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_47f9_return_output := result_u16_addr_MUX_uxn_device_h_l81_c2_47f9_return_output;

     -- MUX[uxn_device_h_l101_c7_ac13] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l101_c7_ac13_cond <= VAR_MUX_uxn_device_h_l101_c7_ac13_cond;
     MUX_uxn_device_h_l101_c7_ac13_iftrue <= VAR_MUX_uxn_device_h_l101_c7_ac13_iftrue;
     MUX_uxn_device_h_l101_c7_ac13_iffalse <= VAR_MUX_uxn_device_h_l101_c7_ac13_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l101_c7_ac13_return_output := MUX_uxn_device_h_l101_c7_ac13_return_output;

     -- CAST_TO_uint16_t[uxn_device_h_l91_c9_0ef2] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_device_h_l91_c9_0ef2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l91_c20_98d6_return_output);

     -- Submodule level 6
     VAR_MUX_uxn_device_h_l94_c19_ae58_cond := VAR_BIN_OP_EQ_uxn_device_h_l94_c19_9f33_return_output;
     VAR_CONST_SL_8_uxn_device_h_l90_c4_e4de_x := VAR_CAST_TO_uint16_t_uxn_device_h_l89_c8_e43a_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l91_c4_fdda_right := VAR_CAST_TO_uint16_t_uxn_device_h_l91_c9_0ef2_return_output;
     VAR_y_MUX_uxn_device_h_l81_c2_47f9_iffalse := VAR_MUX_uxn_device_h_l101_c7_ac13_return_output;
     VAR_x_MUX_uxn_device_h_l81_c2_47f9_iffalse := VAR_MUX_uxn_device_h_l103_c8_4d36_return_output;
     -- x_MUX[uxn_device_h_l81_c2_47f9] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l81_c2_47f9_cond <= VAR_x_MUX_uxn_device_h_l81_c2_47f9_cond;
     x_MUX_uxn_device_h_l81_c2_47f9_iftrue <= VAR_x_MUX_uxn_device_h_l81_c2_47f9_iftrue;
     x_MUX_uxn_device_h_l81_c2_47f9_iffalse <= VAR_x_MUX_uxn_device_h_l81_c2_47f9_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l81_c2_47f9_return_output := x_MUX_uxn_device_h_l81_c2_47f9_return_output;

     -- y_MUX[uxn_device_h_l81_c2_47f9] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l81_c2_47f9_cond <= VAR_y_MUX_uxn_device_h_l81_c2_47f9_cond;
     y_MUX_uxn_device_h_l81_c2_47f9_iftrue <= VAR_y_MUX_uxn_device_h_l81_c2_47f9_iftrue;
     y_MUX_uxn_device_h_l81_c2_47f9_iffalse <= VAR_y_MUX_uxn_device_h_l81_c2_47f9_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l81_c2_47f9_return_output := y_MUX_uxn_device_h_l81_c2_47f9_return_output;

     -- MUX[uxn_device_h_l94_c19_ae58] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l94_c19_ae58_cond <= VAR_MUX_uxn_device_h_l94_c19_ae58_cond;
     MUX_uxn_device_h_l94_c19_ae58_iftrue <= VAR_MUX_uxn_device_h_l94_c19_ae58_iftrue;
     MUX_uxn_device_h_l94_c19_ae58_iffalse <= VAR_MUX_uxn_device_h_l94_c19_ae58_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l94_c19_ae58_return_output := MUX_uxn_device_h_l94_c19_ae58_return_output;

     -- CONST_SL_8[uxn_device_h_l90_c4_e4de] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_device_h_l90_c4_e4de_x <= VAR_CONST_SL_8_uxn_device_h_l90_c4_e4de_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_device_h_l90_c4_e4de_return_output := CONST_SL_8_uxn_device_h_l90_c4_e4de_return_output;

     -- Submodule level 7
     VAR_BIN_OP_OR_uxn_device_h_l91_c4_fdda_left := VAR_CONST_SL_8_uxn_device_h_l90_c4_e4de_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l99_c26_6635_left := VAR_MUX_uxn_device_h_l94_c19_ae58_return_output;
     VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_47f9_iffalse := VAR_MUX_uxn_device_h_l94_c19_ae58_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l81_c2_47f9_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l81_c2_47f9_return_output;
     -- BIN_OP_OR[uxn_device_h_l91_c4_fdda] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l91_c4_fdda_left <= VAR_BIN_OP_OR_uxn_device_h_l91_c4_fdda_left;
     BIN_OP_OR_uxn_device_h_l91_c4_fdda_right <= VAR_BIN_OP_OR_uxn_device_h_l91_c4_fdda_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l91_c4_fdda_return_output := BIN_OP_OR_uxn_device_h_l91_c4_fdda_return_output;

     -- is_in_bounds_MUX[uxn_device_h_l81_c2_47f9] LATENCY=0
     -- Inputs
     is_in_bounds_MUX_uxn_device_h_l81_c2_47f9_cond <= VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_47f9_cond;
     is_in_bounds_MUX_uxn_device_h_l81_c2_47f9_iftrue <= VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_47f9_iftrue;
     is_in_bounds_MUX_uxn_device_h_l81_c2_47f9_iffalse <= VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_47f9_iffalse;
     -- Outputs
     VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_47f9_return_output := is_in_bounds_MUX_uxn_device_h_l81_c2_47f9_return_output;

     -- Submodule level 8
     VAR_c_MUX_uxn_device_h_l88_c3_db26_iftrue := VAR_BIN_OP_OR_uxn_device_h_l91_c4_fdda_return_output;
     REG_VAR_is_in_bounds := VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_47f9_return_output;
     -- c_MUX[uxn_device_h_l88_c3_db26] LATENCY=0
     -- Inputs
     c_MUX_uxn_device_h_l88_c3_db26_cond <= VAR_c_MUX_uxn_device_h_l88_c3_db26_cond;
     c_MUX_uxn_device_h_l88_c3_db26_iftrue <= VAR_c_MUX_uxn_device_h_l88_c3_db26_iftrue;
     c_MUX_uxn_device_h_l88_c3_db26_iffalse <= VAR_c_MUX_uxn_device_h_l88_c3_db26_iffalse;
     -- Outputs
     VAR_c_MUX_uxn_device_h_l88_c3_db26_return_output := c_MUX_uxn_device_h_l88_c3_db26_return_output;

     -- Submodule level 9
     VAR_CONST_SR_1_uxn_device_h_l104_c3_64f3_x := VAR_c_MUX_uxn_device_h_l88_c3_db26_return_output;
     -- uint16_8_8[uxn_device_h_l95_c8_a6b2] LATENCY=0
     VAR_uint16_8_8_uxn_device_h_l95_c8_a6b2_return_output := uint16_8_8(
     VAR_c_MUX_uxn_device_h_l88_c3_db26_return_output);

     -- uint16_0_0[uxn_device_h_l97_c9_b005] LATENCY=0
     VAR_uint16_0_0_uxn_device_h_l97_c9_b005_return_output := uint16_0_0(
     VAR_c_MUX_uxn_device_h_l88_c3_db26_return_output);

     -- CONST_SR_1[uxn_device_h_l104_c3_64f3] LATENCY=0
     -- Inputs
     CONST_SR_1_uxn_device_h_l104_c3_64f3_x <= VAR_CONST_SR_1_uxn_device_h_l104_c3_64f3_x;
     -- Outputs
     VAR_CONST_SR_1_uxn_device_h_l104_c3_64f3_return_output := CONST_SR_1_uxn_device_h_l104_c3_64f3_return_output;

     -- Submodule level 10
     VAR_c_MUX_uxn_device_h_l81_c2_47f9_iffalse := VAR_CONST_SR_1_uxn_device_h_l104_c3_64f3_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l97_c3_6817_right := VAR_uint16_0_0_uxn_device_h_l97_c9_b005_return_output;
     VAR_ch_uxn_device_h_l95_c3_3b77 := resize(VAR_uint16_8_8_uxn_device_h_l95_c8_a6b2_return_output, 8);
     VAR_CONST_SL_1_uxn_device_h_l96_c3_da31_x := VAR_ch_uxn_device_h_l95_c3_3b77;
     -- c_MUX[uxn_device_h_l81_c2_47f9] LATENCY=0
     -- Inputs
     c_MUX_uxn_device_h_l81_c2_47f9_cond <= VAR_c_MUX_uxn_device_h_l81_c2_47f9_cond;
     c_MUX_uxn_device_h_l81_c2_47f9_iftrue <= VAR_c_MUX_uxn_device_h_l81_c2_47f9_iftrue;
     c_MUX_uxn_device_h_l81_c2_47f9_iffalse <= VAR_c_MUX_uxn_device_h_l81_c2_47f9_iffalse;
     -- Outputs
     VAR_c_MUX_uxn_device_h_l81_c2_47f9_return_output := c_MUX_uxn_device_h_l81_c2_47f9_return_output;

     -- CONST_SL_1[uxn_device_h_l96_c3_da31] LATENCY=0
     -- Inputs
     CONST_SL_1_uxn_device_h_l96_c3_da31_x <= VAR_CONST_SL_1_uxn_device_h_l96_c3_da31_x;
     -- Outputs
     VAR_CONST_SL_1_uxn_device_h_l96_c3_da31_return_output := CONST_SL_1_uxn_device_h_l96_c3_da31_return_output;

     -- Submodule level 11
     VAR_BIN_OP_OR_uxn_device_h_l97_c3_6817_left := VAR_CONST_SL_1_uxn_device_h_l96_c3_da31_return_output;
     REG_VAR_c := VAR_c_MUX_uxn_device_h_l81_c2_47f9_return_output;
     -- BIN_OP_OR[uxn_device_h_l97_c3_6817] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l97_c3_6817_left <= VAR_BIN_OP_OR_uxn_device_h_l97_c3_6817_left;
     BIN_OP_OR_uxn_device_h_l97_c3_6817_right <= VAR_BIN_OP_OR_uxn_device_h_l97_c3_6817_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l97_c3_6817_return_output := BIN_OP_OR_uxn_device_h_l97_c3_6817_return_output;

     -- Submodule level 12
     VAR_BIN_OP_EQ_uxn_device_h_l99_c52_2d65_left := VAR_BIN_OP_OR_uxn_device_h_l97_c3_6817_return_output;
     VAR_CONST_SL_4_uxn_device_h_l100_c40_c6f5_x := VAR_BIN_OP_OR_uxn_device_h_l97_c3_6817_return_output;
     VAR_ch_MUX_uxn_device_h_l81_c2_47f9_iffalse := VAR_BIN_OP_OR_uxn_device_h_l97_c3_6817_return_output;
     -- CONST_SL_4[uxn_device_h_l100_c40_c6f5] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_device_h_l100_c40_c6f5_x <= VAR_CONST_SL_4_uxn_device_h_l100_c40_c6f5_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_device_h_l100_c40_c6f5_return_output := CONST_SL_4_uxn_device_h_l100_c40_c6f5_return_output;

     -- BIN_OP_EQ[uxn_device_h_l99_c52_2d65] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l99_c52_2d65_left <= VAR_BIN_OP_EQ_uxn_device_h_l99_c52_2d65_left;
     BIN_OP_EQ_uxn_device_h_l99_c52_2d65_right <= VAR_BIN_OP_EQ_uxn_device_h_l99_c52_2d65_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l99_c52_2d65_return_output := BIN_OP_EQ_uxn_device_h_l99_c52_2d65_return_output;

     -- ch_MUX[uxn_device_h_l81_c2_47f9] LATENCY=0
     -- Inputs
     ch_MUX_uxn_device_h_l81_c2_47f9_cond <= VAR_ch_MUX_uxn_device_h_l81_c2_47f9_cond;
     ch_MUX_uxn_device_h_l81_c2_47f9_iftrue <= VAR_ch_MUX_uxn_device_h_l81_c2_47f9_iftrue;
     ch_MUX_uxn_device_h_l81_c2_47f9_iffalse <= VAR_ch_MUX_uxn_device_h_l81_c2_47f9_iffalse;
     -- Outputs
     VAR_ch_MUX_uxn_device_h_l81_c2_47f9_return_output := ch_MUX_uxn_device_h_l81_c2_47f9_return_output;

     -- Submodule level 13
     VAR_MUX_uxn_device_h_l99_c52_b904_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c52_2d65_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l100_c30_ae02_right := VAR_CONST_SL_4_uxn_device_h_l100_c40_c6f5_return_output;
     REG_VAR_ch := VAR_ch_MUX_uxn_device_h_l81_c2_47f9_return_output;
     -- BIN_OP_PLUS[uxn_device_h_l100_c30_ae02] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l100_c30_ae02_left <= VAR_BIN_OP_PLUS_uxn_device_h_l100_c30_ae02_left;
     BIN_OP_PLUS_uxn_device_h_l100_c30_ae02_right <= VAR_BIN_OP_PLUS_uxn_device_h_l100_c30_ae02_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l100_c30_ae02_return_output := BIN_OP_PLUS_uxn_device_h_l100_c30_ae02_return_output;

     -- MUX[uxn_device_h_l99_c52_b904] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l99_c52_b904_cond <= VAR_MUX_uxn_device_h_l99_c52_b904_cond;
     MUX_uxn_device_h_l99_c52_b904_iftrue <= VAR_MUX_uxn_device_h_l99_c52_b904_iftrue;
     MUX_uxn_device_h_l99_c52_b904_iffalse <= VAR_MUX_uxn_device_h_l99_c52_b904_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l99_c52_b904_return_output := MUX_uxn_device_h_l99_c52_b904_return_output;

     -- Submodule level 14
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_328e_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l100_c30_ae02_return_output, 7);
     VAR_BIN_OP_OR_uxn_device_h_l99_c42_9e3e_right := VAR_MUX_uxn_device_h_l99_c52_b904_return_output;
     -- BIN_OP_OR[uxn_device_h_l99_c42_9e3e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l99_c42_9e3e_left <= VAR_BIN_OP_OR_uxn_device_h_l99_c42_9e3e_left;
     BIN_OP_OR_uxn_device_h_l99_c42_9e3e_right <= VAR_BIN_OP_OR_uxn_device_h_l99_c42_9e3e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l99_c42_9e3e_return_output := BIN_OP_OR_uxn_device_h_l99_c42_9e3e_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l100_c21_328e] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_328e_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_328e_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_328e_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_328e_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_328e_return_output := VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_328e_return_output;

     -- Submodule level 15
     VAR_BIN_OP_AND_uxn_device_h_l99_c26_6635_right := VAR_BIN_OP_OR_uxn_device_h_l99_c42_9e3e_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l81_c2_47f9_iffalse := VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_328e_return_output;
     -- result_u8_value_MUX[uxn_device_h_l81_c2_47f9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l81_c2_47f9_cond <= VAR_result_u8_value_MUX_uxn_device_h_l81_c2_47f9_cond;
     result_u8_value_MUX_uxn_device_h_l81_c2_47f9_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l81_c2_47f9_iftrue;
     result_u8_value_MUX_uxn_device_h_l81_c2_47f9_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l81_c2_47f9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l81_c2_47f9_return_output := result_u8_value_MUX_uxn_device_h_l81_c2_47f9_return_output;

     -- BIN_OP_AND[uxn_device_h_l99_c26_6635] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l99_c26_6635_left <= VAR_BIN_OP_AND_uxn_device_h_l99_c26_6635_left;
     BIN_OP_AND_uxn_device_h_l99_c26_6635_right <= VAR_BIN_OP_AND_uxn_device_h_l99_c26_6635_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l99_c26_6635_return_output := BIN_OP_AND_uxn_device_h_l99_c26_6635_return_output;

     -- Submodule level 16
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_47f9_iffalse := VAR_BIN_OP_AND_uxn_device_h_l99_c26_6635_return_output;
     -- result_is_vram_write_MUX[uxn_device_h_l81_c2_47f9] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l81_c2_47f9_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_47f9_cond;
     result_is_vram_write_MUX_uxn_device_h_l81_c2_47f9_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_47f9_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l81_c2_47f9_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_47f9_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_47f9_return_output := result_is_vram_write_MUX_uxn_device_h_l81_c2_47f9_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_0cf6_uxn_device_h_l107_l42_DUPLICATE_1ad7 LATENCY=0
     VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_0cf6_uxn_device_h_l107_l42_DUPLICATE_1ad7_return_output := CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_0cf6(
     result,
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_47f9_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_47f9_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l81_c2_47f9_return_output,
     VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_47f9_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_0cf6_uxn_device_h_l107_l42_DUPLICATE_1ad7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_0cf6_uxn_device_h_l107_l42_DUPLICATE_1ad7_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_blending <= REG_VAR_blending;
REG_COMB_x <= REG_VAR_x;
REG_COMB_y <= REG_VAR_y;
REG_COMB_opaque <= REG_VAR_opaque;
REG_COMB_c <= REG_VAR_c;
REG_COMB_ch <= REG_VAR_ch;
REG_COMB_color8 <= REG_VAR_color8;
REG_COMB_result <= REG_VAR_result;
REG_COMB_phase_minus_two <= REG_VAR_phase_minus_two;
REG_COMB_phase7_downto_4 <= REG_VAR_phase7_downto_4;
REG_COMB_phase7_downto_3 <= REG_VAR_phase7_downto_3;
REG_COMB_phase2_downto_0 <= REG_VAR_phase2_downto_0;
REG_COMB_phase7_downto_3_u8 <= REG_VAR_phase7_downto_3_u8;
REG_COMB_sprite_rows <= REG_VAR_sprite_rows;
REG_COMB_is_in_bounds <= REG_VAR_is_in_bounds;
REG_COMB_is_new_row <= REG_VAR_is_new_row;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     blending <= REG_COMB_blending;
     x <= REG_COMB_x;
     y <= REG_COMB_y;
     opaque <= REG_COMB_opaque;
     c <= REG_COMB_c;
     ch <= REG_COMB_ch;
     color8 <= REG_COMB_color8;
     result <= REG_COMB_result;
     phase_minus_two <= REG_COMB_phase_minus_two;
     phase7_downto_4 <= REG_COMB_phase7_downto_4;
     phase7_downto_3 <= REG_COMB_phase7_downto_3;
     phase2_downto_0 <= REG_COMB_phase2_downto_0;
     phase7_downto_3_u8 <= REG_COMB_phase7_downto_3_u8;
     sprite_rows <= REG_COMB_sprite_rows;
     is_in_bounds <= REG_COMB_is_in_bounds;
     is_new_row <= REG_COMB_is_new_row;
 end if;
 end if;
end process;

end arch;
