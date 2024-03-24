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
-- Submodules: 77
entity screen_2bpp_0CLK_7c567d05 is
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
end screen_2bpp_0CLK_7c567d05;
architecture arch of screen_2bpp_0CLK_7c567d05 is
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
signal is_x_in_bounds : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_y_in_bounds : unsigned(0 downto 0) := to_unsigned(0, 1);
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
signal REG_COMB_is_x_in_bounds : unsigned(0 downto 0);
signal REG_COMB_is_y_in_bounds : unsigned(0 downto 0);
signal REG_COMB_is_new_row : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_MINUS[uxn_device_h_l69_c20_9066]
signal BIN_OP_MINUS_uxn_device_h_l69_c20_9066_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l69_c20_9066_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l69_c20_9066_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l71_c6_ba9c]
signal BIN_OP_EQ_uxn_device_h_l71_c6_ba9c_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l71_c6_ba9c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l71_c6_ba9c_return_output : unsigned(0 downto 0);

-- sprite_rows_MUX[uxn_device_h_l71_c2_5c23]
signal sprite_rows_MUX_uxn_device_h_l71_c2_5c23_cond : unsigned(0 downto 0);
signal sprite_rows_MUX_uxn_device_h_l71_c2_5c23_iftrue : uint8_t_16;
signal sprite_rows_MUX_uxn_device_h_l71_c2_5c23_iffalse : uint8_t_16;
signal sprite_rows_MUX_uxn_device_h_l71_c2_5c23_return_output : uint8_t_16;

-- VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60[uxn_device_h_l72_c3_482e]
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_482e_elem_val : unsigned(7 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_482e_ref_toks_0 : uint8_t_16;
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_482e_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_482e_return_output : uint8_t_array_16_t;

-- BIN_OP_EQ[uxn_device_h_l75_c6_942f]
signal BIN_OP_EQ_uxn_device_h_l75_c6_942f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l75_c6_942f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l75_c6_942f_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l75_c2_4254]
signal y_MUX_uxn_device_h_l75_c2_4254_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l75_c2_4254_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l75_c2_4254_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l75_c2_4254_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l75_c2_4254]
signal x_MUX_uxn_device_h_l75_c2_4254_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l75_c2_4254_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l75_c2_4254_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l75_c2_4254_return_output : unsigned(15 downto 0);

-- opaque_MUX[uxn_device_h_l75_c2_4254]
signal opaque_MUX_uxn_device_h_l75_c2_4254_cond : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l75_c2_4254_iftrue : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l75_c2_4254_iffalse : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l75_c2_4254_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l76_c21_048b]
signal BIN_OP_PLUS_uxn_device_h_l76_c21_048b_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l76_c21_048b_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l76_c21_048b_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l76_c12_cbda]
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_cbda_ref_toks_0 : uint8_t_80;
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_cbda_var_dim_0 : unsigned(6 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_cbda_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l77_c13_4af0]
signal MUX_uxn_device_h_l77_c13_4af0_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l77_c13_4af0_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l77_c13_4af0_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l77_c13_4af0_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l77_c7_1531]
signal BIN_OP_PLUS_uxn_device_h_l77_c7_1531_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l77_c7_1531_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l77_c7_1531_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l78_c13_463a]
signal MUX_uxn_device_h_l78_c13_463a_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l78_c13_463a_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l78_c13_463a_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l78_c13_463a_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l78_c7_4b43]
signal BIN_OP_PLUS_uxn_device_h_l78_c7_4b43_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l78_c7_4b43_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l78_c7_4b43_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l81_c6_e0c1]
signal BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l81_c2_22c3]
signal y_MUX_uxn_device_h_l81_c2_22c3_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l81_c2_22c3_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c2_22c3_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c2_22c3_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l81_c2_22c3]
signal x_MUX_uxn_device_h_l81_c2_22c3_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l81_c2_22c3_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c2_22c3_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c2_22c3_return_output : unsigned(15 downto 0);

-- ch_MUX[uxn_device_h_l81_c2_22c3]
signal ch_MUX_uxn_device_h_l81_c2_22c3_cond : unsigned(0 downto 0);
signal ch_MUX_uxn_device_h_l81_c2_22c3_iftrue : unsigned(7 downto 0);
signal ch_MUX_uxn_device_h_l81_c2_22c3_iffalse : unsigned(7 downto 0);
signal ch_MUX_uxn_device_h_l81_c2_22c3_return_output : unsigned(7 downto 0);

-- is_x_in_bounds_MUX[uxn_device_h_l81_c2_22c3]
signal is_x_in_bounds_MUX_uxn_device_h_l81_c2_22c3_cond : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l81_c2_22c3_iftrue : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l81_c2_22c3_iffalse : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l81_c2_22c3_return_output : unsigned(0 downto 0);

-- is_y_in_bounds_MUX[uxn_device_h_l81_c2_22c3]
signal is_y_in_bounds_MUX_uxn_device_h_l81_c2_22c3_cond : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l81_c2_22c3_iftrue : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l81_c2_22c3_iffalse : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l81_c2_22c3_return_output : unsigned(0 downto 0);

-- c_MUX[uxn_device_h_l81_c2_22c3]
signal c_MUX_uxn_device_h_l81_c2_22c3_cond : unsigned(0 downto 0);
signal c_MUX_uxn_device_h_l81_c2_22c3_iftrue : unsigned(15 downto 0);
signal c_MUX_uxn_device_h_l81_c2_22c3_iffalse : unsigned(15 downto 0);
signal c_MUX_uxn_device_h_l81_c2_22c3_return_output : unsigned(15 downto 0);

-- is_new_row_MUX[uxn_device_h_l81_c2_22c3]
signal is_new_row_MUX_uxn_device_h_l81_c2_22c3_cond : unsigned(0 downto 0);
signal is_new_row_MUX_uxn_device_h_l81_c2_22c3_iftrue : unsigned(0 downto 0);
signal is_new_row_MUX_uxn_device_h_l81_c2_22c3_iffalse : unsigned(0 downto 0);
signal is_new_row_MUX_uxn_device_h_l81_c2_22c3_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l81_c2_22c3]
signal result_is_vram_write_MUX_uxn_device_h_l81_c2_22c3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c2_22c3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c2_22c3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c2_22c3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l81_c2_22c3]
signal result_u8_value_MUX_uxn_device_h_l81_c2_22c3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l81_c2_22c3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l81_c2_22c3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l81_c2_22c3_return_output : unsigned(7 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l81_c2_22c3]
signal result_u16_addr_MUX_uxn_device_h_l81_c2_22c3_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l81_c2_22c3_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l81_c2_22c3_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l81_c2_22c3_return_output : unsigned(15 downto 0);

-- result_is_blit_done_MUX[uxn_device_h_l81_c2_22c3]
signal result_is_blit_done_MUX_uxn_device_h_l81_c2_22c3_cond : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l81_c2_22c3_iftrue : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l81_c2_22c3_iffalse : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l81_c2_22c3_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l85_c21_62bc]
signal BIN_OP_PLUS_uxn_device_h_l85_c21_62bc_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l85_c21_62bc_right : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l85_c21_62bc_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l87_c16_7fdd]
signal BIN_OP_EQ_uxn_device_h_l87_c16_7fdd_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l87_c16_7fdd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l87_c16_7fdd_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l87_c16_4693]
signal MUX_uxn_device_h_l87_c16_4693_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l87_c16_4693_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l87_c16_4693_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l87_c16_4693_return_output : unsigned(0 downto 0);

-- c_MUX[uxn_device_h_l88_c3_9a58]
signal c_MUX_uxn_device_h_l88_c3_9a58_cond : unsigned(0 downto 0);
signal c_MUX_uxn_device_h_l88_c3_9a58_iftrue : unsigned(15 downto 0);
signal c_MUX_uxn_device_h_l88_c3_9a58_iffalse : unsigned(15 downto 0);
signal c_MUX_uxn_device_h_l88_c3_9a58_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l89_c38_eb27]
signal BIN_OP_PLUS_uxn_device_h_l89_c38_eb27_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l89_c38_eb27_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l89_c38_eb27_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l89_c26_3c18]
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_3c18_ref_toks_0 : uint8_t_16;
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_3c18_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_3c18_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l90_c38_7bc3]
signal BIN_OP_MINUS_uxn_device_h_l90_c38_7bc3_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l90_c38_7bc3_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l90_c38_7bc3_return_output : unsigned(7 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l90_c26_8007]
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_8007_ref_toks_0 : uint8_t_16;
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_8007_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_8007_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l92_c27_aed0]
signal MUX_uxn_device_h_l92_c27_aed0_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l92_c27_aed0_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l92_c27_aed0_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l92_c27_aed0_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l92_c21_b033]
signal BIN_OP_PLUS_uxn_device_h_l92_c21_b033_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l92_c21_b033_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l92_c21_b033_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l92_c7_fefa]
signal MUX_uxn_device_h_l92_c7_fefa_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l92_c7_fefa_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l92_c7_fefa_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l92_c7_fefa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l93_c21_cdcd]
signal BIN_OP_EQ_uxn_device_h_l93_c21_cdcd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l93_c21_cdcd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l93_c21_cdcd_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l93_c21_ed90]
signal MUX_uxn_device_h_l93_c21_ed90_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l93_c21_ed90_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l93_c21_ed90_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l93_c21_ed90_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l94_c21_8030]
signal BIN_OP_EQ_uxn_device_h_l94_c21_8030_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l94_c21_8030_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l94_c21_8030_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l94_c21_c3ad]
signal MUX_uxn_device_h_l94_c21_c3ad_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l94_c21_c3ad_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l94_c21_c3ad_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l94_c21_c3ad_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l99_c26_cfe1]
signal BIN_OP_AND_uxn_device_h_l99_c26_cfe1_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l99_c26_cfe1_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l99_c26_cfe1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l99_c71_60df]
signal BIN_OP_EQ_uxn_device_h_l99_c71_60df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c71_60df_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c71_60df_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l99_c71_d1f0]
signal MUX_uxn_device_h_l99_c71_d1f0_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l99_c71_d1f0_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l99_c71_d1f0_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l99_c71_d1f0_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l99_c61_259f]
signal BIN_OP_OR_uxn_device_h_l99_c61_259f_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l99_c61_259f_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l99_c61_259f_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l99_c26_12d7]
signal BIN_OP_AND_uxn_device_h_l99_c26_12d7_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l99_c26_12d7_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l99_c26_12d7_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l100_c30_0e9d]
signal BIN_OP_PLUS_uxn_device_h_l100_c30_0e9d_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l100_c30_0e9d_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l100_c30_0e9d_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l100_c21_90f9]
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_90f9_ref_toks_0 : uint8_t_80;
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_90f9_var_dim_0 : unsigned(6 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_90f9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l101_c7_4fef]
signal BIN_OP_EQ_uxn_device_h_l101_c7_4fef_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c7_4fef_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c7_4fef_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l101_c41_9558]
signal BIN_OP_MINUS_uxn_device_h_l101_c41_9558_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l101_c41_9558_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l101_c41_9558_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l101_c51_7ab7]
signal BIN_OP_PLUS_uxn_device_h_l101_c51_7ab7_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l101_c51_7ab7_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l101_c51_7ab7_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l101_c35_b561]
signal MUX_uxn_device_h_l101_c35_b561_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l101_c35_b561_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l101_c35_b561_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l101_c35_b561_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l101_c7_0ff8]
signal MUX_uxn_device_h_l101_c7_0ff8_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l101_c7_0ff8_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l101_c7_0ff8_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l101_c7_0ff8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l102_c25_2918]
signal BIN_OP_EQ_uxn_device_h_l102_c25_2918_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l102_c25_2918_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l102_c25_2918_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l102_c25_809f]
signal MUX_uxn_device_h_l102_c25_809f_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l102_c25_809f_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l102_c25_809f_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l102_c25_809f_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l103_c14_5082]
signal BIN_OP_PLUS_uxn_device_h_l103_c14_5082_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l103_c14_5082_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l103_c14_5082_return_output : unsigned(16 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l103_c24_2a1c]
signal BIN_OP_MINUS_uxn_device_h_l103_c24_2a1c_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l103_c24_2a1c_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l103_c24_2a1c_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l103_c8_e261]
signal MUX_uxn_device_h_l103_c8_e261_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l103_c8_e261_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l103_c8_e261_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l103_c8_e261_return_output : unsigned(15 downto 0);

-- CONST_SR_1[uxn_device_h_l104_c3_f53a]
signal CONST_SR_1_uxn_device_h_l104_c3_f53a_x : unsigned(15 downto 0);
signal CONST_SR_1_uxn_device_h_l104_c3_f53a_return_output : unsigned(15 downto 0);

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
      base(1) := ref_toks_0.data(1);
      base(7) := ref_toks_0.data(7);
      base(4) := ref_toks_0.data(4);
      base(10) := ref_toks_0.data(10);
      base(13) := ref_toks_0.data(13);
      base(2) := ref_toks_0.data(2);
      base(5) := ref_toks_0.data(5);
      base(8) := ref_toks_0.data(8);
      base(14) := ref_toks_0.data(14);
      base(11) := ref_toks_0.data(11);
      base(0) := ref_toks_0.data(0);
      base(3) := ref_toks_0.data(3);
      base(6) := ref_toks_0.data(6);
      base(12) := ref_toks_0.data(12);
      base(9) := ref_toks_0.data(9);
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

function CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_15f2( ref_toks_0 : screen_blit_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return screen_blit_result_t is
 
  variable base : screen_blit_result_t; 
  variable return_output : screen_blit_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.u16_addr := ref_toks_3;
      base.is_blit_done := ref_toks_4;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_MINUS_uxn_device_h_l69_c20_9066
BIN_OP_MINUS_uxn_device_h_l69_c20_9066 : entity work.BIN_OP_MINUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l69_c20_9066_left,
BIN_OP_MINUS_uxn_device_h_l69_c20_9066_right,
BIN_OP_MINUS_uxn_device_h_l69_c20_9066_return_output);

-- BIN_OP_EQ_uxn_device_h_l71_c6_ba9c
BIN_OP_EQ_uxn_device_h_l71_c6_ba9c : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l71_c6_ba9c_left,
BIN_OP_EQ_uxn_device_h_l71_c6_ba9c_right,
BIN_OP_EQ_uxn_device_h_l71_c6_ba9c_return_output);

-- sprite_rows_MUX_uxn_device_h_l71_c2_5c23
sprite_rows_MUX_uxn_device_h_l71_c2_5c23 : entity work.MUX_uint1_t_uint8_t_16_uint8_t_16_0CLK_de264c78 port map (
sprite_rows_MUX_uxn_device_h_l71_c2_5c23_cond,
sprite_rows_MUX_uxn_device_h_l71_c2_5c23_iftrue,
sprite_rows_MUX_uxn_device_h_l71_c2_5c23_iffalse,
sprite_rows_MUX_uxn_device_h_l71_c2_5c23_return_output);

-- VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_482e
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_482e : entity work.VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_0CLK_6481cb28 port map (
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_482e_elem_val,
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_482e_ref_toks_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_482e_var_dim_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_482e_return_output);

-- BIN_OP_EQ_uxn_device_h_l75_c6_942f
BIN_OP_EQ_uxn_device_h_l75_c6_942f : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l75_c6_942f_left,
BIN_OP_EQ_uxn_device_h_l75_c6_942f_right,
BIN_OP_EQ_uxn_device_h_l75_c6_942f_return_output);

-- y_MUX_uxn_device_h_l75_c2_4254
y_MUX_uxn_device_h_l75_c2_4254 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l75_c2_4254_cond,
y_MUX_uxn_device_h_l75_c2_4254_iftrue,
y_MUX_uxn_device_h_l75_c2_4254_iffalse,
y_MUX_uxn_device_h_l75_c2_4254_return_output);

-- x_MUX_uxn_device_h_l75_c2_4254
x_MUX_uxn_device_h_l75_c2_4254 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l75_c2_4254_cond,
x_MUX_uxn_device_h_l75_c2_4254_iftrue,
x_MUX_uxn_device_h_l75_c2_4254_iffalse,
x_MUX_uxn_device_h_l75_c2_4254_return_output);

-- opaque_MUX_uxn_device_h_l75_c2_4254
opaque_MUX_uxn_device_h_l75_c2_4254 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opaque_MUX_uxn_device_h_l75_c2_4254_cond,
opaque_MUX_uxn_device_h_l75_c2_4254_iftrue,
opaque_MUX_uxn_device_h_l75_c2_4254_iffalse,
opaque_MUX_uxn_device_h_l75_c2_4254_return_output);

-- BIN_OP_PLUS_uxn_device_h_l76_c21_048b
BIN_OP_PLUS_uxn_device_h_l76_c21_048b : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l76_c21_048b_left,
BIN_OP_PLUS_uxn_device_h_l76_c21_048b_right,
BIN_OP_PLUS_uxn_device_h_l76_c21_048b_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_cbda
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_cbda : entity work.VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_0CLK_4b00ae23 port map (
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_cbda_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_cbda_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_cbda_return_output);

-- MUX_uxn_device_h_l77_c13_4af0
MUX_uxn_device_h_l77_c13_4af0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l77_c13_4af0_cond,
MUX_uxn_device_h_l77_c13_4af0_iftrue,
MUX_uxn_device_h_l77_c13_4af0_iffalse,
MUX_uxn_device_h_l77_c13_4af0_return_output);

-- BIN_OP_PLUS_uxn_device_h_l77_c7_1531
BIN_OP_PLUS_uxn_device_h_l77_c7_1531 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l77_c7_1531_left,
BIN_OP_PLUS_uxn_device_h_l77_c7_1531_right,
BIN_OP_PLUS_uxn_device_h_l77_c7_1531_return_output);

-- MUX_uxn_device_h_l78_c13_463a
MUX_uxn_device_h_l78_c13_463a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l78_c13_463a_cond,
MUX_uxn_device_h_l78_c13_463a_iftrue,
MUX_uxn_device_h_l78_c13_463a_iffalse,
MUX_uxn_device_h_l78_c13_463a_return_output);

-- BIN_OP_PLUS_uxn_device_h_l78_c7_4b43
BIN_OP_PLUS_uxn_device_h_l78_c7_4b43 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l78_c7_4b43_left,
BIN_OP_PLUS_uxn_device_h_l78_c7_4b43_right,
BIN_OP_PLUS_uxn_device_h_l78_c7_4b43_return_output);

-- BIN_OP_EQ_uxn_device_h_l81_c6_e0c1
BIN_OP_EQ_uxn_device_h_l81_c6_e0c1 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_left,
BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_right,
BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_return_output);

-- y_MUX_uxn_device_h_l81_c2_22c3
y_MUX_uxn_device_h_l81_c2_22c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l81_c2_22c3_cond,
y_MUX_uxn_device_h_l81_c2_22c3_iftrue,
y_MUX_uxn_device_h_l81_c2_22c3_iffalse,
y_MUX_uxn_device_h_l81_c2_22c3_return_output);

-- x_MUX_uxn_device_h_l81_c2_22c3
x_MUX_uxn_device_h_l81_c2_22c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l81_c2_22c3_cond,
x_MUX_uxn_device_h_l81_c2_22c3_iftrue,
x_MUX_uxn_device_h_l81_c2_22c3_iffalse,
x_MUX_uxn_device_h_l81_c2_22c3_return_output);

-- ch_MUX_uxn_device_h_l81_c2_22c3
ch_MUX_uxn_device_h_l81_c2_22c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ch_MUX_uxn_device_h_l81_c2_22c3_cond,
ch_MUX_uxn_device_h_l81_c2_22c3_iftrue,
ch_MUX_uxn_device_h_l81_c2_22c3_iffalse,
ch_MUX_uxn_device_h_l81_c2_22c3_return_output);

-- is_x_in_bounds_MUX_uxn_device_h_l81_c2_22c3
is_x_in_bounds_MUX_uxn_device_h_l81_c2_22c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_in_bounds_MUX_uxn_device_h_l81_c2_22c3_cond,
is_x_in_bounds_MUX_uxn_device_h_l81_c2_22c3_iftrue,
is_x_in_bounds_MUX_uxn_device_h_l81_c2_22c3_iffalse,
is_x_in_bounds_MUX_uxn_device_h_l81_c2_22c3_return_output);

-- is_y_in_bounds_MUX_uxn_device_h_l81_c2_22c3
is_y_in_bounds_MUX_uxn_device_h_l81_c2_22c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_in_bounds_MUX_uxn_device_h_l81_c2_22c3_cond,
is_y_in_bounds_MUX_uxn_device_h_l81_c2_22c3_iftrue,
is_y_in_bounds_MUX_uxn_device_h_l81_c2_22c3_iffalse,
is_y_in_bounds_MUX_uxn_device_h_l81_c2_22c3_return_output);

-- c_MUX_uxn_device_h_l81_c2_22c3
c_MUX_uxn_device_h_l81_c2_22c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
c_MUX_uxn_device_h_l81_c2_22c3_cond,
c_MUX_uxn_device_h_l81_c2_22c3_iftrue,
c_MUX_uxn_device_h_l81_c2_22c3_iffalse,
c_MUX_uxn_device_h_l81_c2_22c3_return_output);

-- is_new_row_MUX_uxn_device_h_l81_c2_22c3
is_new_row_MUX_uxn_device_h_l81_c2_22c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_new_row_MUX_uxn_device_h_l81_c2_22c3_cond,
is_new_row_MUX_uxn_device_h_l81_c2_22c3_iftrue,
is_new_row_MUX_uxn_device_h_l81_c2_22c3_iffalse,
is_new_row_MUX_uxn_device_h_l81_c2_22c3_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l81_c2_22c3
result_is_vram_write_MUX_uxn_device_h_l81_c2_22c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l81_c2_22c3_cond,
result_is_vram_write_MUX_uxn_device_h_l81_c2_22c3_iftrue,
result_is_vram_write_MUX_uxn_device_h_l81_c2_22c3_iffalse,
result_is_vram_write_MUX_uxn_device_h_l81_c2_22c3_return_output);

-- result_u8_value_MUX_uxn_device_h_l81_c2_22c3
result_u8_value_MUX_uxn_device_h_l81_c2_22c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l81_c2_22c3_cond,
result_u8_value_MUX_uxn_device_h_l81_c2_22c3_iftrue,
result_u8_value_MUX_uxn_device_h_l81_c2_22c3_iffalse,
result_u8_value_MUX_uxn_device_h_l81_c2_22c3_return_output);

-- result_u16_addr_MUX_uxn_device_h_l81_c2_22c3
result_u16_addr_MUX_uxn_device_h_l81_c2_22c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l81_c2_22c3_cond,
result_u16_addr_MUX_uxn_device_h_l81_c2_22c3_iftrue,
result_u16_addr_MUX_uxn_device_h_l81_c2_22c3_iffalse,
result_u16_addr_MUX_uxn_device_h_l81_c2_22c3_return_output);

-- result_is_blit_done_MUX_uxn_device_h_l81_c2_22c3
result_is_blit_done_MUX_uxn_device_h_l81_c2_22c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_blit_done_MUX_uxn_device_h_l81_c2_22c3_cond,
result_is_blit_done_MUX_uxn_device_h_l81_c2_22c3_iftrue,
result_is_blit_done_MUX_uxn_device_h_l81_c2_22c3_iffalse,
result_is_blit_done_MUX_uxn_device_h_l81_c2_22c3_return_output);

-- BIN_OP_PLUS_uxn_device_h_l85_c21_62bc
BIN_OP_PLUS_uxn_device_h_l85_c21_62bc : entity work.BIN_OP_PLUS_uint16_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l85_c21_62bc_left,
BIN_OP_PLUS_uxn_device_h_l85_c21_62bc_right,
BIN_OP_PLUS_uxn_device_h_l85_c21_62bc_return_output);

-- BIN_OP_EQ_uxn_device_h_l87_c16_7fdd
BIN_OP_EQ_uxn_device_h_l87_c16_7fdd : entity work.BIN_OP_EQ_uint3_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l87_c16_7fdd_left,
BIN_OP_EQ_uxn_device_h_l87_c16_7fdd_right,
BIN_OP_EQ_uxn_device_h_l87_c16_7fdd_return_output);

-- MUX_uxn_device_h_l87_c16_4693
MUX_uxn_device_h_l87_c16_4693 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l87_c16_4693_cond,
MUX_uxn_device_h_l87_c16_4693_iftrue,
MUX_uxn_device_h_l87_c16_4693_iffalse,
MUX_uxn_device_h_l87_c16_4693_return_output);

-- c_MUX_uxn_device_h_l88_c3_9a58
c_MUX_uxn_device_h_l88_c3_9a58 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
c_MUX_uxn_device_h_l88_c3_9a58_cond,
c_MUX_uxn_device_h_l88_c3_9a58_iftrue,
c_MUX_uxn_device_h_l88_c3_9a58_iffalse,
c_MUX_uxn_device_h_l88_c3_9a58_return_output);

-- BIN_OP_PLUS_uxn_device_h_l89_c38_eb27
BIN_OP_PLUS_uxn_device_h_l89_c38_eb27 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l89_c38_eb27_left,
BIN_OP_PLUS_uxn_device_h_l89_c38_eb27_right,
BIN_OP_PLUS_uxn_device_h_l89_c38_eb27_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_3c18
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_3c18 : entity work.VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_0CLK_e799c7f1 port map (
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_3c18_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_3c18_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_3c18_return_output);

-- BIN_OP_MINUS_uxn_device_h_l90_c38_7bc3
BIN_OP_MINUS_uxn_device_h_l90_c38_7bc3 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l90_c38_7bc3_left,
BIN_OP_MINUS_uxn_device_h_l90_c38_7bc3_right,
BIN_OP_MINUS_uxn_device_h_l90_c38_7bc3_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_8007
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_8007 : entity work.VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_0CLK_e799c7f1 port map (
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_8007_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_8007_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_8007_return_output);

-- MUX_uxn_device_h_l92_c27_aed0
MUX_uxn_device_h_l92_c27_aed0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l92_c27_aed0_cond,
MUX_uxn_device_h_l92_c27_aed0_iftrue,
MUX_uxn_device_h_l92_c27_aed0_iffalse,
MUX_uxn_device_h_l92_c27_aed0_return_output);

-- BIN_OP_PLUS_uxn_device_h_l92_c21_b033
BIN_OP_PLUS_uxn_device_h_l92_c21_b033 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l92_c21_b033_left,
BIN_OP_PLUS_uxn_device_h_l92_c21_b033_right,
BIN_OP_PLUS_uxn_device_h_l92_c21_b033_return_output);

-- MUX_uxn_device_h_l92_c7_fefa
MUX_uxn_device_h_l92_c7_fefa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l92_c7_fefa_cond,
MUX_uxn_device_h_l92_c7_fefa_iftrue,
MUX_uxn_device_h_l92_c7_fefa_iffalse,
MUX_uxn_device_h_l92_c7_fefa_return_output);

-- BIN_OP_EQ_uxn_device_h_l93_c21_cdcd
BIN_OP_EQ_uxn_device_h_l93_c21_cdcd : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l93_c21_cdcd_left,
BIN_OP_EQ_uxn_device_h_l93_c21_cdcd_right,
BIN_OP_EQ_uxn_device_h_l93_c21_cdcd_return_output);

-- MUX_uxn_device_h_l93_c21_ed90
MUX_uxn_device_h_l93_c21_ed90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l93_c21_ed90_cond,
MUX_uxn_device_h_l93_c21_ed90_iftrue,
MUX_uxn_device_h_l93_c21_ed90_iffalse,
MUX_uxn_device_h_l93_c21_ed90_return_output);

-- BIN_OP_EQ_uxn_device_h_l94_c21_8030
BIN_OP_EQ_uxn_device_h_l94_c21_8030 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l94_c21_8030_left,
BIN_OP_EQ_uxn_device_h_l94_c21_8030_right,
BIN_OP_EQ_uxn_device_h_l94_c21_8030_return_output);

-- MUX_uxn_device_h_l94_c21_c3ad
MUX_uxn_device_h_l94_c21_c3ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l94_c21_c3ad_cond,
MUX_uxn_device_h_l94_c21_c3ad_iftrue,
MUX_uxn_device_h_l94_c21_c3ad_iffalse,
MUX_uxn_device_h_l94_c21_c3ad_return_output);

-- BIN_OP_AND_uxn_device_h_l99_c26_cfe1
BIN_OP_AND_uxn_device_h_l99_c26_cfe1 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l99_c26_cfe1_left,
BIN_OP_AND_uxn_device_h_l99_c26_cfe1_right,
BIN_OP_AND_uxn_device_h_l99_c26_cfe1_return_output);

-- BIN_OP_EQ_uxn_device_h_l99_c71_60df
BIN_OP_EQ_uxn_device_h_l99_c71_60df : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l99_c71_60df_left,
BIN_OP_EQ_uxn_device_h_l99_c71_60df_right,
BIN_OP_EQ_uxn_device_h_l99_c71_60df_return_output);

-- MUX_uxn_device_h_l99_c71_d1f0
MUX_uxn_device_h_l99_c71_d1f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l99_c71_d1f0_cond,
MUX_uxn_device_h_l99_c71_d1f0_iftrue,
MUX_uxn_device_h_l99_c71_d1f0_iffalse,
MUX_uxn_device_h_l99_c71_d1f0_return_output);

-- BIN_OP_OR_uxn_device_h_l99_c61_259f
BIN_OP_OR_uxn_device_h_l99_c61_259f : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l99_c61_259f_left,
BIN_OP_OR_uxn_device_h_l99_c61_259f_right,
BIN_OP_OR_uxn_device_h_l99_c61_259f_return_output);

-- BIN_OP_AND_uxn_device_h_l99_c26_12d7
BIN_OP_AND_uxn_device_h_l99_c26_12d7 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l99_c26_12d7_left,
BIN_OP_AND_uxn_device_h_l99_c26_12d7_right,
BIN_OP_AND_uxn_device_h_l99_c26_12d7_return_output);

-- BIN_OP_PLUS_uxn_device_h_l100_c30_0e9d
BIN_OP_PLUS_uxn_device_h_l100_c30_0e9d : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l100_c30_0e9d_left,
BIN_OP_PLUS_uxn_device_h_l100_c30_0e9d_right,
BIN_OP_PLUS_uxn_device_h_l100_c30_0e9d_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_90f9
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_90f9 : entity work.VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_0CLK_4b00ae23 port map (
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_90f9_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_90f9_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_90f9_return_output);

-- BIN_OP_EQ_uxn_device_h_l101_c7_4fef
BIN_OP_EQ_uxn_device_h_l101_c7_4fef : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l101_c7_4fef_left,
BIN_OP_EQ_uxn_device_h_l101_c7_4fef_right,
BIN_OP_EQ_uxn_device_h_l101_c7_4fef_return_output);

-- BIN_OP_MINUS_uxn_device_h_l101_c41_9558
BIN_OP_MINUS_uxn_device_h_l101_c41_9558 : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l101_c41_9558_left,
BIN_OP_MINUS_uxn_device_h_l101_c41_9558_right,
BIN_OP_MINUS_uxn_device_h_l101_c41_9558_return_output);

-- BIN_OP_PLUS_uxn_device_h_l101_c51_7ab7
BIN_OP_PLUS_uxn_device_h_l101_c51_7ab7 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l101_c51_7ab7_left,
BIN_OP_PLUS_uxn_device_h_l101_c51_7ab7_right,
BIN_OP_PLUS_uxn_device_h_l101_c51_7ab7_return_output);

-- MUX_uxn_device_h_l101_c35_b561
MUX_uxn_device_h_l101_c35_b561 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l101_c35_b561_cond,
MUX_uxn_device_h_l101_c35_b561_iftrue,
MUX_uxn_device_h_l101_c35_b561_iffalse,
MUX_uxn_device_h_l101_c35_b561_return_output);

-- MUX_uxn_device_h_l101_c7_0ff8
MUX_uxn_device_h_l101_c7_0ff8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l101_c7_0ff8_cond,
MUX_uxn_device_h_l101_c7_0ff8_iftrue,
MUX_uxn_device_h_l101_c7_0ff8_iffalse,
MUX_uxn_device_h_l101_c7_0ff8_return_output);

-- BIN_OP_EQ_uxn_device_h_l102_c25_2918
BIN_OP_EQ_uxn_device_h_l102_c25_2918 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l102_c25_2918_left,
BIN_OP_EQ_uxn_device_h_l102_c25_2918_right,
BIN_OP_EQ_uxn_device_h_l102_c25_2918_return_output);

-- MUX_uxn_device_h_l102_c25_809f
MUX_uxn_device_h_l102_c25_809f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l102_c25_809f_cond,
MUX_uxn_device_h_l102_c25_809f_iftrue,
MUX_uxn_device_h_l102_c25_809f_iffalse,
MUX_uxn_device_h_l102_c25_809f_return_output);

-- BIN_OP_PLUS_uxn_device_h_l103_c14_5082
BIN_OP_PLUS_uxn_device_h_l103_c14_5082 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l103_c14_5082_left,
BIN_OP_PLUS_uxn_device_h_l103_c14_5082_right,
BIN_OP_PLUS_uxn_device_h_l103_c14_5082_return_output);

-- BIN_OP_MINUS_uxn_device_h_l103_c24_2a1c
BIN_OP_MINUS_uxn_device_h_l103_c24_2a1c : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l103_c24_2a1c_left,
BIN_OP_MINUS_uxn_device_h_l103_c24_2a1c_right,
BIN_OP_MINUS_uxn_device_h_l103_c24_2a1c_return_output);

-- MUX_uxn_device_h_l103_c8_e261
MUX_uxn_device_h_l103_c8_e261 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l103_c8_e261_cond,
MUX_uxn_device_h_l103_c8_e261_iftrue,
MUX_uxn_device_h_l103_c8_e261_iffalse,
MUX_uxn_device_h_l103_c8_e261_return_output);

-- CONST_SR_1_uxn_device_h_l104_c3_f53a
CONST_SR_1_uxn_device_h_l104_c3_f53a : entity work.CONST_SR_1_uint16_t_0CLK_de264c78 port map (
CONST_SR_1_uxn_device_h_l104_c3_f53a_x,
CONST_SR_1_uxn_device_h_l104_c3_f53a_return_output);



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
 is_x_in_bounds,
 is_y_in_bounds,
 is_new_row,
 -- All submodule outputs
 BIN_OP_MINUS_uxn_device_h_l69_c20_9066_return_output,
 BIN_OP_EQ_uxn_device_h_l71_c6_ba9c_return_output,
 sprite_rows_MUX_uxn_device_h_l71_c2_5c23_return_output,
 VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_482e_return_output,
 BIN_OP_EQ_uxn_device_h_l75_c6_942f_return_output,
 y_MUX_uxn_device_h_l75_c2_4254_return_output,
 x_MUX_uxn_device_h_l75_c2_4254_return_output,
 opaque_MUX_uxn_device_h_l75_c2_4254_return_output,
 BIN_OP_PLUS_uxn_device_h_l76_c21_048b_return_output,
 VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_cbda_return_output,
 MUX_uxn_device_h_l77_c13_4af0_return_output,
 BIN_OP_PLUS_uxn_device_h_l77_c7_1531_return_output,
 MUX_uxn_device_h_l78_c13_463a_return_output,
 BIN_OP_PLUS_uxn_device_h_l78_c7_4b43_return_output,
 BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_return_output,
 y_MUX_uxn_device_h_l81_c2_22c3_return_output,
 x_MUX_uxn_device_h_l81_c2_22c3_return_output,
 ch_MUX_uxn_device_h_l81_c2_22c3_return_output,
 is_x_in_bounds_MUX_uxn_device_h_l81_c2_22c3_return_output,
 is_y_in_bounds_MUX_uxn_device_h_l81_c2_22c3_return_output,
 c_MUX_uxn_device_h_l81_c2_22c3_return_output,
 is_new_row_MUX_uxn_device_h_l81_c2_22c3_return_output,
 result_is_vram_write_MUX_uxn_device_h_l81_c2_22c3_return_output,
 result_u8_value_MUX_uxn_device_h_l81_c2_22c3_return_output,
 result_u16_addr_MUX_uxn_device_h_l81_c2_22c3_return_output,
 result_is_blit_done_MUX_uxn_device_h_l81_c2_22c3_return_output,
 BIN_OP_PLUS_uxn_device_h_l85_c21_62bc_return_output,
 BIN_OP_EQ_uxn_device_h_l87_c16_7fdd_return_output,
 MUX_uxn_device_h_l87_c16_4693_return_output,
 c_MUX_uxn_device_h_l88_c3_9a58_return_output,
 BIN_OP_PLUS_uxn_device_h_l89_c38_eb27_return_output,
 VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_3c18_return_output,
 BIN_OP_MINUS_uxn_device_h_l90_c38_7bc3_return_output,
 VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_8007_return_output,
 MUX_uxn_device_h_l92_c27_aed0_return_output,
 BIN_OP_PLUS_uxn_device_h_l92_c21_b033_return_output,
 MUX_uxn_device_h_l92_c7_fefa_return_output,
 BIN_OP_EQ_uxn_device_h_l93_c21_cdcd_return_output,
 MUX_uxn_device_h_l93_c21_ed90_return_output,
 BIN_OP_EQ_uxn_device_h_l94_c21_8030_return_output,
 MUX_uxn_device_h_l94_c21_c3ad_return_output,
 BIN_OP_AND_uxn_device_h_l99_c26_cfe1_return_output,
 BIN_OP_EQ_uxn_device_h_l99_c71_60df_return_output,
 MUX_uxn_device_h_l99_c71_d1f0_return_output,
 BIN_OP_OR_uxn_device_h_l99_c61_259f_return_output,
 BIN_OP_AND_uxn_device_h_l99_c26_12d7_return_output,
 BIN_OP_PLUS_uxn_device_h_l100_c30_0e9d_return_output,
 VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_90f9_return_output,
 BIN_OP_EQ_uxn_device_h_l101_c7_4fef_return_output,
 BIN_OP_MINUS_uxn_device_h_l101_c41_9558_return_output,
 BIN_OP_PLUS_uxn_device_h_l101_c51_7ab7_return_output,
 MUX_uxn_device_h_l101_c35_b561_return_output,
 MUX_uxn_device_h_l101_c7_0ff8_return_output,
 BIN_OP_EQ_uxn_device_h_l102_c25_2918_return_output,
 MUX_uxn_device_h_l102_c25_809f_return_output,
 BIN_OP_PLUS_uxn_device_h_l103_c14_5082_return_output,
 BIN_OP_MINUS_uxn_device_h_l103_c24_2a1c_return_output,
 MUX_uxn_device_h_l103_c8_e261_return_output,
 CONST_SR_1_uxn_device_h_l104_c3_f53a_return_output)
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
 variable VAR_color8_uxn_device_h_l64_c2_04a4 : unsigned(7 downto 0);
 variable VAR_uint12_7_4_uxn_device_h_l65_c20_9b2b_return_output : unsigned(3 downto 0);
 variable VAR_phase7_downto_3_uxn_device_h_l66_c2_3f87 : unsigned(4 downto 0);
 variable VAR_uint12_7_3_uxn_device_h_l66_c20_66af_return_output : unsigned(4 downto 0);
 variable VAR_uint12_2_0_uxn_device_h_l67_c20_fda3_return_output : unsigned(2 downto 0);
 variable VAR_phase7_downto_3_u8_uxn_device_h_l68_c2_0e2b : unsigned(7 downto 0);
 variable VAR_phase_minus_two_uxn_device_h_l69_c2_d36b : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_9066_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_9066_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_9066_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l71_c6_ba9c_left : unsigned(3 downto 0);
 variable VAR_uint12_7_4_uxn_device_h_l71_c6_8a33_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l71_c6_ba9c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l71_c6_ba9c_return_output : unsigned(0 downto 0);
 variable VAR_sprite_rows_MUX_uxn_device_h_l71_c2_5c23_iftrue : uint8_t_16;
 variable VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5_uxn_device_h_l71_c2_5c23_return_output : uint8_t_16;
 variable VAR_sprite_rows_MUX_uxn_device_h_l71_c2_5c23_iffalse : uint8_t_16;
 variable VAR_sprite_rows_MUX_uxn_device_h_l71_c2_5c23_return_output : uint8_t_16;
 variable VAR_sprite_rows_MUX_uxn_device_h_l71_c2_5c23_cond : unsigned(0 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_482e_return_output : uint8_t_array_16_t;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_482e_elem_val : unsigned(7 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_482e_ref_toks_0 : uint8_t_16;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_482e_var_dim_0 : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l75_c6_942f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l75_c6_942f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l75_c6_942f_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c2_4254_iftrue : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l78_c3_e718 : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c2_4254_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c2_4254_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c2_4254_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c2_4254_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l77_c3_486d : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c2_4254_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c2_4254_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c2_4254_cond : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l75_c2_4254_iftrue : unsigned(0 downto 0);
 variable VAR_opaque_uxn_device_h_l76_c3_8d70 : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l75_c2_4254_iffalse : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l75_c2_4254_return_output : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l75_c2_4254_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_048b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_048b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_048b_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_cbda_var_dim_0 : unsigned(6 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_cbda_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_cbda_ref_toks_0 : uint8_t_80;
 variable VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_1531_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l77_c13_4af0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l77_c13_4af0_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l77_c13_4af0_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l77_c13_4af0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_1531_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_1531_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_4b43_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l78_c13_463a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l78_c13_463a_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l78_c13_463a_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l78_c13_463a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_4b43_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_4b43_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c2_22c3_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c2_22c3_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c2_22c3_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c2_22c3_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c2_22c3_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c2_22c3_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c2_22c3_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c2_22c3_cond : unsigned(0 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l81_c2_22c3_iftrue : unsigned(7 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l81_c2_22c3_iffalse : unsigned(7 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l81_c2_22c3_return_output : unsigned(7 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l81_c2_22c3_cond : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l81_c2_22c3_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l81_c2_22c3_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l81_c2_22c3_return_output : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l81_c2_22c3_cond : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l81_c2_22c3_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l81_c2_22c3_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l81_c2_22c3_return_output : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l81_c2_22c3_cond : unsigned(0 downto 0);
 variable VAR_c_MUX_uxn_device_h_l81_c2_22c3_iftrue : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l81_c2_22c3_iffalse : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l81_c2_22c3_return_output : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l81_c2_22c3_cond : unsigned(0 downto 0);
 variable VAR_is_new_row_MUX_uxn_device_h_l81_c2_22c3_iftrue : unsigned(0 downto 0);
 variable VAR_is_new_row_MUX_uxn_device_h_l81_c2_22c3_iffalse : unsigned(0 downto 0);
 variable VAR_is_new_row_MUX_uxn_device_h_l81_c2_22c3_return_output : unsigned(0 downto 0);
 variable VAR_is_new_row_MUX_uxn_device_h_l81_c2_22c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_22c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_22c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_22c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_22c3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l81_c2_22c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l83_c3_e5c2 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l81_c2_22c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l81_c2_22c3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l81_c2_22c3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_22c3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l85_c3_1158 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_22c3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_22c3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_22c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_22c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_22c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_22c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_22c3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_62bc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_62bc_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_62bc_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l87_c16_4693_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l87_c16_7fdd_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l87_c16_7fdd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l87_c16_7fdd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l87_c16_4693_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l87_c16_4693_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l87_c16_4693_return_output : unsigned(0 downto 0);
 variable VAR_c_MUX_uxn_device_h_l88_c3_9a58_iftrue : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l88_c3_9a58_iffalse : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l88_c3_9a58_return_output : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l88_c3_9a58_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l89_c38_eb27_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l89_c38_eb27_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l89_c38_eb27_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_3c18_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_3c18_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_3c18_ref_toks_0 : uint8_t_16;
 variable VAR_uint16_uint8_8_uxn_device_h_l89_c8_e235_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l90_c38_7bc3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l90_c38_7bc3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l90_c38_7bc3_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_8007_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_8007_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_8007_ref_toks_0 : uint8_t_16;
 variable VAR_uint16_uint8_0_uxn_device_h_l90_c8_1e22_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c7_fefa_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c7_fefa_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c7_fefa_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l92_c21_b033_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c27_aed0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c27_aed0_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c27_aed0_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c27_aed0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l92_c21_b033_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l92_c21_b033_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c7_fefa_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l93_c21_ed90_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l93_c21_cdcd_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_device_h_l93_c21_4c94_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l93_c21_cdcd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l93_c21_cdcd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l93_c21_ed90_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l93_c21_ed90_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l93_c21_ed90_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l94_c21_c3ad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l94_c21_8030_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_device_h_l94_c21_fe2a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l94_c21_8030_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l94_c21_8030_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l94_c21_c3ad_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l94_c21_c3ad_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l94_c21_c3ad_return_output : unsigned(0 downto 0);
 variable VAR_uint16_8_8_uxn_device_h_l95_c25_f1da_return_output : unsigned(0 downto 0);
 variable VAR_uint8_uint1_5_uxn_device_h_l95_c8_1d8b_return_output : unsigned(7 downto 0);
 variable VAR_uint16_0_0_uxn_device_h_l96_c26_dfc3_return_output : unsigned(0 downto 0);
 variable VAR_uint8_uint1_4_uxn_device_h_l96_c8_24bc_return_output : unsigned(7 downto 0);
 variable VAR_uint16_7_0_uxn_device_h_l97_c39_5b33_return_output : unsigned(7 downto 0);
 variable VAR_uint16_uint8_8_uxn_device_h_l97_c21_1cb8_return_output : unsigned(15 downto 0);
 variable VAR_uint16_7_0_uxn_device_h_l98_c53_8811_return_output : unsigned(7 downto 0);
 variable VAR_uint16_uint8_0_uxn_device_h_l98_c21_6f73_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l99_c26_cfe1_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l99_c26_cfe1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l99_c26_cfe1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l99_c26_12d7_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l99_c61_259f_left : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l99_c71_d1f0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c71_60df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c71_60df_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c71_60df_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l99_c71_d1f0_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l99_c71_d1f0_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l99_c71_d1f0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l99_c61_259f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l99_c61_259f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l99_c26_12d7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l99_c26_12d7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l100_c30_0e9d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l100_c30_0e9d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l100_c30_0e9d_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_90f9_var_dim_0 : unsigned(6 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_90f9_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_90f9_ref_toks_0 : uint8_t_80;
 variable VAR_MUX_uxn_device_h_l101_c7_0ff8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c7_4fef_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c7_4fef_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c7_4fef_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l101_c7_0ff8_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l101_c7_0ff8_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l101_c35_b561_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l101_c35_b561_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l101_c35_b561_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l101_c41_9558_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l101_c41_9558_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l101_c41_9558_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l101_c51_7ab7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l101_c51_7ab7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l101_c51_7ab7_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l101_c35_b561_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l101_c7_0ff8_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l102_c25_809f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l102_c25_2918_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l102_c25_2918_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l102_c25_2918_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l102_c25_809f_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l102_c25_809f_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l102_c25_809f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c8_e261_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c8_e261_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c8_e261_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l103_c14_5082_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l103_c14_5082_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l103_c14_5082_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l103_c24_2a1c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l103_c24_2a1c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l103_c24_2a1c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c8_e261_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l104_c3_f53a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l104_c3_f53a_x : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_15f2_uxn_device_h_l42_l107_DUPLICATE_77d7_return_output : screen_blit_result_t;
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
variable REG_VAR_is_x_in_bounds : unsigned(0 downto 0);
variable REG_VAR_is_y_in_bounds : unsigned(0 downto 0);
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
  REG_VAR_is_x_in_bounds := is_x_in_bounds;
  REG_VAR_is_y_in_bounds := is_y_in_bounds;
  REG_VAR_is_new_row := is_new_row;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_device_h_l71_c6_ba9c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l87_c16_7fdd_right := to_unsigned(0, 2);
     VAR_MUX_uxn_device_h_l77_c13_4af0_iffalse := to_unsigned(7, 16);
     VAR_MUX_uxn_device_h_l78_c13_463a_iffalse := to_unsigned(0, 16);
     VAR_BIN_OP_EQ_uxn_device_h_l102_c25_2918_right := to_unsigned(79, 12);
     VAR_MUX_uxn_device_h_l94_c21_c3ad_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l99_c71_d1f0_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l93_c21_ed90_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l90_c38_7bc3_right := to_unsigned(2, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l102_c25_809f_iftrue := to_unsigned(1, 1);
     VAR_result_u8_value_uxn_device_h_l83_c3_e5c2 := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l81_c2_22c3_iftrue := VAR_result_u8_value_uxn_device_h_l83_c3_e5c2;
     VAR_MUX_uxn_device_h_l102_c25_809f_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l94_c21_c3ad_iffalse := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_22c3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_048b_left := to_unsigned(64, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l75_c6_942f_right := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_9066_right := to_unsigned(2, 2);
     VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_22c3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l99_c71_60df_right := to_unsigned(0, 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l103_c14_5082_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l93_c21_cdcd_right := to_unsigned(0, 8);
     VAR_BIN_OP_MINUS_uxn_device_h_l101_c41_9558_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l101_c51_7ab7_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l101_c7_4fef_right := to_unsigned(7, 3);
     VAR_MUX_uxn_device_h_l87_c16_4693_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l77_c13_4af0_iftrue := to_unsigned(0, 16);
     VAR_MUX_uxn_device_h_l99_c71_d1f0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l89_c38_eb27_right := to_unsigned(6, 8);
     VAR_MUX_uxn_device_h_l78_c13_463a_iftrue := to_unsigned(7, 16);
     VAR_MUX_uxn_device_h_l93_c21_ed90_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l94_c21_8030_right := to_unsigned(0, 8);
     VAR_MUX_uxn_device_h_l92_c27_aed0_iffalse := to_unsigned(7, 16);
     VAR_BIN_OP_MINUS_uxn_device_h_l103_c24_2a1c_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l87_c16_4693_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l92_c27_aed0_iftrue := to_unsigned(0, 16);

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
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_90f9_ref_toks_0 := blending;
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_cbda_ref_toks_0 := blending;
     REG_VAR_blending := blending;
     VAR_c_MUX_uxn_device_h_l81_c2_22c3_iftrue := c;
     VAR_c_MUX_uxn_device_h_l88_c3_9a58_iffalse := c;
     VAR_ch_MUX_uxn_device_h_l81_c2_22c3_iftrue := ch;
     VAR_color8_uxn_device_h_l64_c2_04a4 := resize(VAR_color, 8);
     VAR_MUX_uxn_device_h_l103_c8_e261_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l77_c13_4af0_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l92_c27_aed0_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l101_c35_b561_cond := VAR_fy;
     VAR_MUX_uxn_device_h_l78_c13_463a_cond := VAR_fy;
     VAR_is_new_row_MUX_uxn_device_h_l81_c2_22c3_iftrue := is_new_row;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l81_c2_22c3_iftrue := is_x_in_bounds;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l81_c2_22c3_iftrue := is_y_in_bounds;
     VAR_opaque_MUX_uxn_device_h_l75_c2_4254_iffalse := opaque;
     VAR_BIN_OP_EQ_uxn_device_h_l102_c25_2918_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l75_c6_942f_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_9066_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_62bc_right := VAR_phase;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_482e_elem_val := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_62bc_left := VAR_ram_addr;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_482e_ref_toks_0 := sprite_rows;
     VAR_sprite_rows_MUX_uxn_device_h_l71_c2_5c23_iffalse := sprite_rows;
     VAR_x_MUX_uxn_device_h_l75_c2_4254_iffalse := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_1531_left := VAR_x1;
     VAR_BIN_OP_PLUS_uxn_device_h_l92_c21_b033_left := VAR_x1;
     VAR_y_MUX_uxn_device_h_l75_c2_4254_iffalse := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_4b43_left := VAR_y1;
     VAR_BIN_OP_PLUS_uxn_device_h_l100_c30_0e9d_left := VAR_color8_uxn_device_h_l64_c2_04a4;
     VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_048b_right := VAR_color8_uxn_device_h_l64_c2_04a4;
     REG_VAR_color8 := VAR_color8_uxn_device_h_l64_c2_04a4;
     -- BIN_OP_MINUS[uxn_device_h_l69_c20_9066] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l69_c20_9066_left <= VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_9066_left;
     BIN_OP_MINUS_uxn_device_h_l69_c20_9066_right <= VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_9066_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_9066_return_output := BIN_OP_MINUS_uxn_device_h_l69_c20_9066_return_output;

     -- MUX[uxn_device_h_l77_c13_4af0] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l77_c13_4af0_cond <= VAR_MUX_uxn_device_h_l77_c13_4af0_cond;
     MUX_uxn_device_h_l77_c13_4af0_iftrue <= VAR_MUX_uxn_device_h_l77_c13_4af0_iftrue;
     MUX_uxn_device_h_l77_c13_4af0_iffalse <= VAR_MUX_uxn_device_h_l77_c13_4af0_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l77_c13_4af0_return_output := MUX_uxn_device_h_l77_c13_4af0_return_output;

     -- uint12_2_0[uxn_device_h_l67_c20_fda3] LATENCY=0
     VAR_uint12_2_0_uxn_device_h_l67_c20_fda3_return_output := uint12_2_0(
     VAR_phase);

     -- BIN_OP_EQ[uxn_device_h_l102_c25_2918] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l102_c25_2918_left <= VAR_BIN_OP_EQ_uxn_device_h_l102_c25_2918_left;
     BIN_OP_EQ_uxn_device_h_l102_c25_2918_right <= VAR_BIN_OP_EQ_uxn_device_h_l102_c25_2918_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l102_c25_2918_return_output := BIN_OP_EQ_uxn_device_h_l102_c25_2918_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l85_c21_62bc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l85_c21_62bc_left <= VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_62bc_left;
     BIN_OP_PLUS_uxn_device_h_l85_c21_62bc_right <= VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_62bc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_62bc_return_output := BIN_OP_PLUS_uxn_device_h_l85_c21_62bc_return_output;

     -- BIN_OP_EQ[uxn_device_h_l75_c6_942f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l75_c6_942f_left <= VAR_BIN_OP_EQ_uxn_device_h_l75_c6_942f_left;
     BIN_OP_EQ_uxn_device_h_l75_c6_942f_right <= VAR_BIN_OP_EQ_uxn_device_h_l75_c6_942f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l75_c6_942f_return_output := BIN_OP_EQ_uxn_device_h_l75_c6_942f_return_output;

     -- MUX[uxn_device_h_l92_c27_aed0] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l92_c27_aed0_cond <= VAR_MUX_uxn_device_h_l92_c27_aed0_cond;
     MUX_uxn_device_h_l92_c27_aed0_iftrue <= VAR_MUX_uxn_device_h_l92_c27_aed0_iftrue;
     MUX_uxn_device_h_l92_c27_aed0_iffalse <= VAR_MUX_uxn_device_h_l92_c27_aed0_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l92_c27_aed0_return_output := MUX_uxn_device_h_l92_c27_aed0_return_output;

     -- MUX[uxn_device_h_l78_c13_463a] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l78_c13_463a_cond <= VAR_MUX_uxn_device_h_l78_c13_463a_cond;
     MUX_uxn_device_h_l78_c13_463a_iftrue <= VAR_MUX_uxn_device_h_l78_c13_463a_iftrue;
     MUX_uxn_device_h_l78_c13_463a_iffalse <= VAR_MUX_uxn_device_h_l78_c13_463a_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l78_c13_463a_return_output := MUX_uxn_device_h_l78_c13_463a_return_output;

     -- uint12_7_3[uxn_device_h_l66_c20_66af] LATENCY=0
     VAR_uint12_7_3_uxn_device_h_l66_c20_66af_return_output := uint12_7_3(
     VAR_phase);

     -- BIN_OP_PLUS[uxn_device_h_l76_c21_048b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l76_c21_048b_left <= VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_048b_left;
     BIN_OP_PLUS_uxn_device_h_l76_c21_048b_right <= VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_048b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_048b_return_output := BIN_OP_PLUS_uxn_device_h_l76_c21_048b_return_output;

     -- uint12_7_4[uxn_device_h_l65_c20_9b2b] LATENCY=0
     VAR_uint12_7_4_uxn_device_h_l65_c20_9b2b_return_output := uint12_7_4(
     VAR_phase);

     -- Submodule level 1
     VAR_MUX_uxn_device_h_l102_c25_809f_cond := VAR_BIN_OP_EQ_uxn_device_h_l102_c25_2918_return_output;
     VAR_opaque_MUX_uxn_device_h_l75_c2_4254_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c6_942f_return_output;
     VAR_x_MUX_uxn_device_h_l75_c2_4254_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c6_942f_return_output;
     VAR_y_MUX_uxn_device_h_l75_c2_4254_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c6_942f_return_output;
     VAR_phase_minus_two_uxn_device_h_l69_c2_d36b := VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_9066_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_cbda_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_048b_return_output, 7);
     VAR_result_u16_addr_uxn_device_h_l85_c3_1158 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_62bc_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_1531_right := VAR_MUX_uxn_device_h_l77_c13_4af0_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_4b43_right := VAR_MUX_uxn_device_h_l78_c13_463a_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l92_c21_b033_right := VAR_MUX_uxn_device_h_l92_c27_aed0_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l101_c7_4fef_left := VAR_uint12_2_0_uxn_device_h_l67_c20_fda3_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l87_c16_7fdd_left := VAR_uint12_2_0_uxn_device_h_l67_c20_fda3_return_output;
     REG_VAR_phase2_downto_0 := VAR_uint12_2_0_uxn_device_h_l67_c20_fda3_return_output;
     VAR_phase7_downto_3_uxn_device_h_l66_c2_3f87 := VAR_uint12_7_3_uxn_device_h_l66_c20_66af_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_left := VAR_uint12_7_4_uxn_device_h_l65_c20_9b2b_return_output;
     REG_VAR_phase7_downto_4 := VAR_uint12_7_4_uxn_device_h_l65_c20_9b2b_return_output;
     REG_VAR_phase7_downto_3 := VAR_phase7_downto_3_uxn_device_h_l66_c2_3f87;
     VAR_phase7_downto_3_u8_uxn_device_h_l68_c2_0e2b := resize(VAR_phase7_downto_3_uxn_device_h_l66_c2_3f87, 8);
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_482e_var_dim_0 := resize(VAR_phase_minus_two_uxn_device_h_l69_c2_d36b, 4);
     REG_VAR_phase_minus_two := VAR_phase_minus_two_uxn_device_h_l69_c2_d36b;
     VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_22c3_iftrue := VAR_result_u16_addr_uxn_device_h_l85_c3_1158;
     VAR_BIN_OP_MINUS_uxn_device_h_l90_c38_7bc3_left := VAR_phase7_downto_3_u8_uxn_device_h_l68_c2_0e2b;
     VAR_BIN_OP_PLUS_uxn_device_h_l89_c38_eb27_left := VAR_phase7_downto_3_u8_uxn_device_h_l68_c2_0e2b;
     REG_VAR_phase7_downto_3_u8 := VAR_phase7_downto_3_u8_uxn_device_h_l68_c2_0e2b;
     -- BIN_OP_PLUS[uxn_device_h_l89_c38_eb27] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l89_c38_eb27_left <= VAR_BIN_OP_PLUS_uxn_device_h_l89_c38_eb27_left;
     BIN_OP_PLUS_uxn_device_h_l89_c38_eb27_right <= VAR_BIN_OP_PLUS_uxn_device_h_l89_c38_eb27_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l89_c38_eb27_return_output := BIN_OP_PLUS_uxn_device_h_l89_c38_eb27_return_output;

     -- VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60[uxn_device_h_l72_c3_482e] LATENCY=0
     -- Inputs
     VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_482e_elem_val <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_482e_elem_val;
     VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_482e_ref_toks_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_482e_ref_toks_0;
     VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_482e_var_dim_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_482e_var_dim_0;
     -- Outputs
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_482e_return_output := VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_482e_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l92_c21_b033] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l92_c21_b033_left <= VAR_BIN_OP_PLUS_uxn_device_h_l92_c21_b033_left;
     BIN_OP_PLUS_uxn_device_h_l92_c21_b033_right <= VAR_BIN_OP_PLUS_uxn_device_h_l92_c21_b033_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l92_c21_b033_return_output := BIN_OP_PLUS_uxn_device_h_l92_c21_b033_return_output;

     -- BIN_OP_EQ[uxn_device_h_l87_c16_7fdd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l87_c16_7fdd_left <= VAR_BIN_OP_EQ_uxn_device_h_l87_c16_7fdd_left;
     BIN_OP_EQ_uxn_device_h_l87_c16_7fdd_right <= VAR_BIN_OP_EQ_uxn_device_h_l87_c16_7fdd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l87_c16_7fdd_return_output := BIN_OP_EQ_uxn_device_h_l87_c16_7fdd_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l90_c38_7bc3] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l90_c38_7bc3_left <= VAR_BIN_OP_MINUS_uxn_device_h_l90_c38_7bc3_left;
     BIN_OP_MINUS_uxn_device_h_l90_c38_7bc3_right <= VAR_BIN_OP_MINUS_uxn_device_h_l90_c38_7bc3_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l90_c38_7bc3_return_output := BIN_OP_MINUS_uxn_device_h_l90_c38_7bc3_return_output;

     -- uint12_7_4[uxn_device_h_l71_c6_8a33] LATENCY=0
     VAR_uint12_7_4_uxn_device_h_l71_c6_8a33_return_output := uint12_7_4(
     VAR_phase_minus_two_uxn_device_h_l69_c2_d36b);

     -- MUX[uxn_device_h_l102_c25_809f] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l102_c25_809f_cond <= VAR_MUX_uxn_device_h_l102_c25_809f_cond;
     MUX_uxn_device_h_l102_c25_809f_iftrue <= VAR_MUX_uxn_device_h_l102_c25_809f_iftrue;
     MUX_uxn_device_h_l102_c25_809f_iffalse <= VAR_MUX_uxn_device_h_l102_c25_809f_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l102_c25_809f_return_output := MUX_uxn_device_h_l102_c25_809f_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l77_c7_1531] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l77_c7_1531_left <= VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_1531_left;
     BIN_OP_PLUS_uxn_device_h_l77_c7_1531_right <= VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_1531_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_1531_return_output := BIN_OP_PLUS_uxn_device_h_l77_c7_1531_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l78_c7_4b43] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l78_c7_4b43_left <= VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_4b43_left;
     BIN_OP_PLUS_uxn_device_h_l78_c7_4b43_right <= VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_4b43_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_4b43_return_output := BIN_OP_PLUS_uxn_device_h_l78_c7_4b43_return_output;

     -- BIN_OP_EQ[uxn_device_h_l81_c6_e0c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_left <= VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_left;
     BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_right <= VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_return_output := BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l76_c12_cbda] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_cbda_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_cbda_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_cbda_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_cbda_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_cbda_return_output := VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_cbda_return_output;

     -- BIN_OP_EQ[uxn_device_h_l101_c7_4fef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l101_c7_4fef_left <= VAR_BIN_OP_EQ_uxn_device_h_l101_c7_4fef_left;
     BIN_OP_EQ_uxn_device_h_l101_c7_4fef_right <= VAR_BIN_OP_EQ_uxn_device_h_l101_c7_4fef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l101_c7_4fef_return_output := BIN_OP_EQ_uxn_device_h_l101_c7_4fef_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l101_c7_0ff8_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c7_4fef_return_output;
     VAR_c_MUX_uxn_device_h_l81_c2_22c3_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_return_output;
     VAR_ch_MUX_uxn_device_h_l81_c2_22c3_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_return_output;
     VAR_is_new_row_MUX_uxn_device_h_l81_c2_22c3_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l81_c2_22c3_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l81_c2_22c3_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_return_output;
     VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_22c3_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_22c3_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_22c3_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l81_c2_22c3_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_return_output;
     VAR_x_MUX_uxn_device_h_l81_c2_22c3_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_return_output;
     VAR_y_MUX_uxn_device_h_l81_c2_22c3_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_e0c1_return_output;
     VAR_MUX_uxn_device_h_l87_c16_4693_cond := VAR_BIN_OP_EQ_uxn_device_h_l87_c16_7fdd_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_8007_var_dim_0 := resize(VAR_BIN_OP_MINUS_uxn_device_h_l90_c38_7bc3_return_output, 4);
     VAR_x_uxn_device_h_l77_c3_486d := resize(VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_1531_return_output, 16);
     VAR_y_uxn_device_h_l78_c3_e718 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_4b43_return_output, 16);
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_3c18_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l89_c38_eb27_return_output, 4);
     VAR_MUX_uxn_device_h_l92_c7_fefa_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l92_c21_b033_return_output, 16);
     VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_22c3_iffalse := VAR_MUX_uxn_device_h_l102_c25_809f_return_output;
     VAR_opaque_uxn_device_h_l76_c3_8d70 := resize(VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_cbda_return_output, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l71_c6_ba9c_left := VAR_uint12_7_4_uxn_device_h_l71_c6_8a33_return_output;
     VAR_opaque_MUX_uxn_device_h_l75_c2_4254_iftrue := VAR_opaque_uxn_device_h_l76_c3_8d70;
     VAR_x_MUX_uxn_device_h_l75_c2_4254_iftrue := VAR_x_uxn_device_h_l77_c3_486d;
     VAR_y_MUX_uxn_device_h_l75_c2_4254_iftrue := VAR_y_uxn_device_h_l78_c3_e718;
     -- x_MUX[uxn_device_h_l75_c2_4254] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l75_c2_4254_cond <= VAR_x_MUX_uxn_device_h_l75_c2_4254_cond;
     x_MUX_uxn_device_h_l75_c2_4254_iftrue <= VAR_x_MUX_uxn_device_h_l75_c2_4254_iftrue;
     x_MUX_uxn_device_h_l75_c2_4254_iffalse <= VAR_x_MUX_uxn_device_h_l75_c2_4254_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l75_c2_4254_return_output := x_MUX_uxn_device_h_l75_c2_4254_return_output;

     -- result_is_blit_done_MUX[uxn_device_h_l81_c2_22c3] LATENCY=0
     -- Inputs
     result_is_blit_done_MUX_uxn_device_h_l81_c2_22c3_cond <= VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_22c3_cond;
     result_is_blit_done_MUX_uxn_device_h_l81_c2_22c3_iftrue <= VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_22c3_iftrue;
     result_is_blit_done_MUX_uxn_device_h_l81_c2_22c3_iffalse <= VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_22c3_iffalse;
     -- Outputs
     VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_22c3_return_output := result_is_blit_done_MUX_uxn_device_h_l81_c2_22c3_return_output;

     -- opaque_MUX[uxn_device_h_l75_c2_4254] LATENCY=0
     -- Inputs
     opaque_MUX_uxn_device_h_l75_c2_4254_cond <= VAR_opaque_MUX_uxn_device_h_l75_c2_4254_cond;
     opaque_MUX_uxn_device_h_l75_c2_4254_iftrue <= VAR_opaque_MUX_uxn_device_h_l75_c2_4254_iftrue;
     opaque_MUX_uxn_device_h_l75_c2_4254_iffalse <= VAR_opaque_MUX_uxn_device_h_l75_c2_4254_iffalse;
     -- Outputs
     VAR_opaque_MUX_uxn_device_h_l75_c2_4254_return_output := opaque_MUX_uxn_device_h_l75_c2_4254_return_output;

     -- MUX[uxn_device_h_l87_c16_4693] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l87_c16_4693_cond <= VAR_MUX_uxn_device_h_l87_c16_4693_cond;
     MUX_uxn_device_h_l87_c16_4693_iftrue <= VAR_MUX_uxn_device_h_l87_c16_4693_iftrue;
     MUX_uxn_device_h_l87_c16_4693_iffalse <= VAR_MUX_uxn_device_h_l87_c16_4693_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l87_c16_4693_return_output := MUX_uxn_device_h_l87_c16_4693_return_output;

     -- BIN_OP_EQ[uxn_device_h_l71_c6_ba9c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l71_c6_ba9c_left <= VAR_BIN_OP_EQ_uxn_device_h_l71_c6_ba9c_left;
     BIN_OP_EQ_uxn_device_h_l71_c6_ba9c_right <= VAR_BIN_OP_EQ_uxn_device_h_l71_c6_ba9c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l71_c6_ba9c_return_output := BIN_OP_EQ_uxn_device_h_l71_c6_ba9c_return_output;

     -- sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5[uxn_device_h_l71_c2_5c23] LATENCY=0
     VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5_uxn_device_h_l71_c2_5c23_return_output := CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5(
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_482e_return_output);

     -- y_MUX[uxn_device_h_l75_c2_4254] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l75_c2_4254_cond <= VAR_y_MUX_uxn_device_h_l75_c2_4254_cond;
     y_MUX_uxn_device_h_l75_c2_4254_iftrue <= VAR_y_MUX_uxn_device_h_l75_c2_4254_iftrue;
     y_MUX_uxn_device_h_l75_c2_4254_iffalse <= VAR_y_MUX_uxn_device_h_l75_c2_4254_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l75_c2_4254_return_output := y_MUX_uxn_device_h_l75_c2_4254_return_output;

     -- Submodule level 3
     VAR_sprite_rows_MUX_uxn_device_h_l71_c2_5c23_cond := VAR_BIN_OP_EQ_uxn_device_h_l71_c6_ba9c_return_output;
     VAR_MUX_uxn_device_h_l92_c7_fefa_cond := VAR_MUX_uxn_device_h_l87_c16_4693_return_output;
     VAR_c_MUX_uxn_device_h_l88_c3_9a58_cond := VAR_MUX_uxn_device_h_l87_c16_4693_return_output;
     VAR_is_new_row_MUX_uxn_device_h_l81_c2_22c3_iffalse := VAR_MUX_uxn_device_h_l87_c16_4693_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l99_c61_259f_left := VAR_opaque_MUX_uxn_device_h_l75_c2_4254_return_output;
     REG_VAR_opaque := VAR_opaque_MUX_uxn_device_h_l75_c2_4254_return_output;
     VAR_sprite_rows_MUX_uxn_device_h_l71_c2_5c23_iftrue := VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5_uxn_device_h_l71_c2_5c23_return_output;
     VAR_MUX_uxn_device_h_l92_c7_fefa_iffalse := VAR_x_MUX_uxn_device_h_l75_c2_4254_return_output;
     VAR_x_MUX_uxn_device_h_l81_c2_22c3_iftrue := VAR_x_MUX_uxn_device_h_l75_c2_4254_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l101_c41_9558_left := VAR_y_MUX_uxn_device_h_l75_c2_4254_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l101_c51_7ab7_left := VAR_y_MUX_uxn_device_h_l75_c2_4254_return_output;
     VAR_MUX_uxn_device_h_l101_c7_0ff8_iffalse := VAR_y_MUX_uxn_device_h_l75_c2_4254_return_output;
     VAR_y_MUX_uxn_device_h_l81_c2_22c3_iftrue := VAR_y_MUX_uxn_device_h_l75_c2_4254_return_output;
     -- uint16_15_8[uxn_device_h_l94_c21_fe2a] LATENCY=0
     VAR_uint16_15_8_uxn_device_h_l94_c21_fe2a_return_output := uint16_15_8(
     VAR_y_MUX_uxn_device_h_l75_c2_4254_return_output);

     -- is_new_row_MUX[uxn_device_h_l81_c2_22c3] LATENCY=0
     -- Inputs
     is_new_row_MUX_uxn_device_h_l81_c2_22c3_cond <= VAR_is_new_row_MUX_uxn_device_h_l81_c2_22c3_cond;
     is_new_row_MUX_uxn_device_h_l81_c2_22c3_iftrue <= VAR_is_new_row_MUX_uxn_device_h_l81_c2_22c3_iftrue;
     is_new_row_MUX_uxn_device_h_l81_c2_22c3_iffalse <= VAR_is_new_row_MUX_uxn_device_h_l81_c2_22c3_iffalse;
     -- Outputs
     VAR_is_new_row_MUX_uxn_device_h_l81_c2_22c3_return_output := is_new_row_MUX_uxn_device_h_l81_c2_22c3_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l101_c51_7ab7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l101_c51_7ab7_left <= VAR_BIN_OP_PLUS_uxn_device_h_l101_c51_7ab7_left;
     BIN_OP_PLUS_uxn_device_h_l101_c51_7ab7_right <= VAR_BIN_OP_PLUS_uxn_device_h_l101_c51_7ab7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l101_c51_7ab7_return_output := BIN_OP_PLUS_uxn_device_h_l101_c51_7ab7_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l101_c41_9558] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l101_c41_9558_left <= VAR_BIN_OP_MINUS_uxn_device_h_l101_c41_9558_left;
     BIN_OP_MINUS_uxn_device_h_l101_c41_9558_right <= VAR_BIN_OP_MINUS_uxn_device_h_l101_c41_9558_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l101_c41_9558_return_output := BIN_OP_MINUS_uxn_device_h_l101_c41_9558_return_output;

     -- uint16_7_0[uxn_device_h_l97_c39_5b33] LATENCY=0
     VAR_uint16_7_0_uxn_device_h_l97_c39_5b33_return_output := uint16_7_0(
     VAR_y_MUX_uxn_device_h_l75_c2_4254_return_output);

     -- sprite_rows_MUX[uxn_device_h_l71_c2_5c23] LATENCY=0
     -- Inputs
     sprite_rows_MUX_uxn_device_h_l71_c2_5c23_cond <= VAR_sprite_rows_MUX_uxn_device_h_l71_c2_5c23_cond;
     sprite_rows_MUX_uxn_device_h_l71_c2_5c23_iftrue <= VAR_sprite_rows_MUX_uxn_device_h_l71_c2_5c23_iftrue;
     sprite_rows_MUX_uxn_device_h_l71_c2_5c23_iffalse <= VAR_sprite_rows_MUX_uxn_device_h_l71_c2_5c23_iffalse;
     -- Outputs
     VAR_sprite_rows_MUX_uxn_device_h_l71_c2_5c23_return_output := sprite_rows_MUX_uxn_device_h_l71_c2_5c23_return_output;

     -- MUX[uxn_device_h_l92_c7_fefa] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l92_c7_fefa_cond <= VAR_MUX_uxn_device_h_l92_c7_fefa_cond;
     MUX_uxn_device_h_l92_c7_fefa_iftrue <= VAR_MUX_uxn_device_h_l92_c7_fefa_iftrue;
     MUX_uxn_device_h_l92_c7_fefa_iffalse <= VAR_MUX_uxn_device_h_l92_c7_fefa_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l92_c7_fefa_return_output := MUX_uxn_device_h_l92_c7_fefa_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l101_c35_b561_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l101_c41_9558_return_output;
     VAR_MUX_uxn_device_h_l101_c35_b561_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l101_c51_7ab7_return_output, 16);
     VAR_BIN_OP_MINUS_uxn_device_h_l103_c24_2a1c_left := VAR_MUX_uxn_device_h_l92_c7_fefa_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l103_c14_5082_left := VAR_MUX_uxn_device_h_l92_c7_fefa_return_output;
     REG_VAR_is_new_row := VAR_is_new_row_MUX_uxn_device_h_l81_c2_22c3_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_3c18_ref_toks_0 := VAR_sprite_rows_MUX_uxn_device_h_l71_c2_5c23_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_8007_ref_toks_0 := VAR_sprite_rows_MUX_uxn_device_h_l71_c2_5c23_return_output;
     REG_VAR_sprite_rows := VAR_sprite_rows_MUX_uxn_device_h_l71_c2_5c23_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l94_c21_8030_left := VAR_uint16_15_8_uxn_device_h_l94_c21_fe2a_return_output;
     -- uint16_7_0[uxn_device_h_l98_c53_8811] LATENCY=0
     VAR_uint16_7_0_uxn_device_h_l98_c53_8811_return_output := uint16_7_0(
     VAR_MUX_uxn_device_h_l92_c7_fefa_return_output);

     -- uint16_uint8_8[uxn_device_h_l97_c21_1cb8] LATENCY=0
     VAR_uint16_uint8_8_uxn_device_h_l97_c21_1cb8_return_output := uint16_uint8_8(
     resize(to_unsigned(0, 1), 16),
     VAR_uint16_7_0_uxn_device_h_l97_c39_5b33_return_output);

     -- uint16_15_8[uxn_device_h_l93_c21_4c94] LATENCY=0
     VAR_uint16_15_8_uxn_device_h_l93_c21_4c94_return_output := uint16_15_8(
     VAR_MUX_uxn_device_h_l92_c7_fefa_return_output);

     -- BIN_OP_EQ[uxn_device_h_l94_c21_8030] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l94_c21_8030_left <= VAR_BIN_OP_EQ_uxn_device_h_l94_c21_8030_left;
     BIN_OP_EQ_uxn_device_h_l94_c21_8030_right <= VAR_BIN_OP_EQ_uxn_device_h_l94_c21_8030_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l94_c21_8030_return_output := BIN_OP_EQ_uxn_device_h_l94_c21_8030_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l90_c26_8007] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_8007_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_8007_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_8007_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_8007_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_8007_return_output := VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_8007_return_output;

     -- MUX[uxn_device_h_l101_c35_b561] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l101_c35_b561_cond <= VAR_MUX_uxn_device_h_l101_c35_b561_cond;
     MUX_uxn_device_h_l101_c35_b561_iftrue <= VAR_MUX_uxn_device_h_l101_c35_b561_iftrue;
     MUX_uxn_device_h_l101_c35_b561_iffalse <= VAR_MUX_uxn_device_h_l101_c35_b561_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l101_c35_b561_return_output := MUX_uxn_device_h_l101_c35_b561_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l103_c14_5082] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l103_c14_5082_left <= VAR_BIN_OP_PLUS_uxn_device_h_l103_c14_5082_left;
     BIN_OP_PLUS_uxn_device_h_l103_c14_5082_right <= VAR_BIN_OP_PLUS_uxn_device_h_l103_c14_5082_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l103_c14_5082_return_output := BIN_OP_PLUS_uxn_device_h_l103_c14_5082_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l103_c24_2a1c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l103_c24_2a1c_left <= VAR_BIN_OP_MINUS_uxn_device_h_l103_c24_2a1c_left;
     BIN_OP_MINUS_uxn_device_h_l103_c24_2a1c_right <= VAR_BIN_OP_MINUS_uxn_device_h_l103_c24_2a1c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l103_c24_2a1c_return_output := BIN_OP_MINUS_uxn_device_h_l103_c24_2a1c_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l89_c26_3c18] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_3c18_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_3c18_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_3c18_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_3c18_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_3c18_return_output := VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_3c18_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_device_h_l94_c21_c3ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l94_c21_8030_return_output;
     VAR_MUX_uxn_device_h_l103_c8_e261_iffalse := VAR_BIN_OP_MINUS_uxn_device_h_l103_c24_2a1c_return_output;
     VAR_MUX_uxn_device_h_l103_c8_e261_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l103_c14_5082_return_output, 16);
     VAR_MUX_uxn_device_h_l101_c7_0ff8_iftrue := VAR_MUX_uxn_device_h_l101_c35_b561_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l93_c21_cdcd_left := VAR_uint16_15_8_uxn_device_h_l93_c21_4c94_return_output;
     -- uint16_uint8_8[uxn_device_h_l89_c8_e235] LATENCY=0
     VAR_uint16_uint8_8_uxn_device_h_l89_c8_e235_return_output := uint16_uint8_8(
     resize(to_unsigned(0, 1), 16),
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_3c18_return_output);

     -- MUX[uxn_device_h_l103_c8_e261] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l103_c8_e261_cond <= VAR_MUX_uxn_device_h_l103_c8_e261_cond;
     MUX_uxn_device_h_l103_c8_e261_iftrue <= VAR_MUX_uxn_device_h_l103_c8_e261_iftrue;
     MUX_uxn_device_h_l103_c8_e261_iffalse <= VAR_MUX_uxn_device_h_l103_c8_e261_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l103_c8_e261_return_output := MUX_uxn_device_h_l103_c8_e261_return_output;

     -- MUX[uxn_device_h_l94_c21_c3ad] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l94_c21_c3ad_cond <= VAR_MUX_uxn_device_h_l94_c21_c3ad_cond;
     MUX_uxn_device_h_l94_c21_c3ad_iftrue <= VAR_MUX_uxn_device_h_l94_c21_c3ad_iftrue;
     MUX_uxn_device_h_l94_c21_c3ad_iffalse <= VAR_MUX_uxn_device_h_l94_c21_c3ad_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l94_c21_c3ad_return_output := MUX_uxn_device_h_l94_c21_c3ad_return_output;

     -- BIN_OP_EQ[uxn_device_h_l93_c21_cdcd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l93_c21_cdcd_left <= VAR_BIN_OP_EQ_uxn_device_h_l93_c21_cdcd_left;
     BIN_OP_EQ_uxn_device_h_l93_c21_cdcd_right <= VAR_BIN_OP_EQ_uxn_device_h_l93_c21_cdcd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l93_c21_cdcd_return_output := BIN_OP_EQ_uxn_device_h_l93_c21_cdcd_return_output;

     -- MUX[uxn_device_h_l101_c7_0ff8] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l101_c7_0ff8_cond <= VAR_MUX_uxn_device_h_l101_c7_0ff8_cond;
     MUX_uxn_device_h_l101_c7_0ff8_iftrue <= VAR_MUX_uxn_device_h_l101_c7_0ff8_iftrue;
     MUX_uxn_device_h_l101_c7_0ff8_iffalse <= VAR_MUX_uxn_device_h_l101_c7_0ff8_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l101_c7_0ff8_return_output := MUX_uxn_device_h_l101_c7_0ff8_return_output;

     -- uint16_uint8_0[uxn_device_h_l98_c21_6f73] LATENCY=0
     VAR_uint16_uint8_0_uxn_device_h_l98_c21_6f73_return_output := uint16_uint8_0(
     VAR_uint16_uint8_8_uxn_device_h_l97_c21_1cb8_return_output,
     VAR_uint16_7_0_uxn_device_h_l98_c53_8811_return_output);

     -- Submodule level 6
     VAR_MUX_uxn_device_h_l93_c21_ed90_cond := VAR_BIN_OP_EQ_uxn_device_h_l93_c21_cdcd_return_output;
     VAR_y_MUX_uxn_device_h_l81_c2_22c3_iffalse := VAR_MUX_uxn_device_h_l101_c7_0ff8_return_output;
     VAR_x_MUX_uxn_device_h_l81_c2_22c3_iffalse := VAR_MUX_uxn_device_h_l103_c8_e261_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l99_c26_cfe1_right := VAR_MUX_uxn_device_h_l94_c21_c3ad_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l81_c2_22c3_iffalse := VAR_MUX_uxn_device_h_l94_c21_c3ad_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_22c3_iffalse := VAR_uint16_uint8_0_uxn_device_h_l98_c21_6f73_return_output;
     -- x_MUX[uxn_device_h_l81_c2_22c3] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l81_c2_22c3_cond <= VAR_x_MUX_uxn_device_h_l81_c2_22c3_cond;
     x_MUX_uxn_device_h_l81_c2_22c3_iftrue <= VAR_x_MUX_uxn_device_h_l81_c2_22c3_iftrue;
     x_MUX_uxn_device_h_l81_c2_22c3_iffalse <= VAR_x_MUX_uxn_device_h_l81_c2_22c3_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l81_c2_22c3_return_output := x_MUX_uxn_device_h_l81_c2_22c3_return_output;

     -- uint16_uint8_0[uxn_device_h_l90_c8_1e22] LATENCY=0
     VAR_uint16_uint8_0_uxn_device_h_l90_c8_1e22_return_output := uint16_uint8_0(
     VAR_uint16_uint8_8_uxn_device_h_l89_c8_e235_return_output,
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_8007_return_output);

     -- y_MUX[uxn_device_h_l81_c2_22c3] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l81_c2_22c3_cond <= VAR_y_MUX_uxn_device_h_l81_c2_22c3_cond;
     y_MUX_uxn_device_h_l81_c2_22c3_iftrue <= VAR_y_MUX_uxn_device_h_l81_c2_22c3_iftrue;
     y_MUX_uxn_device_h_l81_c2_22c3_iffalse <= VAR_y_MUX_uxn_device_h_l81_c2_22c3_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l81_c2_22c3_return_output := y_MUX_uxn_device_h_l81_c2_22c3_return_output;

     -- MUX[uxn_device_h_l93_c21_ed90] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l93_c21_ed90_cond <= VAR_MUX_uxn_device_h_l93_c21_ed90_cond;
     MUX_uxn_device_h_l93_c21_ed90_iftrue <= VAR_MUX_uxn_device_h_l93_c21_ed90_iftrue;
     MUX_uxn_device_h_l93_c21_ed90_iffalse <= VAR_MUX_uxn_device_h_l93_c21_ed90_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l93_c21_ed90_return_output := MUX_uxn_device_h_l93_c21_ed90_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l81_c2_22c3] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l81_c2_22c3_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_22c3_cond;
     result_u16_addr_MUX_uxn_device_h_l81_c2_22c3_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_22c3_iftrue;
     result_u16_addr_MUX_uxn_device_h_l81_c2_22c3_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_22c3_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_22c3_return_output := result_u16_addr_MUX_uxn_device_h_l81_c2_22c3_return_output;

     -- is_y_in_bounds_MUX[uxn_device_h_l81_c2_22c3] LATENCY=0
     -- Inputs
     is_y_in_bounds_MUX_uxn_device_h_l81_c2_22c3_cond <= VAR_is_y_in_bounds_MUX_uxn_device_h_l81_c2_22c3_cond;
     is_y_in_bounds_MUX_uxn_device_h_l81_c2_22c3_iftrue <= VAR_is_y_in_bounds_MUX_uxn_device_h_l81_c2_22c3_iftrue;
     is_y_in_bounds_MUX_uxn_device_h_l81_c2_22c3_iffalse <= VAR_is_y_in_bounds_MUX_uxn_device_h_l81_c2_22c3_iffalse;
     -- Outputs
     VAR_is_y_in_bounds_MUX_uxn_device_h_l81_c2_22c3_return_output := is_y_in_bounds_MUX_uxn_device_h_l81_c2_22c3_return_output;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_device_h_l99_c26_cfe1_left := VAR_MUX_uxn_device_h_l93_c21_ed90_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l81_c2_22c3_iffalse := VAR_MUX_uxn_device_h_l93_c21_ed90_return_output;
     REG_VAR_is_y_in_bounds := VAR_is_y_in_bounds_MUX_uxn_device_h_l81_c2_22c3_return_output;
     VAR_c_MUX_uxn_device_h_l88_c3_9a58_iftrue := VAR_uint16_uint8_0_uxn_device_h_l90_c8_1e22_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l81_c2_22c3_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l81_c2_22c3_return_output;
     -- c_MUX[uxn_device_h_l88_c3_9a58] LATENCY=0
     -- Inputs
     c_MUX_uxn_device_h_l88_c3_9a58_cond <= VAR_c_MUX_uxn_device_h_l88_c3_9a58_cond;
     c_MUX_uxn_device_h_l88_c3_9a58_iftrue <= VAR_c_MUX_uxn_device_h_l88_c3_9a58_iftrue;
     c_MUX_uxn_device_h_l88_c3_9a58_iffalse <= VAR_c_MUX_uxn_device_h_l88_c3_9a58_iffalse;
     -- Outputs
     VAR_c_MUX_uxn_device_h_l88_c3_9a58_return_output := c_MUX_uxn_device_h_l88_c3_9a58_return_output;

     -- is_x_in_bounds_MUX[uxn_device_h_l81_c2_22c3] LATENCY=0
     -- Inputs
     is_x_in_bounds_MUX_uxn_device_h_l81_c2_22c3_cond <= VAR_is_x_in_bounds_MUX_uxn_device_h_l81_c2_22c3_cond;
     is_x_in_bounds_MUX_uxn_device_h_l81_c2_22c3_iftrue <= VAR_is_x_in_bounds_MUX_uxn_device_h_l81_c2_22c3_iftrue;
     is_x_in_bounds_MUX_uxn_device_h_l81_c2_22c3_iffalse <= VAR_is_x_in_bounds_MUX_uxn_device_h_l81_c2_22c3_iffalse;
     -- Outputs
     VAR_is_x_in_bounds_MUX_uxn_device_h_l81_c2_22c3_return_output := is_x_in_bounds_MUX_uxn_device_h_l81_c2_22c3_return_output;

     -- BIN_OP_AND[uxn_device_h_l99_c26_cfe1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l99_c26_cfe1_left <= VAR_BIN_OP_AND_uxn_device_h_l99_c26_cfe1_left;
     BIN_OP_AND_uxn_device_h_l99_c26_cfe1_right <= VAR_BIN_OP_AND_uxn_device_h_l99_c26_cfe1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l99_c26_cfe1_return_output := BIN_OP_AND_uxn_device_h_l99_c26_cfe1_return_output;

     -- Submodule level 8
     VAR_BIN_OP_AND_uxn_device_h_l99_c26_12d7_left := VAR_BIN_OP_AND_uxn_device_h_l99_c26_cfe1_return_output;
     VAR_CONST_SR_1_uxn_device_h_l104_c3_f53a_x := VAR_c_MUX_uxn_device_h_l88_c3_9a58_return_output;
     REG_VAR_is_x_in_bounds := VAR_is_x_in_bounds_MUX_uxn_device_h_l81_c2_22c3_return_output;
     -- uint16_0_0[uxn_device_h_l96_c26_dfc3] LATENCY=0
     VAR_uint16_0_0_uxn_device_h_l96_c26_dfc3_return_output := uint16_0_0(
     VAR_c_MUX_uxn_device_h_l88_c3_9a58_return_output);

     -- uint16_8_8[uxn_device_h_l95_c25_f1da] LATENCY=0
     VAR_uint16_8_8_uxn_device_h_l95_c25_f1da_return_output := uint16_8_8(
     VAR_c_MUX_uxn_device_h_l88_c3_9a58_return_output);

     -- CONST_SR_1[uxn_device_h_l104_c3_f53a] LATENCY=0
     -- Inputs
     CONST_SR_1_uxn_device_h_l104_c3_f53a_x <= VAR_CONST_SR_1_uxn_device_h_l104_c3_f53a_x;
     -- Outputs
     VAR_CONST_SR_1_uxn_device_h_l104_c3_f53a_return_output := CONST_SR_1_uxn_device_h_l104_c3_f53a_return_output;

     -- Submodule level 9
     VAR_c_MUX_uxn_device_h_l81_c2_22c3_iffalse := VAR_CONST_SR_1_uxn_device_h_l104_c3_f53a_return_output;
     -- uint8_uint1_5[uxn_device_h_l95_c8_1d8b] LATENCY=0
     VAR_uint8_uint1_5_uxn_device_h_l95_c8_1d8b_return_output := uint8_uint1_5(
     resize(to_unsigned(0, 1), 8),
     VAR_uint16_8_8_uxn_device_h_l95_c25_f1da_return_output);

     -- c_MUX[uxn_device_h_l81_c2_22c3] LATENCY=0
     -- Inputs
     c_MUX_uxn_device_h_l81_c2_22c3_cond <= VAR_c_MUX_uxn_device_h_l81_c2_22c3_cond;
     c_MUX_uxn_device_h_l81_c2_22c3_iftrue <= VAR_c_MUX_uxn_device_h_l81_c2_22c3_iftrue;
     c_MUX_uxn_device_h_l81_c2_22c3_iffalse <= VAR_c_MUX_uxn_device_h_l81_c2_22c3_iffalse;
     -- Outputs
     VAR_c_MUX_uxn_device_h_l81_c2_22c3_return_output := c_MUX_uxn_device_h_l81_c2_22c3_return_output;

     -- Submodule level 10
     REG_VAR_c := VAR_c_MUX_uxn_device_h_l81_c2_22c3_return_output;
     -- uint8_uint1_4[uxn_device_h_l96_c8_24bc] LATENCY=0
     VAR_uint8_uint1_4_uxn_device_h_l96_c8_24bc_return_output := uint8_uint1_4(
     VAR_uint8_uint1_5_uxn_device_h_l95_c8_1d8b_return_output,
     VAR_uint16_0_0_uxn_device_h_l96_c26_dfc3_return_output);

     -- Submodule level 11
     VAR_BIN_OP_EQ_uxn_device_h_l99_c71_60df_left := VAR_uint8_uint1_4_uxn_device_h_l96_c8_24bc_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l100_c30_0e9d_right := VAR_uint8_uint1_4_uxn_device_h_l96_c8_24bc_return_output;
     VAR_ch_MUX_uxn_device_h_l81_c2_22c3_iffalse := VAR_uint8_uint1_4_uxn_device_h_l96_c8_24bc_return_output;
     -- BIN_OP_PLUS[uxn_device_h_l100_c30_0e9d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l100_c30_0e9d_left <= VAR_BIN_OP_PLUS_uxn_device_h_l100_c30_0e9d_left;
     BIN_OP_PLUS_uxn_device_h_l100_c30_0e9d_right <= VAR_BIN_OP_PLUS_uxn_device_h_l100_c30_0e9d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l100_c30_0e9d_return_output := BIN_OP_PLUS_uxn_device_h_l100_c30_0e9d_return_output;

     -- ch_MUX[uxn_device_h_l81_c2_22c3] LATENCY=0
     -- Inputs
     ch_MUX_uxn_device_h_l81_c2_22c3_cond <= VAR_ch_MUX_uxn_device_h_l81_c2_22c3_cond;
     ch_MUX_uxn_device_h_l81_c2_22c3_iftrue <= VAR_ch_MUX_uxn_device_h_l81_c2_22c3_iftrue;
     ch_MUX_uxn_device_h_l81_c2_22c3_iffalse <= VAR_ch_MUX_uxn_device_h_l81_c2_22c3_iffalse;
     -- Outputs
     VAR_ch_MUX_uxn_device_h_l81_c2_22c3_return_output := ch_MUX_uxn_device_h_l81_c2_22c3_return_output;

     -- BIN_OP_EQ[uxn_device_h_l99_c71_60df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l99_c71_60df_left <= VAR_BIN_OP_EQ_uxn_device_h_l99_c71_60df_left;
     BIN_OP_EQ_uxn_device_h_l99_c71_60df_right <= VAR_BIN_OP_EQ_uxn_device_h_l99_c71_60df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l99_c71_60df_return_output := BIN_OP_EQ_uxn_device_h_l99_c71_60df_return_output;

     -- Submodule level 12
     VAR_MUX_uxn_device_h_l99_c71_d1f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c71_60df_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_90f9_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l100_c30_0e9d_return_output, 7);
     REG_VAR_ch := VAR_ch_MUX_uxn_device_h_l81_c2_22c3_return_output;
     -- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l100_c21_90f9] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_90f9_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_90f9_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_90f9_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_90f9_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_90f9_return_output := VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_90f9_return_output;

     -- MUX[uxn_device_h_l99_c71_d1f0] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l99_c71_d1f0_cond <= VAR_MUX_uxn_device_h_l99_c71_d1f0_cond;
     MUX_uxn_device_h_l99_c71_d1f0_iftrue <= VAR_MUX_uxn_device_h_l99_c71_d1f0_iftrue;
     MUX_uxn_device_h_l99_c71_d1f0_iffalse <= VAR_MUX_uxn_device_h_l99_c71_d1f0_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l99_c71_d1f0_return_output := MUX_uxn_device_h_l99_c71_d1f0_return_output;

     -- Submodule level 13
     VAR_BIN_OP_OR_uxn_device_h_l99_c61_259f_right := VAR_MUX_uxn_device_h_l99_c71_d1f0_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l81_c2_22c3_iffalse := VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l100_c21_90f9_return_output;
     -- BIN_OP_OR[uxn_device_h_l99_c61_259f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l99_c61_259f_left <= VAR_BIN_OP_OR_uxn_device_h_l99_c61_259f_left;
     BIN_OP_OR_uxn_device_h_l99_c61_259f_right <= VAR_BIN_OP_OR_uxn_device_h_l99_c61_259f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l99_c61_259f_return_output := BIN_OP_OR_uxn_device_h_l99_c61_259f_return_output;

     -- result_u8_value_MUX[uxn_device_h_l81_c2_22c3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l81_c2_22c3_cond <= VAR_result_u8_value_MUX_uxn_device_h_l81_c2_22c3_cond;
     result_u8_value_MUX_uxn_device_h_l81_c2_22c3_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l81_c2_22c3_iftrue;
     result_u8_value_MUX_uxn_device_h_l81_c2_22c3_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l81_c2_22c3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l81_c2_22c3_return_output := result_u8_value_MUX_uxn_device_h_l81_c2_22c3_return_output;

     -- Submodule level 14
     VAR_BIN_OP_AND_uxn_device_h_l99_c26_12d7_right := VAR_BIN_OP_OR_uxn_device_h_l99_c61_259f_return_output;
     -- BIN_OP_AND[uxn_device_h_l99_c26_12d7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l99_c26_12d7_left <= VAR_BIN_OP_AND_uxn_device_h_l99_c26_12d7_left;
     BIN_OP_AND_uxn_device_h_l99_c26_12d7_right <= VAR_BIN_OP_AND_uxn_device_h_l99_c26_12d7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l99_c26_12d7_return_output := BIN_OP_AND_uxn_device_h_l99_c26_12d7_return_output;

     -- Submodule level 15
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_22c3_iffalse := VAR_BIN_OP_AND_uxn_device_h_l99_c26_12d7_return_output;
     -- result_is_vram_write_MUX[uxn_device_h_l81_c2_22c3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l81_c2_22c3_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_22c3_cond;
     result_is_vram_write_MUX_uxn_device_h_l81_c2_22c3_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_22c3_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l81_c2_22c3_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_22c3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_22c3_return_output := result_is_vram_write_MUX_uxn_device_h_l81_c2_22c3_return_output;

     -- Submodule level 16
     -- CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_15f2_uxn_device_h_l42_l107_DUPLICATE_77d7 LATENCY=0
     VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_15f2_uxn_device_h_l42_l107_DUPLICATE_77d7_return_output := CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_15f2(
     result,
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_22c3_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l81_c2_22c3_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_22c3_return_output,
     VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_22c3_return_output);

     -- Submodule level 17
     REG_VAR_result := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_15f2_uxn_device_h_l42_l107_DUPLICATE_77d7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_15f2_uxn_device_h_l42_l107_DUPLICATE_77d7_return_output;
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
REG_COMB_is_x_in_bounds <= REG_VAR_is_x_in_bounds;
REG_COMB_is_y_in_bounds <= REG_VAR_is_y_in_bounds;
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
     is_x_in_bounds <= REG_COMB_is_x_in_bounds;
     is_y_in_bounds <= REG_COMB_is_y_in_bounds;
     is_new_row <= REG_COMB_is_new_row;
 end if;
 end if;
end process;

end arch;
