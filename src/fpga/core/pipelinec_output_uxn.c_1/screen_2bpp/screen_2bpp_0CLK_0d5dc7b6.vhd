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
-- Submodules: 72
entity screen_2bpp_0CLK_0d5dc7b6 is
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
end screen_2bpp_0CLK_0d5dc7b6;
architecture arch of screen_2bpp_0CLK_0d5dc7b6 is
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
-- BIN_OP_MINUS[uxn_device_h_l69_c20_7b96]
signal BIN_OP_MINUS_uxn_device_h_l69_c20_7b96_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l69_c20_7b96_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l69_c20_7b96_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l71_c6_8ba7]
signal BIN_OP_EQ_uxn_device_h_l71_c6_8ba7_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l71_c6_8ba7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l71_c6_8ba7_return_output : unsigned(0 downto 0);

-- sprite_rows_MUX[uxn_device_h_l71_c2_4442]
signal sprite_rows_MUX_uxn_device_h_l71_c2_4442_cond : unsigned(0 downto 0);
signal sprite_rows_MUX_uxn_device_h_l71_c2_4442_iftrue : uint8_t_16;
signal sprite_rows_MUX_uxn_device_h_l71_c2_4442_iffalse : uint8_t_16;
signal sprite_rows_MUX_uxn_device_h_l71_c2_4442_return_output : uint8_t_16;

-- VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60[uxn_device_h_l72_c3_a8dc]
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_a8dc_elem_val : unsigned(7 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_a8dc_ref_toks_0 : uint8_t_16;
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_a8dc_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_a8dc_return_output : uint8_t_array_16_t;

-- BIN_OP_EQ[uxn_device_h_l75_c6_8898]
signal BIN_OP_EQ_uxn_device_h_l75_c6_8898_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l75_c6_8898_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l75_c6_8898_return_output : unsigned(0 downto 0);

-- opaque_MUX[uxn_device_h_l75_c2_5bd2]
signal opaque_MUX_uxn_device_h_l75_c2_5bd2_cond : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l75_c2_5bd2_iftrue : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l75_c2_5bd2_iffalse : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l75_c2_5bd2_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l75_c2_5bd2]
signal x_MUX_uxn_device_h_l75_c2_5bd2_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l75_c2_5bd2_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l75_c2_5bd2_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l75_c2_5bd2_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l75_c2_5bd2]
signal y_MUX_uxn_device_h_l75_c2_5bd2_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l75_c2_5bd2_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l75_c2_5bd2_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l75_c2_5bd2_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l76_c21_60d0]
signal BIN_OP_PLUS_uxn_device_h_l76_c21_60d0_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l76_c21_60d0_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l76_c21_60d0_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l76_c12_f5d1]
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_f5d1_ref_toks_0 : uint8_t_80;
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_f5d1_var_dim_0 : unsigned(6 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_f5d1_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l77_c13_2eab]
signal MUX_uxn_device_h_l77_c13_2eab_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l77_c13_2eab_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l77_c13_2eab_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l77_c13_2eab_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l77_c7_8829]
signal BIN_OP_PLUS_uxn_device_h_l77_c7_8829_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l77_c7_8829_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l77_c7_8829_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l78_c13_95e6]
signal MUX_uxn_device_h_l78_c13_95e6_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l78_c13_95e6_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l78_c13_95e6_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l78_c13_95e6_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l78_c7_dc3f]
signal BIN_OP_PLUS_uxn_device_h_l78_c7_dc3f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l78_c7_dc3f_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l78_c7_dc3f_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l81_c6_f57f]
signal BIN_OP_EQ_uxn_device_h_l81_c6_f57f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c6_f57f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c6_f57f_return_output : unsigned(0 downto 0);

-- is_new_row_MUX[uxn_device_h_l81_c2_7858]
signal is_new_row_MUX_uxn_device_h_l81_c2_7858_cond : unsigned(0 downto 0);
signal is_new_row_MUX_uxn_device_h_l81_c2_7858_iftrue : unsigned(0 downto 0);
signal is_new_row_MUX_uxn_device_h_l81_c2_7858_iffalse : unsigned(0 downto 0);
signal is_new_row_MUX_uxn_device_h_l81_c2_7858_return_output : unsigned(0 downto 0);

-- is_in_bounds_MUX[uxn_device_h_l81_c2_7858]
signal is_in_bounds_MUX_uxn_device_h_l81_c2_7858_cond : unsigned(0 downto 0);
signal is_in_bounds_MUX_uxn_device_h_l81_c2_7858_iftrue : unsigned(0 downto 0);
signal is_in_bounds_MUX_uxn_device_h_l81_c2_7858_iffalse : unsigned(0 downto 0);
signal is_in_bounds_MUX_uxn_device_h_l81_c2_7858_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l81_c2_7858]
signal x_MUX_uxn_device_h_l81_c2_7858_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l81_c2_7858_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c2_7858_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c2_7858_return_output : unsigned(15 downto 0);

-- ch_MUX[uxn_device_h_l81_c2_7858]
signal ch_MUX_uxn_device_h_l81_c2_7858_cond : unsigned(0 downto 0);
signal ch_MUX_uxn_device_h_l81_c2_7858_iftrue : unsigned(7 downto 0);
signal ch_MUX_uxn_device_h_l81_c2_7858_iffalse : unsigned(7 downto 0);
signal ch_MUX_uxn_device_h_l81_c2_7858_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l81_c2_7858]
signal result_is_vram_write_MUX_uxn_device_h_l81_c2_7858_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c2_7858_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c2_7858_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c2_7858_return_output : unsigned(0 downto 0);

-- result_is_blit_done_MUX[uxn_device_h_l81_c2_7858]
signal result_is_blit_done_MUX_uxn_device_h_l81_c2_7858_cond : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l81_c2_7858_iftrue : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l81_c2_7858_iffalse : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l81_c2_7858_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l81_c2_7858]
signal result_u16_addr_MUX_uxn_device_h_l81_c2_7858_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l81_c2_7858_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l81_c2_7858_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l81_c2_7858_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_device_h_l81_c2_7858]
signal result_u8_value_MUX_uxn_device_h_l81_c2_7858_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l81_c2_7858_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l81_c2_7858_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l81_c2_7858_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l81_c2_7858]
signal y_MUX_uxn_device_h_l81_c2_7858_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l81_c2_7858_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c2_7858_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c2_7858_return_output : unsigned(15 downto 0);

-- c_MUX[uxn_device_h_l81_c2_7858]
signal c_MUX_uxn_device_h_l81_c2_7858_cond : unsigned(0 downto 0);
signal c_MUX_uxn_device_h_l81_c2_7858_iftrue : unsigned(15 downto 0);
signal c_MUX_uxn_device_h_l81_c2_7858_iffalse : unsigned(15 downto 0);
signal c_MUX_uxn_device_h_l81_c2_7858_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l85_c21_fa3b]
signal BIN_OP_PLUS_uxn_device_h_l85_c21_fa3b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l85_c21_fa3b_right : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l85_c21_fa3b_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l87_c16_4498]
signal BIN_OP_EQ_uxn_device_h_l87_c16_4498_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l87_c16_4498_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l87_c16_4498_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l87_c16_41ce]
signal MUX_uxn_device_h_l87_c16_41ce_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l87_c16_41ce_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l87_c16_41ce_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l87_c16_41ce_return_output : unsigned(0 downto 0);

-- c_MUX[uxn_device_h_l88_c3_4380]
signal c_MUX_uxn_device_h_l88_c3_4380_cond : unsigned(0 downto 0);
signal c_MUX_uxn_device_h_l88_c3_4380_iftrue : unsigned(15 downto 0);
signal c_MUX_uxn_device_h_l88_c3_4380_iffalse : unsigned(15 downto 0);
signal c_MUX_uxn_device_h_l88_c3_4380_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l89_c38_402d]
signal BIN_OP_PLUS_uxn_device_h_l89_c38_402d_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l89_c38_402d_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l89_c38_402d_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l89_c26_5854]
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_5854_ref_toks_0 : uint8_t_16;
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_5854_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_5854_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l90_c38_2c39]
signal BIN_OP_MINUS_uxn_device_h_l90_c38_2c39_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l90_c38_2c39_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l90_c38_2c39_return_output : unsigned(7 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l90_c26_1fe9]
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_1fe9_ref_toks_0 : uint8_t_16;
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_1fe9_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_1fe9_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l92_c27_1933]
signal MUX_uxn_device_h_l92_c27_1933_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l92_c27_1933_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l92_c27_1933_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l92_c27_1933_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l92_c21_04c4]
signal BIN_OP_PLUS_uxn_device_h_l92_c21_04c4_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l92_c21_04c4_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l92_c21_04c4_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l92_c7_3720]
signal MUX_uxn_device_h_l92_c7_3720_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l92_c7_3720_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l92_c7_3720_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l92_c7_3720_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l93_c19_d855]
signal BIN_OP_EQ_uxn_device_h_l93_c19_d855_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l93_c19_d855_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l93_c19_d855_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l93_c19_e9e0]
signal MUX_uxn_device_h_l93_c19_e9e0_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l93_c19_e9e0_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l93_c19_e9e0_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l93_c19_e9e0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l98_c52_fd19]
signal BIN_OP_EQ_uxn_device_h_l98_c52_fd19_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l98_c52_fd19_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l98_c52_fd19_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l98_c52_2948]
signal MUX_uxn_device_h_l98_c52_2948_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l98_c52_2948_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l98_c52_2948_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l98_c52_2948_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l98_c42_ef9d]
signal BIN_OP_OR_uxn_device_h_l98_c42_ef9d_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l98_c42_ef9d_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l98_c42_ef9d_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l98_c26_d89a]
signal BIN_OP_AND_uxn_device_h_l98_c26_d89a_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l98_c26_d89a_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l98_c26_d89a_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l99_c30_1711]
signal BIN_OP_PLUS_uxn_device_h_l99_c30_1711_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l99_c30_1711_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l99_c30_1711_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l99_c21_ae83]
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_ae83_ref_toks_0 : uint8_t_80;
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_ae83_var_dim_0 : unsigned(6 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_ae83_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l100_c7_cb9e]
signal BIN_OP_EQ_uxn_device_h_l100_c7_cb9e_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_cb9e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_cb9e_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l100_c41_96f5]
signal BIN_OP_MINUS_uxn_device_h_l100_c41_96f5_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l100_c41_96f5_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l100_c41_96f5_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l100_c51_681d]
signal BIN_OP_PLUS_uxn_device_h_l100_c51_681d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l100_c51_681d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l100_c51_681d_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l100_c35_3c0c]
signal MUX_uxn_device_h_l100_c35_3c0c_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l100_c35_3c0c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l100_c35_3c0c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l100_c35_3c0c_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l100_c7_6258]
signal MUX_uxn_device_h_l100_c7_6258_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l100_c7_6258_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l100_c7_6258_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l100_c7_6258_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l101_c25_d3f7]
signal BIN_OP_EQ_uxn_device_h_l101_c25_d3f7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c25_d3f7_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c25_d3f7_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l101_c25_05e8]
signal MUX_uxn_device_h_l101_c25_05e8_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l101_c25_05e8_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l101_c25_05e8_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l101_c25_05e8_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l102_c14_7bc0]
signal BIN_OP_PLUS_uxn_device_h_l102_c14_7bc0_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l102_c14_7bc0_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l102_c14_7bc0_return_output : unsigned(16 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l102_c24_c5d8]
signal BIN_OP_MINUS_uxn_device_h_l102_c24_c5d8_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l102_c24_c5d8_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l102_c24_c5d8_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l102_c8_3df5]
signal MUX_uxn_device_h_l102_c8_3df5_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l102_c8_3df5_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l102_c8_3df5_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l102_c8_3df5_return_output : unsigned(15 downto 0);

-- CONST_SR_1[uxn_device_h_l103_c3_11e0]
signal CONST_SR_1_uxn_device_h_l103_c3_11e0_x : unsigned(15 downto 0);
signal CONST_SR_1_uxn_device_h_l103_c3_11e0_return_output : unsigned(15 downto 0);

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
      base(4) := ref_toks_0.data(4);
      base(1) := ref_toks_0.data(1);
      base(7) := ref_toks_0.data(7);
      base(13) := ref_toks_0.data(13);
      base(10) := ref_toks_0.data(10);
      base(2) := ref_toks_0.data(2);
      base(5) := ref_toks_0.data(5);
      base(11) := ref_toks_0.data(11);
      base(8) := ref_toks_0.data(8);
      base(14) := ref_toks_0.data(14);
      base(0) := ref_toks_0.data(0);
      base(6) := ref_toks_0.data(6);
      base(3) := ref_toks_0.data(3);
      base(9) := ref_toks_0.data(9);
      base(12) := ref_toks_0.data(12);
      base(15) := ref_toks_0.data(15);

      return_output := base;
      return return_output; 
end function;

function uint16_uint8_8( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(15 downto 0);
  --variable x : unsigned(7 downto 0);
  variable intermediate : unsigned(15 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    intermediate := (others => '0');
    intermediate(15 downto 0) := unsigned(inp);
    intermediate(15 downto 8) := x;
    
    return_output := intermediate(15 downto 0) ;
    
    return return_output;

end function;

function uint16_uint8_0( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(15 downto 0);
  --variable x : unsigned(7 downto 0);
  variable intermediate : unsigned(15 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    intermediate := (others => '0');
    intermediate(15 downto 0) := unsigned(inp);
    intermediate(7 downto 0) := x;
    
    return_output := intermediate(15 downto 0) ;
    
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

function uint8_uint1_5( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(5 downto 5) := x;
    
    return_output := intermediate(7 downto 0) ;
    
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

function uint8_uint1_4( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(4 downto 4) := x;
    
    return_output := intermediate(7 downto 0) ;
    
    return return_output;

end function;

function uint16_7_0( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);
begin
return_output := unsigned(std_logic_vector(x(7 downto 0)));
return return_output;
end function;

function CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_d326( ref_toks_0 : screen_blit_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return screen_blit_result_t is
 
  variable base : screen_blit_result_t; 
  variable return_output : screen_blit_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.is_blit_done := ref_toks_2;
      base.u16_addr := ref_toks_3;
      base.u8_value := ref_toks_4;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_MINUS_uxn_device_h_l69_c20_7b96
BIN_OP_MINUS_uxn_device_h_l69_c20_7b96 : entity work.BIN_OP_MINUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l69_c20_7b96_left,
BIN_OP_MINUS_uxn_device_h_l69_c20_7b96_right,
BIN_OP_MINUS_uxn_device_h_l69_c20_7b96_return_output);

-- BIN_OP_EQ_uxn_device_h_l71_c6_8ba7
BIN_OP_EQ_uxn_device_h_l71_c6_8ba7 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l71_c6_8ba7_left,
BIN_OP_EQ_uxn_device_h_l71_c6_8ba7_right,
BIN_OP_EQ_uxn_device_h_l71_c6_8ba7_return_output);

-- sprite_rows_MUX_uxn_device_h_l71_c2_4442
sprite_rows_MUX_uxn_device_h_l71_c2_4442 : entity work.MUX_uint1_t_uint8_t_16_uint8_t_16_0CLK_de264c78 port map (
sprite_rows_MUX_uxn_device_h_l71_c2_4442_cond,
sprite_rows_MUX_uxn_device_h_l71_c2_4442_iftrue,
sprite_rows_MUX_uxn_device_h_l71_c2_4442_iffalse,
sprite_rows_MUX_uxn_device_h_l71_c2_4442_return_output);

-- VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_a8dc
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_a8dc : entity work.VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_0CLK_6481cb28 port map (
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_a8dc_elem_val,
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_a8dc_ref_toks_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_a8dc_var_dim_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_a8dc_return_output);

-- BIN_OP_EQ_uxn_device_h_l75_c6_8898
BIN_OP_EQ_uxn_device_h_l75_c6_8898 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l75_c6_8898_left,
BIN_OP_EQ_uxn_device_h_l75_c6_8898_right,
BIN_OP_EQ_uxn_device_h_l75_c6_8898_return_output);

-- opaque_MUX_uxn_device_h_l75_c2_5bd2
opaque_MUX_uxn_device_h_l75_c2_5bd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opaque_MUX_uxn_device_h_l75_c2_5bd2_cond,
opaque_MUX_uxn_device_h_l75_c2_5bd2_iftrue,
opaque_MUX_uxn_device_h_l75_c2_5bd2_iffalse,
opaque_MUX_uxn_device_h_l75_c2_5bd2_return_output);

-- x_MUX_uxn_device_h_l75_c2_5bd2
x_MUX_uxn_device_h_l75_c2_5bd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l75_c2_5bd2_cond,
x_MUX_uxn_device_h_l75_c2_5bd2_iftrue,
x_MUX_uxn_device_h_l75_c2_5bd2_iffalse,
x_MUX_uxn_device_h_l75_c2_5bd2_return_output);

-- y_MUX_uxn_device_h_l75_c2_5bd2
y_MUX_uxn_device_h_l75_c2_5bd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l75_c2_5bd2_cond,
y_MUX_uxn_device_h_l75_c2_5bd2_iftrue,
y_MUX_uxn_device_h_l75_c2_5bd2_iffalse,
y_MUX_uxn_device_h_l75_c2_5bd2_return_output);

-- BIN_OP_PLUS_uxn_device_h_l76_c21_60d0
BIN_OP_PLUS_uxn_device_h_l76_c21_60d0 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l76_c21_60d0_left,
BIN_OP_PLUS_uxn_device_h_l76_c21_60d0_right,
BIN_OP_PLUS_uxn_device_h_l76_c21_60d0_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_f5d1
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_f5d1 : entity work.VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_0CLK_4b00ae23 port map (
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_f5d1_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_f5d1_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_f5d1_return_output);

-- MUX_uxn_device_h_l77_c13_2eab
MUX_uxn_device_h_l77_c13_2eab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l77_c13_2eab_cond,
MUX_uxn_device_h_l77_c13_2eab_iftrue,
MUX_uxn_device_h_l77_c13_2eab_iffalse,
MUX_uxn_device_h_l77_c13_2eab_return_output);

-- BIN_OP_PLUS_uxn_device_h_l77_c7_8829
BIN_OP_PLUS_uxn_device_h_l77_c7_8829 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l77_c7_8829_left,
BIN_OP_PLUS_uxn_device_h_l77_c7_8829_right,
BIN_OP_PLUS_uxn_device_h_l77_c7_8829_return_output);

-- MUX_uxn_device_h_l78_c13_95e6
MUX_uxn_device_h_l78_c13_95e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l78_c13_95e6_cond,
MUX_uxn_device_h_l78_c13_95e6_iftrue,
MUX_uxn_device_h_l78_c13_95e6_iffalse,
MUX_uxn_device_h_l78_c13_95e6_return_output);

-- BIN_OP_PLUS_uxn_device_h_l78_c7_dc3f
BIN_OP_PLUS_uxn_device_h_l78_c7_dc3f : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l78_c7_dc3f_left,
BIN_OP_PLUS_uxn_device_h_l78_c7_dc3f_right,
BIN_OP_PLUS_uxn_device_h_l78_c7_dc3f_return_output);

-- BIN_OP_EQ_uxn_device_h_l81_c6_f57f
BIN_OP_EQ_uxn_device_h_l81_c6_f57f : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l81_c6_f57f_left,
BIN_OP_EQ_uxn_device_h_l81_c6_f57f_right,
BIN_OP_EQ_uxn_device_h_l81_c6_f57f_return_output);

-- is_new_row_MUX_uxn_device_h_l81_c2_7858
is_new_row_MUX_uxn_device_h_l81_c2_7858 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_new_row_MUX_uxn_device_h_l81_c2_7858_cond,
is_new_row_MUX_uxn_device_h_l81_c2_7858_iftrue,
is_new_row_MUX_uxn_device_h_l81_c2_7858_iffalse,
is_new_row_MUX_uxn_device_h_l81_c2_7858_return_output);

-- is_in_bounds_MUX_uxn_device_h_l81_c2_7858
is_in_bounds_MUX_uxn_device_h_l81_c2_7858 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_in_bounds_MUX_uxn_device_h_l81_c2_7858_cond,
is_in_bounds_MUX_uxn_device_h_l81_c2_7858_iftrue,
is_in_bounds_MUX_uxn_device_h_l81_c2_7858_iffalse,
is_in_bounds_MUX_uxn_device_h_l81_c2_7858_return_output);

-- x_MUX_uxn_device_h_l81_c2_7858
x_MUX_uxn_device_h_l81_c2_7858 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l81_c2_7858_cond,
x_MUX_uxn_device_h_l81_c2_7858_iftrue,
x_MUX_uxn_device_h_l81_c2_7858_iffalse,
x_MUX_uxn_device_h_l81_c2_7858_return_output);

-- ch_MUX_uxn_device_h_l81_c2_7858
ch_MUX_uxn_device_h_l81_c2_7858 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ch_MUX_uxn_device_h_l81_c2_7858_cond,
ch_MUX_uxn_device_h_l81_c2_7858_iftrue,
ch_MUX_uxn_device_h_l81_c2_7858_iffalse,
ch_MUX_uxn_device_h_l81_c2_7858_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l81_c2_7858
result_is_vram_write_MUX_uxn_device_h_l81_c2_7858 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l81_c2_7858_cond,
result_is_vram_write_MUX_uxn_device_h_l81_c2_7858_iftrue,
result_is_vram_write_MUX_uxn_device_h_l81_c2_7858_iffalse,
result_is_vram_write_MUX_uxn_device_h_l81_c2_7858_return_output);

-- result_is_blit_done_MUX_uxn_device_h_l81_c2_7858
result_is_blit_done_MUX_uxn_device_h_l81_c2_7858 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_blit_done_MUX_uxn_device_h_l81_c2_7858_cond,
result_is_blit_done_MUX_uxn_device_h_l81_c2_7858_iftrue,
result_is_blit_done_MUX_uxn_device_h_l81_c2_7858_iffalse,
result_is_blit_done_MUX_uxn_device_h_l81_c2_7858_return_output);

-- result_u16_addr_MUX_uxn_device_h_l81_c2_7858
result_u16_addr_MUX_uxn_device_h_l81_c2_7858 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l81_c2_7858_cond,
result_u16_addr_MUX_uxn_device_h_l81_c2_7858_iftrue,
result_u16_addr_MUX_uxn_device_h_l81_c2_7858_iffalse,
result_u16_addr_MUX_uxn_device_h_l81_c2_7858_return_output);

-- result_u8_value_MUX_uxn_device_h_l81_c2_7858
result_u8_value_MUX_uxn_device_h_l81_c2_7858 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l81_c2_7858_cond,
result_u8_value_MUX_uxn_device_h_l81_c2_7858_iftrue,
result_u8_value_MUX_uxn_device_h_l81_c2_7858_iffalse,
result_u8_value_MUX_uxn_device_h_l81_c2_7858_return_output);

-- y_MUX_uxn_device_h_l81_c2_7858
y_MUX_uxn_device_h_l81_c2_7858 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l81_c2_7858_cond,
y_MUX_uxn_device_h_l81_c2_7858_iftrue,
y_MUX_uxn_device_h_l81_c2_7858_iffalse,
y_MUX_uxn_device_h_l81_c2_7858_return_output);

-- c_MUX_uxn_device_h_l81_c2_7858
c_MUX_uxn_device_h_l81_c2_7858 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
c_MUX_uxn_device_h_l81_c2_7858_cond,
c_MUX_uxn_device_h_l81_c2_7858_iftrue,
c_MUX_uxn_device_h_l81_c2_7858_iffalse,
c_MUX_uxn_device_h_l81_c2_7858_return_output);

-- BIN_OP_PLUS_uxn_device_h_l85_c21_fa3b
BIN_OP_PLUS_uxn_device_h_l85_c21_fa3b : entity work.BIN_OP_PLUS_uint16_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l85_c21_fa3b_left,
BIN_OP_PLUS_uxn_device_h_l85_c21_fa3b_right,
BIN_OP_PLUS_uxn_device_h_l85_c21_fa3b_return_output);

-- BIN_OP_EQ_uxn_device_h_l87_c16_4498
BIN_OP_EQ_uxn_device_h_l87_c16_4498 : entity work.BIN_OP_EQ_uint3_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l87_c16_4498_left,
BIN_OP_EQ_uxn_device_h_l87_c16_4498_right,
BIN_OP_EQ_uxn_device_h_l87_c16_4498_return_output);

-- MUX_uxn_device_h_l87_c16_41ce
MUX_uxn_device_h_l87_c16_41ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l87_c16_41ce_cond,
MUX_uxn_device_h_l87_c16_41ce_iftrue,
MUX_uxn_device_h_l87_c16_41ce_iffalse,
MUX_uxn_device_h_l87_c16_41ce_return_output);

-- c_MUX_uxn_device_h_l88_c3_4380
c_MUX_uxn_device_h_l88_c3_4380 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
c_MUX_uxn_device_h_l88_c3_4380_cond,
c_MUX_uxn_device_h_l88_c3_4380_iftrue,
c_MUX_uxn_device_h_l88_c3_4380_iffalse,
c_MUX_uxn_device_h_l88_c3_4380_return_output);

-- BIN_OP_PLUS_uxn_device_h_l89_c38_402d
BIN_OP_PLUS_uxn_device_h_l89_c38_402d : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l89_c38_402d_left,
BIN_OP_PLUS_uxn_device_h_l89_c38_402d_right,
BIN_OP_PLUS_uxn_device_h_l89_c38_402d_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_5854
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_5854 : entity work.VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_0CLK_e799c7f1 port map (
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_5854_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_5854_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_5854_return_output);

-- BIN_OP_MINUS_uxn_device_h_l90_c38_2c39
BIN_OP_MINUS_uxn_device_h_l90_c38_2c39 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l90_c38_2c39_left,
BIN_OP_MINUS_uxn_device_h_l90_c38_2c39_right,
BIN_OP_MINUS_uxn_device_h_l90_c38_2c39_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_1fe9
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_1fe9 : entity work.VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_0CLK_e799c7f1 port map (
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_1fe9_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_1fe9_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_1fe9_return_output);

-- MUX_uxn_device_h_l92_c27_1933
MUX_uxn_device_h_l92_c27_1933 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l92_c27_1933_cond,
MUX_uxn_device_h_l92_c27_1933_iftrue,
MUX_uxn_device_h_l92_c27_1933_iffalse,
MUX_uxn_device_h_l92_c27_1933_return_output);

-- BIN_OP_PLUS_uxn_device_h_l92_c21_04c4
BIN_OP_PLUS_uxn_device_h_l92_c21_04c4 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l92_c21_04c4_left,
BIN_OP_PLUS_uxn_device_h_l92_c21_04c4_right,
BIN_OP_PLUS_uxn_device_h_l92_c21_04c4_return_output);

-- MUX_uxn_device_h_l92_c7_3720
MUX_uxn_device_h_l92_c7_3720 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l92_c7_3720_cond,
MUX_uxn_device_h_l92_c7_3720_iftrue,
MUX_uxn_device_h_l92_c7_3720_iffalse,
MUX_uxn_device_h_l92_c7_3720_return_output);

-- BIN_OP_EQ_uxn_device_h_l93_c19_d855
BIN_OP_EQ_uxn_device_h_l93_c19_d855 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l93_c19_d855_left,
BIN_OP_EQ_uxn_device_h_l93_c19_d855_right,
BIN_OP_EQ_uxn_device_h_l93_c19_d855_return_output);

-- MUX_uxn_device_h_l93_c19_e9e0
MUX_uxn_device_h_l93_c19_e9e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l93_c19_e9e0_cond,
MUX_uxn_device_h_l93_c19_e9e0_iftrue,
MUX_uxn_device_h_l93_c19_e9e0_iffalse,
MUX_uxn_device_h_l93_c19_e9e0_return_output);

-- BIN_OP_EQ_uxn_device_h_l98_c52_fd19
BIN_OP_EQ_uxn_device_h_l98_c52_fd19 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l98_c52_fd19_left,
BIN_OP_EQ_uxn_device_h_l98_c52_fd19_right,
BIN_OP_EQ_uxn_device_h_l98_c52_fd19_return_output);

-- MUX_uxn_device_h_l98_c52_2948
MUX_uxn_device_h_l98_c52_2948 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l98_c52_2948_cond,
MUX_uxn_device_h_l98_c52_2948_iftrue,
MUX_uxn_device_h_l98_c52_2948_iffalse,
MUX_uxn_device_h_l98_c52_2948_return_output);

-- BIN_OP_OR_uxn_device_h_l98_c42_ef9d
BIN_OP_OR_uxn_device_h_l98_c42_ef9d : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l98_c42_ef9d_left,
BIN_OP_OR_uxn_device_h_l98_c42_ef9d_right,
BIN_OP_OR_uxn_device_h_l98_c42_ef9d_return_output);

-- BIN_OP_AND_uxn_device_h_l98_c26_d89a
BIN_OP_AND_uxn_device_h_l98_c26_d89a : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l98_c26_d89a_left,
BIN_OP_AND_uxn_device_h_l98_c26_d89a_right,
BIN_OP_AND_uxn_device_h_l98_c26_d89a_return_output);

-- BIN_OP_PLUS_uxn_device_h_l99_c30_1711
BIN_OP_PLUS_uxn_device_h_l99_c30_1711 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l99_c30_1711_left,
BIN_OP_PLUS_uxn_device_h_l99_c30_1711_right,
BIN_OP_PLUS_uxn_device_h_l99_c30_1711_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_ae83
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_ae83 : entity work.VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_0CLK_4b00ae23 port map (
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_ae83_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_ae83_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_ae83_return_output);

-- BIN_OP_EQ_uxn_device_h_l100_c7_cb9e
BIN_OP_EQ_uxn_device_h_l100_c7_cb9e : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l100_c7_cb9e_left,
BIN_OP_EQ_uxn_device_h_l100_c7_cb9e_right,
BIN_OP_EQ_uxn_device_h_l100_c7_cb9e_return_output);

-- BIN_OP_MINUS_uxn_device_h_l100_c41_96f5
BIN_OP_MINUS_uxn_device_h_l100_c41_96f5 : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l100_c41_96f5_left,
BIN_OP_MINUS_uxn_device_h_l100_c41_96f5_right,
BIN_OP_MINUS_uxn_device_h_l100_c41_96f5_return_output);

-- BIN_OP_PLUS_uxn_device_h_l100_c51_681d
BIN_OP_PLUS_uxn_device_h_l100_c51_681d : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l100_c51_681d_left,
BIN_OP_PLUS_uxn_device_h_l100_c51_681d_right,
BIN_OP_PLUS_uxn_device_h_l100_c51_681d_return_output);

-- MUX_uxn_device_h_l100_c35_3c0c
MUX_uxn_device_h_l100_c35_3c0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l100_c35_3c0c_cond,
MUX_uxn_device_h_l100_c35_3c0c_iftrue,
MUX_uxn_device_h_l100_c35_3c0c_iffalse,
MUX_uxn_device_h_l100_c35_3c0c_return_output);

-- MUX_uxn_device_h_l100_c7_6258
MUX_uxn_device_h_l100_c7_6258 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l100_c7_6258_cond,
MUX_uxn_device_h_l100_c7_6258_iftrue,
MUX_uxn_device_h_l100_c7_6258_iffalse,
MUX_uxn_device_h_l100_c7_6258_return_output);

-- BIN_OP_EQ_uxn_device_h_l101_c25_d3f7
BIN_OP_EQ_uxn_device_h_l101_c25_d3f7 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l101_c25_d3f7_left,
BIN_OP_EQ_uxn_device_h_l101_c25_d3f7_right,
BIN_OP_EQ_uxn_device_h_l101_c25_d3f7_return_output);

-- MUX_uxn_device_h_l101_c25_05e8
MUX_uxn_device_h_l101_c25_05e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l101_c25_05e8_cond,
MUX_uxn_device_h_l101_c25_05e8_iftrue,
MUX_uxn_device_h_l101_c25_05e8_iffalse,
MUX_uxn_device_h_l101_c25_05e8_return_output);

-- BIN_OP_PLUS_uxn_device_h_l102_c14_7bc0
BIN_OP_PLUS_uxn_device_h_l102_c14_7bc0 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l102_c14_7bc0_left,
BIN_OP_PLUS_uxn_device_h_l102_c14_7bc0_right,
BIN_OP_PLUS_uxn_device_h_l102_c14_7bc0_return_output);

-- BIN_OP_MINUS_uxn_device_h_l102_c24_c5d8
BIN_OP_MINUS_uxn_device_h_l102_c24_c5d8 : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l102_c24_c5d8_left,
BIN_OP_MINUS_uxn_device_h_l102_c24_c5d8_right,
BIN_OP_MINUS_uxn_device_h_l102_c24_c5d8_return_output);

-- MUX_uxn_device_h_l102_c8_3df5
MUX_uxn_device_h_l102_c8_3df5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l102_c8_3df5_cond,
MUX_uxn_device_h_l102_c8_3df5_iftrue,
MUX_uxn_device_h_l102_c8_3df5_iffalse,
MUX_uxn_device_h_l102_c8_3df5_return_output);

-- CONST_SR_1_uxn_device_h_l103_c3_11e0
CONST_SR_1_uxn_device_h_l103_c3_11e0 : entity work.CONST_SR_1_uint16_t_0CLK_de264c78 port map (
CONST_SR_1_uxn_device_h_l103_c3_11e0_x,
CONST_SR_1_uxn_device_h_l103_c3_11e0_return_output);



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
 BIN_OP_MINUS_uxn_device_h_l69_c20_7b96_return_output,
 BIN_OP_EQ_uxn_device_h_l71_c6_8ba7_return_output,
 sprite_rows_MUX_uxn_device_h_l71_c2_4442_return_output,
 VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_a8dc_return_output,
 BIN_OP_EQ_uxn_device_h_l75_c6_8898_return_output,
 opaque_MUX_uxn_device_h_l75_c2_5bd2_return_output,
 x_MUX_uxn_device_h_l75_c2_5bd2_return_output,
 y_MUX_uxn_device_h_l75_c2_5bd2_return_output,
 BIN_OP_PLUS_uxn_device_h_l76_c21_60d0_return_output,
 VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_f5d1_return_output,
 MUX_uxn_device_h_l77_c13_2eab_return_output,
 BIN_OP_PLUS_uxn_device_h_l77_c7_8829_return_output,
 MUX_uxn_device_h_l78_c13_95e6_return_output,
 BIN_OP_PLUS_uxn_device_h_l78_c7_dc3f_return_output,
 BIN_OP_EQ_uxn_device_h_l81_c6_f57f_return_output,
 is_new_row_MUX_uxn_device_h_l81_c2_7858_return_output,
 is_in_bounds_MUX_uxn_device_h_l81_c2_7858_return_output,
 x_MUX_uxn_device_h_l81_c2_7858_return_output,
 ch_MUX_uxn_device_h_l81_c2_7858_return_output,
 result_is_vram_write_MUX_uxn_device_h_l81_c2_7858_return_output,
 result_is_blit_done_MUX_uxn_device_h_l81_c2_7858_return_output,
 result_u16_addr_MUX_uxn_device_h_l81_c2_7858_return_output,
 result_u8_value_MUX_uxn_device_h_l81_c2_7858_return_output,
 y_MUX_uxn_device_h_l81_c2_7858_return_output,
 c_MUX_uxn_device_h_l81_c2_7858_return_output,
 BIN_OP_PLUS_uxn_device_h_l85_c21_fa3b_return_output,
 BIN_OP_EQ_uxn_device_h_l87_c16_4498_return_output,
 MUX_uxn_device_h_l87_c16_41ce_return_output,
 c_MUX_uxn_device_h_l88_c3_4380_return_output,
 BIN_OP_PLUS_uxn_device_h_l89_c38_402d_return_output,
 VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_5854_return_output,
 BIN_OP_MINUS_uxn_device_h_l90_c38_2c39_return_output,
 VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_1fe9_return_output,
 MUX_uxn_device_h_l92_c27_1933_return_output,
 BIN_OP_PLUS_uxn_device_h_l92_c21_04c4_return_output,
 MUX_uxn_device_h_l92_c7_3720_return_output,
 BIN_OP_EQ_uxn_device_h_l93_c19_d855_return_output,
 MUX_uxn_device_h_l93_c19_e9e0_return_output,
 BIN_OP_EQ_uxn_device_h_l98_c52_fd19_return_output,
 MUX_uxn_device_h_l98_c52_2948_return_output,
 BIN_OP_OR_uxn_device_h_l98_c42_ef9d_return_output,
 BIN_OP_AND_uxn_device_h_l98_c26_d89a_return_output,
 BIN_OP_PLUS_uxn_device_h_l99_c30_1711_return_output,
 VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_ae83_return_output,
 BIN_OP_EQ_uxn_device_h_l100_c7_cb9e_return_output,
 BIN_OP_MINUS_uxn_device_h_l100_c41_96f5_return_output,
 BIN_OP_PLUS_uxn_device_h_l100_c51_681d_return_output,
 MUX_uxn_device_h_l100_c35_3c0c_return_output,
 MUX_uxn_device_h_l100_c7_6258_return_output,
 BIN_OP_EQ_uxn_device_h_l101_c25_d3f7_return_output,
 MUX_uxn_device_h_l101_c25_05e8_return_output,
 BIN_OP_PLUS_uxn_device_h_l102_c14_7bc0_return_output,
 BIN_OP_MINUS_uxn_device_h_l102_c24_c5d8_return_output,
 MUX_uxn_device_h_l102_c8_3df5_return_output,
 CONST_SR_1_uxn_device_h_l103_c3_11e0_return_output)
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
 variable VAR_color8_uxn_device_h_l64_c2_f512 : unsigned(7 downto 0);
 variable VAR_uint12_7_4_uxn_device_h_l65_c20_f7b1_return_output : unsigned(3 downto 0);
 variable VAR_phase7_downto_3_uxn_device_h_l66_c2_f01d : unsigned(4 downto 0);
 variable VAR_uint12_7_3_uxn_device_h_l66_c20_5029_return_output : unsigned(4 downto 0);
 variable VAR_uint12_2_0_uxn_device_h_l67_c20_e191_return_output : unsigned(2 downto 0);
 variable VAR_phase7_downto_3_u8_uxn_device_h_l68_c2_e7cf : unsigned(7 downto 0);
 variable VAR_phase_minus_two_uxn_device_h_l69_c2_8838 : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_7b96_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_7b96_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_7b96_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l71_c6_8ba7_left : unsigned(3 downto 0);
 variable VAR_uint12_7_4_uxn_device_h_l71_c6_504b_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l71_c6_8ba7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l71_c6_8ba7_return_output : unsigned(0 downto 0);
 variable VAR_sprite_rows_MUX_uxn_device_h_l71_c2_4442_iftrue : uint8_t_16;
 variable VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5_uxn_device_h_l71_c2_4442_return_output : uint8_t_16;
 variable VAR_sprite_rows_MUX_uxn_device_h_l71_c2_4442_iffalse : uint8_t_16;
 variable VAR_sprite_rows_MUX_uxn_device_h_l71_c2_4442_return_output : uint8_t_16;
 variable VAR_sprite_rows_MUX_uxn_device_h_l71_c2_4442_cond : unsigned(0 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_a8dc_return_output : uint8_t_array_16_t;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_a8dc_elem_val : unsigned(7 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_a8dc_ref_toks_0 : uint8_t_16;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_a8dc_var_dim_0 : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l75_c6_8898_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l75_c6_8898_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l75_c6_8898_return_output : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l75_c2_5bd2_iftrue : unsigned(0 downto 0);
 variable VAR_opaque_uxn_device_h_l76_c3_2e0a : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l75_c2_5bd2_iffalse : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l75_c2_5bd2_return_output : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l75_c2_5bd2_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c2_5bd2_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l77_c3_0792 : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c2_5bd2_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c2_5bd2_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c2_5bd2_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c2_5bd2_iftrue : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l78_c3_692f : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c2_5bd2_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c2_5bd2_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c2_5bd2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_60d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_60d0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_60d0_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_f5d1_var_dim_0 : unsigned(6 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_f5d1_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_f5d1_ref_toks_0 : uint8_t_80;
 variable VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_8829_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l77_c13_2eab_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l77_c13_2eab_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l77_c13_2eab_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l77_c13_2eab_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_8829_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_8829_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_dc3f_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l78_c13_95e6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l78_c13_95e6_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l78_c13_95e6_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l78_c13_95e6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_dc3f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_dc3f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c6_f57f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c6_f57f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c6_f57f_return_output : unsigned(0 downto 0);
 variable VAR_is_new_row_MUX_uxn_device_h_l81_c2_7858_iftrue : unsigned(0 downto 0);
 variable VAR_is_new_row_MUX_uxn_device_h_l81_c2_7858_iffalse : unsigned(0 downto 0);
 variable VAR_is_new_row_MUX_uxn_device_h_l81_c2_7858_return_output : unsigned(0 downto 0);
 variable VAR_is_new_row_MUX_uxn_device_h_l81_c2_7858_cond : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_7858_iftrue : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_7858_iffalse : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_7858_return_output : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_7858_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c2_7858_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c2_7858_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c2_7858_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c2_7858_cond : unsigned(0 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l81_c2_7858_iftrue : unsigned(7 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l81_c2_7858_iffalse : unsigned(7 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l81_c2_7858_return_output : unsigned(7 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l81_c2_7858_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_7858_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_7858_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_7858_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_7858_cond : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_7858_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_7858_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_7858_return_output : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_7858_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_7858_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l85_c3_973a : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_7858_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_7858_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_7858_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l81_c2_7858_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l83_c3_a366 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l81_c2_7858_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l81_c2_7858_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l81_c2_7858_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c2_7858_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c2_7858_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c2_7858_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c2_7858_cond : unsigned(0 downto 0);
 variable VAR_c_MUX_uxn_device_h_l81_c2_7858_iftrue : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l81_c2_7858_iffalse : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l81_c2_7858_return_output : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l81_c2_7858_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_fa3b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_fa3b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_fa3b_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l87_c16_41ce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l87_c16_4498_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l87_c16_4498_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l87_c16_4498_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l87_c16_41ce_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l87_c16_41ce_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l87_c16_41ce_return_output : unsigned(0 downto 0);
 variable VAR_c_MUX_uxn_device_h_l88_c3_4380_iftrue : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l88_c3_4380_iffalse : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l88_c3_4380_return_output : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l88_c3_4380_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l89_c38_402d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l89_c38_402d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l89_c38_402d_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_5854_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_5854_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_5854_ref_toks_0 : uint8_t_16;
 variable VAR_uint16_uint8_8_uxn_device_h_l89_c8_98c9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l90_c38_2c39_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l90_c38_2c39_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l90_c38_2c39_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_1fe9_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_1fe9_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_1fe9_ref_toks_0 : uint8_t_16;
 variable VAR_uint16_uint8_0_uxn_device_h_l90_c8_9f77_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c7_3720_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c7_3720_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c7_3720_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l92_c21_04c4_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c27_1933_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c27_1933_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c27_1933_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c27_1933_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l92_c21_04c4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l92_c21_04c4_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c7_3720_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l93_c19_e9e0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l93_c19_d855_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_device_h_l93_c19_6d99_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l93_c19_d855_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l93_c19_d855_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l93_c19_e9e0_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l93_c19_e9e0_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l93_c19_e9e0_return_output : unsigned(0 downto 0);
 variable VAR_uint16_8_8_uxn_device_h_l94_c25_b126_return_output : unsigned(0 downto 0);
 variable VAR_uint8_uint1_5_uxn_device_h_l94_c8_d9ff_return_output : unsigned(7 downto 0);
 variable VAR_uint16_0_0_uxn_device_h_l95_c26_9b2a_return_output : unsigned(0 downto 0);
 variable VAR_uint8_uint1_4_uxn_device_h_l95_c8_a9e0_return_output : unsigned(7 downto 0);
 variable VAR_uint16_7_0_uxn_device_h_l96_c39_e4e3_return_output : unsigned(7 downto 0);
 variable VAR_uint16_uint8_8_uxn_device_h_l96_c21_4bcf_return_output : unsigned(15 downto 0);
 variable VAR_uint16_7_0_uxn_device_h_l97_c53_a833_return_output : unsigned(7 downto 0);
 variable VAR_uint16_uint8_0_uxn_device_h_l97_c21_dfd4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l98_c26_d89a_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l98_c42_ef9d_left : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l98_c52_2948_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l98_c52_fd19_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l98_c52_fd19_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l98_c52_fd19_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l98_c52_2948_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l98_c52_2948_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l98_c52_2948_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l98_c42_ef9d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l98_c42_ef9d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l98_c26_d89a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l98_c26_d89a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l99_c30_1711_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l99_c30_1711_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l99_c30_1711_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_ae83_var_dim_0 : unsigned(6 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_ae83_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_ae83_ref_toks_0 : uint8_t_80;
 variable VAR_MUX_uxn_device_h_l100_c7_6258_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_cb9e_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_cb9e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_cb9e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l100_c7_6258_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l100_c7_6258_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l100_c35_3c0c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l100_c35_3c0c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l100_c35_3c0c_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l100_c41_96f5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l100_c41_96f5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l100_c41_96f5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l100_c51_681d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l100_c51_681d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l100_c51_681d_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l100_c35_3c0c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l100_c7_6258_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l101_c25_05e8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c25_d3f7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c25_d3f7_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c25_d3f7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l101_c25_05e8_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l101_c25_05e8_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l101_c25_05e8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l102_c8_3df5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l102_c8_3df5_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l102_c8_3df5_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l102_c14_7bc0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l102_c14_7bc0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l102_c14_7bc0_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l102_c24_c5d8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l102_c24_c5d8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l102_c24_c5d8_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l102_c8_3df5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l103_c3_11e0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l103_c3_11e0_x : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_d326_uxn_device_h_l106_l42_DUPLICATE_a159_return_output : screen_blit_result_t;
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
     VAR_BIN_OP_EQ_uxn_device_h_l87_c16_4498_right := to_unsigned(0, 2);
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_7858_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l98_c52_2948_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l102_c24_c5d8_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l100_c41_96f5_right := to_unsigned(1, 1);
     VAR_result_u8_value_uxn_device_h_l83_c3_a366 := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l81_c2_7858_iftrue := VAR_result_u8_value_uxn_device_h_l83_c3_a366;
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_cb9e_right := to_unsigned(7, 3);
     VAR_MUX_uxn_device_h_l77_c13_2eab_iftrue := to_unsigned(0, 16);
     VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_7b96_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l98_c52_fd19_right := to_unsigned(0, 8);
     VAR_BIN_OP_MINUS_uxn_device_h_l90_c38_2c39_right := to_unsigned(2, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l101_c25_d3f7_right := to_unsigned(79, 12);
     VAR_MUX_uxn_device_h_l98_c52_2948_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_60d0_left := to_unsigned(64, 8);
     VAR_MUX_uxn_device_h_l92_c27_1933_iftrue := to_unsigned(0, 16);
     VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_7858_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l81_c6_f57f_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l87_c16_41ce_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l92_c27_1933_iffalse := to_unsigned(7, 16);
     VAR_MUX_uxn_device_h_l101_c25_05e8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l89_c38_402d_right := to_unsigned(6, 8);
     VAR_MUX_uxn_device_h_l93_c19_e9e0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l100_c51_681d_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l93_c19_e9e0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l93_c19_d855_right := to_unsigned(0, 8);
     VAR_MUX_uxn_device_h_l78_c13_95e6_iffalse := to_unsigned(0, 16);
     VAR_BIN_OP_EQ_uxn_device_h_l71_c6_8ba7_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l75_c6_8898_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l78_c13_95e6_iftrue := to_unsigned(7, 16);
     VAR_MUX_uxn_device_h_l87_c16_41ce_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l101_c25_05e8_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l77_c13_2eab_iffalse := to_unsigned(7, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l102_c14_7bc0_right := to_unsigned(1, 1);

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
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_f5d1_ref_toks_0 := blending;
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_ae83_ref_toks_0 := blending;
     REG_VAR_blending := blending;
     VAR_c_MUX_uxn_device_h_l81_c2_7858_iftrue := c;
     VAR_c_MUX_uxn_device_h_l88_c3_4380_iffalse := c;
     VAR_ch_MUX_uxn_device_h_l81_c2_7858_iftrue := ch;
     VAR_color8_uxn_device_h_l64_c2_f512 := resize(VAR_color, 8);
     VAR_MUX_uxn_device_h_l102_c8_3df5_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l77_c13_2eab_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l92_c27_1933_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l100_c35_3c0c_cond := VAR_fy;
     VAR_MUX_uxn_device_h_l78_c13_95e6_cond := VAR_fy;
     VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_7858_iftrue := is_in_bounds;
     VAR_is_new_row_MUX_uxn_device_h_l81_c2_7858_iftrue := is_new_row;
     VAR_opaque_MUX_uxn_device_h_l75_c2_5bd2_iffalse := opaque;
     VAR_BIN_OP_EQ_uxn_device_h_l101_c25_d3f7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l75_c6_8898_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_7b96_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_fa3b_right := VAR_phase;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_a8dc_elem_val := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_fa3b_left := VAR_ram_addr;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_a8dc_ref_toks_0 := sprite_rows;
     VAR_sprite_rows_MUX_uxn_device_h_l71_c2_4442_iffalse := sprite_rows;
     VAR_x_MUX_uxn_device_h_l75_c2_5bd2_iffalse := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_8829_left := VAR_x1;
     VAR_BIN_OP_PLUS_uxn_device_h_l92_c21_04c4_left := VAR_x1;
     VAR_y_MUX_uxn_device_h_l75_c2_5bd2_iffalse := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_dc3f_left := VAR_y1;
     VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_60d0_right := VAR_color8_uxn_device_h_l64_c2_f512;
     VAR_BIN_OP_PLUS_uxn_device_h_l99_c30_1711_left := VAR_color8_uxn_device_h_l64_c2_f512;
     REG_VAR_color8 := VAR_color8_uxn_device_h_l64_c2_f512;
     -- BIN_OP_EQ[uxn_device_h_l101_c25_d3f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l101_c25_d3f7_left <= VAR_BIN_OP_EQ_uxn_device_h_l101_c25_d3f7_left;
     BIN_OP_EQ_uxn_device_h_l101_c25_d3f7_right <= VAR_BIN_OP_EQ_uxn_device_h_l101_c25_d3f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l101_c25_d3f7_return_output := BIN_OP_EQ_uxn_device_h_l101_c25_d3f7_return_output;

     -- MUX[uxn_device_h_l77_c13_2eab] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l77_c13_2eab_cond <= VAR_MUX_uxn_device_h_l77_c13_2eab_cond;
     MUX_uxn_device_h_l77_c13_2eab_iftrue <= VAR_MUX_uxn_device_h_l77_c13_2eab_iftrue;
     MUX_uxn_device_h_l77_c13_2eab_iffalse <= VAR_MUX_uxn_device_h_l77_c13_2eab_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l77_c13_2eab_return_output := MUX_uxn_device_h_l77_c13_2eab_return_output;

     -- MUX[uxn_device_h_l78_c13_95e6] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l78_c13_95e6_cond <= VAR_MUX_uxn_device_h_l78_c13_95e6_cond;
     MUX_uxn_device_h_l78_c13_95e6_iftrue <= VAR_MUX_uxn_device_h_l78_c13_95e6_iftrue;
     MUX_uxn_device_h_l78_c13_95e6_iffalse <= VAR_MUX_uxn_device_h_l78_c13_95e6_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l78_c13_95e6_return_output := MUX_uxn_device_h_l78_c13_95e6_return_output;

     -- uint12_7_3[uxn_device_h_l66_c20_5029] LATENCY=0
     VAR_uint12_7_3_uxn_device_h_l66_c20_5029_return_output := uint12_7_3(
     VAR_phase);

     -- uint12_7_4[uxn_device_h_l65_c20_f7b1] LATENCY=0
     VAR_uint12_7_4_uxn_device_h_l65_c20_f7b1_return_output := uint12_7_4(
     VAR_phase);

     -- BIN_OP_EQ[uxn_device_h_l75_c6_8898] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l75_c6_8898_left <= VAR_BIN_OP_EQ_uxn_device_h_l75_c6_8898_left;
     BIN_OP_EQ_uxn_device_h_l75_c6_8898_right <= VAR_BIN_OP_EQ_uxn_device_h_l75_c6_8898_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l75_c6_8898_return_output := BIN_OP_EQ_uxn_device_h_l75_c6_8898_return_output;

     -- uint12_2_0[uxn_device_h_l67_c20_e191] LATENCY=0
     VAR_uint12_2_0_uxn_device_h_l67_c20_e191_return_output := uint12_2_0(
     VAR_phase);

     -- BIN_OP_PLUS[uxn_device_h_l76_c21_60d0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l76_c21_60d0_left <= VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_60d0_left;
     BIN_OP_PLUS_uxn_device_h_l76_c21_60d0_right <= VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_60d0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_60d0_return_output := BIN_OP_PLUS_uxn_device_h_l76_c21_60d0_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l85_c21_fa3b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l85_c21_fa3b_left <= VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_fa3b_left;
     BIN_OP_PLUS_uxn_device_h_l85_c21_fa3b_right <= VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_fa3b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_fa3b_return_output := BIN_OP_PLUS_uxn_device_h_l85_c21_fa3b_return_output;

     -- MUX[uxn_device_h_l92_c27_1933] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l92_c27_1933_cond <= VAR_MUX_uxn_device_h_l92_c27_1933_cond;
     MUX_uxn_device_h_l92_c27_1933_iftrue <= VAR_MUX_uxn_device_h_l92_c27_1933_iftrue;
     MUX_uxn_device_h_l92_c27_1933_iffalse <= VAR_MUX_uxn_device_h_l92_c27_1933_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l92_c27_1933_return_output := MUX_uxn_device_h_l92_c27_1933_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l69_c20_7b96] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l69_c20_7b96_left <= VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_7b96_left;
     BIN_OP_MINUS_uxn_device_h_l69_c20_7b96_right <= VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_7b96_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_7b96_return_output := BIN_OP_MINUS_uxn_device_h_l69_c20_7b96_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_device_h_l101_c25_05e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c25_d3f7_return_output;
     VAR_opaque_MUX_uxn_device_h_l75_c2_5bd2_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c6_8898_return_output;
     VAR_x_MUX_uxn_device_h_l75_c2_5bd2_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c6_8898_return_output;
     VAR_y_MUX_uxn_device_h_l75_c2_5bd2_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c6_8898_return_output;
     VAR_phase_minus_two_uxn_device_h_l69_c2_8838 := VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_7b96_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_f5d1_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_60d0_return_output, 7);
     VAR_result_u16_addr_uxn_device_h_l85_c3_973a := resize(VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_fa3b_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_8829_right := VAR_MUX_uxn_device_h_l77_c13_2eab_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_dc3f_right := VAR_MUX_uxn_device_h_l78_c13_95e6_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l92_c21_04c4_right := VAR_MUX_uxn_device_h_l92_c27_1933_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_cb9e_left := VAR_uint12_2_0_uxn_device_h_l67_c20_e191_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l87_c16_4498_left := VAR_uint12_2_0_uxn_device_h_l67_c20_e191_return_output;
     REG_VAR_phase2_downto_0 := VAR_uint12_2_0_uxn_device_h_l67_c20_e191_return_output;
     VAR_phase7_downto_3_uxn_device_h_l66_c2_f01d := VAR_uint12_7_3_uxn_device_h_l66_c20_5029_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l81_c6_f57f_left := VAR_uint12_7_4_uxn_device_h_l65_c20_f7b1_return_output;
     REG_VAR_phase7_downto_4 := VAR_uint12_7_4_uxn_device_h_l65_c20_f7b1_return_output;
     REG_VAR_phase7_downto_3 := VAR_phase7_downto_3_uxn_device_h_l66_c2_f01d;
     VAR_phase7_downto_3_u8_uxn_device_h_l68_c2_e7cf := resize(VAR_phase7_downto_3_uxn_device_h_l66_c2_f01d, 8);
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_a8dc_var_dim_0 := resize(VAR_phase_minus_two_uxn_device_h_l69_c2_8838, 4);
     REG_VAR_phase_minus_two := VAR_phase_minus_two_uxn_device_h_l69_c2_8838;
     VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_7858_iftrue := VAR_result_u16_addr_uxn_device_h_l85_c3_973a;
     VAR_BIN_OP_MINUS_uxn_device_h_l90_c38_2c39_left := VAR_phase7_downto_3_u8_uxn_device_h_l68_c2_e7cf;
     VAR_BIN_OP_PLUS_uxn_device_h_l89_c38_402d_left := VAR_phase7_downto_3_u8_uxn_device_h_l68_c2_e7cf;
     REG_VAR_phase7_downto_3_u8 := VAR_phase7_downto_3_u8_uxn_device_h_l68_c2_e7cf;
     -- BIN_OP_MINUS[uxn_device_h_l90_c38_2c39] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l90_c38_2c39_left <= VAR_BIN_OP_MINUS_uxn_device_h_l90_c38_2c39_left;
     BIN_OP_MINUS_uxn_device_h_l90_c38_2c39_right <= VAR_BIN_OP_MINUS_uxn_device_h_l90_c38_2c39_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l90_c38_2c39_return_output := BIN_OP_MINUS_uxn_device_h_l90_c38_2c39_return_output;

     -- BIN_OP_EQ[uxn_device_h_l87_c16_4498] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l87_c16_4498_left <= VAR_BIN_OP_EQ_uxn_device_h_l87_c16_4498_left;
     BIN_OP_EQ_uxn_device_h_l87_c16_4498_right <= VAR_BIN_OP_EQ_uxn_device_h_l87_c16_4498_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l87_c16_4498_return_output := BIN_OP_EQ_uxn_device_h_l87_c16_4498_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l89_c38_402d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l89_c38_402d_left <= VAR_BIN_OP_PLUS_uxn_device_h_l89_c38_402d_left;
     BIN_OP_PLUS_uxn_device_h_l89_c38_402d_right <= VAR_BIN_OP_PLUS_uxn_device_h_l89_c38_402d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l89_c38_402d_return_output := BIN_OP_PLUS_uxn_device_h_l89_c38_402d_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l76_c12_f5d1] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_f5d1_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_f5d1_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_f5d1_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_f5d1_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_f5d1_return_output := VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_f5d1_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l78_c7_dc3f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l78_c7_dc3f_left <= VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_dc3f_left;
     BIN_OP_PLUS_uxn_device_h_l78_c7_dc3f_right <= VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_dc3f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_dc3f_return_output := BIN_OP_PLUS_uxn_device_h_l78_c7_dc3f_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l77_c7_8829] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l77_c7_8829_left <= VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_8829_left;
     BIN_OP_PLUS_uxn_device_h_l77_c7_8829_right <= VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_8829_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_8829_return_output := BIN_OP_PLUS_uxn_device_h_l77_c7_8829_return_output;

     -- BIN_OP_EQ[uxn_device_h_l81_c6_f57f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l81_c6_f57f_left <= VAR_BIN_OP_EQ_uxn_device_h_l81_c6_f57f_left;
     BIN_OP_EQ_uxn_device_h_l81_c6_f57f_right <= VAR_BIN_OP_EQ_uxn_device_h_l81_c6_f57f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l81_c6_f57f_return_output := BIN_OP_EQ_uxn_device_h_l81_c6_f57f_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l92_c21_04c4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l92_c21_04c4_left <= VAR_BIN_OP_PLUS_uxn_device_h_l92_c21_04c4_left;
     BIN_OP_PLUS_uxn_device_h_l92_c21_04c4_right <= VAR_BIN_OP_PLUS_uxn_device_h_l92_c21_04c4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l92_c21_04c4_return_output := BIN_OP_PLUS_uxn_device_h_l92_c21_04c4_return_output;

     -- MUX[uxn_device_h_l101_c25_05e8] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l101_c25_05e8_cond <= VAR_MUX_uxn_device_h_l101_c25_05e8_cond;
     MUX_uxn_device_h_l101_c25_05e8_iftrue <= VAR_MUX_uxn_device_h_l101_c25_05e8_iftrue;
     MUX_uxn_device_h_l101_c25_05e8_iffalse <= VAR_MUX_uxn_device_h_l101_c25_05e8_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l101_c25_05e8_return_output := MUX_uxn_device_h_l101_c25_05e8_return_output;

     -- BIN_OP_EQ[uxn_device_h_l100_c7_cb9e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l100_c7_cb9e_left <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_cb9e_left;
     BIN_OP_EQ_uxn_device_h_l100_c7_cb9e_right <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_cb9e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_cb9e_return_output := BIN_OP_EQ_uxn_device_h_l100_c7_cb9e_return_output;

     -- uint12_7_4[uxn_device_h_l71_c6_504b] LATENCY=0
     VAR_uint12_7_4_uxn_device_h_l71_c6_504b_return_output := uint12_7_4(
     VAR_phase_minus_two_uxn_device_h_l69_c2_8838);

     -- VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60[uxn_device_h_l72_c3_a8dc] LATENCY=0
     -- Inputs
     VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_a8dc_elem_val <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_a8dc_elem_val;
     VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_a8dc_ref_toks_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_a8dc_ref_toks_0;
     VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_a8dc_var_dim_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_a8dc_var_dim_0;
     -- Outputs
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_a8dc_return_output := VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_a8dc_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l100_c7_6258_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_cb9e_return_output;
     VAR_c_MUX_uxn_device_h_l81_c2_7858_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_f57f_return_output;
     VAR_ch_MUX_uxn_device_h_l81_c2_7858_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_f57f_return_output;
     VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_7858_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_f57f_return_output;
     VAR_is_new_row_MUX_uxn_device_h_l81_c2_7858_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_f57f_return_output;
     VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_7858_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_f57f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_7858_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_f57f_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_7858_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_f57f_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l81_c2_7858_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_f57f_return_output;
     VAR_x_MUX_uxn_device_h_l81_c2_7858_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_f57f_return_output;
     VAR_y_MUX_uxn_device_h_l81_c2_7858_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_f57f_return_output;
     VAR_MUX_uxn_device_h_l87_c16_41ce_cond := VAR_BIN_OP_EQ_uxn_device_h_l87_c16_4498_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_1fe9_var_dim_0 := resize(VAR_BIN_OP_MINUS_uxn_device_h_l90_c38_2c39_return_output, 4);
     VAR_x_uxn_device_h_l77_c3_0792 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_8829_return_output, 16);
     VAR_y_uxn_device_h_l78_c3_692f := resize(VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_dc3f_return_output, 16);
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_5854_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l89_c38_402d_return_output, 4);
     VAR_MUX_uxn_device_h_l92_c7_3720_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l92_c21_04c4_return_output, 16);
     VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_7858_iffalse := VAR_MUX_uxn_device_h_l101_c25_05e8_return_output;
     VAR_opaque_uxn_device_h_l76_c3_2e0a := resize(VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_f5d1_return_output, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l71_c6_8ba7_left := VAR_uint12_7_4_uxn_device_h_l71_c6_504b_return_output;
     VAR_opaque_MUX_uxn_device_h_l75_c2_5bd2_iftrue := VAR_opaque_uxn_device_h_l76_c3_2e0a;
     VAR_x_MUX_uxn_device_h_l75_c2_5bd2_iftrue := VAR_x_uxn_device_h_l77_c3_0792;
     VAR_y_MUX_uxn_device_h_l75_c2_5bd2_iftrue := VAR_y_uxn_device_h_l78_c3_692f;
     -- result_is_blit_done_MUX[uxn_device_h_l81_c2_7858] LATENCY=0
     -- Inputs
     result_is_blit_done_MUX_uxn_device_h_l81_c2_7858_cond <= VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_7858_cond;
     result_is_blit_done_MUX_uxn_device_h_l81_c2_7858_iftrue <= VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_7858_iftrue;
     result_is_blit_done_MUX_uxn_device_h_l81_c2_7858_iffalse <= VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_7858_iffalse;
     -- Outputs
     VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_7858_return_output := result_is_blit_done_MUX_uxn_device_h_l81_c2_7858_return_output;

     -- BIN_OP_EQ[uxn_device_h_l71_c6_8ba7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l71_c6_8ba7_left <= VAR_BIN_OP_EQ_uxn_device_h_l71_c6_8ba7_left;
     BIN_OP_EQ_uxn_device_h_l71_c6_8ba7_right <= VAR_BIN_OP_EQ_uxn_device_h_l71_c6_8ba7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l71_c6_8ba7_return_output := BIN_OP_EQ_uxn_device_h_l71_c6_8ba7_return_output;

     -- MUX[uxn_device_h_l87_c16_41ce] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l87_c16_41ce_cond <= VAR_MUX_uxn_device_h_l87_c16_41ce_cond;
     MUX_uxn_device_h_l87_c16_41ce_iftrue <= VAR_MUX_uxn_device_h_l87_c16_41ce_iftrue;
     MUX_uxn_device_h_l87_c16_41ce_iffalse <= VAR_MUX_uxn_device_h_l87_c16_41ce_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l87_c16_41ce_return_output := MUX_uxn_device_h_l87_c16_41ce_return_output;

     -- y_MUX[uxn_device_h_l75_c2_5bd2] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l75_c2_5bd2_cond <= VAR_y_MUX_uxn_device_h_l75_c2_5bd2_cond;
     y_MUX_uxn_device_h_l75_c2_5bd2_iftrue <= VAR_y_MUX_uxn_device_h_l75_c2_5bd2_iftrue;
     y_MUX_uxn_device_h_l75_c2_5bd2_iffalse <= VAR_y_MUX_uxn_device_h_l75_c2_5bd2_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l75_c2_5bd2_return_output := y_MUX_uxn_device_h_l75_c2_5bd2_return_output;

     -- opaque_MUX[uxn_device_h_l75_c2_5bd2] LATENCY=0
     -- Inputs
     opaque_MUX_uxn_device_h_l75_c2_5bd2_cond <= VAR_opaque_MUX_uxn_device_h_l75_c2_5bd2_cond;
     opaque_MUX_uxn_device_h_l75_c2_5bd2_iftrue <= VAR_opaque_MUX_uxn_device_h_l75_c2_5bd2_iftrue;
     opaque_MUX_uxn_device_h_l75_c2_5bd2_iffalse <= VAR_opaque_MUX_uxn_device_h_l75_c2_5bd2_iffalse;
     -- Outputs
     VAR_opaque_MUX_uxn_device_h_l75_c2_5bd2_return_output := opaque_MUX_uxn_device_h_l75_c2_5bd2_return_output;

     -- sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5[uxn_device_h_l71_c2_4442] LATENCY=0
     VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5_uxn_device_h_l71_c2_4442_return_output := CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5(
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_a8dc_return_output);

     -- x_MUX[uxn_device_h_l75_c2_5bd2] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l75_c2_5bd2_cond <= VAR_x_MUX_uxn_device_h_l75_c2_5bd2_cond;
     x_MUX_uxn_device_h_l75_c2_5bd2_iftrue <= VAR_x_MUX_uxn_device_h_l75_c2_5bd2_iftrue;
     x_MUX_uxn_device_h_l75_c2_5bd2_iffalse <= VAR_x_MUX_uxn_device_h_l75_c2_5bd2_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l75_c2_5bd2_return_output := x_MUX_uxn_device_h_l75_c2_5bd2_return_output;

     -- Submodule level 3
     VAR_sprite_rows_MUX_uxn_device_h_l71_c2_4442_cond := VAR_BIN_OP_EQ_uxn_device_h_l71_c6_8ba7_return_output;
     VAR_MUX_uxn_device_h_l92_c7_3720_cond := VAR_MUX_uxn_device_h_l87_c16_41ce_return_output;
     VAR_c_MUX_uxn_device_h_l88_c3_4380_cond := VAR_MUX_uxn_device_h_l87_c16_41ce_return_output;
     VAR_is_new_row_MUX_uxn_device_h_l81_c2_7858_iffalse := VAR_MUX_uxn_device_h_l87_c16_41ce_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l98_c42_ef9d_left := VAR_opaque_MUX_uxn_device_h_l75_c2_5bd2_return_output;
     REG_VAR_opaque := VAR_opaque_MUX_uxn_device_h_l75_c2_5bd2_return_output;
     VAR_sprite_rows_MUX_uxn_device_h_l71_c2_4442_iftrue := VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5_uxn_device_h_l71_c2_4442_return_output;
     VAR_MUX_uxn_device_h_l92_c7_3720_iffalse := VAR_x_MUX_uxn_device_h_l75_c2_5bd2_return_output;
     VAR_x_MUX_uxn_device_h_l81_c2_7858_iftrue := VAR_x_MUX_uxn_device_h_l75_c2_5bd2_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l100_c41_96f5_left := VAR_y_MUX_uxn_device_h_l75_c2_5bd2_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l100_c51_681d_left := VAR_y_MUX_uxn_device_h_l75_c2_5bd2_return_output;
     VAR_MUX_uxn_device_h_l100_c7_6258_iffalse := VAR_y_MUX_uxn_device_h_l75_c2_5bd2_return_output;
     VAR_y_MUX_uxn_device_h_l81_c2_7858_iftrue := VAR_y_MUX_uxn_device_h_l75_c2_5bd2_return_output;
     -- BIN_OP_MINUS[uxn_device_h_l100_c41_96f5] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l100_c41_96f5_left <= VAR_BIN_OP_MINUS_uxn_device_h_l100_c41_96f5_left;
     BIN_OP_MINUS_uxn_device_h_l100_c41_96f5_right <= VAR_BIN_OP_MINUS_uxn_device_h_l100_c41_96f5_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l100_c41_96f5_return_output := BIN_OP_MINUS_uxn_device_h_l100_c41_96f5_return_output;

     -- is_new_row_MUX[uxn_device_h_l81_c2_7858] LATENCY=0
     -- Inputs
     is_new_row_MUX_uxn_device_h_l81_c2_7858_cond <= VAR_is_new_row_MUX_uxn_device_h_l81_c2_7858_cond;
     is_new_row_MUX_uxn_device_h_l81_c2_7858_iftrue <= VAR_is_new_row_MUX_uxn_device_h_l81_c2_7858_iftrue;
     is_new_row_MUX_uxn_device_h_l81_c2_7858_iffalse <= VAR_is_new_row_MUX_uxn_device_h_l81_c2_7858_iffalse;
     -- Outputs
     VAR_is_new_row_MUX_uxn_device_h_l81_c2_7858_return_output := is_new_row_MUX_uxn_device_h_l81_c2_7858_return_output;

     -- MUX[uxn_device_h_l92_c7_3720] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l92_c7_3720_cond <= VAR_MUX_uxn_device_h_l92_c7_3720_cond;
     MUX_uxn_device_h_l92_c7_3720_iftrue <= VAR_MUX_uxn_device_h_l92_c7_3720_iftrue;
     MUX_uxn_device_h_l92_c7_3720_iffalse <= VAR_MUX_uxn_device_h_l92_c7_3720_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l92_c7_3720_return_output := MUX_uxn_device_h_l92_c7_3720_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l100_c51_681d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l100_c51_681d_left <= VAR_BIN_OP_PLUS_uxn_device_h_l100_c51_681d_left;
     BIN_OP_PLUS_uxn_device_h_l100_c51_681d_right <= VAR_BIN_OP_PLUS_uxn_device_h_l100_c51_681d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l100_c51_681d_return_output := BIN_OP_PLUS_uxn_device_h_l100_c51_681d_return_output;

     -- sprite_rows_MUX[uxn_device_h_l71_c2_4442] LATENCY=0
     -- Inputs
     sprite_rows_MUX_uxn_device_h_l71_c2_4442_cond <= VAR_sprite_rows_MUX_uxn_device_h_l71_c2_4442_cond;
     sprite_rows_MUX_uxn_device_h_l71_c2_4442_iftrue <= VAR_sprite_rows_MUX_uxn_device_h_l71_c2_4442_iftrue;
     sprite_rows_MUX_uxn_device_h_l71_c2_4442_iffalse <= VAR_sprite_rows_MUX_uxn_device_h_l71_c2_4442_iffalse;
     -- Outputs
     VAR_sprite_rows_MUX_uxn_device_h_l71_c2_4442_return_output := sprite_rows_MUX_uxn_device_h_l71_c2_4442_return_output;

     -- uint16_7_0[uxn_device_h_l96_c39_e4e3] LATENCY=0
     VAR_uint16_7_0_uxn_device_h_l96_c39_e4e3_return_output := uint16_7_0(
     VAR_y_MUX_uxn_device_h_l75_c2_5bd2_return_output);

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l100_c35_3c0c_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l100_c41_96f5_return_output;
     VAR_MUX_uxn_device_h_l100_c35_3c0c_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l100_c51_681d_return_output, 16);
     VAR_BIN_OP_MINUS_uxn_device_h_l102_c24_c5d8_left := VAR_MUX_uxn_device_h_l92_c7_3720_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l102_c14_7bc0_left := VAR_MUX_uxn_device_h_l92_c7_3720_return_output;
     REG_VAR_is_new_row := VAR_is_new_row_MUX_uxn_device_h_l81_c2_7858_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_5854_ref_toks_0 := VAR_sprite_rows_MUX_uxn_device_h_l71_c2_4442_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_1fe9_ref_toks_0 := VAR_sprite_rows_MUX_uxn_device_h_l71_c2_4442_return_output;
     REG_VAR_sprite_rows := VAR_sprite_rows_MUX_uxn_device_h_l71_c2_4442_return_output;
     -- BIN_OP_MINUS[uxn_device_h_l102_c24_c5d8] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l102_c24_c5d8_left <= VAR_BIN_OP_MINUS_uxn_device_h_l102_c24_c5d8_left;
     BIN_OP_MINUS_uxn_device_h_l102_c24_c5d8_right <= VAR_BIN_OP_MINUS_uxn_device_h_l102_c24_c5d8_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l102_c24_c5d8_return_output := BIN_OP_MINUS_uxn_device_h_l102_c24_c5d8_return_output;

     -- uint16_uint8_8[uxn_device_h_l96_c21_4bcf] LATENCY=0
     VAR_uint16_uint8_8_uxn_device_h_l96_c21_4bcf_return_output := uint16_uint8_8(
     resize(to_unsigned(0, 1), 16),
     VAR_uint16_7_0_uxn_device_h_l96_c39_e4e3_return_output);

     -- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l90_c26_1fe9] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_1fe9_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_1fe9_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_1fe9_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_1fe9_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_1fe9_return_output := VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_1fe9_return_output;

     -- MUX[uxn_device_h_l100_c35_3c0c] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l100_c35_3c0c_cond <= VAR_MUX_uxn_device_h_l100_c35_3c0c_cond;
     MUX_uxn_device_h_l100_c35_3c0c_iftrue <= VAR_MUX_uxn_device_h_l100_c35_3c0c_iftrue;
     MUX_uxn_device_h_l100_c35_3c0c_iffalse <= VAR_MUX_uxn_device_h_l100_c35_3c0c_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l100_c35_3c0c_return_output := MUX_uxn_device_h_l100_c35_3c0c_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l89_c26_5854] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_5854_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_5854_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_5854_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_5854_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_5854_return_output := VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_5854_return_output;

     -- uint16_7_0[uxn_device_h_l97_c53_a833] LATENCY=0
     VAR_uint16_7_0_uxn_device_h_l97_c53_a833_return_output := uint16_7_0(
     VAR_MUX_uxn_device_h_l92_c7_3720_return_output);

     -- BIN_OP_PLUS[uxn_device_h_l102_c14_7bc0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l102_c14_7bc0_left <= VAR_BIN_OP_PLUS_uxn_device_h_l102_c14_7bc0_left;
     BIN_OP_PLUS_uxn_device_h_l102_c14_7bc0_right <= VAR_BIN_OP_PLUS_uxn_device_h_l102_c14_7bc0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l102_c14_7bc0_return_output := BIN_OP_PLUS_uxn_device_h_l102_c14_7bc0_return_output;

     -- uint16_15_8[uxn_device_h_l93_c19_6d99] LATENCY=0
     VAR_uint16_15_8_uxn_device_h_l93_c19_6d99_return_output := uint16_15_8(
     VAR_MUX_uxn_device_h_l92_c7_3720_return_output);

     -- Submodule level 5
     VAR_MUX_uxn_device_h_l102_c8_3df5_iffalse := VAR_BIN_OP_MINUS_uxn_device_h_l102_c24_c5d8_return_output;
     VAR_MUX_uxn_device_h_l102_c8_3df5_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l102_c14_7bc0_return_output, 16);
     VAR_MUX_uxn_device_h_l100_c7_6258_iftrue := VAR_MUX_uxn_device_h_l100_c35_3c0c_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l93_c19_d855_left := VAR_uint16_15_8_uxn_device_h_l93_c19_6d99_return_output;
     -- BIN_OP_EQ[uxn_device_h_l93_c19_d855] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l93_c19_d855_left <= VAR_BIN_OP_EQ_uxn_device_h_l93_c19_d855_left;
     BIN_OP_EQ_uxn_device_h_l93_c19_d855_right <= VAR_BIN_OP_EQ_uxn_device_h_l93_c19_d855_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l93_c19_d855_return_output := BIN_OP_EQ_uxn_device_h_l93_c19_d855_return_output;

     -- MUX[uxn_device_h_l102_c8_3df5] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l102_c8_3df5_cond <= VAR_MUX_uxn_device_h_l102_c8_3df5_cond;
     MUX_uxn_device_h_l102_c8_3df5_iftrue <= VAR_MUX_uxn_device_h_l102_c8_3df5_iftrue;
     MUX_uxn_device_h_l102_c8_3df5_iffalse <= VAR_MUX_uxn_device_h_l102_c8_3df5_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l102_c8_3df5_return_output := MUX_uxn_device_h_l102_c8_3df5_return_output;

     -- uint16_uint8_0[uxn_device_h_l97_c21_dfd4] LATENCY=0
     VAR_uint16_uint8_0_uxn_device_h_l97_c21_dfd4_return_output := uint16_uint8_0(
     VAR_uint16_uint8_8_uxn_device_h_l96_c21_4bcf_return_output,
     VAR_uint16_7_0_uxn_device_h_l97_c53_a833_return_output);

     -- uint16_uint8_8[uxn_device_h_l89_c8_98c9] LATENCY=0
     VAR_uint16_uint8_8_uxn_device_h_l89_c8_98c9_return_output := uint16_uint8_8(
     resize(to_unsigned(0, 1), 16),
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_5854_return_output);

     -- MUX[uxn_device_h_l100_c7_6258] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l100_c7_6258_cond <= VAR_MUX_uxn_device_h_l100_c7_6258_cond;
     MUX_uxn_device_h_l100_c7_6258_iftrue <= VAR_MUX_uxn_device_h_l100_c7_6258_iftrue;
     MUX_uxn_device_h_l100_c7_6258_iffalse <= VAR_MUX_uxn_device_h_l100_c7_6258_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l100_c7_6258_return_output := MUX_uxn_device_h_l100_c7_6258_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_device_h_l93_c19_e9e0_cond := VAR_BIN_OP_EQ_uxn_device_h_l93_c19_d855_return_output;
     VAR_y_MUX_uxn_device_h_l81_c2_7858_iffalse := VAR_MUX_uxn_device_h_l100_c7_6258_return_output;
     VAR_x_MUX_uxn_device_h_l81_c2_7858_iffalse := VAR_MUX_uxn_device_h_l102_c8_3df5_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_7858_iffalse := VAR_uint16_uint8_0_uxn_device_h_l97_c21_dfd4_return_output;
     -- x_MUX[uxn_device_h_l81_c2_7858] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l81_c2_7858_cond <= VAR_x_MUX_uxn_device_h_l81_c2_7858_cond;
     x_MUX_uxn_device_h_l81_c2_7858_iftrue <= VAR_x_MUX_uxn_device_h_l81_c2_7858_iftrue;
     x_MUX_uxn_device_h_l81_c2_7858_iffalse <= VAR_x_MUX_uxn_device_h_l81_c2_7858_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l81_c2_7858_return_output := x_MUX_uxn_device_h_l81_c2_7858_return_output;

     -- uint16_uint8_0[uxn_device_h_l90_c8_9f77] LATENCY=0
     VAR_uint16_uint8_0_uxn_device_h_l90_c8_9f77_return_output := uint16_uint8_0(
     VAR_uint16_uint8_8_uxn_device_h_l89_c8_98c9_return_output,
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_1fe9_return_output);

     -- y_MUX[uxn_device_h_l81_c2_7858] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l81_c2_7858_cond <= VAR_y_MUX_uxn_device_h_l81_c2_7858_cond;
     y_MUX_uxn_device_h_l81_c2_7858_iftrue <= VAR_y_MUX_uxn_device_h_l81_c2_7858_iftrue;
     y_MUX_uxn_device_h_l81_c2_7858_iffalse <= VAR_y_MUX_uxn_device_h_l81_c2_7858_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l81_c2_7858_return_output := y_MUX_uxn_device_h_l81_c2_7858_return_output;

     -- MUX[uxn_device_h_l93_c19_e9e0] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l93_c19_e9e0_cond <= VAR_MUX_uxn_device_h_l93_c19_e9e0_cond;
     MUX_uxn_device_h_l93_c19_e9e0_iftrue <= VAR_MUX_uxn_device_h_l93_c19_e9e0_iftrue;
     MUX_uxn_device_h_l93_c19_e9e0_iffalse <= VAR_MUX_uxn_device_h_l93_c19_e9e0_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l93_c19_e9e0_return_output := MUX_uxn_device_h_l93_c19_e9e0_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l81_c2_7858] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l81_c2_7858_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_7858_cond;
     result_u16_addr_MUX_uxn_device_h_l81_c2_7858_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_7858_iftrue;
     result_u16_addr_MUX_uxn_device_h_l81_c2_7858_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_7858_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_7858_return_output := result_u16_addr_MUX_uxn_device_h_l81_c2_7858_return_output;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_device_h_l98_c26_d89a_left := VAR_MUX_uxn_device_h_l93_c19_e9e0_return_output;
     VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_7858_iffalse := VAR_MUX_uxn_device_h_l93_c19_e9e0_return_output;
     VAR_c_MUX_uxn_device_h_l88_c3_4380_iftrue := VAR_uint16_uint8_0_uxn_device_h_l90_c8_9f77_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l81_c2_7858_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l81_c2_7858_return_output;
     -- is_in_bounds_MUX[uxn_device_h_l81_c2_7858] LATENCY=0
     -- Inputs
     is_in_bounds_MUX_uxn_device_h_l81_c2_7858_cond <= VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_7858_cond;
     is_in_bounds_MUX_uxn_device_h_l81_c2_7858_iftrue <= VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_7858_iftrue;
     is_in_bounds_MUX_uxn_device_h_l81_c2_7858_iffalse <= VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_7858_iffalse;
     -- Outputs
     VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_7858_return_output := is_in_bounds_MUX_uxn_device_h_l81_c2_7858_return_output;

     -- c_MUX[uxn_device_h_l88_c3_4380] LATENCY=0
     -- Inputs
     c_MUX_uxn_device_h_l88_c3_4380_cond <= VAR_c_MUX_uxn_device_h_l88_c3_4380_cond;
     c_MUX_uxn_device_h_l88_c3_4380_iftrue <= VAR_c_MUX_uxn_device_h_l88_c3_4380_iftrue;
     c_MUX_uxn_device_h_l88_c3_4380_iffalse <= VAR_c_MUX_uxn_device_h_l88_c3_4380_iffalse;
     -- Outputs
     VAR_c_MUX_uxn_device_h_l88_c3_4380_return_output := c_MUX_uxn_device_h_l88_c3_4380_return_output;

     -- Submodule level 8
     VAR_CONST_SR_1_uxn_device_h_l103_c3_11e0_x := VAR_c_MUX_uxn_device_h_l88_c3_4380_return_output;
     REG_VAR_is_in_bounds := VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_7858_return_output;
     -- CONST_SR_1[uxn_device_h_l103_c3_11e0] LATENCY=0
     -- Inputs
     CONST_SR_1_uxn_device_h_l103_c3_11e0_x <= VAR_CONST_SR_1_uxn_device_h_l103_c3_11e0_x;
     -- Outputs
     VAR_CONST_SR_1_uxn_device_h_l103_c3_11e0_return_output := CONST_SR_1_uxn_device_h_l103_c3_11e0_return_output;

     -- uint16_8_8[uxn_device_h_l94_c25_b126] LATENCY=0
     VAR_uint16_8_8_uxn_device_h_l94_c25_b126_return_output := uint16_8_8(
     VAR_c_MUX_uxn_device_h_l88_c3_4380_return_output);

     -- uint16_0_0[uxn_device_h_l95_c26_9b2a] LATENCY=0
     VAR_uint16_0_0_uxn_device_h_l95_c26_9b2a_return_output := uint16_0_0(
     VAR_c_MUX_uxn_device_h_l88_c3_4380_return_output);

     -- Submodule level 9
     VAR_c_MUX_uxn_device_h_l81_c2_7858_iffalse := VAR_CONST_SR_1_uxn_device_h_l103_c3_11e0_return_output;
     -- c_MUX[uxn_device_h_l81_c2_7858] LATENCY=0
     -- Inputs
     c_MUX_uxn_device_h_l81_c2_7858_cond <= VAR_c_MUX_uxn_device_h_l81_c2_7858_cond;
     c_MUX_uxn_device_h_l81_c2_7858_iftrue <= VAR_c_MUX_uxn_device_h_l81_c2_7858_iftrue;
     c_MUX_uxn_device_h_l81_c2_7858_iffalse <= VAR_c_MUX_uxn_device_h_l81_c2_7858_iffalse;
     -- Outputs
     VAR_c_MUX_uxn_device_h_l81_c2_7858_return_output := c_MUX_uxn_device_h_l81_c2_7858_return_output;

     -- uint8_uint1_5[uxn_device_h_l94_c8_d9ff] LATENCY=0
     VAR_uint8_uint1_5_uxn_device_h_l94_c8_d9ff_return_output := uint8_uint1_5(
     resize(to_unsigned(0, 1), 8),
     VAR_uint16_8_8_uxn_device_h_l94_c25_b126_return_output);

     -- Submodule level 10
     REG_VAR_c := VAR_c_MUX_uxn_device_h_l81_c2_7858_return_output;
     -- uint8_uint1_4[uxn_device_h_l95_c8_a9e0] LATENCY=0
     VAR_uint8_uint1_4_uxn_device_h_l95_c8_a9e0_return_output := uint8_uint1_4(
     VAR_uint8_uint1_5_uxn_device_h_l94_c8_d9ff_return_output,
     VAR_uint16_0_0_uxn_device_h_l95_c26_9b2a_return_output);

     -- Submodule level 11
     VAR_BIN_OP_EQ_uxn_device_h_l98_c52_fd19_left := VAR_uint8_uint1_4_uxn_device_h_l95_c8_a9e0_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l99_c30_1711_right := VAR_uint8_uint1_4_uxn_device_h_l95_c8_a9e0_return_output;
     VAR_ch_MUX_uxn_device_h_l81_c2_7858_iffalse := VAR_uint8_uint1_4_uxn_device_h_l95_c8_a9e0_return_output;
     -- BIN_OP_EQ[uxn_device_h_l98_c52_fd19] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l98_c52_fd19_left <= VAR_BIN_OP_EQ_uxn_device_h_l98_c52_fd19_left;
     BIN_OP_EQ_uxn_device_h_l98_c52_fd19_right <= VAR_BIN_OP_EQ_uxn_device_h_l98_c52_fd19_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l98_c52_fd19_return_output := BIN_OP_EQ_uxn_device_h_l98_c52_fd19_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l99_c30_1711] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l99_c30_1711_left <= VAR_BIN_OP_PLUS_uxn_device_h_l99_c30_1711_left;
     BIN_OP_PLUS_uxn_device_h_l99_c30_1711_right <= VAR_BIN_OP_PLUS_uxn_device_h_l99_c30_1711_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l99_c30_1711_return_output := BIN_OP_PLUS_uxn_device_h_l99_c30_1711_return_output;

     -- ch_MUX[uxn_device_h_l81_c2_7858] LATENCY=0
     -- Inputs
     ch_MUX_uxn_device_h_l81_c2_7858_cond <= VAR_ch_MUX_uxn_device_h_l81_c2_7858_cond;
     ch_MUX_uxn_device_h_l81_c2_7858_iftrue <= VAR_ch_MUX_uxn_device_h_l81_c2_7858_iftrue;
     ch_MUX_uxn_device_h_l81_c2_7858_iffalse <= VAR_ch_MUX_uxn_device_h_l81_c2_7858_iffalse;
     -- Outputs
     VAR_ch_MUX_uxn_device_h_l81_c2_7858_return_output := ch_MUX_uxn_device_h_l81_c2_7858_return_output;

     -- Submodule level 12
     VAR_MUX_uxn_device_h_l98_c52_2948_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c52_fd19_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_ae83_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l99_c30_1711_return_output, 7);
     REG_VAR_ch := VAR_ch_MUX_uxn_device_h_l81_c2_7858_return_output;
     -- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l99_c21_ae83] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_ae83_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_ae83_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_ae83_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_ae83_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_ae83_return_output := VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_ae83_return_output;

     -- MUX[uxn_device_h_l98_c52_2948] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l98_c52_2948_cond <= VAR_MUX_uxn_device_h_l98_c52_2948_cond;
     MUX_uxn_device_h_l98_c52_2948_iftrue <= VAR_MUX_uxn_device_h_l98_c52_2948_iftrue;
     MUX_uxn_device_h_l98_c52_2948_iffalse <= VAR_MUX_uxn_device_h_l98_c52_2948_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l98_c52_2948_return_output := MUX_uxn_device_h_l98_c52_2948_return_output;

     -- Submodule level 13
     VAR_BIN_OP_OR_uxn_device_h_l98_c42_ef9d_right := VAR_MUX_uxn_device_h_l98_c52_2948_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l81_c2_7858_iffalse := VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_ae83_return_output;
     -- result_u8_value_MUX[uxn_device_h_l81_c2_7858] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l81_c2_7858_cond <= VAR_result_u8_value_MUX_uxn_device_h_l81_c2_7858_cond;
     result_u8_value_MUX_uxn_device_h_l81_c2_7858_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l81_c2_7858_iftrue;
     result_u8_value_MUX_uxn_device_h_l81_c2_7858_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l81_c2_7858_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l81_c2_7858_return_output := result_u8_value_MUX_uxn_device_h_l81_c2_7858_return_output;

     -- BIN_OP_OR[uxn_device_h_l98_c42_ef9d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l98_c42_ef9d_left <= VAR_BIN_OP_OR_uxn_device_h_l98_c42_ef9d_left;
     BIN_OP_OR_uxn_device_h_l98_c42_ef9d_right <= VAR_BIN_OP_OR_uxn_device_h_l98_c42_ef9d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l98_c42_ef9d_return_output := BIN_OP_OR_uxn_device_h_l98_c42_ef9d_return_output;

     -- Submodule level 14
     VAR_BIN_OP_AND_uxn_device_h_l98_c26_d89a_right := VAR_BIN_OP_OR_uxn_device_h_l98_c42_ef9d_return_output;
     -- BIN_OP_AND[uxn_device_h_l98_c26_d89a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l98_c26_d89a_left <= VAR_BIN_OP_AND_uxn_device_h_l98_c26_d89a_left;
     BIN_OP_AND_uxn_device_h_l98_c26_d89a_right <= VAR_BIN_OP_AND_uxn_device_h_l98_c26_d89a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l98_c26_d89a_return_output := BIN_OP_AND_uxn_device_h_l98_c26_d89a_return_output;

     -- Submodule level 15
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_7858_iffalse := VAR_BIN_OP_AND_uxn_device_h_l98_c26_d89a_return_output;
     -- result_is_vram_write_MUX[uxn_device_h_l81_c2_7858] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l81_c2_7858_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_7858_cond;
     result_is_vram_write_MUX_uxn_device_h_l81_c2_7858_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_7858_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l81_c2_7858_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_7858_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_7858_return_output := result_is_vram_write_MUX_uxn_device_h_l81_c2_7858_return_output;

     -- Submodule level 16
     -- CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_d326_uxn_device_h_l106_l42_DUPLICATE_a159 LATENCY=0
     VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_d326_uxn_device_h_l106_l42_DUPLICATE_a159_return_output := CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_d326(
     result,
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_7858_return_output,
     VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_7858_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_7858_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l81_c2_7858_return_output);

     -- Submodule level 17
     REG_VAR_result := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_d326_uxn_device_h_l106_l42_DUPLICATE_a159_return_output;
     VAR_return_output := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_d326_uxn_device_h_l106_l42_DUPLICATE_a159_return_output;
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
