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
-- Submodules: 66
entity screen_2bpp_0CLK_29be10e5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 x1 : in unsigned(7 downto 0);
 y1 : in unsigned(7 downto 0);
 color : in unsigned(3 downto 0);
 fx : in unsigned(0 downto 0);
 fy : in unsigned(0 downto 0);
 ram_addr : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out screen_blit_result_t);
end screen_2bpp_0CLK_29be10e5;
architecture arch of screen_2bpp_0CLK_29be10e5 is
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
signal xmod : unsigned(7 downto 0) := to_unsigned(0, 8);
signal opaque : unsigned(0 downto 0) := to_unsigned(0, 1);
signal c : unsigned(15 downto 0) := to_unsigned(0, 16);
signal ch : unsigned(7 downto 0) := to_unsigned(0, 8);
signal color8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : screen_blit_result_t := screen_blit_result_t_NULL;
signal phase_minus_two : unsigned(7 downto 0) := to_unsigned(0, 8);
signal phase7_downto_4 : unsigned(3 downto 0) := to_unsigned(0, 4);
signal phase7_downto_3 : unsigned(4 downto 0) := to_unsigned(0, 5);
signal phase2_downto_0 : unsigned(2 downto 0) := to_unsigned(0, 3);
signal sprite_rows : uint8_t_16 := (others => to_unsigned(0, 8));
signal REG_COMB_blending : uint8_t_80;
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);
signal REG_COMB_xmod : unsigned(7 downto 0);
signal REG_COMB_opaque : unsigned(0 downto 0);
signal REG_COMB_c : unsigned(15 downto 0);
signal REG_COMB_ch : unsigned(7 downto 0);
signal REG_COMB_color8 : unsigned(7 downto 0);
signal REG_COMB_result : screen_blit_result_t;
signal REG_COMB_phase_minus_two : unsigned(7 downto 0);
signal REG_COMB_phase7_downto_4 : unsigned(3 downto 0);
signal REG_COMB_phase7_downto_3 : unsigned(4 downto 0);
signal REG_COMB_phase2_downto_0 : unsigned(2 downto 0);
signal REG_COMB_sprite_rows : uint8_t_16;

-- Each function instance gets signals
-- BIN_OP_MINUS[uxn_device_h_l67_c20_17bb]
signal BIN_OP_MINUS_uxn_device_h_l67_c20_17bb_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l67_c20_17bb_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l67_c20_17bb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l69_c6_aa4f]
signal BIN_OP_EQ_uxn_device_h_l69_c6_aa4f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l69_c6_aa4f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l69_c6_aa4f_return_output : unsigned(0 downto 0);

-- sprite_rows_MUX[uxn_device_h_l69_c2_a9ac]
signal sprite_rows_MUX_uxn_device_h_l69_c2_a9ac_cond : unsigned(0 downto 0);
signal sprite_rows_MUX_uxn_device_h_l69_c2_a9ac_iftrue : uint8_t_16;
signal sprite_rows_MUX_uxn_device_h_l69_c2_a9ac_iffalse : uint8_t_16;
signal sprite_rows_MUX_uxn_device_h_l69_c2_a9ac_return_output : uint8_t_16;

-- VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60[uxn_device_h_l70_c3_f092]
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_f092_elem_val : unsigned(7 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_f092_ref_toks_0 : uint8_t_16;
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_f092_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_f092_return_output : uint8_t_array_16_t;

-- BIN_OP_EQ[uxn_device_h_l73_c6_f91a]
signal BIN_OP_EQ_uxn_device_h_l73_c6_f91a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l73_c6_f91a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l73_c6_f91a_return_output : unsigned(0 downto 0);

-- xmod_MUX[uxn_device_h_l73_c2_c3bb]
signal xmod_MUX_uxn_device_h_l73_c2_c3bb_cond : unsigned(0 downto 0);
signal xmod_MUX_uxn_device_h_l73_c2_c3bb_iftrue : unsigned(7 downto 0);
signal xmod_MUX_uxn_device_h_l73_c2_c3bb_iffalse : unsigned(7 downto 0);
signal xmod_MUX_uxn_device_h_l73_c2_c3bb_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l73_c2_c3bb]
signal x_MUX_uxn_device_h_l73_c2_c3bb_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l73_c2_c3bb_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l73_c2_c3bb_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l73_c2_c3bb_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l73_c2_c3bb]
signal y_MUX_uxn_device_h_l73_c2_c3bb_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l73_c2_c3bb_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l73_c2_c3bb_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l73_c2_c3bb_return_output : unsigned(15 downto 0);

-- opaque_MUX[uxn_device_h_l73_c2_c3bb]
signal opaque_MUX_uxn_device_h_l73_c2_c3bb_cond : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l73_c2_c3bb_iftrue : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l73_c2_c3bb_iffalse : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l73_c2_c3bb_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l74_c21_9b2a]
signal BIN_OP_PLUS_uxn_device_h_l74_c21_9b2a_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l74_c21_9b2a_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l74_c21_9b2a_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l74_c12_f649]
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_f649_ref_toks_0 : uint8_t_80;
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_f649_var_dim_0 : unsigned(6 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_f649_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l75_c10_dfa4]
signal MUX_uxn_device_h_l75_c10_dfa4_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l75_c10_dfa4_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l75_c10_dfa4_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l75_c10_dfa4_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l76_c7_9d84]
signal BIN_OP_PLUS_uxn_device_h_l76_c7_9d84_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l76_c7_9d84_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l76_c7_9d84_return_output : unsigned(8 downto 0);

-- MUX[uxn_device_h_l77_c13_aad8]
signal MUX_uxn_device_h_l77_c13_aad8_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l77_c13_aad8_iftrue : unsigned(2 downto 0);
signal MUX_uxn_device_h_l77_c13_aad8_iffalse : unsigned(2 downto 0);
signal MUX_uxn_device_h_l77_c13_aad8_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l77_c7_e4c9]
signal BIN_OP_PLUS_uxn_device_h_l77_c7_e4c9_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l77_c7_e4c9_right : unsigned(2 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l77_c7_e4c9_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_device_h_l80_c6_9e23]
signal BIN_OP_EQ_uxn_device_h_l80_c6_9e23_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l80_c6_9e23_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l80_c6_9e23_return_output : unsigned(0 downto 0);

-- ch_MUX[uxn_device_h_l80_c2_eb8b]
signal ch_MUX_uxn_device_h_l80_c2_eb8b_cond : unsigned(0 downto 0);
signal ch_MUX_uxn_device_h_l80_c2_eb8b_iftrue : unsigned(7 downto 0);
signal ch_MUX_uxn_device_h_l80_c2_eb8b_iffalse : unsigned(7 downto 0);
signal ch_MUX_uxn_device_h_l80_c2_eb8b_return_output : unsigned(7 downto 0);

-- c_MUX[uxn_device_h_l80_c2_eb8b]
signal c_MUX_uxn_device_h_l80_c2_eb8b_cond : unsigned(0 downto 0);
signal c_MUX_uxn_device_h_l80_c2_eb8b_iftrue : unsigned(15 downto 0);
signal c_MUX_uxn_device_h_l80_c2_eb8b_iffalse : unsigned(15 downto 0);
signal c_MUX_uxn_device_h_l80_c2_eb8b_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l80_c2_eb8b]
signal x_MUX_uxn_device_h_l80_c2_eb8b_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l80_c2_eb8b_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l80_c2_eb8b_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l80_c2_eb8b_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l80_c2_eb8b]
signal y_MUX_uxn_device_h_l80_c2_eb8b_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l80_c2_eb8b_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l80_c2_eb8b_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l80_c2_eb8b_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_device_h_l80_c2_eb8b]
signal result_u8_value_MUX_uxn_device_h_l80_c2_eb8b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l80_c2_eb8b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l80_c2_eb8b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l80_c2_eb8b_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l80_c2_eb8b]
signal result_is_vram_write_MUX_uxn_device_h_l80_c2_eb8b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l80_c2_eb8b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l80_c2_eb8b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l80_c2_eb8b_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l80_c2_eb8b]
signal result_u16_addr_MUX_uxn_device_h_l80_c2_eb8b_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l80_c2_eb8b_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l80_c2_eb8b_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l80_c2_eb8b_return_output : unsigned(15 downto 0);

-- result_is_blit_done_MUX[uxn_device_h_l80_c2_eb8b]
signal result_is_blit_done_MUX_uxn_device_h_l80_c2_eb8b_cond : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l80_c2_eb8b_iftrue : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l80_c2_eb8b_iffalse : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l80_c2_eb8b_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l84_c21_e4d2]
signal BIN_OP_PLUS_uxn_device_h_l84_c21_e4d2_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l84_c21_e4d2_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l84_c21_e4d2_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l86_c7_c04a]
signal BIN_OP_EQ_uxn_device_h_l86_c7_c04a_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l86_c7_c04a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l86_c7_c04a_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l86_c46_f37b]
signal BIN_OP_MINUS_uxn_device_h_l86_c46_f37b_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l86_c46_f37b_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l86_c46_f37b_return_output : unsigned(7 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l86_c34_13b1]
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_13b1_ref_toks_0 : uint8_t_16;
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_13b1_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_13b1_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l86_c96_d00d]
signal BIN_OP_PLUS_uxn_device_h_l86_c96_d00d_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l86_c96_d00d_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l86_c96_d00d_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l86_c84_cff9]
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_cff9_ref_toks_0 : uint8_t_16;
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_cff9_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_cff9_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_device_h_l86_c84_590f]
signal CONST_SL_8_uxn_device_h_l86_c84_590f_x : unsigned(7 downto 0);
signal CONST_SL_8_uxn_device_h_l86_c84_590f_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l86_c34_0192]
signal BIN_OP_OR_uxn_device_h_l86_c34_0192_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l86_c34_0192_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l86_c34_0192_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l86_c7_debe]
signal MUX_uxn_device_h_l86_c7_debe_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l86_c7_debe_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l86_c7_debe_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l86_c7_debe_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l87_c7_2a5a]
signal BIN_OP_EQ_uxn_device_h_l87_c7_2a5a_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l87_c7_2a5a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l87_c7_2a5a_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l87_c35_2b25]
signal BIN_OP_PLUS_uxn_device_h_l87_c35_2b25_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l87_c35_2b25_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l87_c35_2b25_return_output : unsigned(8 downto 0);

-- MUX[uxn_device_h_l87_c7_af2c]
signal MUX_uxn_device_h_l87_c7_af2c_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l87_c7_af2c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l87_c7_af2c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l87_c7_af2c_return_output : unsigned(15 downto 0);

-- CONST_SL_1[uxn_device_h_l89_c3_6566]
signal CONST_SL_1_uxn_device_h_l89_c3_6566_x : unsigned(7 downto 0);
signal CONST_SL_1_uxn_device_h_l89_c3_6566_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l90_c3_69c4]
signal BIN_OP_OR_uxn_device_h_l90_c3_69c4_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l90_c3_69c4_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l90_c3_69c4_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_device_h_l91_c22_a26d]
signal CONST_SL_8_uxn_device_h_l91_c22_a26d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_device_h_l91_c22_a26d_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l91_c22_8519]
signal BIN_OP_PLUS_uxn_device_h_l91_c22_8519_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l91_c22_8519_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l91_c22_8519_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l92_c36_36b5]
signal BIN_OP_EQ_uxn_device_h_l92_c36_36b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l92_c36_36b5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l92_c36_36b5_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l92_c36_d5e5]
signal MUX_uxn_device_h_l92_c36_d5e5_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l92_c36_d5e5_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l92_c36_d5e5_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l92_c36_d5e5_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l92_c26_023f]
signal BIN_OP_OR_uxn_device_h_l92_c26_023f_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l92_c26_023f_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l92_c26_023f_return_output : unsigned(0 downto 0);

-- CONST_SL_4[uxn_device_h_l93_c40_c28b]
signal CONST_SL_4_uxn_device_h_l93_c40_c28b_x : unsigned(7 downto 0);
signal CONST_SL_4_uxn_device_h_l93_c40_c28b_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l93_c30_75ae]
signal BIN_OP_PLUS_uxn_device_h_l93_c30_75ae_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l93_c30_75ae_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l93_c30_75ae_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l93_c21_4483]
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_4483_ref_toks_0 : uint8_t_80;
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_4483_var_dim_0 : unsigned(6 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_4483_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l94_c7_bb9b]
signal BIN_OP_EQ_uxn_device_h_l94_c7_bb9b_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l94_c7_bb9b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l94_c7_bb9b_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l94_c41_35a4]
signal BIN_OP_MINUS_uxn_device_h_l94_c41_35a4_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l94_c41_35a4_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l94_c41_35a4_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l94_c51_710d]
signal BIN_OP_PLUS_uxn_device_h_l94_c51_710d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l94_c51_710d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l94_c51_710d_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l94_c35_8c88]
signal MUX_uxn_device_h_l94_c35_8c88_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l94_c35_8c88_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l94_c35_8c88_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l94_c35_8c88_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l94_c7_05bc]
signal MUX_uxn_device_h_l94_c7_05bc_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l94_c7_05bc_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l94_c7_05bc_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l94_c7_05bc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l95_c25_0c90]
signal BIN_OP_EQ_uxn_device_h_l95_c25_0c90_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l95_c25_0c90_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l95_c25_0c90_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l95_c25_024a]
signal MUX_uxn_device_h_l95_c25_024a_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l95_c25_024a_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l95_c25_024a_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l95_c25_024a_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l96_c14_416f]
signal BIN_OP_PLUS_uxn_device_h_l96_c14_416f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l96_c14_416f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l96_c14_416f_return_output : unsigned(16 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l96_c24_79f4]
signal BIN_OP_MINUS_uxn_device_h_l96_c24_79f4_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l96_c24_79f4_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l96_c24_79f4_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l96_c8_1e91]
signal MUX_uxn_device_h_l96_c8_1e91_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l96_c8_1e91_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l96_c8_1e91_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l96_c8_1e91_return_output : unsigned(15 downto 0);

-- CONST_SR_1[uxn_device_h_l97_c3_7303]
signal CONST_SR_1_uxn_device_h_l97_c3_7303_x : unsigned(15 downto 0);
signal CONST_SR_1_uxn_device_h_l97_c3_7303_return_output : unsigned(15 downto 0);

function uint8_7_4( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(3 downto 0);
begin
return_output := unsigned(std_logic_vector(x(7 downto 4)));
return return_output;
end function;

function uint8_7_3( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(4 downto 0);
begin
return_output := unsigned(std_logic_vector(x(7 downto 3)));
return return_output;
end function;

function uint8_2_0( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(2 downto 0);
begin
return_output := unsigned(std_logic_vector(x(2 downto 0)));
return return_output;
end function;

function CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5( ref_toks_0 : uint8_t_array_16_t) return uint8_t_16 is
 
  variable base : uint8_t_16; 
  variable return_output : uint8_t_16;
begin
      base(2) := ref_toks_0.data(2);
      base(8) := ref_toks_0.data(8);
      base(5) := ref_toks_0.data(5);
      base(11) := ref_toks_0.data(11);
      base(14) := ref_toks_0.data(14);
      base(3) := ref_toks_0.data(3);
      base(0) := ref_toks_0.data(0);
      base(6) := ref_toks_0.data(6);
      base(9) := ref_toks_0.data(9);
      base(15) := ref_toks_0.data(15);
      base(12) := ref_toks_0.data(12);
      base(1) := ref_toks_0.data(1);
      base(4) := ref_toks_0.data(4);
      base(10) := ref_toks_0.data(10);
      base(7) := ref_toks_0.data(7);
      base(13) := ref_toks_0.data(13);

      return_output := base;
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

function CAST_TO_uint8_t_uint5_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(4 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_97ac( ref_toks_0 : screen_blit_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return screen_blit_result_t is
 
  variable base : screen_blit_result_t; 
  variable return_output : screen_blit_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u16_addr := ref_toks_3;
      base.is_blit_done := ref_toks_4;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_MINUS_uxn_device_h_l67_c20_17bb
BIN_OP_MINUS_uxn_device_h_l67_c20_17bb : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l67_c20_17bb_left,
BIN_OP_MINUS_uxn_device_h_l67_c20_17bb_right,
BIN_OP_MINUS_uxn_device_h_l67_c20_17bb_return_output);

-- BIN_OP_EQ_uxn_device_h_l69_c6_aa4f
BIN_OP_EQ_uxn_device_h_l69_c6_aa4f : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l69_c6_aa4f_left,
BIN_OP_EQ_uxn_device_h_l69_c6_aa4f_right,
BIN_OP_EQ_uxn_device_h_l69_c6_aa4f_return_output);

-- sprite_rows_MUX_uxn_device_h_l69_c2_a9ac
sprite_rows_MUX_uxn_device_h_l69_c2_a9ac : entity work.MUX_uint1_t_uint8_t_16_uint8_t_16_0CLK_de264c78 port map (
sprite_rows_MUX_uxn_device_h_l69_c2_a9ac_cond,
sprite_rows_MUX_uxn_device_h_l69_c2_a9ac_iftrue,
sprite_rows_MUX_uxn_device_h_l69_c2_a9ac_iffalse,
sprite_rows_MUX_uxn_device_h_l69_c2_a9ac_return_output);

-- VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_f092
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_f092 : entity work.VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_0CLK_6481cb28 port map (
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_f092_elem_val,
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_f092_ref_toks_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_f092_var_dim_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_f092_return_output);

-- BIN_OP_EQ_uxn_device_h_l73_c6_f91a
BIN_OP_EQ_uxn_device_h_l73_c6_f91a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l73_c6_f91a_left,
BIN_OP_EQ_uxn_device_h_l73_c6_f91a_right,
BIN_OP_EQ_uxn_device_h_l73_c6_f91a_return_output);

-- xmod_MUX_uxn_device_h_l73_c2_c3bb
xmod_MUX_uxn_device_h_l73_c2_c3bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
xmod_MUX_uxn_device_h_l73_c2_c3bb_cond,
xmod_MUX_uxn_device_h_l73_c2_c3bb_iftrue,
xmod_MUX_uxn_device_h_l73_c2_c3bb_iffalse,
xmod_MUX_uxn_device_h_l73_c2_c3bb_return_output);

-- x_MUX_uxn_device_h_l73_c2_c3bb
x_MUX_uxn_device_h_l73_c2_c3bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l73_c2_c3bb_cond,
x_MUX_uxn_device_h_l73_c2_c3bb_iftrue,
x_MUX_uxn_device_h_l73_c2_c3bb_iffalse,
x_MUX_uxn_device_h_l73_c2_c3bb_return_output);

-- y_MUX_uxn_device_h_l73_c2_c3bb
y_MUX_uxn_device_h_l73_c2_c3bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l73_c2_c3bb_cond,
y_MUX_uxn_device_h_l73_c2_c3bb_iftrue,
y_MUX_uxn_device_h_l73_c2_c3bb_iffalse,
y_MUX_uxn_device_h_l73_c2_c3bb_return_output);

-- opaque_MUX_uxn_device_h_l73_c2_c3bb
opaque_MUX_uxn_device_h_l73_c2_c3bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opaque_MUX_uxn_device_h_l73_c2_c3bb_cond,
opaque_MUX_uxn_device_h_l73_c2_c3bb_iftrue,
opaque_MUX_uxn_device_h_l73_c2_c3bb_iffalse,
opaque_MUX_uxn_device_h_l73_c2_c3bb_return_output);

-- BIN_OP_PLUS_uxn_device_h_l74_c21_9b2a
BIN_OP_PLUS_uxn_device_h_l74_c21_9b2a : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l74_c21_9b2a_left,
BIN_OP_PLUS_uxn_device_h_l74_c21_9b2a_right,
BIN_OP_PLUS_uxn_device_h_l74_c21_9b2a_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_f649
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_f649 : entity work.VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_0CLK_4b00ae23 port map (
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_f649_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_f649_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_f649_return_output);

-- MUX_uxn_device_h_l75_c10_dfa4
MUX_uxn_device_h_l75_c10_dfa4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l75_c10_dfa4_cond,
MUX_uxn_device_h_l75_c10_dfa4_iftrue,
MUX_uxn_device_h_l75_c10_dfa4_iffalse,
MUX_uxn_device_h_l75_c10_dfa4_return_output);

-- BIN_OP_PLUS_uxn_device_h_l76_c7_9d84
BIN_OP_PLUS_uxn_device_h_l76_c7_9d84 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l76_c7_9d84_left,
BIN_OP_PLUS_uxn_device_h_l76_c7_9d84_right,
BIN_OP_PLUS_uxn_device_h_l76_c7_9d84_return_output);

-- MUX_uxn_device_h_l77_c13_aad8
MUX_uxn_device_h_l77_c13_aad8 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l77_c13_aad8_cond,
MUX_uxn_device_h_l77_c13_aad8_iftrue,
MUX_uxn_device_h_l77_c13_aad8_iffalse,
MUX_uxn_device_h_l77_c13_aad8_return_output);

-- BIN_OP_PLUS_uxn_device_h_l77_c7_e4c9
BIN_OP_PLUS_uxn_device_h_l77_c7_e4c9 : entity work.BIN_OP_PLUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l77_c7_e4c9_left,
BIN_OP_PLUS_uxn_device_h_l77_c7_e4c9_right,
BIN_OP_PLUS_uxn_device_h_l77_c7_e4c9_return_output);

-- BIN_OP_EQ_uxn_device_h_l80_c6_9e23
BIN_OP_EQ_uxn_device_h_l80_c6_9e23 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l80_c6_9e23_left,
BIN_OP_EQ_uxn_device_h_l80_c6_9e23_right,
BIN_OP_EQ_uxn_device_h_l80_c6_9e23_return_output);

-- ch_MUX_uxn_device_h_l80_c2_eb8b
ch_MUX_uxn_device_h_l80_c2_eb8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ch_MUX_uxn_device_h_l80_c2_eb8b_cond,
ch_MUX_uxn_device_h_l80_c2_eb8b_iftrue,
ch_MUX_uxn_device_h_l80_c2_eb8b_iffalse,
ch_MUX_uxn_device_h_l80_c2_eb8b_return_output);

-- c_MUX_uxn_device_h_l80_c2_eb8b
c_MUX_uxn_device_h_l80_c2_eb8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
c_MUX_uxn_device_h_l80_c2_eb8b_cond,
c_MUX_uxn_device_h_l80_c2_eb8b_iftrue,
c_MUX_uxn_device_h_l80_c2_eb8b_iffalse,
c_MUX_uxn_device_h_l80_c2_eb8b_return_output);

-- x_MUX_uxn_device_h_l80_c2_eb8b
x_MUX_uxn_device_h_l80_c2_eb8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l80_c2_eb8b_cond,
x_MUX_uxn_device_h_l80_c2_eb8b_iftrue,
x_MUX_uxn_device_h_l80_c2_eb8b_iffalse,
x_MUX_uxn_device_h_l80_c2_eb8b_return_output);

-- y_MUX_uxn_device_h_l80_c2_eb8b
y_MUX_uxn_device_h_l80_c2_eb8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l80_c2_eb8b_cond,
y_MUX_uxn_device_h_l80_c2_eb8b_iftrue,
y_MUX_uxn_device_h_l80_c2_eb8b_iffalse,
y_MUX_uxn_device_h_l80_c2_eb8b_return_output);

-- result_u8_value_MUX_uxn_device_h_l80_c2_eb8b
result_u8_value_MUX_uxn_device_h_l80_c2_eb8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l80_c2_eb8b_cond,
result_u8_value_MUX_uxn_device_h_l80_c2_eb8b_iftrue,
result_u8_value_MUX_uxn_device_h_l80_c2_eb8b_iffalse,
result_u8_value_MUX_uxn_device_h_l80_c2_eb8b_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l80_c2_eb8b
result_is_vram_write_MUX_uxn_device_h_l80_c2_eb8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l80_c2_eb8b_cond,
result_is_vram_write_MUX_uxn_device_h_l80_c2_eb8b_iftrue,
result_is_vram_write_MUX_uxn_device_h_l80_c2_eb8b_iffalse,
result_is_vram_write_MUX_uxn_device_h_l80_c2_eb8b_return_output);

-- result_u16_addr_MUX_uxn_device_h_l80_c2_eb8b
result_u16_addr_MUX_uxn_device_h_l80_c2_eb8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l80_c2_eb8b_cond,
result_u16_addr_MUX_uxn_device_h_l80_c2_eb8b_iftrue,
result_u16_addr_MUX_uxn_device_h_l80_c2_eb8b_iffalse,
result_u16_addr_MUX_uxn_device_h_l80_c2_eb8b_return_output);

-- result_is_blit_done_MUX_uxn_device_h_l80_c2_eb8b
result_is_blit_done_MUX_uxn_device_h_l80_c2_eb8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_blit_done_MUX_uxn_device_h_l80_c2_eb8b_cond,
result_is_blit_done_MUX_uxn_device_h_l80_c2_eb8b_iftrue,
result_is_blit_done_MUX_uxn_device_h_l80_c2_eb8b_iffalse,
result_is_blit_done_MUX_uxn_device_h_l80_c2_eb8b_return_output);

-- BIN_OP_PLUS_uxn_device_h_l84_c21_e4d2
BIN_OP_PLUS_uxn_device_h_l84_c21_e4d2 : entity work.BIN_OP_PLUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l84_c21_e4d2_left,
BIN_OP_PLUS_uxn_device_h_l84_c21_e4d2_right,
BIN_OP_PLUS_uxn_device_h_l84_c21_e4d2_return_output);

-- BIN_OP_EQ_uxn_device_h_l86_c7_c04a
BIN_OP_EQ_uxn_device_h_l86_c7_c04a : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l86_c7_c04a_left,
BIN_OP_EQ_uxn_device_h_l86_c7_c04a_right,
BIN_OP_EQ_uxn_device_h_l86_c7_c04a_return_output);

-- BIN_OP_MINUS_uxn_device_h_l86_c46_f37b
BIN_OP_MINUS_uxn_device_h_l86_c46_f37b : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l86_c46_f37b_left,
BIN_OP_MINUS_uxn_device_h_l86_c46_f37b_right,
BIN_OP_MINUS_uxn_device_h_l86_c46_f37b_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_13b1
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_13b1 : entity work.VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_0CLK_e799c7f1 port map (
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_13b1_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_13b1_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_13b1_return_output);

-- BIN_OP_PLUS_uxn_device_h_l86_c96_d00d
BIN_OP_PLUS_uxn_device_h_l86_c96_d00d : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l86_c96_d00d_left,
BIN_OP_PLUS_uxn_device_h_l86_c96_d00d_right,
BIN_OP_PLUS_uxn_device_h_l86_c96_d00d_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_cff9
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_cff9 : entity work.VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_0CLK_e799c7f1 port map (
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_cff9_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_cff9_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_cff9_return_output);

-- CONST_SL_8_uxn_device_h_l86_c84_590f
CONST_SL_8_uxn_device_h_l86_c84_590f : entity work.CONST_SL_8_uint8_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_device_h_l86_c84_590f_x,
CONST_SL_8_uxn_device_h_l86_c84_590f_return_output);

-- BIN_OP_OR_uxn_device_h_l86_c34_0192
BIN_OP_OR_uxn_device_h_l86_c34_0192 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l86_c34_0192_left,
BIN_OP_OR_uxn_device_h_l86_c34_0192_right,
BIN_OP_OR_uxn_device_h_l86_c34_0192_return_output);

-- MUX_uxn_device_h_l86_c7_debe
MUX_uxn_device_h_l86_c7_debe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l86_c7_debe_cond,
MUX_uxn_device_h_l86_c7_debe_iftrue,
MUX_uxn_device_h_l86_c7_debe_iffalse,
MUX_uxn_device_h_l86_c7_debe_return_output);

-- BIN_OP_EQ_uxn_device_h_l87_c7_2a5a
BIN_OP_EQ_uxn_device_h_l87_c7_2a5a : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l87_c7_2a5a_left,
BIN_OP_EQ_uxn_device_h_l87_c7_2a5a_right,
BIN_OP_EQ_uxn_device_h_l87_c7_2a5a_return_output);

-- BIN_OP_PLUS_uxn_device_h_l87_c35_2b25
BIN_OP_PLUS_uxn_device_h_l87_c35_2b25 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l87_c35_2b25_left,
BIN_OP_PLUS_uxn_device_h_l87_c35_2b25_right,
BIN_OP_PLUS_uxn_device_h_l87_c35_2b25_return_output);

-- MUX_uxn_device_h_l87_c7_af2c
MUX_uxn_device_h_l87_c7_af2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l87_c7_af2c_cond,
MUX_uxn_device_h_l87_c7_af2c_iftrue,
MUX_uxn_device_h_l87_c7_af2c_iffalse,
MUX_uxn_device_h_l87_c7_af2c_return_output);

-- CONST_SL_1_uxn_device_h_l89_c3_6566
CONST_SL_1_uxn_device_h_l89_c3_6566 : entity work.CONST_SL_1_uint8_t_0CLK_de264c78 port map (
CONST_SL_1_uxn_device_h_l89_c3_6566_x,
CONST_SL_1_uxn_device_h_l89_c3_6566_return_output);

-- BIN_OP_OR_uxn_device_h_l90_c3_69c4
BIN_OP_OR_uxn_device_h_l90_c3_69c4 : entity work.BIN_OP_OR_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l90_c3_69c4_left,
BIN_OP_OR_uxn_device_h_l90_c3_69c4_right,
BIN_OP_OR_uxn_device_h_l90_c3_69c4_return_output);

-- CONST_SL_8_uxn_device_h_l91_c22_a26d
CONST_SL_8_uxn_device_h_l91_c22_a26d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_device_h_l91_c22_a26d_x,
CONST_SL_8_uxn_device_h_l91_c22_a26d_return_output);

-- BIN_OP_PLUS_uxn_device_h_l91_c22_8519
BIN_OP_PLUS_uxn_device_h_l91_c22_8519 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l91_c22_8519_left,
BIN_OP_PLUS_uxn_device_h_l91_c22_8519_right,
BIN_OP_PLUS_uxn_device_h_l91_c22_8519_return_output);

-- BIN_OP_EQ_uxn_device_h_l92_c36_36b5
BIN_OP_EQ_uxn_device_h_l92_c36_36b5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l92_c36_36b5_left,
BIN_OP_EQ_uxn_device_h_l92_c36_36b5_right,
BIN_OP_EQ_uxn_device_h_l92_c36_36b5_return_output);

-- MUX_uxn_device_h_l92_c36_d5e5
MUX_uxn_device_h_l92_c36_d5e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l92_c36_d5e5_cond,
MUX_uxn_device_h_l92_c36_d5e5_iftrue,
MUX_uxn_device_h_l92_c36_d5e5_iffalse,
MUX_uxn_device_h_l92_c36_d5e5_return_output);

-- BIN_OP_OR_uxn_device_h_l92_c26_023f
BIN_OP_OR_uxn_device_h_l92_c26_023f : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l92_c26_023f_left,
BIN_OP_OR_uxn_device_h_l92_c26_023f_right,
BIN_OP_OR_uxn_device_h_l92_c26_023f_return_output);

-- CONST_SL_4_uxn_device_h_l93_c40_c28b
CONST_SL_4_uxn_device_h_l93_c40_c28b : entity work.CONST_SL_4_uint8_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_device_h_l93_c40_c28b_x,
CONST_SL_4_uxn_device_h_l93_c40_c28b_return_output);

-- BIN_OP_PLUS_uxn_device_h_l93_c30_75ae
BIN_OP_PLUS_uxn_device_h_l93_c30_75ae : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l93_c30_75ae_left,
BIN_OP_PLUS_uxn_device_h_l93_c30_75ae_right,
BIN_OP_PLUS_uxn_device_h_l93_c30_75ae_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_4483
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_4483 : entity work.VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_0CLK_4b00ae23 port map (
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_4483_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_4483_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_4483_return_output);

-- BIN_OP_EQ_uxn_device_h_l94_c7_bb9b
BIN_OP_EQ_uxn_device_h_l94_c7_bb9b : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l94_c7_bb9b_left,
BIN_OP_EQ_uxn_device_h_l94_c7_bb9b_right,
BIN_OP_EQ_uxn_device_h_l94_c7_bb9b_return_output);

-- BIN_OP_MINUS_uxn_device_h_l94_c41_35a4
BIN_OP_MINUS_uxn_device_h_l94_c41_35a4 : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l94_c41_35a4_left,
BIN_OP_MINUS_uxn_device_h_l94_c41_35a4_right,
BIN_OP_MINUS_uxn_device_h_l94_c41_35a4_return_output);

-- BIN_OP_PLUS_uxn_device_h_l94_c51_710d
BIN_OP_PLUS_uxn_device_h_l94_c51_710d : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l94_c51_710d_left,
BIN_OP_PLUS_uxn_device_h_l94_c51_710d_right,
BIN_OP_PLUS_uxn_device_h_l94_c51_710d_return_output);

-- MUX_uxn_device_h_l94_c35_8c88
MUX_uxn_device_h_l94_c35_8c88 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l94_c35_8c88_cond,
MUX_uxn_device_h_l94_c35_8c88_iftrue,
MUX_uxn_device_h_l94_c35_8c88_iffalse,
MUX_uxn_device_h_l94_c35_8c88_return_output);

-- MUX_uxn_device_h_l94_c7_05bc
MUX_uxn_device_h_l94_c7_05bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l94_c7_05bc_cond,
MUX_uxn_device_h_l94_c7_05bc_iftrue,
MUX_uxn_device_h_l94_c7_05bc_iffalse,
MUX_uxn_device_h_l94_c7_05bc_return_output);

-- BIN_OP_EQ_uxn_device_h_l95_c25_0c90
BIN_OP_EQ_uxn_device_h_l95_c25_0c90 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l95_c25_0c90_left,
BIN_OP_EQ_uxn_device_h_l95_c25_0c90_right,
BIN_OP_EQ_uxn_device_h_l95_c25_0c90_return_output);

-- MUX_uxn_device_h_l95_c25_024a
MUX_uxn_device_h_l95_c25_024a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l95_c25_024a_cond,
MUX_uxn_device_h_l95_c25_024a_iftrue,
MUX_uxn_device_h_l95_c25_024a_iffalse,
MUX_uxn_device_h_l95_c25_024a_return_output);

-- BIN_OP_PLUS_uxn_device_h_l96_c14_416f
BIN_OP_PLUS_uxn_device_h_l96_c14_416f : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l96_c14_416f_left,
BIN_OP_PLUS_uxn_device_h_l96_c14_416f_right,
BIN_OP_PLUS_uxn_device_h_l96_c14_416f_return_output);

-- BIN_OP_MINUS_uxn_device_h_l96_c24_79f4
BIN_OP_MINUS_uxn_device_h_l96_c24_79f4 : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l96_c24_79f4_left,
BIN_OP_MINUS_uxn_device_h_l96_c24_79f4_right,
BIN_OP_MINUS_uxn_device_h_l96_c24_79f4_return_output);

-- MUX_uxn_device_h_l96_c8_1e91
MUX_uxn_device_h_l96_c8_1e91 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l96_c8_1e91_cond,
MUX_uxn_device_h_l96_c8_1e91_iftrue,
MUX_uxn_device_h_l96_c8_1e91_iffalse,
MUX_uxn_device_h_l96_c8_1e91_return_output);

-- CONST_SR_1_uxn_device_h_l97_c3_7303
CONST_SR_1_uxn_device_h_l97_c3_7303 : entity work.CONST_SR_1_uint16_t_0CLK_de264c78 port map (
CONST_SR_1_uxn_device_h_l97_c3_7303_x,
CONST_SR_1_uxn_device_h_l97_c3_7303_return_output);



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
 xmod,
 opaque,
 c,
 ch,
 color8,
 result,
 phase_minus_two,
 phase7_downto_4,
 phase7_downto_3,
 phase2_downto_0,
 sprite_rows,
 -- All submodule outputs
 BIN_OP_MINUS_uxn_device_h_l67_c20_17bb_return_output,
 BIN_OP_EQ_uxn_device_h_l69_c6_aa4f_return_output,
 sprite_rows_MUX_uxn_device_h_l69_c2_a9ac_return_output,
 VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_f092_return_output,
 BIN_OP_EQ_uxn_device_h_l73_c6_f91a_return_output,
 xmod_MUX_uxn_device_h_l73_c2_c3bb_return_output,
 x_MUX_uxn_device_h_l73_c2_c3bb_return_output,
 y_MUX_uxn_device_h_l73_c2_c3bb_return_output,
 opaque_MUX_uxn_device_h_l73_c2_c3bb_return_output,
 BIN_OP_PLUS_uxn_device_h_l74_c21_9b2a_return_output,
 VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_f649_return_output,
 MUX_uxn_device_h_l75_c10_dfa4_return_output,
 BIN_OP_PLUS_uxn_device_h_l76_c7_9d84_return_output,
 MUX_uxn_device_h_l77_c13_aad8_return_output,
 BIN_OP_PLUS_uxn_device_h_l77_c7_e4c9_return_output,
 BIN_OP_EQ_uxn_device_h_l80_c6_9e23_return_output,
 ch_MUX_uxn_device_h_l80_c2_eb8b_return_output,
 c_MUX_uxn_device_h_l80_c2_eb8b_return_output,
 x_MUX_uxn_device_h_l80_c2_eb8b_return_output,
 y_MUX_uxn_device_h_l80_c2_eb8b_return_output,
 result_u8_value_MUX_uxn_device_h_l80_c2_eb8b_return_output,
 result_is_vram_write_MUX_uxn_device_h_l80_c2_eb8b_return_output,
 result_u16_addr_MUX_uxn_device_h_l80_c2_eb8b_return_output,
 result_is_blit_done_MUX_uxn_device_h_l80_c2_eb8b_return_output,
 BIN_OP_PLUS_uxn_device_h_l84_c21_e4d2_return_output,
 BIN_OP_EQ_uxn_device_h_l86_c7_c04a_return_output,
 BIN_OP_MINUS_uxn_device_h_l86_c46_f37b_return_output,
 VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_13b1_return_output,
 BIN_OP_PLUS_uxn_device_h_l86_c96_d00d_return_output,
 VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_cff9_return_output,
 CONST_SL_8_uxn_device_h_l86_c84_590f_return_output,
 BIN_OP_OR_uxn_device_h_l86_c34_0192_return_output,
 MUX_uxn_device_h_l86_c7_debe_return_output,
 BIN_OP_EQ_uxn_device_h_l87_c7_2a5a_return_output,
 BIN_OP_PLUS_uxn_device_h_l87_c35_2b25_return_output,
 MUX_uxn_device_h_l87_c7_af2c_return_output,
 CONST_SL_1_uxn_device_h_l89_c3_6566_return_output,
 BIN_OP_OR_uxn_device_h_l90_c3_69c4_return_output,
 CONST_SL_8_uxn_device_h_l91_c22_a26d_return_output,
 BIN_OP_PLUS_uxn_device_h_l91_c22_8519_return_output,
 BIN_OP_EQ_uxn_device_h_l92_c36_36b5_return_output,
 MUX_uxn_device_h_l92_c36_d5e5_return_output,
 BIN_OP_OR_uxn_device_h_l92_c26_023f_return_output,
 CONST_SL_4_uxn_device_h_l93_c40_c28b_return_output,
 BIN_OP_PLUS_uxn_device_h_l93_c30_75ae_return_output,
 VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_4483_return_output,
 BIN_OP_EQ_uxn_device_h_l94_c7_bb9b_return_output,
 BIN_OP_MINUS_uxn_device_h_l94_c41_35a4_return_output,
 BIN_OP_PLUS_uxn_device_h_l94_c51_710d_return_output,
 MUX_uxn_device_h_l94_c35_8c88_return_output,
 MUX_uxn_device_h_l94_c7_05bc_return_output,
 BIN_OP_EQ_uxn_device_h_l95_c25_0c90_return_output,
 MUX_uxn_device_h_l95_c25_024a_return_output,
 BIN_OP_PLUS_uxn_device_h_l96_c14_416f_return_output,
 BIN_OP_MINUS_uxn_device_h_l96_c24_79f4_return_output,
 MUX_uxn_device_h_l96_c8_1e91_return_output,
 CONST_SR_1_uxn_device_h_l97_c3_7303_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : screen_blit_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_x1 : unsigned(7 downto 0);
 variable VAR_y1 : unsigned(7 downto 0);
 variable VAR_color : unsigned(3 downto 0);
 variable VAR_fx : unsigned(0 downto 0);
 variable VAR_fy : unsigned(0 downto 0);
 variable VAR_ram_addr : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_color8_uxn_device_h_l63_c2_d4bf : unsigned(7 downto 0);
 variable VAR_uint8_7_4_uxn_device_h_l64_c20_fcf1_return_output : unsigned(3 downto 0);
 variable VAR_uint8_7_3_uxn_device_h_l65_c20_1db0_return_output : unsigned(4 downto 0);
 variable VAR_uint8_2_0_uxn_device_h_l66_c20_ba4f_return_output : unsigned(2 downto 0);
 variable VAR_phase_minus_two_uxn_device_h_l67_c2_cc64 : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l67_c20_17bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l67_c20_17bb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l67_c20_17bb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l69_c6_aa4f_left : unsigned(3 downto 0);
 variable VAR_uint8_7_4_uxn_device_h_l69_c6_438d_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l69_c6_aa4f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l69_c6_aa4f_return_output : unsigned(0 downto 0);
 variable VAR_sprite_rows_MUX_uxn_device_h_l69_c2_a9ac_iftrue : uint8_t_16;
 variable VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5_uxn_device_h_l69_c2_a9ac_return_output : uint8_t_16;
 variable VAR_sprite_rows_MUX_uxn_device_h_l69_c2_a9ac_iffalse : uint8_t_16;
 variable VAR_sprite_rows_MUX_uxn_device_h_l69_c2_a9ac_return_output : uint8_t_16;
 variable VAR_sprite_rows_MUX_uxn_device_h_l69_c2_a9ac_cond : unsigned(0 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_f092_return_output : uint8_t_array_16_t;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_f092_elem_val : unsigned(7 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_f092_ref_toks_0 : uint8_t_16;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_f092_var_dim_0 : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c6_f91a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c6_f91a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c6_f91a_return_output : unsigned(0 downto 0);
 variable VAR_xmod_MUX_uxn_device_h_l73_c2_c3bb_iftrue : unsigned(7 downto 0);
 variable VAR_xmod_MUX_uxn_device_h_l73_c2_c3bb_iffalse : unsigned(7 downto 0);
 variable VAR_xmod_MUX_uxn_device_h_l73_c2_c3bb_return_output : unsigned(7 downto 0);
 variable VAR_xmod_MUX_uxn_device_h_l73_c2_c3bb_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l73_c2_c3bb_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l76_c3_583a : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l73_c2_c3bb_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l73_c2_c3bb_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l73_c2_c3bb_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l73_c2_c3bb_iftrue : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l77_c3_6020 : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l73_c2_c3bb_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l73_c2_c3bb_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l73_c2_c3bb_cond : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l73_c2_c3bb_iftrue : unsigned(0 downto 0);
 variable VAR_opaque_uxn_device_h_l74_c3_fbc4 : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l73_c2_c3bb_iffalse : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l73_c2_c3bb_return_output : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l73_c2_c3bb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l74_c21_9b2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l74_c21_9b2a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l74_c21_9b2a_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_f649_var_dim_0 : unsigned(6 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_f649_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_f649_ref_toks_0 : uint8_t_80;
 variable VAR_MUX_uxn_device_h_l75_c10_dfa4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l75_c10_dfa4_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l75_c10_dfa4_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l75_c10_dfa4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l76_c7_9d84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l76_c7_9d84_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l76_c7_9d84_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_e4c9_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l77_c13_aad8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l77_c13_aad8_iftrue : unsigned(2 downto 0);
 variable VAR_MUX_uxn_device_h_l77_c13_aad8_iffalse : unsigned(2 downto 0);
 variable VAR_MUX_uxn_device_h_l77_c13_aad8_return_output : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_e4c9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_e4c9_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l80_c6_9e23_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l80_c6_9e23_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l80_c6_9e23_return_output : unsigned(0 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l80_c2_eb8b_iftrue : unsigned(7 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l80_c2_eb8b_iffalse : unsigned(7 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l80_c2_eb8b_return_output : unsigned(7 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l80_c2_eb8b_cond : unsigned(0 downto 0);
 variable VAR_c_MUX_uxn_device_h_l80_c2_eb8b_iftrue : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l80_c2_eb8b_iffalse : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l80_c2_eb8b_return_output : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l80_c2_eb8b_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l80_c2_eb8b_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l80_c2_eb8b_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l80_c2_eb8b_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l80_c2_eb8b_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l80_c2_eb8b_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l80_c2_eb8b_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l80_c2_eb8b_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l80_c2_eb8b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l80_c2_eb8b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l82_c3_756e : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l80_c2_eb8b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l80_c2_eb8b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l80_c2_eb8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l80_c2_eb8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l80_c2_eb8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l80_c2_eb8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l80_c2_eb8b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l80_c2_eb8b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l84_c3_b9eb : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l80_c2_eb8b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l91_c3_ffde : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l80_c2_eb8b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l80_c2_eb8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l80_c2_eb8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l80_c2_eb8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l80_c2_eb8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l80_c2_eb8b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l84_c21_e4d2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l84_c21_e4d2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l84_c21_e4d2_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l86_c7_debe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l86_c7_c04a_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l86_c7_c04a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l86_c7_c04a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l86_c7_debe_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l86_c7_debe_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l86_c46_f37b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l86_c46_f37b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l86_c46_f37b_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_13b1_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_13b1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l86_c34_0192_left : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_13b1_ref_toks_0 : uint8_t_16;
 variable VAR_BIN_OP_PLUS_uxn_device_h_l86_c96_d00d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l86_c96_d00d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l86_c96_d00d_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_cff9_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_cff9_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_cff9_ref_toks_0 : uint8_t_16;
 variable VAR_CONST_SL_8_uxn_device_h_l86_c84_590f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l86_c34_0192_right : unsigned(7 downto 0);
 variable VAR_CONST_SL_8_uxn_device_h_l86_c84_590f_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l86_c34_0192_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l86_c7_debe_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l87_c7_af2c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l87_c7_2a5a_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l87_c7_2a5a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l87_c7_2a5a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l87_c7_af2c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l87_c7_af2c_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l87_c35_2b25_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l87_c35_2b25_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l87_c35_2b25_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_device_h_l87_c7_af2c_return_output : unsigned(15 downto 0);
 variable VAR_ch_uxn_device_h_l88_c3_e9dc : unsigned(7 downto 0);
 variable VAR_uint16_8_8_uxn_device_h_l88_c8_6f14_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SL_1_uxn_device_h_l89_c3_6566_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SL_1_uxn_device_h_l89_c3_6566_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l90_c3_69c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l90_c3_69c4_right : unsigned(0 downto 0);
 variable VAR_uint16_0_0_uxn_device_h_l90_c9_73ff_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l90_c3_69c4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SL_8_uxn_device_h_l91_c22_a26d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l91_c22_8519_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_device_h_l91_c22_a26d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l91_c22_8519_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l91_c22_8519_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l92_c26_023f_left : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c36_d5e5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l92_c36_36b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l92_c36_36b5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l92_c36_36b5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c36_d5e5_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c36_d5e5_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c36_d5e5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l92_c26_023f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l92_c26_023f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l93_c30_75ae_left : unsigned(7 downto 0);
 variable VAR_CONST_SL_4_uxn_device_h_l93_c40_c28b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l93_c30_75ae_right : unsigned(7 downto 0);
 variable VAR_CONST_SL_4_uxn_device_h_l93_c40_c28b_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l93_c30_75ae_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_4483_var_dim_0 : unsigned(6 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_4483_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_4483_ref_toks_0 : uint8_t_80;
 variable VAR_MUX_uxn_device_h_l94_c7_05bc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l94_c7_bb9b_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l94_c7_bb9b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l94_c7_bb9b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l94_c7_05bc_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l94_c7_05bc_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l94_c35_8c88_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l94_c35_8c88_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l94_c35_8c88_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l94_c41_35a4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l94_c41_35a4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l94_c41_35a4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l94_c51_710d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l94_c51_710d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l94_c51_710d_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l94_c35_8c88_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l94_c7_05bc_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c25_024a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c25_0c90_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c25_0c90_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c25_0c90_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c25_024a_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c25_024a_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l95_c25_024a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c8_1e91_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c8_1e91_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c8_1e91_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l96_c14_416f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l96_c14_416f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l96_c14_416f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l96_c24_79f4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l96_c24_79f4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l96_c24_79f4_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c8_1e91_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l97_c3_7303_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l97_c3_7303_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint5_t_uxn_device_h_l86_DUPLICATE_b9e4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_97ac_uxn_device_h_l100_l42_DUPLICATE_459c_return_output : screen_blit_result_t;
 -- State registers comb logic variables
variable REG_VAR_blending : uint8_t_80;
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
variable REG_VAR_xmod : unsigned(7 downto 0);
variable REG_VAR_opaque : unsigned(0 downto 0);
variable REG_VAR_c : unsigned(15 downto 0);
variable REG_VAR_ch : unsigned(7 downto 0);
variable REG_VAR_color8 : unsigned(7 downto 0);
variable REG_VAR_result : screen_blit_result_t;
variable REG_VAR_phase_minus_two : unsigned(7 downto 0);
variable REG_VAR_phase7_downto_4 : unsigned(3 downto 0);
variable REG_VAR_phase7_downto_3 : unsigned(4 downto 0);
variable REG_VAR_phase2_downto_0 : unsigned(2 downto 0);
variable REG_VAR_sprite_rows : uint8_t_16;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_blending := blending;
  REG_VAR_x := x;
  REG_VAR_y := y;
  REG_VAR_xmod := xmod;
  REG_VAR_opaque := opaque;
  REG_VAR_c := c;
  REG_VAR_ch := ch;
  REG_VAR_color8 := color8;
  REG_VAR_result := result;
  REG_VAR_phase_minus_two := phase_minus_two;
  REG_VAR_phase7_downto_4 := phase7_downto_4;
  REG_VAR_phase7_downto_3 := phase7_downto_3;
  REG_VAR_phase2_downto_0 := phase2_downto_0;
  REG_VAR_sprite_rows := sprite_rows;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_device_h_l92_c36_36b5_right := to_unsigned(0, 8);
     VAR_BIN_OP_MINUS_uxn_device_h_l86_c46_f37b_right := to_unsigned(2, 8);
     VAR_BIN_OP_MINUS_uxn_device_h_l96_c24_79f4_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l77_c13_aad8_iffalse := resize(to_unsigned(0, 1), 3);
     VAR_BIN_OP_PLUS_uxn_device_h_l86_c96_d00d_right := to_unsigned(6, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l69_c6_aa4f_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l80_c2_eb8b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l96_c14_416f_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l94_c41_35a4_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l80_c6_9e23_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l75_c10_dfa4_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_device_h_l92_c36_d5e5_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l92_c36_d5e5_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l67_c20_17bb_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l94_c7_bb9b_right := to_unsigned(7, 3);
     VAR_MUX_uxn_device_h_l95_c25_024a_iftrue := to_unsigned(1, 1);
     VAR_result_u8_value_uxn_device_h_l82_c3_756e := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l80_c2_eb8b_iftrue := VAR_result_u8_value_uxn_device_h_l82_c3_756e;
     VAR_BIN_OP_EQ_uxn_device_h_l86_c7_c04a_right := to_unsigned(0, 3);
     VAR_MUX_uxn_device_h_l77_c13_aad8_iftrue := to_unsigned(7, 3);
     VAR_result_is_blit_done_MUX_uxn_device_h_l80_c2_eb8b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l73_c6_f91a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l95_c25_0c90_right := to_unsigned(79, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l87_c7_2a5a_right := to_unsigned(0, 3);
     VAR_BIN_OP_PLUS_uxn_device_h_l94_c51_710d_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l75_c10_dfa4_iffalse := resize(to_unsigned(7, 3), 8);
     VAR_MUX_uxn_device_h_l95_c25_024a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l74_c21_9b2a_left := to_unsigned(64, 8);

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
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_f649_ref_toks_0 := blending;
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_4483_ref_toks_0 := blending;
     REG_VAR_blending := blending;
     VAR_MUX_uxn_device_h_l86_c7_debe_iffalse := c;
     VAR_c_MUX_uxn_device_h_l80_c2_eb8b_iftrue := c;
     VAR_ch_MUX_uxn_device_h_l80_c2_eb8b_iftrue := ch;
     VAR_color8_uxn_device_h_l63_c2_d4bf := resize(VAR_color, 8);
     VAR_MUX_uxn_device_h_l75_c10_dfa4_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l96_c8_1e91_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l77_c13_aad8_cond := VAR_fy;
     VAR_MUX_uxn_device_h_l94_c35_8c88_cond := VAR_fy;
     VAR_opaque_MUX_uxn_device_h_l73_c2_c3bb_iffalse := opaque;
     VAR_BIN_OP_EQ_uxn_device_h_l73_c6_f91a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l95_c25_0c90_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l67_c20_17bb_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_device_h_l84_c21_e4d2_right := VAR_phase;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_f092_elem_val := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_device_h_l84_c21_e4d2_left := VAR_ram_addr;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_f092_ref_toks_0 := sprite_rows;
     VAR_sprite_rows_MUX_uxn_device_h_l69_c2_a9ac_iffalse := sprite_rows;
     VAR_x_MUX_uxn_device_h_l73_c2_c3bb_iffalse := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l76_c7_9d84_left := VAR_x1;
     VAR_BIN_OP_PLUS_uxn_device_h_l87_c35_2b25_left := VAR_x1;
     VAR_xmod_MUX_uxn_device_h_l73_c2_c3bb_iffalse := xmod;
     VAR_y_MUX_uxn_device_h_l73_c2_c3bb_iffalse := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_e4c9_left := VAR_y1;
     VAR_BIN_OP_PLUS_uxn_device_h_l74_c21_9b2a_right := VAR_color8_uxn_device_h_l63_c2_d4bf;
     VAR_BIN_OP_PLUS_uxn_device_h_l93_c30_75ae_left := VAR_color8_uxn_device_h_l63_c2_d4bf;
     REG_VAR_color8 := VAR_color8_uxn_device_h_l63_c2_d4bf;
     -- BIN_OP_EQ[uxn_device_h_l95_c25_0c90] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l95_c25_0c90_left <= VAR_BIN_OP_EQ_uxn_device_h_l95_c25_0c90_left;
     BIN_OP_EQ_uxn_device_h_l95_c25_0c90_right <= VAR_BIN_OP_EQ_uxn_device_h_l95_c25_0c90_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l95_c25_0c90_return_output := BIN_OP_EQ_uxn_device_h_l95_c25_0c90_return_output;

     -- BIN_OP_EQ[uxn_device_h_l73_c6_f91a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l73_c6_f91a_left <= VAR_BIN_OP_EQ_uxn_device_h_l73_c6_f91a_left;
     BIN_OP_EQ_uxn_device_h_l73_c6_f91a_right <= VAR_BIN_OP_EQ_uxn_device_h_l73_c6_f91a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l73_c6_f91a_return_output := BIN_OP_EQ_uxn_device_h_l73_c6_f91a_return_output;

     -- uint8_2_0[uxn_device_h_l66_c20_ba4f] LATENCY=0
     VAR_uint8_2_0_uxn_device_h_l66_c20_ba4f_return_output := uint8_2_0(
     VAR_phase);

     -- uint8_7_4[uxn_device_h_l64_c20_fcf1] LATENCY=0
     VAR_uint8_7_4_uxn_device_h_l64_c20_fcf1_return_output := uint8_7_4(
     VAR_phase);

     -- MUX[uxn_device_h_l77_c13_aad8] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l77_c13_aad8_cond <= VAR_MUX_uxn_device_h_l77_c13_aad8_cond;
     MUX_uxn_device_h_l77_c13_aad8_iftrue <= VAR_MUX_uxn_device_h_l77_c13_aad8_iftrue;
     MUX_uxn_device_h_l77_c13_aad8_iffalse <= VAR_MUX_uxn_device_h_l77_c13_aad8_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l77_c13_aad8_return_output := MUX_uxn_device_h_l77_c13_aad8_return_output;

     -- MUX[uxn_device_h_l75_c10_dfa4] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l75_c10_dfa4_cond <= VAR_MUX_uxn_device_h_l75_c10_dfa4_cond;
     MUX_uxn_device_h_l75_c10_dfa4_iftrue <= VAR_MUX_uxn_device_h_l75_c10_dfa4_iftrue;
     MUX_uxn_device_h_l75_c10_dfa4_iffalse <= VAR_MUX_uxn_device_h_l75_c10_dfa4_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l75_c10_dfa4_return_output := MUX_uxn_device_h_l75_c10_dfa4_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l84_c21_e4d2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l84_c21_e4d2_left <= VAR_BIN_OP_PLUS_uxn_device_h_l84_c21_e4d2_left;
     BIN_OP_PLUS_uxn_device_h_l84_c21_e4d2_right <= VAR_BIN_OP_PLUS_uxn_device_h_l84_c21_e4d2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l84_c21_e4d2_return_output := BIN_OP_PLUS_uxn_device_h_l84_c21_e4d2_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l67_c20_17bb] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l67_c20_17bb_left <= VAR_BIN_OP_MINUS_uxn_device_h_l67_c20_17bb_left;
     BIN_OP_MINUS_uxn_device_h_l67_c20_17bb_right <= VAR_BIN_OP_MINUS_uxn_device_h_l67_c20_17bb_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l67_c20_17bb_return_output := BIN_OP_MINUS_uxn_device_h_l67_c20_17bb_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l74_c21_9b2a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l74_c21_9b2a_left <= VAR_BIN_OP_PLUS_uxn_device_h_l74_c21_9b2a_left;
     BIN_OP_PLUS_uxn_device_h_l74_c21_9b2a_right <= VAR_BIN_OP_PLUS_uxn_device_h_l74_c21_9b2a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l74_c21_9b2a_return_output := BIN_OP_PLUS_uxn_device_h_l74_c21_9b2a_return_output;

     -- uint8_7_3[uxn_device_h_l65_c20_1db0] LATENCY=0
     VAR_uint8_7_3_uxn_device_h_l65_c20_1db0_return_output := uint8_7_3(
     VAR_phase);

     -- Submodule level 1
     VAR_opaque_MUX_uxn_device_h_l73_c2_c3bb_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c6_f91a_return_output;
     VAR_x_MUX_uxn_device_h_l73_c2_c3bb_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c6_f91a_return_output;
     VAR_xmod_MUX_uxn_device_h_l73_c2_c3bb_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c6_f91a_return_output;
     VAR_y_MUX_uxn_device_h_l73_c2_c3bb_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c6_f91a_return_output;
     VAR_MUX_uxn_device_h_l95_c25_024a_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c25_0c90_return_output;
     VAR_phase_minus_two_uxn_device_h_l67_c2_cc64 := VAR_BIN_OP_MINUS_uxn_device_h_l67_c20_17bb_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_f649_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l74_c21_9b2a_return_output, 7);
     VAR_result_u16_addr_uxn_device_h_l84_c3_b9eb := resize(VAR_BIN_OP_PLUS_uxn_device_h_l84_c21_e4d2_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l76_c7_9d84_right := VAR_MUX_uxn_device_h_l75_c10_dfa4_return_output;
     VAR_xmod_MUX_uxn_device_h_l73_c2_c3bb_iftrue := VAR_MUX_uxn_device_h_l75_c10_dfa4_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_e4c9_right := VAR_MUX_uxn_device_h_l77_c13_aad8_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l86_c7_c04a_left := VAR_uint8_2_0_uxn_device_h_l66_c20_ba4f_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l87_c7_2a5a_left := VAR_uint8_2_0_uxn_device_h_l66_c20_ba4f_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l94_c7_bb9b_left := VAR_uint8_2_0_uxn_device_h_l66_c20_ba4f_return_output;
     REG_VAR_phase2_downto_0 := VAR_uint8_2_0_uxn_device_h_l66_c20_ba4f_return_output;
     REG_VAR_phase7_downto_3 := VAR_uint8_7_3_uxn_device_h_l65_c20_1db0_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l80_c6_9e23_left := VAR_uint8_7_4_uxn_device_h_l64_c20_fcf1_return_output;
     REG_VAR_phase7_downto_4 := VAR_uint8_7_4_uxn_device_h_l64_c20_fcf1_return_output;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_f092_var_dim_0 := resize(VAR_phase_minus_two_uxn_device_h_l67_c2_cc64, 4);
     REG_VAR_phase_minus_two := VAR_phase_minus_two_uxn_device_h_l67_c2_cc64;
     VAR_result_u16_addr_MUX_uxn_device_h_l80_c2_eb8b_iftrue := VAR_result_u16_addr_uxn_device_h_l84_c3_b9eb;
     -- BIN_OP_PLUS[uxn_device_h_l77_c7_e4c9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l77_c7_e4c9_left <= VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_e4c9_left;
     BIN_OP_PLUS_uxn_device_h_l77_c7_e4c9_right <= VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_e4c9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_e4c9_return_output := BIN_OP_PLUS_uxn_device_h_l77_c7_e4c9_return_output;

     -- MUX[uxn_device_h_l95_c25_024a] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l95_c25_024a_cond <= VAR_MUX_uxn_device_h_l95_c25_024a_cond;
     MUX_uxn_device_h_l95_c25_024a_iftrue <= VAR_MUX_uxn_device_h_l95_c25_024a_iftrue;
     MUX_uxn_device_h_l95_c25_024a_iffalse <= VAR_MUX_uxn_device_h_l95_c25_024a_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l95_c25_024a_return_output := MUX_uxn_device_h_l95_c25_024a_return_output;

     -- xmod_MUX[uxn_device_h_l73_c2_c3bb] LATENCY=0
     -- Inputs
     xmod_MUX_uxn_device_h_l73_c2_c3bb_cond <= VAR_xmod_MUX_uxn_device_h_l73_c2_c3bb_cond;
     xmod_MUX_uxn_device_h_l73_c2_c3bb_iftrue <= VAR_xmod_MUX_uxn_device_h_l73_c2_c3bb_iftrue;
     xmod_MUX_uxn_device_h_l73_c2_c3bb_iffalse <= VAR_xmod_MUX_uxn_device_h_l73_c2_c3bb_iffalse;
     -- Outputs
     VAR_xmod_MUX_uxn_device_h_l73_c2_c3bb_return_output := xmod_MUX_uxn_device_h_l73_c2_c3bb_return_output;

     -- BIN_OP_EQ[uxn_device_h_l86_c7_c04a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l86_c7_c04a_left <= VAR_BIN_OP_EQ_uxn_device_h_l86_c7_c04a_left;
     BIN_OP_EQ_uxn_device_h_l86_c7_c04a_right <= VAR_BIN_OP_EQ_uxn_device_h_l86_c7_c04a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l86_c7_c04a_return_output := BIN_OP_EQ_uxn_device_h_l86_c7_c04a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l94_c7_bb9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l94_c7_bb9b_left <= VAR_BIN_OP_EQ_uxn_device_h_l94_c7_bb9b_left;
     BIN_OP_EQ_uxn_device_h_l94_c7_bb9b_right <= VAR_BIN_OP_EQ_uxn_device_h_l94_c7_bb9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l94_c7_bb9b_return_output := BIN_OP_EQ_uxn_device_h_l94_c7_bb9b_return_output;

     -- CAST_TO_uint8_t_uint5_t_uxn_device_h_l86_DUPLICATE_b9e4 LATENCY=0
     VAR_CAST_TO_uint8_t_uint5_t_uxn_device_h_l86_DUPLICATE_b9e4_return_output := CAST_TO_uint8_t_uint5_t(
     VAR_uint8_7_3_uxn_device_h_l65_c20_1db0_return_output);

     -- BIN_OP_EQ[uxn_device_h_l80_c6_9e23] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l80_c6_9e23_left <= VAR_BIN_OP_EQ_uxn_device_h_l80_c6_9e23_left;
     BIN_OP_EQ_uxn_device_h_l80_c6_9e23_right <= VAR_BIN_OP_EQ_uxn_device_h_l80_c6_9e23_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l80_c6_9e23_return_output := BIN_OP_EQ_uxn_device_h_l80_c6_9e23_return_output;

     -- uint8_7_4[uxn_device_h_l69_c6_438d] LATENCY=0
     VAR_uint8_7_4_uxn_device_h_l69_c6_438d_return_output := uint8_7_4(
     VAR_phase_minus_two_uxn_device_h_l67_c2_cc64);

     -- BIN_OP_EQ[uxn_device_h_l87_c7_2a5a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l87_c7_2a5a_left <= VAR_BIN_OP_EQ_uxn_device_h_l87_c7_2a5a_left;
     BIN_OP_EQ_uxn_device_h_l87_c7_2a5a_right <= VAR_BIN_OP_EQ_uxn_device_h_l87_c7_2a5a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l87_c7_2a5a_return_output := BIN_OP_EQ_uxn_device_h_l87_c7_2a5a_return_output;

     -- VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60[uxn_device_h_l70_c3_f092] LATENCY=0
     -- Inputs
     VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_f092_elem_val <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_f092_elem_val;
     VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_f092_ref_toks_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_f092_ref_toks_0;
     VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_f092_var_dim_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_f092_var_dim_0;
     -- Outputs
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_f092_return_output := VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_f092_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l74_c12_f649] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_f649_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_f649_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_f649_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_f649_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_f649_return_output := VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_f649_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l76_c7_9d84] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l76_c7_9d84_left <= VAR_BIN_OP_PLUS_uxn_device_h_l76_c7_9d84_left;
     BIN_OP_PLUS_uxn_device_h_l76_c7_9d84_right <= VAR_BIN_OP_PLUS_uxn_device_h_l76_c7_9d84_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l76_c7_9d84_return_output := BIN_OP_PLUS_uxn_device_h_l76_c7_9d84_return_output;

     -- Submodule level 2
     VAR_c_MUX_uxn_device_h_l80_c2_eb8b_cond := VAR_BIN_OP_EQ_uxn_device_h_l80_c6_9e23_return_output;
     VAR_ch_MUX_uxn_device_h_l80_c2_eb8b_cond := VAR_BIN_OP_EQ_uxn_device_h_l80_c6_9e23_return_output;
     VAR_result_is_blit_done_MUX_uxn_device_h_l80_c2_eb8b_cond := VAR_BIN_OP_EQ_uxn_device_h_l80_c6_9e23_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l80_c2_eb8b_cond := VAR_BIN_OP_EQ_uxn_device_h_l80_c6_9e23_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l80_c2_eb8b_cond := VAR_BIN_OP_EQ_uxn_device_h_l80_c6_9e23_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l80_c2_eb8b_cond := VAR_BIN_OP_EQ_uxn_device_h_l80_c6_9e23_return_output;
     VAR_x_MUX_uxn_device_h_l80_c2_eb8b_cond := VAR_BIN_OP_EQ_uxn_device_h_l80_c6_9e23_return_output;
     VAR_y_MUX_uxn_device_h_l80_c2_eb8b_cond := VAR_BIN_OP_EQ_uxn_device_h_l80_c6_9e23_return_output;
     VAR_MUX_uxn_device_h_l86_c7_debe_cond := VAR_BIN_OP_EQ_uxn_device_h_l86_c7_c04a_return_output;
     VAR_MUX_uxn_device_h_l87_c7_af2c_cond := VAR_BIN_OP_EQ_uxn_device_h_l87_c7_2a5a_return_output;
     VAR_MUX_uxn_device_h_l94_c7_05bc_cond := VAR_BIN_OP_EQ_uxn_device_h_l94_c7_bb9b_return_output;
     VAR_x_uxn_device_h_l76_c3_583a := resize(VAR_BIN_OP_PLUS_uxn_device_h_l76_c7_9d84_return_output, 16);
     VAR_y_uxn_device_h_l77_c3_6020 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_e4c9_return_output, 16);
     VAR_BIN_OP_MINUS_uxn_device_h_l86_c46_f37b_left := VAR_CAST_TO_uint8_t_uint5_t_uxn_device_h_l86_DUPLICATE_b9e4_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l86_c96_d00d_left := VAR_CAST_TO_uint8_t_uint5_t_uxn_device_h_l86_DUPLICATE_b9e4_return_output;
     VAR_result_is_blit_done_MUX_uxn_device_h_l80_c2_eb8b_iffalse := VAR_MUX_uxn_device_h_l95_c25_024a_return_output;
     VAR_opaque_uxn_device_h_l74_c3_fbc4 := resize(VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l74_c12_f649_return_output, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l69_c6_aa4f_left := VAR_uint8_7_4_uxn_device_h_l69_c6_438d_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l87_c35_2b25_right := VAR_xmod_MUX_uxn_device_h_l73_c2_c3bb_return_output;
     REG_VAR_xmod := VAR_xmod_MUX_uxn_device_h_l73_c2_c3bb_return_output;
     VAR_opaque_MUX_uxn_device_h_l73_c2_c3bb_iftrue := VAR_opaque_uxn_device_h_l74_c3_fbc4;
     VAR_x_MUX_uxn_device_h_l73_c2_c3bb_iftrue := VAR_x_uxn_device_h_l76_c3_583a;
     VAR_y_MUX_uxn_device_h_l73_c2_c3bb_iftrue := VAR_y_uxn_device_h_l77_c3_6020;
     -- opaque_MUX[uxn_device_h_l73_c2_c3bb] LATENCY=0
     -- Inputs
     opaque_MUX_uxn_device_h_l73_c2_c3bb_cond <= VAR_opaque_MUX_uxn_device_h_l73_c2_c3bb_cond;
     opaque_MUX_uxn_device_h_l73_c2_c3bb_iftrue <= VAR_opaque_MUX_uxn_device_h_l73_c2_c3bb_iftrue;
     opaque_MUX_uxn_device_h_l73_c2_c3bb_iffalse <= VAR_opaque_MUX_uxn_device_h_l73_c2_c3bb_iffalse;
     -- Outputs
     VAR_opaque_MUX_uxn_device_h_l73_c2_c3bb_return_output := opaque_MUX_uxn_device_h_l73_c2_c3bb_return_output;

     -- y_MUX[uxn_device_h_l73_c2_c3bb] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l73_c2_c3bb_cond <= VAR_y_MUX_uxn_device_h_l73_c2_c3bb_cond;
     y_MUX_uxn_device_h_l73_c2_c3bb_iftrue <= VAR_y_MUX_uxn_device_h_l73_c2_c3bb_iftrue;
     y_MUX_uxn_device_h_l73_c2_c3bb_iffalse <= VAR_y_MUX_uxn_device_h_l73_c2_c3bb_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l73_c2_c3bb_return_output := y_MUX_uxn_device_h_l73_c2_c3bb_return_output;

     -- x_MUX[uxn_device_h_l73_c2_c3bb] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l73_c2_c3bb_cond <= VAR_x_MUX_uxn_device_h_l73_c2_c3bb_cond;
     x_MUX_uxn_device_h_l73_c2_c3bb_iftrue <= VAR_x_MUX_uxn_device_h_l73_c2_c3bb_iftrue;
     x_MUX_uxn_device_h_l73_c2_c3bb_iffalse <= VAR_x_MUX_uxn_device_h_l73_c2_c3bb_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l73_c2_c3bb_return_output := x_MUX_uxn_device_h_l73_c2_c3bb_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l86_c46_f37b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l86_c46_f37b_left <= VAR_BIN_OP_MINUS_uxn_device_h_l86_c46_f37b_left;
     BIN_OP_MINUS_uxn_device_h_l86_c46_f37b_right <= VAR_BIN_OP_MINUS_uxn_device_h_l86_c46_f37b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l86_c46_f37b_return_output := BIN_OP_MINUS_uxn_device_h_l86_c46_f37b_return_output;

     -- sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5[uxn_device_h_l69_c2_a9ac] LATENCY=0
     VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5_uxn_device_h_l69_c2_a9ac_return_output := CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5(
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l70_c3_f092_return_output);

     -- BIN_OP_PLUS[uxn_device_h_l87_c35_2b25] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l87_c35_2b25_left <= VAR_BIN_OP_PLUS_uxn_device_h_l87_c35_2b25_left;
     BIN_OP_PLUS_uxn_device_h_l87_c35_2b25_right <= VAR_BIN_OP_PLUS_uxn_device_h_l87_c35_2b25_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l87_c35_2b25_return_output := BIN_OP_PLUS_uxn_device_h_l87_c35_2b25_return_output;

     -- result_is_blit_done_MUX[uxn_device_h_l80_c2_eb8b] LATENCY=0
     -- Inputs
     result_is_blit_done_MUX_uxn_device_h_l80_c2_eb8b_cond <= VAR_result_is_blit_done_MUX_uxn_device_h_l80_c2_eb8b_cond;
     result_is_blit_done_MUX_uxn_device_h_l80_c2_eb8b_iftrue <= VAR_result_is_blit_done_MUX_uxn_device_h_l80_c2_eb8b_iftrue;
     result_is_blit_done_MUX_uxn_device_h_l80_c2_eb8b_iffalse <= VAR_result_is_blit_done_MUX_uxn_device_h_l80_c2_eb8b_iffalse;
     -- Outputs
     VAR_result_is_blit_done_MUX_uxn_device_h_l80_c2_eb8b_return_output := result_is_blit_done_MUX_uxn_device_h_l80_c2_eb8b_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l86_c96_d00d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l86_c96_d00d_left <= VAR_BIN_OP_PLUS_uxn_device_h_l86_c96_d00d_left;
     BIN_OP_PLUS_uxn_device_h_l86_c96_d00d_right <= VAR_BIN_OP_PLUS_uxn_device_h_l86_c96_d00d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l86_c96_d00d_return_output := BIN_OP_PLUS_uxn_device_h_l86_c96_d00d_return_output;

     -- BIN_OP_EQ[uxn_device_h_l69_c6_aa4f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l69_c6_aa4f_left <= VAR_BIN_OP_EQ_uxn_device_h_l69_c6_aa4f_left;
     BIN_OP_EQ_uxn_device_h_l69_c6_aa4f_right <= VAR_BIN_OP_EQ_uxn_device_h_l69_c6_aa4f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l69_c6_aa4f_return_output := BIN_OP_EQ_uxn_device_h_l69_c6_aa4f_return_output;

     -- Submodule level 3
     VAR_sprite_rows_MUX_uxn_device_h_l69_c2_a9ac_cond := VAR_BIN_OP_EQ_uxn_device_h_l69_c6_aa4f_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_13b1_var_dim_0 := resize(VAR_BIN_OP_MINUS_uxn_device_h_l86_c46_f37b_return_output, 4);
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_cff9_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l86_c96_d00d_return_output, 4);
     VAR_MUX_uxn_device_h_l87_c7_af2c_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l87_c35_2b25_return_output, 16);
     VAR_BIN_OP_OR_uxn_device_h_l92_c26_023f_left := VAR_opaque_MUX_uxn_device_h_l73_c2_c3bb_return_output;
     REG_VAR_opaque := VAR_opaque_MUX_uxn_device_h_l73_c2_c3bb_return_output;
     VAR_sprite_rows_MUX_uxn_device_h_l69_c2_a9ac_iftrue := VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5_uxn_device_h_l69_c2_a9ac_return_output;
     VAR_MUX_uxn_device_h_l87_c7_af2c_iffalse := VAR_x_MUX_uxn_device_h_l73_c2_c3bb_return_output;
     VAR_x_MUX_uxn_device_h_l80_c2_eb8b_iftrue := VAR_x_MUX_uxn_device_h_l73_c2_c3bb_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l94_c41_35a4_left := VAR_y_MUX_uxn_device_h_l73_c2_c3bb_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l94_c51_710d_left := VAR_y_MUX_uxn_device_h_l73_c2_c3bb_return_output;
     VAR_CONST_SL_8_uxn_device_h_l91_c22_a26d_x := VAR_y_MUX_uxn_device_h_l73_c2_c3bb_return_output;
     VAR_MUX_uxn_device_h_l94_c7_05bc_iffalse := VAR_y_MUX_uxn_device_h_l73_c2_c3bb_return_output;
     VAR_y_MUX_uxn_device_h_l80_c2_eb8b_iftrue := VAR_y_MUX_uxn_device_h_l73_c2_c3bb_return_output;
     -- MUX[uxn_device_h_l87_c7_af2c] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l87_c7_af2c_cond <= VAR_MUX_uxn_device_h_l87_c7_af2c_cond;
     MUX_uxn_device_h_l87_c7_af2c_iftrue <= VAR_MUX_uxn_device_h_l87_c7_af2c_iftrue;
     MUX_uxn_device_h_l87_c7_af2c_iffalse <= VAR_MUX_uxn_device_h_l87_c7_af2c_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l87_c7_af2c_return_output := MUX_uxn_device_h_l87_c7_af2c_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l94_c41_35a4] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l94_c41_35a4_left <= VAR_BIN_OP_MINUS_uxn_device_h_l94_c41_35a4_left;
     BIN_OP_MINUS_uxn_device_h_l94_c41_35a4_right <= VAR_BIN_OP_MINUS_uxn_device_h_l94_c41_35a4_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l94_c41_35a4_return_output := BIN_OP_MINUS_uxn_device_h_l94_c41_35a4_return_output;

     -- CONST_SL_8[uxn_device_h_l91_c22_a26d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_device_h_l91_c22_a26d_x <= VAR_CONST_SL_8_uxn_device_h_l91_c22_a26d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_device_h_l91_c22_a26d_return_output := CONST_SL_8_uxn_device_h_l91_c22_a26d_return_output;

     -- sprite_rows_MUX[uxn_device_h_l69_c2_a9ac] LATENCY=0
     -- Inputs
     sprite_rows_MUX_uxn_device_h_l69_c2_a9ac_cond <= VAR_sprite_rows_MUX_uxn_device_h_l69_c2_a9ac_cond;
     sprite_rows_MUX_uxn_device_h_l69_c2_a9ac_iftrue <= VAR_sprite_rows_MUX_uxn_device_h_l69_c2_a9ac_iftrue;
     sprite_rows_MUX_uxn_device_h_l69_c2_a9ac_iffalse <= VAR_sprite_rows_MUX_uxn_device_h_l69_c2_a9ac_iffalse;
     -- Outputs
     VAR_sprite_rows_MUX_uxn_device_h_l69_c2_a9ac_return_output := sprite_rows_MUX_uxn_device_h_l69_c2_a9ac_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l94_c51_710d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l94_c51_710d_left <= VAR_BIN_OP_PLUS_uxn_device_h_l94_c51_710d_left;
     BIN_OP_PLUS_uxn_device_h_l94_c51_710d_right <= VAR_BIN_OP_PLUS_uxn_device_h_l94_c51_710d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l94_c51_710d_return_output := BIN_OP_PLUS_uxn_device_h_l94_c51_710d_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l94_c35_8c88_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l94_c41_35a4_return_output;
     VAR_MUX_uxn_device_h_l94_c35_8c88_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l94_c51_710d_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l91_c22_8519_left := VAR_CONST_SL_8_uxn_device_h_l91_c22_a26d_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l96_c24_79f4_left := VAR_MUX_uxn_device_h_l87_c7_af2c_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l91_c22_8519_right := VAR_MUX_uxn_device_h_l87_c7_af2c_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l96_c14_416f_left := VAR_MUX_uxn_device_h_l87_c7_af2c_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_13b1_ref_toks_0 := VAR_sprite_rows_MUX_uxn_device_h_l69_c2_a9ac_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_cff9_ref_toks_0 := VAR_sprite_rows_MUX_uxn_device_h_l69_c2_a9ac_return_output;
     REG_VAR_sprite_rows := VAR_sprite_rows_MUX_uxn_device_h_l69_c2_a9ac_return_output;
     -- BIN_OP_MINUS[uxn_device_h_l96_c24_79f4] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l96_c24_79f4_left <= VAR_BIN_OP_MINUS_uxn_device_h_l96_c24_79f4_left;
     BIN_OP_MINUS_uxn_device_h_l96_c24_79f4_right <= VAR_BIN_OP_MINUS_uxn_device_h_l96_c24_79f4_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l96_c24_79f4_return_output := BIN_OP_MINUS_uxn_device_h_l96_c24_79f4_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l86_c84_cff9] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_cff9_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_cff9_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_cff9_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_cff9_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_cff9_return_output := VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_cff9_return_output;

     -- MUX[uxn_device_h_l94_c35_8c88] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l94_c35_8c88_cond <= VAR_MUX_uxn_device_h_l94_c35_8c88_cond;
     MUX_uxn_device_h_l94_c35_8c88_iftrue <= VAR_MUX_uxn_device_h_l94_c35_8c88_iftrue;
     MUX_uxn_device_h_l94_c35_8c88_iffalse <= VAR_MUX_uxn_device_h_l94_c35_8c88_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l94_c35_8c88_return_output := MUX_uxn_device_h_l94_c35_8c88_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l91_c22_8519] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l91_c22_8519_left <= VAR_BIN_OP_PLUS_uxn_device_h_l91_c22_8519_left;
     BIN_OP_PLUS_uxn_device_h_l91_c22_8519_right <= VAR_BIN_OP_PLUS_uxn_device_h_l91_c22_8519_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l91_c22_8519_return_output := BIN_OP_PLUS_uxn_device_h_l91_c22_8519_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l86_c34_13b1] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_13b1_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_13b1_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_13b1_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_13b1_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_13b1_return_output := VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_13b1_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l96_c14_416f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l96_c14_416f_left <= VAR_BIN_OP_PLUS_uxn_device_h_l96_c14_416f_left;
     BIN_OP_PLUS_uxn_device_h_l96_c14_416f_right <= VAR_BIN_OP_PLUS_uxn_device_h_l96_c14_416f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l96_c14_416f_return_output := BIN_OP_PLUS_uxn_device_h_l96_c14_416f_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_device_h_l96_c8_1e91_iffalse := VAR_BIN_OP_MINUS_uxn_device_h_l96_c24_79f4_return_output;
     VAR_result_u16_addr_uxn_device_h_l91_c3_ffde := resize(VAR_BIN_OP_PLUS_uxn_device_h_l91_c22_8519_return_output, 16);
     VAR_MUX_uxn_device_h_l96_c8_1e91_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l96_c14_416f_return_output, 16);
     VAR_MUX_uxn_device_h_l94_c7_05bc_iftrue := VAR_MUX_uxn_device_h_l94_c35_8c88_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l86_c34_0192_left := VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c34_13b1_return_output;
     VAR_CONST_SL_8_uxn_device_h_l86_c84_590f_x := VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l86_c84_cff9_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l80_c2_eb8b_iffalse := VAR_result_u16_addr_uxn_device_h_l91_c3_ffde;
     -- result_u16_addr_MUX[uxn_device_h_l80_c2_eb8b] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l80_c2_eb8b_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l80_c2_eb8b_cond;
     result_u16_addr_MUX_uxn_device_h_l80_c2_eb8b_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l80_c2_eb8b_iftrue;
     result_u16_addr_MUX_uxn_device_h_l80_c2_eb8b_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l80_c2_eb8b_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l80_c2_eb8b_return_output := result_u16_addr_MUX_uxn_device_h_l80_c2_eb8b_return_output;

     -- MUX[uxn_device_h_l94_c7_05bc] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l94_c7_05bc_cond <= VAR_MUX_uxn_device_h_l94_c7_05bc_cond;
     MUX_uxn_device_h_l94_c7_05bc_iftrue <= VAR_MUX_uxn_device_h_l94_c7_05bc_iftrue;
     MUX_uxn_device_h_l94_c7_05bc_iffalse <= VAR_MUX_uxn_device_h_l94_c7_05bc_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l94_c7_05bc_return_output := MUX_uxn_device_h_l94_c7_05bc_return_output;

     -- MUX[uxn_device_h_l96_c8_1e91] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l96_c8_1e91_cond <= VAR_MUX_uxn_device_h_l96_c8_1e91_cond;
     MUX_uxn_device_h_l96_c8_1e91_iftrue <= VAR_MUX_uxn_device_h_l96_c8_1e91_iftrue;
     MUX_uxn_device_h_l96_c8_1e91_iffalse <= VAR_MUX_uxn_device_h_l96_c8_1e91_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l96_c8_1e91_return_output := MUX_uxn_device_h_l96_c8_1e91_return_output;

     -- CONST_SL_8[uxn_device_h_l86_c84_590f] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_device_h_l86_c84_590f_x <= VAR_CONST_SL_8_uxn_device_h_l86_c84_590f_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_device_h_l86_c84_590f_return_output := CONST_SL_8_uxn_device_h_l86_c84_590f_return_output;

     -- Submodule level 6
     VAR_BIN_OP_OR_uxn_device_h_l86_c34_0192_right := VAR_CONST_SL_8_uxn_device_h_l86_c84_590f_return_output;
     VAR_y_MUX_uxn_device_h_l80_c2_eb8b_iffalse := VAR_MUX_uxn_device_h_l94_c7_05bc_return_output;
     VAR_x_MUX_uxn_device_h_l80_c2_eb8b_iffalse := VAR_MUX_uxn_device_h_l96_c8_1e91_return_output;
     -- BIN_OP_OR[uxn_device_h_l86_c34_0192] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l86_c34_0192_left <= VAR_BIN_OP_OR_uxn_device_h_l86_c34_0192_left;
     BIN_OP_OR_uxn_device_h_l86_c34_0192_right <= VAR_BIN_OP_OR_uxn_device_h_l86_c34_0192_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l86_c34_0192_return_output := BIN_OP_OR_uxn_device_h_l86_c34_0192_return_output;

     -- y_MUX[uxn_device_h_l80_c2_eb8b] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l80_c2_eb8b_cond <= VAR_y_MUX_uxn_device_h_l80_c2_eb8b_cond;
     y_MUX_uxn_device_h_l80_c2_eb8b_iftrue <= VAR_y_MUX_uxn_device_h_l80_c2_eb8b_iftrue;
     y_MUX_uxn_device_h_l80_c2_eb8b_iffalse <= VAR_y_MUX_uxn_device_h_l80_c2_eb8b_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l80_c2_eb8b_return_output := y_MUX_uxn_device_h_l80_c2_eb8b_return_output;

     -- x_MUX[uxn_device_h_l80_c2_eb8b] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l80_c2_eb8b_cond <= VAR_x_MUX_uxn_device_h_l80_c2_eb8b_cond;
     x_MUX_uxn_device_h_l80_c2_eb8b_iftrue <= VAR_x_MUX_uxn_device_h_l80_c2_eb8b_iftrue;
     x_MUX_uxn_device_h_l80_c2_eb8b_iffalse <= VAR_x_MUX_uxn_device_h_l80_c2_eb8b_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l80_c2_eb8b_return_output := x_MUX_uxn_device_h_l80_c2_eb8b_return_output;

     -- Submodule level 7
     VAR_MUX_uxn_device_h_l86_c7_debe_iftrue := resize(VAR_BIN_OP_OR_uxn_device_h_l86_c34_0192_return_output, 16);
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l80_c2_eb8b_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l80_c2_eb8b_return_output;
     -- MUX[uxn_device_h_l86_c7_debe] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l86_c7_debe_cond <= VAR_MUX_uxn_device_h_l86_c7_debe_cond;
     MUX_uxn_device_h_l86_c7_debe_iftrue <= VAR_MUX_uxn_device_h_l86_c7_debe_iftrue;
     MUX_uxn_device_h_l86_c7_debe_iffalse <= VAR_MUX_uxn_device_h_l86_c7_debe_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l86_c7_debe_return_output := MUX_uxn_device_h_l86_c7_debe_return_output;

     -- Submodule level 8
     VAR_CONST_SR_1_uxn_device_h_l97_c3_7303_x := VAR_MUX_uxn_device_h_l86_c7_debe_return_output;
     -- CONST_SR_1[uxn_device_h_l97_c3_7303] LATENCY=0
     -- Inputs
     CONST_SR_1_uxn_device_h_l97_c3_7303_x <= VAR_CONST_SR_1_uxn_device_h_l97_c3_7303_x;
     -- Outputs
     VAR_CONST_SR_1_uxn_device_h_l97_c3_7303_return_output := CONST_SR_1_uxn_device_h_l97_c3_7303_return_output;

     -- uint16_8_8[uxn_device_h_l88_c8_6f14] LATENCY=0
     VAR_uint16_8_8_uxn_device_h_l88_c8_6f14_return_output := uint16_8_8(
     VAR_MUX_uxn_device_h_l86_c7_debe_return_output);

     -- uint16_0_0[uxn_device_h_l90_c9_73ff] LATENCY=0
     VAR_uint16_0_0_uxn_device_h_l90_c9_73ff_return_output := uint16_0_0(
     VAR_MUX_uxn_device_h_l86_c7_debe_return_output);

     -- Submodule level 9
     VAR_c_MUX_uxn_device_h_l80_c2_eb8b_iffalse := VAR_CONST_SR_1_uxn_device_h_l97_c3_7303_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l90_c3_69c4_right := VAR_uint16_0_0_uxn_device_h_l90_c9_73ff_return_output;
     VAR_ch_uxn_device_h_l88_c3_e9dc := resize(VAR_uint16_8_8_uxn_device_h_l88_c8_6f14_return_output, 8);
     VAR_CONST_SL_1_uxn_device_h_l89_c3_6566_x := VAR_ch_uxn_device_h_l88_c3_e9dc;
     -- CONST_SL_1[uxn_device_h_l89_c3_6566] LATENCY=0
     -- Inputs
     CONST_SL_1_uxn_device_h_l89_c3_6566_x <= VAR_CONST_SL_1_uxn_device_h_l89_c3_6566_x;
     -- Outputs
     VAR_CONST_SL_1_uxn_device_h_l89_c3_6566_return_output := CONST_SL_1_uxn_device_h_l89_c3_6566_return_output;

     -- c_MUX[uxn_device_h_l80_c2_eb8b] LATENCY=0
     -- Inputs
     c_MUX_uxn_device_h_l80_c2_eb8b_cond <= VAR_c_MUX_uxn_device_h_l80_c2_eb8b_cond;
     c_MUX_uxn_device_h_l80_c2_eb8b_iftrue <= VAR_c_MUX_uxn_device_h_l80_c2_eb8b_iftrue;
     c_MUX_uxn_device_h_l80_c2_eb8b_iffalse <= VAR_c_MUX_uxn_device_h_l80_c2_eb8b_iffalse;
     -- Outputs
     VAR_c_MUX_uxn_device_h_l80_c2_eb8b_return_output := c_MUX_uxn_device_h_l80_c2_eb8b_return_output;

     -- Submodule level 10
     VAR_BIN_OP_OR_uxn_device_h_l90_c3_69c4_left := VAR_CONST_SL_1_uxn_device_h_l89_c3_6566_return_output;
     REG_VAR_c := VAR_c_MUX_uxn_device_h_l80_c2_eb8b_return_output;
     -- BIN_OP_OR[uxn_device_h_l90_c3_69c4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l90_c3_69c4_left <= VAR_BIN_OP_OR_uxn_device_h_l90_c3_69c4_left;
     BIN_OP_OR_uxn_device_h_l90_c3_69c4_right <= VAR_BIN_OP_OR_uxn_device_h_l90_c3_69c4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l90_c3_69c4_return_output := BIN_OP_OR_uxn_device_h_l90_c3_69c4_return_output;

     -- Submodule level 11
     VAR_BIN_OP_EQ_uxn_device_h_l92_c36_36b5_left := VAR_BIN_OP_OR_uxn_device_h_l90_c3_69c4_return_output;
     VAR_CONST_SL_4_uxn_device_h_l93_c40_c28b_x := VAR_BIN_OP_OR_uxn_device_h_l90_c3_69c4_return_output;
     VAR_ch_MUX_uxn_device_h_l80_c2_eb8b_iffalse := VAR_BIN_OP_OR_uxn_device_h_l90_c3_69c4_return_output;
     -- ch_MUX[uxn_device_h_l80_c2_eb8b] LATENCY=0
     -- Inputs
     ch_MUX_uxn_device_h_l80_c2_eb8b_cond <= VAR_ch_MUX_uxn_device_h_l80_c2_eb8b_cond;
     ch_MUX_uxn_device_h_l80_c2_eb8b_iftrue <= VAR_ch_MUX_uxn_device_h_l80_c2_eb8b_iftrue;
     ch_MUX_uxn_device_h_l80_c2_eb8b_iffalse <= VAR_ch_MUX_uxn_device_h_l80_c2_eb8b_iffalse;
     -- Outputs
     VAR_ch_MUX_uxn_device_h_l80_c2_eb8b_return_output := ch_MUX_uxn_device_h_l80_c2_eb8b_return_output;

     -- CONST_SL_4[uxn_device_h_l93_c40_c28b] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_device_h_l93_c40_c28b_x <= VAR_CONST_SL_4_uxn_device_h_l93_c40_c28b_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_device_h_l93_c40_c28b_return_output := CONST_SL_4_uxn_device_h_l93_c40_c28b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l92_c36_36b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l92_c36_36b5_left <= VAR_BIN_OP_EQ_uxn_device_h_l92_c36_36b5_left;
     BIN_OP_EQ_uxn_device_h_l92_c36_36b5_right <= VAR_BIN_OP_EQ_uxn_device_h_l92_c36_36b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l92_c36_36b5_return_output := BIN_OP_EQ_uxn_device_h_l92_c36_36b5_return_output;

     -- Submodule level 12
     VAR_MUX_uxn_device_h_l92_c36_d5e5_cond := VAR_BIN_OP_EQ_uxn_device_h_l92_c36_36b5_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l93_c30_75ae_right := VAR_CONST_SL_4_uxn_device_h_l93_c40_c28b_return_output;
     REG_VAR_ch := VAR_ch_MUX_uxn_device_h_l80_c2_eb8b_return_output;
     -- MUX[uxn_device_h_l92_c36_d5e5] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l92_c36_d5e5_cond <= VAR_MUX_uxn_device_h_l92_c36_d5e5_cond;
     MUX_uxn_device_h_l92_c36_d5e5_iftrue <= VAR_MUX_uxn_device_h_l92_c36_d5e5_iftrue;
     MUX_uxn_device_h_l92_c36_d5e5_iffalse <= VAR_MUX_uxn_device_h_l92_c36_d5e5_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l92_c36_d5e5_return_output := MUX_uxn_device_h_l92_c36_d5e5_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l93_c30_75ae] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l93_c30_75ae_left <= VAR_BIN_OP_PLUS_uxn_device_h_l93_c30_75ae_left;
     BIN_OP_PLUS_uxn_device_h_l93_c30_75ae_right <= VAR_BIN_OP_PLUS_uxn_device_h_l93_c30_75ae_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l93_c30_75ae_return_output := BIN_OP_PLUS_uxn_device_h_l93_c30_75ae_return_output;

     -- Submodule level 13
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_4483_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l93_c30_75ae_return_output, 7);
     VAR_BIN_OP_OR_uxn_device_h_l92_c26_023f_right := VAR_MUX_uxn_device_h_l92_c36_d5e5_return_output;
     -- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l93_c21_4483] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_4483_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_4483_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_4483_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_4483_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_4483_return_output := VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_4483_return_output;

     -- BIN_OP_OR[uxn_device_h_l92_c26_023f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l92_c26_023f_left <= VAR_BIN_OP_OR_uxn_device_h_l92_c26_023f_left;
     BIN_OP_OR_uxn_device_h_l92_c26_023f_right <= VAR_BIN_OP_OR_uxn_device_h_l92_c26_023f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l92_c26_023f_return_output := BIN_OP_OR_uxn_device_h_l92_c26_023f_return_output;

     -- Submodule level 14
     VAR_result_is_vram_write_MUX_uxn_device_h_l80_c2_eb8b_iffalse := VAR_BIN_OP_OR_uxn_device_h_l92_c26_023f_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l80_c2_eb8b_iffalse := VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l93_c21_4483_return_output;
     -- result_u8_value_MUX[uxn_device_h_l80_c2_eb8b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l80_c2_eb8b_cond <= VAR_result_u8_value_MUX_uxn_device_h_l80_c2_eb8b_cond;
     result_u8_value_MUX_uxn_device_h_l80_c2_eb8b_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l80_c2_eb8b_iftrue;
     result_u8_value_MUX_uxn_device_h_l80_c2_eb8b_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l80_c2_eb8b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l80_c2_eb8b_return_output := result_u8_value_MUX_uxn_device_h_l80_c2_eb8b_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l80_c2_eb8b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l80_c2_eb8b_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l80_c2_eb8b_cond;
     result_is_vram_write_MUX_uxn_device_h_l80_c2_eb8b_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l80_c2_eb8b_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l80_c2_eb8b_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l80_c2_eb8b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l80_c2_eb8b_return_output := result_is_vram_write_MUX_uxn_device_h_l80_c2_eb8b_return_output;

     -- Submodule level 15
     -- CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_97ac_uxn_device_h_l100_l42_DUPLICATE_459c LATENCY=0
     VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_97ac_uxn_device_h_l100_l42_DUPLICATE_459c_return_output := CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_97ac(
     result,
     VAR_result_u8_value_MUX_uxn_device_h_l80_c2_eb8b_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l80_c2_eb8b_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l80_c2_eb8b_return_output,
     VAR_result_is_blit_done_MUX_uxn_device_h_l80_c2_eb8b_return_output);

     -- Submodule level 16
     REG_VAR_result := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_97ac_uxn_device_h_l100_l42_DUPLICATE_459c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_97ac_uxn_device_h_l100_l42_DUPLICATE_459c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_blending <= REG_VAR_blending;
REG_COMB_x <= REG_VAR_x;
REG_COMB_y <= REG_VAR_y;
REG_COMB_xmod <= REG_VAR_xmod;
REG_COMB_opaque <= REG_VAR_opaque;
REG_COMB_c <= REG_VAR_c;
REG_COMB_ch <= REG_VAR_ch;
REG_COMB_color8 <= REG_VAR_color8;
REG_COMB_result <= REG_VAR_result;
REG_COMB_phase_minus_two <= REG_VAR_phase_minus_two;
REG_COMB_phase7_downto_4 <= REG_VAR_phase7_downto_4;
REG_COMB_phase7_downto_3 <= REG_VAR_phase7_downto_3;
REG_COMB_phase2_downto_0 <= REG_VAR_phase2_downto_0;
REG_COMB_sprite_rows <= REG_VAR_sprite_rows;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     blending <= REG_COMB_blending;
     x <= REG_COMB_x;
     y <= REG_COMB_y;
     xmod <= REG_COMB_xmod;
     opaque <= REG_COMB_opaque;
     c <= REG_COMB_c;
     ch <= REG_COMB_ch;
     color8 <= REG_COMB_color8;
     result <= REG_COMB_result;
     phase_minus_two <= REG_COMB_phase_minus_two;
     phase7_downto_4 <= REG_COMB_phase7_downto_4;
     phase7_downto_3 <= REG_COMB_phase7_downto_3;
     phase2_downto_0 <= REG_COMB_phase2_downto_0;
     sprite_rows <= REG_COMB_sprite_rows;
 end if;
 end if;
end process;

end arch;
