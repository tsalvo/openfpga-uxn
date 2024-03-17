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
-- BIN_OP_MINUS[uxn_device_h_l69_c20_6ac3]
signal BIN_OP_MINUS_uxn_device_h_l69_c20_6ac3_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l69_c20_6ac3_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l69_c20_6ac3_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l71_c6_a52a]
signal BIN_OP_EQ_uxn_device_h_l71_c6_a52a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l71_c6_a52a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l71_c6_a52a_return_output : unsigned(0 downto 0);

-- sprite_rows_MUX[uxn_device_h_l71_c2_ae49]
signal sprite_rows_MUX_uxn_device_h_l71_c2_ae49_cond : unsigned(0 downto 0);
signal sprite_rows_MUX_uxn_device_h_l71_c2_ae49_iftrue : uint8_t_16;
signal sprite_rows_MUX_uxn_device_h_l71_c2_ae49_iffalse : uint8_t_16;
signal sprite_rows_MUX_uxn_device_h_l71_c2_ae49_return_output : uint8_t_16;

-- VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60[uxn_device_h_l72_c3_1e36]
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_1e36_elem_val : unsigned(7 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_1e36_ref_toks_0 : uint8_t_16;
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_1e36_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_1e36_return_output : uint8_t_array_16_t;

-- BIN_OP_EQ[uxn_device_h_l75_c6_f7ae]
signal BIN_OP_EQ_uxn_device_h_l75_c6_f7ae_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l75_c6_f7ae_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l75_c6_f7ae_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l75_c2_d9da]
signal y_MUX_uxn_device_h_l75_c2_d9da_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l75_c2_d9da_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l75_c2_d9da_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l75_c2_d9da_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l75_c2_d9da]
signal x_MUX_uxn_device_h_l75_c2_d9da_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l75_c2_d9da_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l75_c2_d9da_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l75_c2_d9da_return_output : unsigned(15 downto 0);

-- opaque_MUX[uxn_device_h_l75_c2_d9da]
signal opaque_MUX_uxn_device_h_l75_c2_d9da_cond : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l75_c2_d9da_iftrue : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l75_c2_d9da_iffalse : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l75_c2_d9da_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l76_c21_2f6d]
signal BIN_OP_PLUS_uxn_device_h_l76_c21_2f6d_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l76_c21_2f6d_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l76_c21_2f6d_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l76_c12_a1ed]
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_a1ed_ref_toks_0 : uint8_t_80;
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_a1ed_var_dim_0 : unsigned(6 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_a1ed_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l77_c13_b278]
signal MUX_uxn_device_h_l77_c13_b278_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l77_c13_b278_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l77_c13_b278_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l77_c13_b278_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l77_c7_bdbf]
signal BIN_OP_PLUS_uxn_device_h_l77_c7_bdbf_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l77_c7_bdbf_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l77_c7_bdbf_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l78_c13_2485]
signal MUX_uxn_device_h_l78_c13_2485_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l78_c13_2485_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l78_c13_2485_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l78_c13_2485_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l78_c7_af13]
signal BIN_OP_PLUS_uxn_device_h_l78_c7_af13_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l78_c7_af13_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l78_c7_af13_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l81_c6_aa1d]
signal BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_return_output : unsigned(0 downto 0);

-- is_in_bounds_MUX[uxn_device_h_l81_c2_1948]
signal is_in_bounds_MUX_uxn_device_h_l81_c2_1948_cond : unsigned(0 downto 0);
signal is_in_bounds_MUX_uxn_device_h_l81_c2_1948_iftrue : unsigned(0 downto 0);
signal is_in_bounds_MUX_uxn_device_h_l81_c2_1948_iffalse : unsigned(0 downto 0);
signal is_in_bounds_MUX_uxn_device_h_l81_c2_1948_return_output : unsigned(0 downto 0);

-- c_MUX[uxn_device_h_l81_c2_1948]
signal c_MUX_uxn_device_h_l81_c2_1948_cond : unsigned(0 downto 0);
signal c_MUX_uxn_device_h_l81_c2_1948_iftrue : unsigned(15 downto 0);
signal c_MUX_uxn_device_h_l81_c2_1948_iffalse : unsigned(15 downto 0);
signal c_MUX_uxn_device_h_l81_c2_1948_return_output : unsigned(15 downto 0);

-- ch_MUX[uxn_device_h_l81_c2_1948]
signal ch_MUX_uxn_device_h_l81_c2_1948_cond : unsigned(0 downto 0);
signal ch_MUX_uxn_device_h_l81_c2_1948_iftrue : unsigned(7 downto 0);
signal ch_MUX_uxn_device_h_l81_c2_1948_iffalse : unsigned(7 downto 0);
signal ch_MUX_uxn_device_h_l81_c2_1948_return_output : unsigned(7 downto 0);

-- result_is_blit_done_MUX[uxn_device_h_l81_c2_1948]
signal result_is_blit_done_MUX_uxn_device_h_l81_c2_1948_cond : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l81_c2_1948_iftrue : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l81_c2_1948_iffalse : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l81_c2_1948_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l81_c2_1948]
signal result_u8_value_MUX_uxn_device_h_l81_c2_1948_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l81_c2_1948_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l81_c2_1948_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l81_c2_1948_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l81_c2_1948]
signal result_is_vram_write_MUX_uxn_device_h_l81_c2_1948_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c2_1948_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c2_1948_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c2_1948_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l81_c2_1948]
signal result_u16_addr_MUX_uxn_device_h_l81_c2_1948_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l81_c2_1948_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l81_c2_1948_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l81_c2_1948_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l81_c2_1948]
signal y_MUX_uxn_device_h_l81_c2_1948_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l81_c2_1948_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c2_1948_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c2_1948_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l81_c2_1948]
signal x_MUX_uxn_device_h_l81_c2_1948_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l81_c2_1948_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c2_1948_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c2_1948_return_output : unsigned(15 downto 0);

-- is_new_row_MUX[uxn_device_h_l81_c2_1948]
signal is_new_row_MUX_uxn_device_h_l81_c2_1948_cond : unsigned(0 downto 0);
signal is_new_row_MUX_uxn_device_h_l81_c2_1948_iftrue : unsigned(0 downto 0);
signal is_new_row_MUX_uxn_device_h_l81_c2_1948_iffalse : unsigned(0 downto 0);
signal is_new_row_MUX_uxn_device_h_l81_c2_1948_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l85_c21_4f58]
signal BIN_OP_PLUS_uxn_device_h_l85_c21_4f58_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l85_c21_4f58_right : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l85_c21_4f58_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l87_c16_6a3e]
signal BIN_OP_EQ_uxn_device_h_l87_c16_6a3e_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l87_c16_6a3e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l87_c16_6a3e_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l87_c16_b994]
signal MUX_uxn_device_h_l87_c16_b994_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l87_c16_b994_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l87_c16_b994_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l87_c16_b994_return_output : unsigned(0 downto 0);

-- c_MUX[uxn_device_h_l88_c3_1bfd]
signal c_MUX_uxn_device_h_l88_c3_1bfd_cond : unsigned(0 downto 0);
signal c_MUX_uxn_device_h_l88_c3_1bfd_iftrue : unsigned(15 downto 0);
signal c_MUX_uxn_device_h_l88_c3_1bfd_iffalse : unsigned(15 downto 0);
signal c_MUX_uxn_device_h_l88_c3_1bfd_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l89_c38_6f52]
signal BIN_OP_PLUS_uxn_device_h_l89_c38_6f52_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l89_c38_6f52_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l89_c38_6f52_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l89_c26_e601]
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_e601_ref_toks_0 : uint8_t_16;
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_e601_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_e601_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l90_c38_42d1]
signal BIN_OP_MINUS_uxn_device_h_l90_c38_42d1_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l90_c38_42d1_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l90_c38_42d1_return_output : unsigned(7 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l90_c26_a491]
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_a491_ref_toks_0 : uint8_t_16;
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_a491_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_a491_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l92_c27_3e0e]
signal MUX_uxn_device_h_l92_c27_3e0e_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l92_c27_3e0e_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l92_c27_3e0e_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l92_c27_3e0e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l92_c21_ee86]
signal BIN_OP_PLUS_uxn_device_h_l92_c21_ee86_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l92_c21_ee86_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l92_c21_ee86_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l92_c7_dc52]
signal MUX_uxn_device_h_l92_c7_dc52_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l92_c7_dc52_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l92_c7_dc52_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l92_c7_dc52_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l93_c19_27f8]
signal BIN_OP_EQ_uxn_device_h_l93_c19_27f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l93_c19_27f8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l93_c19_27f8_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l93_c19_4d2f]
signal MUX_uxn_device_h_l93_c19_4d2f_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l93_c19_4d2f_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l93_c19_4d2f_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l93_c19_4d2f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l98_c52_ee7a]
signal BIN_OP_EQ_uxn_device_h_l98_c52_ee7a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l98_c52_ee7a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l98_c52_ee7a_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l98_c52_c798]
signal MUX_uxn_device_h_l98_c52_c798_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l98_c52_c798_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l98_c52_c798_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l98_c52_c798_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l98_c42_5f69]
signal BIN_OP_OR_uxn_device_h_l98_c42_5f69_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l98_c42_5f69_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l98_c42_5f69_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l98_c26_5966]
signal BIN_OP_AND_uxn_device_h_l98_c26_5966_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l98_c26_5966_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l98_c26_5966_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l99_c30_d62f]
signal BIN_OP_PLUS_uxn_device_h_l99_c30_d62f_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l99_c30_d62f_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l99_c30_d62f_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l99_c21_56d7]
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_56d7_ref_toks_0 : uint8_t_80;
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_56d7_var_dim_0 : unsigned(6 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_56d7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l100_c7_bf06]
signal BIN_OP_EQ_uxn_device_h_l100_c7_bf06_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_bf06_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_bf06_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l100_c41_500a]
signal BIN_OP_MINUS_uxn_device_h_l100_c41_500a_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l100_c41_500a_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l100_c41_500a_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l100_c51_bb17]
signal BIN_OP_PLUS_uxn_device_h_l100_c51_bb17_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l100_c51_bb17_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l100_c51_bb17_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l100_c35_d104]
signal MUX_uxn_device_h_l100_c35_d104_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l100_c35_d104_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l100_c35_d104_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l100_c35_d104_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l100_c7_fc28]
signal MUX_uxn_device_h_l100_c7_fc28_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l100_c7_fc28_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l100_c7_fc28_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l100_c7_fc28_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l101_c25_0b67]
signal BIN_OP_EQ_uxn_device_h_l101_c25_0b67_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c25_0b67_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c25_0b67_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l101_c25_2603]
signal MUX_uxn_device_h_l101_c25_2603_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l101_c25_2603_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l101_c25_2603_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l101_c25_2603_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l102_c14_d42e]
signal BIN_OP_PLUS_uxn_device_h_l102_c14_d42e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l102_c14_d42e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l102_c14_d42e_return_output : unsigned(16 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l102_c24_46d0]
signal BIN_OP_MINUS_uxn_device_h_l102_c24_46d0_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l102_c24_46d0_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l102_c24_46d0_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l102_c8_ff45]
signal MUX_uxn_device_h_l102_c8_ff45_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l102_c8_ff45_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l102_c8_ff45_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l102_c8_ff45_return_output : unsigned(15 downto 0);

-- CONST_SR_1[uxn_device_h_l103_c3_f346]
signal CONST_SR_1_uxn_device_h_l103_c3_f346_x : unsigned(15 downto 0);
signal CONST_SR_1_uxn_device_h_l103_c3_f346_return_output : unsigned(15 downto 0);

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
      base(2) := ref_toks_0.data(2);
      base(8) := ref_toks_0.data(8);
      base(5) := ref_toks_0.data(5);
      base(11) := ref_toks_0.data(11);
      base(14) := ref_toks_0.data(14);
      base(0) := ref_toks_0.data(0);
      base(6) := ref_toks_0.data(6);
      base(3) := ref_toks_0.data(3);
      base(9) := ref_toks_0.data(9);
      base(15) := ref_toks_0.data(15);
      base(12) := ref_toks_0.data(12);
      base(1) := ref_toks_0.data(1);
      base(4) := ref_toks_0.data(4);
      base(7) := ref_toks_0.data(7);
      base(13) := ref_toks_0.data(13);
      base(10) := ref_toks_0.data(10);

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

function CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_128d( ref_toks_0 : screen_blit_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return screen_blit_result_t is
 
  variable base : screen_blit_result_t; 
  variable return_output : screen_blit_result_t;
begin
      base := ref_toks_0;
      base.is_blit_done := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.u16_addr := ref_toks_4;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_MINUS_uxn_device_h_l69_c20_6ac3
BIN_OP_MINUS_uxn_device_h_l69_c20_6ac3 : entity work.BIN_OP_MINUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l69_c20_6ac3_left,
BIN_OP_MINUS_uxn_device_h_l69_c20_6ac3_right,
BIN_OP_MINUS_uxn_device_h_l69_c20_6ac3_return_output);

-- BIN_OP_EQ_uxn_device_h_l71_c6_a52a
BIN_OP_EQ_uxn_device_h_l71_c6_a52a : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l71_c6_a52a_left,
BIN_OP_EQ_uxn_device_h_l71_c6_a52a_right,
BIN_OP_EQ_uxn_device_h_l71_c6_a52a_return_output);

-- sprite_rows_MUX_uxn_device_h_l71_c2_ae49
sprite_rows_MUX_uxn_device_h_l71_c2_ae49 : entity work.MUX_uint1_t_uint8_t_16_uint8_t_16_0CLK_de264c78 port map (
sprite_rows_MUX_uxn_device_h_l71_c2_ae49_cond,
sprite_rows_MUX_uxn_device_h_l71_c2_ae49_iftrue,
sprite_rows_MUX_uxn_device_h_l71_c2_ae49_iffalse,
sprite_rows_MUX_uxn_device_h_l71_c2_ae49_return_output);

-- VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_1e36
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_1e36 : entity work.VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_0CLK_6481cb28 port map (
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_1e36_elem_val,
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_1e36_ref_toks_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_1e36_var_dim_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_1e36_return_output);

-- BIN_OP_EQ_uxn_device_h_l75_c6_f7ae
BIN_OP_EQ_uxn_device_h_l75_c6_f7ae : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l75_c6_f7ae_left,
BIN_OP_EQ_uxn_device_h_l75_c6_f7ae_right,
BIN_OP_EQ_uxn_device_h_l75_c6_f7ae_return_output);

-- y_MUX_uxn_device_h_l75_c2_d9da
y_MUX_uxn_device_h_l75_c2_d9da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l75_c2_d9da_cond,
y_MUX_uxn_device_h_l75_c2_d9da_iftrue,
y_MUX_uxn_device_h_l75_c2_d9da_iffalse,
y_MUX_uxn_device_h_l75_c2_d9da_return_output);

-- x_MUX_uxn_device_h_l75_c2_d9da
x_MUX_uxn_device_h_l75_c2_d9da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l75_c2_d9da_cond,
x_MUX_uxn_device_h_l75_c2_d9da_iftrue,
x_MUX_uxn_device_h_l75_c2_d9da_iffalse,
x_MUX_uxn_device_h_l75_c2_d9da_return_output);

-- opaque_MUX_uxn_device_h_l75_c2_d9da
opaque_MUX_uxn_device_h_l75_c2_d9da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opaque_MUX_uxn_device_h_l75_c2_d9da_cond,
opaque_MUX_uxn_device_h_l75_c2_d9da_iftrue,
opaque_MUX_uxn_device_h_l75_c2_d9da_iffalse,
opaque_MUX_uxn_device_h_l75_c2_d9da_return_output);

-- BIN_OP_PLUS_uxn_device_h_l76_c21_2f6d
BIN_OP_PLUS_uxn_device_h_l76_c21_2f6d : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l76_c21_2f6d_left,
BIN_OP_PLUS_uxn_device_h_l76_c21_2f6d_right,
BIN_OP_PLUS_uxn_device_h_l76_c21_2f6d_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_a1ed
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_a1ed : entity work.VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_0CLK_4b00ae23 port map (
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_a1ed_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_a1ed_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_a1ed_return_output);

-- MUX_uxn_device_h_l77_c13_b278
MUX_uxn_device_h_l77_c13_b278 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l77_c13_b278_cond,
MUX_uxn_device_h_l77_c13_b278_iftrue,
MUX_uxn_device_h_l77_c13_b278_iffalse,
MUX_uxn_device_h_l77_c13_b278_return_output);

-- BIN_OP_PLUS_uxn_device_h_l77_c7_bdbf
BIN_OP_PLUS_uxn_device_h_l77_c7_bdbf : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l77_c7_bdbf_left,
BIN_OP_PLUS_uxn_device_h_l77_c7_bdbf_right,
BIN_OP_PLUS_uxn_device_h_l77_c7_bdbf_return_output);

-- MUX_uxn_device_h_l78_c13_2485
MUX_uxn_device_h_l78_c13_2485 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l78_c13_2485_cond,
MUX_uxn_device_h_l78_c13_2485_iftrue,
MUX_uxn_device_h_l78_c13_2485_iffalse,
MUX_uxn_device_h_l78_c13_2485_return_output);

-- BIN_OP_PLUS_uxn_device_h_l78_c7_af13
BIN_OP_PLUS_uxn_device_h_l78_c7_af13 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l78_c7_af13_left,
BIN_OP_PLUS_uxn_device_h_l78_c7_af13_right,
BIN_OP_PLUS_uxn_device_h_l78_c7_af13_return_output);

-- BIN_OP_EQ_uxn_device_h_l81_c6_aa1d
BIN_OP_EQ_uxn_device_h_l81_c6_aa1d : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_left,
BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_right,
BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_return_output);

-- is_in_bounds_MUX_uxn_device_h_l81_c2_1948
is_in_bounds_MUX_uxn_device_h_l81_c2_1948 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_in_bounds_MUX_uxn_device_h_l81_c2_1948_cond,
is_in_bounds_MUX_uxn_device_h_l81_c2_1948_iftrue,
is_in_bounds_MUX_uxn_device_h_l81_c2_1948_iffalse,
is_in_bounds_MUX_uxn_device_h_l81_c2_1948_return_output);

-- c_MUX_uxn_device_h_l81_c2_1948
c_MUX_uxn_device_h_l81_c2_1948 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
c_MUX_uxn_device_h_l81_c2_1948_cond,
c_MUX_uxn_device_h_l81_c2_1948_iftrue,
c_MUX_uxn_device_h_l81_c2_1948_iffalse,
c_MUX_uxn_device_h_l81_c2_1948_return_output);

-- ch_MUX_uxn_device_h_l81_c2_1948
ch_MUX_uxn_device_h_l81_c2_1948 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ch_MUX_uxn_device_h_l81_c2_1948_cond,
ch_MUX_uxn_device_h_l81_c2_1948_iftrue,
ch_MUX_uxn_device_h_l81_c2_1948_iffalse,
ch_MUX_uxn_device_h_l81_c2_1948_return_output);

-- result_is_blit_done_MUX_uxn_device_h_l81_c2_1948
result_is_blit_done_MUX_uxn_device_h_l81_c2_1948 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_blit_done_MUX_uxn_device_h_l81_c2_1948_cond,
result_is_blit_done_MUX_uxn_device_h_l81_c2_1948_iftrue,
result_is_blit_done_MUX_uxn_device_h_l81_c2_1948_iffalse,
result_is_blit_done_MUX_uxn_device_h_l81_c2_1948_return_output);

-- result_u8_value_MUX_uxn_device_h_l81_c2_1948
result_u8_value_MUX_uxn_device_h_l81_c2_1948 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l81_c2_1948_cond,
result_u8_value_MUX_uxn_device_h_l81_c2_1948_iftrue,
result_u8_value_MUX_uxn_device_h_l81_c2_1948_iffalse,
result_u8_value_MUX_uxn_device_h_l81_c2_1948_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l81_c2_1948
result_is_vram_write_MUX_uxn_device_h_l81_c2_1948 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l81_c2_1948_cond,
result_is_vram_write_MUX_uxn_device_h_l81_c2_1948_iftrue,
result_is_vram_write_MUX_uxn_device_h_l81_c2_1948_iffalse,
result_is_vram_write_MUX_uxn_device_h_l81_c2_1948_return_output);

-- result_u16_addr_MUX_uxn_device_h_l81_c2_1948
result_u16_addr_MUX_uxn_device_h_l81_c2_1948 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l81_c2_1948_cond,
result_u16_addr_MUX_uxn_device_h_l81_c2_1948_iftrue,
result_u16_addr_MUX_uxn_device_h_l81_c2_1948_iffalse,
result_u16_addr_MUX_uxn_device_h_l81_c2_1948_return_output);

-- y_MUX_uxn_device_h_l81_c2_1948
y_MUX_uxn_device_h_l81_c2_1948 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l81_c2_1948_cond,
y_MUX_uxn_device_h_l81_c2_1948_iftrue,
y_MUX_uxn_device_h_l81_c2_1948_iffalse,
y_MUX_uxn_device_h_l81_c2_1948_return_output);

-- x_MUX_uxn_device_h_l81_c2_1948
x_MUX_uxn_device_h_l81_c2_1948 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l81_c2_1948_cond,
x_MUX_uxn_device_h_l81_c2_1948_iftrue,
x_MUX_uxn_device_h_l81_c2_1948_iffalse,
x_MUX_uxn_device_h_l81_c2_1948_return_output);

-- is_new_row_MUX_uxn_device_h_l81_c2_1948
is_new_row_MUX_uxn_device_h_l81_c2_1948 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_new_row_MUX_uxn_device_h_l81_c2_1948_cond,
is_new_row_MUX_uxn_device_h_l81_c2_1948_iftrue,
is_new_row_MUX_uxn_device_h_l81_c2_1948_iffalse,
is_new_row_MUX_uxn_device_h_l81_c2_1948_return_output);

-- BIN_OP_PLUS_uxn_device_h_l85_c21_4f58
BIN_OP_PLUS_uxn_device_h_l85_c21_4f58 : entity work.BIN_OP_PLUS_uint16_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l85_c21_4f58_left,
BIN_OP_PLUS_uxn_device_h_l85_c21_4f58_right,
BIN_OP_PLUS_uxn_device_h_l85_c21_4f58_return_output);

-- BIN_OP_EQ_uxn_device_h_l87_c16_6a3e
BIN_OP_EQ_uxn_device_h_l87_c16_6a3e : entity work.BIN_OP_EQ_uint3_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l87_c16_6a3e_left,
BIN_OP_EQ_uxn_device_h_l87_c16_6a3e_right,
BIN_OP_EQ_uxn_device_h_l87_c16_6a3e_return_output);

-- MUX_uxn_device_h_l87_c16_b994
MUX_uxn_device_h_l87_c16_b994 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l87_c16_b994_cond,
MUX_uxn_device_h_l87_c16_b994_iftrue,
MUX_uxn_device_h_l87_c16_b994_iffalse,
MUX_uxn_device_h_l87_c16_b994_return_output);

-- c_MUX_uxn_device_h_l88_c3_1bfd
c_MUX_uxn_device_h_l88_c3_1bfd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
c_MUX_uxn_device_h_l88_c3_1bfd_cond,
c_MUX_uxn_device_h_l88_c3_1bfd_iftrue,
c_MUX_uxn_device_h_l88_c3_1bfd_iffalse,
c_MUX_uxn_device_h_l88_c3_1bfd_return_output);

-- BIN_OP_PLUS_uxn_device_h_l89_c38_6f52
BIN_OP_PLUS_uxn_device_h_l89_c38_6f52 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l89_c38_6f52_left,
BIN_OP_PLUS_uxn_device_h_l89_c38_6f52_right,
BIN_OP_PLUS_uxn_device_h_l89_c38_6f52_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_e601
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_e601 : entity work.VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_0CLK_e799c7f1 port map (
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_e601_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_e601_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_e601_return_output);

-- BIN_OP_MINUS_uxn_device_h_l90_c38_42d1
BIN_OP_MINUS_uxn_device_h_l90_c38_42d1 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l90_c38_42d1_left,
BIN_OP_MINUS_uxn_device_h_l90_c38_42d1_right,
BIN_OP_MINUS_uxn_device_h_l90_c38_42d1_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_a491
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_a491 : entity work.VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_0CLK_e799c7f1 port map (
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_a491_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_a491_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_a491_return_output);

-- MUX_uxn_device_h_l92_c27_3e0e
MUX_uxn_device_h_l92_c27_3e0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l92_c27_3e0e_cond,
MUX_uxn_device_h_l92_c27_3e0e_iftrue,
MUX_uxn_device_h_l92_c27_3e0e_iffalse,
MUX_uxn_device_h_l92_c27_3e0e_return_output);

-- BIN_OP_PLUS_uxn_device_h_l92_c21_ee86
BIN_OP_PLUS_uxn_device_h_l92_c21_ee86 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l92_c21_ee86_left,
BIN_OP_PLUS_uxn_device_h_l92_c21_ee86_right,
BIN_OP_PLUS_uxn_device_h_l92_c21_ee86_return_output);

-- MUX_uxn_device_h_l92_c7_dc52
MUX_uxn_device_h_l92_c7_dc52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l92_c7_dc52_cond,
MUX_uxn_device_h_l92_c7_dc52_iftrue,
MUX_uxn_device_h_l92_c7_dc52_iffalse,
MUX_uxn_device_h_l92_c7_dc52_return_output);

-- BIN_OP_EQ_uxn_device_h_l93_c19_27f8
BIN_OP_EQ_uxn_device_h_l93_c19_27f8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l93_c19_27f8_left,
BIN_OP_EQ_uxn_device_h_l93_c19_27f8_right,
BIN_OP_EQ_uxn_device_h_l93_c19_27f8_return_output);

-- MUX_uxn_device_h_l93_c19_4d2f
MUX_uxn_device_h_l93_c19_4d2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l93_c19_4d2f_cond,
MUX_uxn_device_h_l93_c19_4d2f_iftrue,
MUX_uxn_device_h_l93_c19_4d2f_iffalse,
MUX_uxn_device_h_l93_c19_4d2f_return_output);

-- BIN_OP_EQ_uxn_device_h_l98_c52_ee7a
BIN_OP_EQ_uxn_device_h_l98_c52_ee7a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l98_c52_ee7a_left,
BIN_OP_EQ_uxn_device_h_l98_c52_ee7a_right,
BIN_OP_EQ_uxn_device_h_l98_c52_ee7a_return_output);

-- MUX_uxn_device_h_l98_c52_c798
MUX_uxn_device_h_l98_c52_c798 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l98_c52_c798_cond,
MUX_uxn_device_h_l98_c52_c798_iftrue,
MUX_uxn_device_h_l98_c52_c798_iffalse,
MUX_uxn_device_h_l98_c52_c798_return_output);

-- BIN_OP_OR_uxn_device_h_l98_c42_5f69
BIN_OP_OR_uxn_device_h_l98_c42_5f69 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l98_c42_5f69_left,
BIN_OP_OR_uxn_device_h_l98_c42_5f69_right,
BIN_OP_OR_uxn_device_h_l98_c42_5f69_return_output);

-- BIN_OP_AND_uxn_device_h_l98_c26_5966
BIN_OP_AND_uxn_device_h_l98_c26_5966 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l98_c26_5966_left,
BIN_OP_AND_uxn_device_h_l98_c26_5966_right,
BIN_OP_AND_uxn_device_h_l98_c26_5966_return_output);

-- BIN_OP_PLUS_uxn_device_h_l99_c30_d62f
BIN_OP_PLUS_uxn_device_h_l99_c30_d62f : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l99_c30_d62f_left,
BIN_OP_PLUS_uxn_device_h_l99_c30_d62f_right,
BIN_OP_PLUS_uxn_device_h_l99_c30_d62f_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_56d7
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_56d7 : entity work.VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_0CLK_4b00ae23 port map (
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_56d7_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_56d7_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_56d7_return_output);

-- BIN_OP_EQ_uxn_device_h_l100_c7_bf06
BIN_OP_EQ_uxn_device_h_l100_c7_bf06 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l100_c7_bf06_left,
BIN_OP_EQ_uxn_device_h_l100_c7_bf06_right,
BIN_OP_EQ_uxn_device_h_l100_c7_bf06_return_output);

-- BIN_OP_MINUS_uxn_device_h_l100_c41_500a
BIN_OP_MINUS_uxn_device_h_l100_c41_500a : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l100_c41_500a_left,
BIN_OP_MINUS_uxn_device_h_l100_c41_500a_right,
BIN_OP_MINUS_uxn_device_h_l100_c41_500a_return_output);

-- BIN_OP_PLUS_uxn_device_h_l100_c51_bb17
BIN_OP_PLUS_uxn_device_h_l100_c51_bb17 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l100_c51_bb17_left,
BIN_OP_PLUS_uxn_device_h_l100_c51_bb17_right,
BIN_OP_PLUS_uxn_device_h_l100_c51_bb17_return_output);

-- MUX_uxn_device_h_l100_c35_d104
MUX_uxn_device_h_l100_c35_d104 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l100_c35_d104_cond,
MUX_uxn_device_h_l100_c35_d104_iftrue,
MUX_uxn_device_h_l100_c35_d104_iffalse,
MUX_uxn_device_h_l100_c35_d104_return_output);

-- MUX_uxn_device_h_l100_c7_fc28
MUX_uxn_device_h_l100_c7_fc28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l100_c7_fc28_cond,
MUX_uxn_device_h_l100_c7_fc28_iftrue,
MUX_uxn_device_h_l100_c7_fc28_iffalse,
MUX_uxn_device_h_l100_c7_fc28_return_output);

-- BIN_OP_EQ_uxn_device_h_l101_c25_0b67
BIN_OP_EQ_uxn_device_h_l101_c25_0b67 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l101_c25_0b67_left,
BIN_OP_EQ_uxn_device_h_l101_c25_0b67_right,
BIN_OP_EQ_uxn_device_h_l101_c25_0b67_return_output);

-- MUX_uxn_device_h_l101_c25_2603
MUX_uxn_device_h_l101_c25_2603 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l101_c25_2603_cond,
MUX_uxn_device_h_l101_c25_2603_iftrue,
MUX_uxn_device_h_l101_c25_2603_iffalse,
MUX_uxn_device_h_l101_c25_2603_return_output);

-- BIN_OP_PLUS_uxn_device_h_l102_c14_d42e
BIN_OP_PLUS_uxn_device_h_l102_c14_d42e : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l102_c14_d42e_left,
BIN_OP_PLUS_uxn_device_h_l102_c14_d42e_right,
BIN_OP_PLUS_uxn_device_h_l102_c14_d42e_return_output);

-- BIN_OP_MINUS_uxn_device_h_l102_c24_46d0
BIN_OP_MINUS_uxn_device_h_l102_c24_46d0 : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l102_c24_46d0_left,
BIN_OP_MINUS_uxn_device_h_l102_c24_46d0_right,
BIN_OP_MINUS_uxn_device_h_l102_c24_46d0_return_output);

-- MUX_uxn_device_h_l102_c8_ff45
MUX_uxn_device_h_l102_c8_ff45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l102_c8_ff45_cond,
MUX_uxn_device_h_l102_c8_ff45_iftrue,
MUX_uxn_device_h_l102_c8_ff45_iffalse,
MUX_uxn_device_h_l102_c8_ff45_return_output);

-- CONST_SR_1_uxn_device_h_l103_c3_f346
CONST_SR_1_uxn_device_h_l103_c3_f346 : entity work.CONST_SR_1_uint16_t_0CLK_de264c78 port map (
CONST_SR_1_uxn_device_h_l103_c3_f346_x,
CONST_SR_1_uxn_device_h_l103_c3_f346_return_output);



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
 BIN_OP_MINUS_uxn_device_h_l69_c20_6ac3_return_output,
 BIN_OP_EQ_uxn_device_h_l71_c6_a52a_return_output,
 sprite_rows_MUX_uxn_device_h_l71_c2_ae49_return_output,
 VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_1e36_return_output,
 BIN_OP_EQ_uxn_device_h_l75_c6_f7ae_return_output,
 y_MUX_uxn_device_h_l75_c2_d9da_return_output,
 x_MUX_uxn_device_h_l75_c2_d9da_return_output,
 opaque_MUX_uxn_device_h_l75_c2_d9da_return_output,
 BIN_OP_PLUS_uxn_device_h_l76_c21_2f6d_return_output,
 VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_a1ed_return_output,
 MUX_uxn_device_h_l77_c13_b278_return_output,
 BIN_OP_PLUS_uxn_device_h_l77_c7_bdbf_return_output,
 MUX_uxn_device_h_l78_c13_2485_return_output,
 BIN_OP_PLUS_uxn_device_h_l78_c7_af13_return_output,
 BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_return_output,
 is_in_bounds_MUX_uxn_device_h_l81_c2_1948_return_output,
 c_MUX_uxn_device_h_l81_c2_1948_return_output,
 ch_MUX_uxn_device_h_l81_c2_1948_return_output,
 result_is_blit_done_MUX_uxn_device_h_l81_c2_1948_return_output,
 result_u8_value_MUX_uxn_device_h_l81_c2_1948_return_output,
 result_is_vram_write_MUX_uxn_device_h_l81_c2_1948_return_output,
 result_u16_addr_MUX_uxn_device_h_l81_c2_1948_return_output,
 y_MUX_uxn_device_h_l81_c2_1948_return_output,
 x_MUX_uxn_device_h_l81_c2_1948_return_output,
 is_new_row_MUX_uxn_device_h_l81_c2_1948_return_output,
 BIN_OP_PLUS_uxn_device_h_l85_c21_4f58_return_output,
 BIN_OP_EQ_uxn_device_h_l87_c16_6a3e_return_output,
 MUX_uxn_device_h_l87_c16_b994_return_output,
 c_MUX_uxn_device_h_l88_c3_1bfd_return_output,
 BIN_OP_PLUS_uxn_device_h_l89_c38_6f52_return_output,
 VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_e601_return_output,
 BIN_OP_MINUS_uxn_device_h_l90_c38_42d1_return_output,
 VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_a491_return_output,
 MUX_uxn_device_h_l92_c27_3e0e_return_output,
 BIN_OP_PLUS_uxn_device_h_l92_c21_ee86_return_output,
 MUX_uxn_device_h_l92_c7_dc52_return_output,
 BIN_OP_EQ_uxn_device_h_l93_c19_27f8_return_output,
 MUX_uxn_device_h_l93_c19_4d2f_return_output,
 BIN_OP_EQ_uxn_device_h_l98_c52_ee7a_return_output,
 MUX_uxn_device_h_l98_c52_c798_return_output,
 BIN_OP_OR_uxn_device_h_l98_c42_5f69_return_output,
 BIN_OP_AND_uxn_device_h_l98_c26_5966_return_output,
 BIN_OP_PLUS_uxn_device_h_l99_c30_d62f_return_output,
 VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_56d7_return_output,
 BIN_OP_EQ_uxn_device_h_l100_c7_bf06_return_output,
 BIN_OP_MINUS_uxn_device_h_l100_c41_500a_return_output,
 BIN_OP_PLUS_uxn_device_h_l100_c51_bb17_return_output,
 MUX_uxn_device_h_l100_c35_d104_return_output,
 MUX_uxn_device_h_l100_c7_fc28_return_output,
 BIN_OP_EQ_uxn_device_h_l101_c25_0b67_return_output,
 MUX_uxn_device_h_l101_c25_2603_return_output,
 BIN_OP_PLUS_uxn_device_h_l102_c14_d42e_return_output,
 BIN_OP_MINUS_uxn_device_h_l102_c24_46d0_return_output,
 MUX_uxn_device_h_l102_c8_ff45_return_output,
 CONST_SR_1_uxn_device_h_l103_c3_f346_return_output)
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
 variable VAR_color8_uxn_device_h_l64_c2_d18d : unsigned(7 downto 0);
 variable VAR_uint12_7_4_uxn_device_h_l65_c20_ca77_return_output : unsigned(3 downto 0);
 variable VAR_phase7_downto_3_uxn_device_h_l66_c2_fd9b : unsigned(4 downto 0);
 variable VAR_uint12_7_3_uxn_device_h_l66_c20_8ff7_return_output : unsigned(4 downto 0);
 variable VAR_uint12_2_0_uxn_device_h_l67_c20_2df0_return_output : unsigned(2 downto 0);
 variable VAR_phase7_downto_3_u8_uxn_device_h_l68_c2_7df6 : unsigned(7 downto 0);
 variable VAR_phase_minus_two_uxn_device_h_l69_c2_2ed9 : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_6ac3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_6ac3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_6ac3_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l71_c6_a52a_left : unsigned(3 downto 0);
 variable VAR_uint12_7_4_uxn_device_h_l71_c6_44d5_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l71_c6_a52a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l71_c6_a52a_return_output : unsigned(0 downto 0);
 variable VAR_sprite_rows_MUX_uxn_device_h_l71_c2_ae49_iftrue : uint8_t_16;
 variable VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5_uxn_device_h_l71_c2_ae49_return_output : uint8_t_16;
 variable VAR_sprite_rows_MUX_uxn_device_h_l71_c2_ae49_iffalse : uint8_t_16;
 variable VAR_sprite_rows_MUX_uxn_device_h_l71_c2_ae49_return_output : uint8_t_16;
 variable VAR_sprite_rows_MUX_uxn_device_h_l71_c2_ae49_cond : unsigned(0 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_1e36_return_output : uint8_t_array_16_t;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_1e36_elem_val : unsigned(7 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_1e36_ref_toks_0 : uint8_t_16;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_1e36_var_dim_0 : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l75_c6_f7ae_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l75_c6_f7ae_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l75_c6_f7ae_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c2_d9da_iftrue : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l78_c3_d5d6 : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c2_d9da_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c2_d9da_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c2_d9da_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c2_d9da_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l77_c3_cc9a : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c2_d9da_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c2_d9da_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c2_d9da_cond : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l75_c2_d9da_iftrue : unsigned(0 downto 0);
 variable VAR_opaque_uxn_device_h_l76_c3_333a : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l75_c2_d9da_iffalse : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l75_c2_d9da_return_output : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l75_c2_d9da_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_2f6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_2f6d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_2f6d_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_a1ed_var_dim_0 : unsigned(6 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_a1ed_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_a1ed_ref_toks_0 : uint8_t_80;
 variable VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_bdbf_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l77_c13_b278_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l77_c13_b278_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l77_c13_b278_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l77_c13_b278_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_bdbf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_bdbf_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_af13_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l78_c13_2485_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l78_c13_2485_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l78_c13_2485_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l78_c13_2485_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_af13_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_af13_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_return_output : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_1948_iftrue : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_1948_iffalse : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_1948_return_output : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_1948_cond : unsigned(0 downto 0);
 variable VAR_c_MUX_uxn_device_h_l81_c2_1948_iftrue : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l81_c2_1948_iffalse : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l81_c2_1948_return_output : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l81_c2_1948_cond : unsigned(0 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l81_c2_1948_iftrue : unsigned(7 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l81_c2_1948_iffalse : unsigned(7 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l81_c2_1948_return_output : unsigned(7 downto 0);
 variable VAR_ch_MUX_uxn_device_h_l81_c2_1948_cond : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_1948_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_1948_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_1948_return_output : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_1948_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l81_c2_1948_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l83_c3_0d3a : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l81_c2_1948_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l81_c2_1948_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l81_c2_1948_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_1948_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_1948_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_1948_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_1948_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_1948_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l85_c3_8aa8 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_1948_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_1948_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_1948_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c2_1948_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c2_1948_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c2_1948_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c2_1948_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c2_1948_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c2_1948_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c2_1948_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c2_1948_cond : unsigned(0 downto 0);
 variable VAR_is_new_row_MUX_uxn_device_h_l81_c2_1948_iftrue : unsigned(0 downto 0);
 variable VAR_is_new_row_MUX_uxn_device_h_l81_c2_1948_iffalse : unsigned(0 downto 0);
 variable VAR_is_new_row_MUX_uxn_device_h_l81_c2_1948_return_output : unsigned(0 downto 0);
 variable VAR_is_new_row_MUX_uxn_device_h_l81_c2_1948_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_4f58_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_4f58_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_4f58_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l87_c16_b994_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l87_c16_6a3e_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l87_c16_6a3e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l87_c16_6a3e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l87_c16_b994_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l87_c16_b994_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l87_c16_b994_return_output : unsigned(0 downto 0);
 variable VAR_c_MUX_uxn_device_h_l88_c3_1bfd_iftrue : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l88_c3_1bfd_iffalse : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l88_c3_1bfd_return_output : unsigned(15 downto 0);
 variable VAR_c_MUX_uxn_device_h_l88_c3_1bfd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l89_c38_6f52_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l89_c38_6f52_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l89_c38_6f52_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_e601_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_e601_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_e601_ref_toks_0 : uint8_t_16;
 variable VAR_uint16_uint8_8_uxn_device_h_l89_c8_8ed5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l90_c38_42d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l90_c38_42d1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l90_c38_42d1_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_a491_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_a491_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_a491_ref_toks_0 : uint8_t_16;
 variable VAR_uint16_uint8_0_uxn_device_h_l90_c8_66fa_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c7_dc52_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c7_dc52_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c7_dc52_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l92_c21_ee86_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c27_3e0e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c27_3e0e_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c27_3e0e_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c27_3e0e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l92_c21_ee86_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l92_c21_ee86_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l92_c7_dc52_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l93_c19_4d2f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l93_c19_27f8_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_device_h_l93_c19_ed2f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l93_c19_27f8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l93_c19_27f8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l93_c19_4d2f_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l93_c19_4d2f_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l93_c19_4d2f_return_output : unsigned(0 downto 0);
 variable VAR_uint16_8_8_uxn_device_h_l94_c25_bc68_return_output : unsigned(0 downto 0);
 variable VAR_uint8_uint1_5_uxn_device_h_l94_c8_449a_return_output : unsigned(7 downto 0);
 variable VAR_uint16_0_0_uxn_device_h_l95_c26_4b73_return_output : unsigned(0 downto 0);
 variable VAR_uint8_uint1_4_uxn_device_h_l95_c8_9ba2_return_output : unsigned(7 downto 0);
 variable VAR_uint16_7_0_uxn_device_h_l96_c39_ba69_return_output : unsigned(7 downto 0);
 variable VAR_uint16_uint8_8_uxn_device_h_l96_c21_37fa_return_output : unsigned(15 downto 0);
 variable VAR_uint16_7_0_uxn_device_h_l97_c53_5a77_return_output : unsigned(7 downto 0);
 variable VAR_uint16_uint8_0_uxn_device_h_l97_c21_93ce_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l98_c26_5966_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l98_c42_5f69_left : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l98_c52_c798_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l98_c52_ee7a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l98_c52_ee7a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l98_c52_ee7a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l98_c52_c798_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l98_c52_c798_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l98_c52_c798_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l98_c42_5f69_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l98_c42_5f69_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l98_c26_5966_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l98_c26_5966_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l99_c30_d62f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l99_c30_d62f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l99_c30_d62f_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_56d7_var_dim_0 : unsigned(6 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_56d7_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_56d7_ref_toks_0 : uint8_t_80;
 variable VAR_MUX_uxn_device_h_l100_c7_fc28_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_bf06_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_bf06_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_bf06_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l100_c7_fc28_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l100_c7_fc28_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l100_c35_d104_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l100_c35_d104_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l100_c35_d104_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l100_c41_500a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l100_c41_500a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l100_c41_500a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l100_c51_bb17_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l100_c51_bb17_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l100_c51_bb17_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l100_c35_d104_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l100_c7_fc28_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l101_c25_2603_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c25_0b67_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c25_0b67_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c25_0b67_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l101_c25_2603_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l101_c25_2603_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l101_c25_2603_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l102_c8_ff45_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l102_c8_ff45_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l102_c8_ff45_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l102_c14_d42e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l102_c14_d42e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l102_c14_d42e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l102_c24_46d0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l102_c24_46d0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l102_c24_46d0_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l102_c8_ff45_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l103_c3_f346_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l103_c3_f346_x : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_128d_uxn_device_h_l42_l106_DUPLICATE_0dad_return_output : screen_blit_result_t;
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
     VAR_MUX_uxn_device_h_l77_c13_b278_iftrue := to_unsigned(0, 16);
     VAR_MUX_uxn_device_h_l78_c13_2485_iffalse := to_unsigned(0, 16);
     VAR_result_u8_value_uxn_device_h_l83_c3_0d3a := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l81_c2_1948_iftrue := VAR_result_u8_value_uxn_device_h_l83_c3_0d3a;
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_bf06_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l101_c25_0b67_right := to_unsigned(79, 12);
     VAR_BIN_OP_EQ_uxn_device_h_l93_c19_27f8_right := to_unsigned(0, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l71_c6_a52a_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l78_c13_2485_iftrue := to_unsigned(7, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_2f6d_left := to_unsigned(64, 8);
     VAR_MUX_uxn_device_h_l77_c13_b278_iffalse := to_unsigned(7, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l102_c14_d42e_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l98_c52_c798_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l98_c52_ee7a_right := to_unsigned(0, 8);
     VAR_MUX_uxn_device_h_l93_c19_4d2f_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l101_c25_2603_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l93_c19_4d2f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l87_c16_6a3e_right := to_unsigned(0, 2);
     VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_1948_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l87_c16_b994_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l101_c25_2603_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l100_c41_500a_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l90_c38_42d1_right := to_unsigned(2, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l75_c6_f7ae_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l100_c51_bb17_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l89_c38_6f52_right := to_unsigned(6, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_right := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_6ac3_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_1948_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l98_c52_c798_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l87_c16_b994_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l92_c27_3e0e_iftrue := to_unsigned(0, 16);
     VAR_MUX_uxn_device_h_l92_c27_3e0e_iffalse := to_unsigned(7, 16);
     VAR_BIN_OP_MINUS_uxn_device_h_l102_c24_46d0_right := to_unsigned(1, 1);

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
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_a1ed_ref_toks_0 := blending;
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_56d7_ref_toks_0 := blending;
     REG_VAR_blending := blending;
     VAR_c_MUX_uxn_device_h_l81_c2_1948_iftrue := c;
     VAR_c_MUX_uxn_device_h_l88_c3_1bfd_iffalse := c;
     VAR_ch_MUX_uxn_device_h_l81_c2_1948_iftrue := ch;
     VAR_color8_uxn_device_h_l64_c2_d18d := resize(VAR_color, 8);
     VAR_MUX_uxn_device_h_l102_c8_ff45_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l77_c13_b278_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l92_c27_3e0e_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l100_c35_d104_cond := VAR_fy;
     VAR_MUX_uxn_device_h_l78_c13_2485_cond := VAR_fy;
     VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_1948_iftrue := is_in_bounds;
     VAR_is_new_row_MUX_uxn_device_h_l81_c2_1948_iftrue := is_new_row;
     VAR_opaque_MUX_uxn_device_h_l75_c2_d9da_iffalse := opaque;
     VAR_BIN_OP_EQ_uxn_device_h_l101_c25_0b67_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l75_c6_f7ae_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_6ac3_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_4f58_right := VAR_phase;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_1e36_elem_val := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_4f58_left := VAR_ram_addr;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_1e36_ref_toks_0 := sprite_rows;
     VAR_sprite_rows_MUX_uxn_device_h_l71_c2_ae49_iffalse := sprite_rows;
     VAR_x_MUX_uxn_device_h_l75_c2_d9da_iffalse := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_bdbf_left := VAR_x1;
     VAR_BIN_OP_PLUS_uxn_device_h_l92_c21_ee86_left := VAR_x1;
     VAR_y_MUX_uxn_device_h_l75_c2_d9da_iffalse := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_af13_left := VAR_y1;
     VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_2f6d_right := VAR_color8_uxn_device_h_l64_c2_d18d;
     VAR_BIN_OP_PLUS_uxn_device_h_l99_c30_d62f_left := VAR_color8_uxn_device_h_l64_c2_d18d;
     REG_VAR_color8 := VAR_color8_uxn_device_h_l64_c2_d18d;
     -- uint12_7_4[uxn_device_h_l65_c20_ca77] LATENCY=0
     VAR_uint12_7_4_uxn_device_h_l65_c20_ca77_return_output := uint12_7_4(
     VAR_phase);

     -- BIN_OP_PLUS[uxn_device_h_l85_c21_4f58] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l85_c21_4f58_left <= VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_4f58_left;
     BIN_OP_PLUS_uxn_device_h_l85_c21_4f58_right <= VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_4f58_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_4f58_return_output := BIN_OP_PLUS_uxn_device_h_l85_c21_4f58_return_output;

     -- uint12_7_3[uxn_device_h_l66_c20_8ff7] LATENCY=0
     VAR_uint12_7_3_uxn_device_h_l66_c20_8ff7_return_output := uint12_7_3(
     VAR_phase);

     -- MUX[uxn_device_h_l92_c27_3e0e] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l92_c27_3e0e_cond <= VAR_MUX_uxn_device_h_l92_c27_3e0e_cond;
     MUX_uxn_device_h_l92_c27_3e0e_iftrue <= VAR_MUX_uxn_device_h_l92_c27_3e0e_iftrue;
     MUX_uxn_device_h_l92_c27_3e0e_iffalse <= VAR_MUX_uxn_device_h_l92_c27_3e0e_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l92_c27_3e0e_return_output := MUX_uxn_device_h_l92_c27_3e0e_return_output;

     -- uint12_2_0[uxn_device_h_l67_c20_2df0] LATENCY=0
     VAR_uint12_2_0_uxn_device_h_l67_c20_2df0_return_output := uint12_2_0(
     VAR_phase);

     -- MUX[uxn_device_h_l77_c13_b278] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l77_c13_b278_cond <= VAR_MUX_uxn_device_h_l77_c13_b278_cond;
     MUX_uxn_device_h_l77_c13_b278_iftrue <= VAR_MUX_uxn_device_h_l77_c13_b278_iftrue;
     MUX_uxn_device_h_l77_c13_b278_iffalse <= VAR_MUX_uxn_device_h_l77_c13_b278_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l77_c13_b278_return_output := MUX_uxn_device_h_l77_c13_b278_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l69_c20_6ac3] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l69_c20_6ac3_left <= VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_6ac3_left;
     BIN_OP_MINUS_uxn_device_h_l69_c20_6ac3_right <= VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_6ac3_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_6ac3_return_output := BIN_OP_MINUS_uxn_device_h_l69_c20_6ac3_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l76_c21_2f6d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l76_c21_2f6d_left <= VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_2f6d_left;
     BIN_OP_PLUS_uxn_device_h_l76_c21_2f6d_right <= VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_2f6d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_2f6d_return_output := BIN_OP_PLUS_uxn_device_h_l76_c21_2f6d_return_output;

     -- MUX[uxn_device_h_l78_c13_2485] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l78_c13_2485_cond <= VAR_MUX_uxn_device_h_l78_c13_2485_cond;
     MUX_uxn_device_h_l78_c13_2485_iftrue <= VAR_MUX_uxn_device_h_l78_c13_2485_iftrue;
     MUX_uxn_device_h_l78_c13_2485_iffalse <= VAR_MUX_uxn_device_h_l78_c13_2485_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l78_c13_2485_return_output := MUX_uxn_device_h_l78_c13_2485_return_output;

     -- BIN_OP_EQ[uxn_device_h_l101_c25_0b67] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l101_c25_0b67_left <= VAR_BIN_OP_EQ_uxn_device_h_l101_c25_0b67_left;
     BIN_OP_EQ_uxn_device_h_l101_c25_0b67_right <= VAR_BIN_OP_EQ_uxn_device_h_l101_c25_0b67_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l101_c25_0b67_return_output := BIN_OP_EQ_uxn_device_h_l101_c25_0b67_return_output;

     -- BIN_OP_EQ[uxn_device_h_l75_c6_f7ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l75_c6_f7ae_left <= VAR_BIN_OP_EQ_uxn_device_h_l75_c6_f7ae_left;
     BIN_OP_EQ_uxn_device_h_l75_c6_f7ae_right <= VAR_BIN_OP_EQ_uxn_device_h_l75_c6_f7ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l75_c6_f7ae_return_output := BIN_OP_EQ_uxn_device_h_l75_c6_f7ae_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_device_h_l101_c25_2603_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c25_0b67_return_output;
     VAR_opaque_MUX_uxn_device_h_l75_c2_d9da_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c6_f7ae_return_output;
     VAR_x_MUX_uxn_device_h_l75_c2_d9da_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c6_f7ae_return_output;
     VAR_y_MUX_uxn_device_h_l75_c2_d9da_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c6_f7ae_return_output;
     VAR_phase_minus_two_uxn_device_h_l69_c2_2ed9 := VAR_BIN_OP_MINUS_uxn_device_h_l69_c20_6ac3_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_a1ed_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l76_c21_2f6d_return_output, 7);
     VAR_result_u16_addr_uxn_device_h_l85_c3_8aa8 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l85_c21_4f58_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_bdbf_right := VAR_MUX_uxn_device_h_l77_c13_b278_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_af13_right := VAR_MUX_uxn_device_h_l78_c13_2485_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l92_c21_ee86_right := VAR_MUX_uxn_device_h_l92_c27_3e0e_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_bf06_left := VAR_uint12_2_0_uxn_device_h_l67_c20_2df0_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l87_c16_6a3e_left := VAR_uint12_2_0_uxn_device_h_l67_c20_2df0_return_output;
     REG_VAR_phase2_downto_0 := VAR_uint12_2_0_uxn_device_h_l67_c20_2df0_return_output;
     VAR_phase7_downto_3_uxn_device_h_l66_c2_fd9b := VAR_uint12_7_3_uxn_device_h_l66_c20_8ff7_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_left := VAR_uint12_7_4_uxn_device_h_l65_c20_ca77_return_output;
     REG_VAR_phase7_downto_4 := VAR_uint12_7_4_uxn_device_h_l65_c20_ca77_return_output;
     REG_VAR_phase7_downto_3 := VAR_phase7_downto_3_uxn_device_h_l66_c2_fd9b;
     VAR_phase7_downto_3_u8_uxn_device_h_l68_c2_7df6 := resize(VAR_phase7_downto_3_uxn_device_h_l66_c2_fd9b, 8);
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_1e36_var_dim_0 := resize(VAR_phase_minus_two_uxn_device_h_l69_c2_2ed9, 4);
     REG_VAR_phase_minus_two := VAR_phase_minus_two_uxn_device_h_l69_c2_2ed9;
     VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_1948_iftrue := VAR_result_u16_addr_uxn_device_h_l85_c3_8aa8;
     VAR_BIN_OP_MINUS_uxn_device_h_l90_c38_42d1_left := VAR_phase7_downto_3_u8_uxn_device_h_l68_c2_7df6;
     VAR_BIN_OP_PLUS_uxn_device_h_l89_c38_6f52_left := VAR_phase7_downto_3_u8_uxn_device_h_l68_c2_7df6;
     REG_VAR_phase7_downto_3_u8 := VAR_phase7_downto_3_u8_uxn_device_h_l68_c2_7df6;
     -- BIN_OP_EQ[uxn_device_h_l81_c6_aa1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_left <= VAR_BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_left;
     BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_right <= VAR_BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_return_output := BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_return_output;

     -- uint12_7_4[uxn_device_h_l71_c6_44d5] LATENCY=0
     VAR_uint12_7_4_uxn_device_h_l71_c6_44d5_return_output := uint12_7_4(
     VAR_phase_minus_two_uxn_device_h_l69_c2_2ed9);

     -- BIN_OP_PLUS[uxn_device_h_l78_c7_af13] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l78_c7_af13_left <= VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_af13_left;
     BIN_OP_PLUS_uxn_device_h_l78_c7_af13_right <= VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_af13_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_af13_return_output := BIN_OP_PLUS_uxn_device_h_l78_c7_af13_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l92_c21_ee86] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l92_c21_ee86_left <= VAR_BIN_OP_PLUS_uxn_device_h_l92_c21_ee86_left;
     BIN_OP_PLUS_uxn_device_h_l92_c21_ee86_right <= VAR_BIN_OP_PLUS_uxn_device_h_l92_c21_ee86_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l92_c21_ee86_return_output := BIN_OP_PLUS_uxn_device_h_l92_c21_ee86_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l76_c12_a1ed] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_a1ed_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_a1ed_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_a1ed_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_a1ed_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_a1ed_return_output := VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_a1ed_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l77_c7_bdbf] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l77_c7_bdbf_left <= VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_bdbf_left;
     BIN_OP_PLUS_uxn_device_h_l77_c7_bdbf_right <= VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_bdbf_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_bdbf_return_output := BIN_OP_PLUS_uxn_device_h_l77_c7_bdbf_return_output;

     -- BIN_OP_EQ[uxn_device_h_l87_c16_6a3e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l87_c16_6a3e_left <= VAR_BIN_OP_EQ_uxn_device_h_l87_c16_6a3e_left;
     BIN_OP_EQ_uxn_device_h_l87_c16_6a3e_right <= VAR_BIN_OP_EQ_uxn_device_h_l87_c16_6a3e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l87_c16_6a3e_return_output := BIN_OP_EQ_uxn_device_h_l87_c16_6a3e_return_output;

     -- MUX[uxn_device_h_l101_c25_2603] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l101_c25_2603_cond <= VAR_MUX_uxn_device_h_l101_c25_2603_cond;
     MUX_uxn_device_h_l101_c25_2603_iftrue <= VAR_MUX_uxn_device_h_l101_c25_2603_iftrue;
     MUX_uxn_device_h_l101_c25_2603_iffalse <= VAR_MUX_uxn_device_h_l101_c25_2603_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l101_c25_2603_return_output := MUX_uxn_device_h_l101_c25_2603_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l89_c38_6f52] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l89_c38_6f52_left <= VAR_BIN_OP_PLUS_uxn_device_h_l89_c38_6f52_left;
     BIN_OP_PLUS_uxn_device_h_l89_c38_6f52_right <= VAR_BIN_OP_PLUS_uxn_device_h_l89_c38_6f52_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l89_c38_6f52_return_output := BIN_OP_PLUS_uxn_device_h_l89_c38_6f52_return_output;

     -- BIN_OP_EQ[uxn_device_h_l100_c7_bf06] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l100_c7_bf06_left <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_bf06_left;
     BIN_OP_EQ_uxn_device_h_l100_c7_bf06_right <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_bf06_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_bf06_return_output := BIN_OP_EQ_uxn_device_h_l100_c7_bf06_return_output;

     -- VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60[uxn_device_h_l72_c3_1e36] LATENCY=0
     -- Inputs
     VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_1e36_elem_val <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_1e36_elem_val;
     VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_1e36_ref_toks_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_1e36_ref_toks_0;
     VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_1e36_var_dim_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_1e36_var_dim_0;
     -- Outputs
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_1e36_return_output := VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_1e36_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l90_c38_42d1] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l90_c38_42d1_left <= VAR_BIN_OP_MINUS_uxn_device_h_l90_c38_42d1_left;
     BIN_OP_MINUS_uxn_device_h_l90_c38_42d1_right <= VAR_BIN_OP_MINUS_uxn_device_h_l90_c38_42d1_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l90_c38_42d1_return_output := BIN_OP_MINUS_uxn_device_h_l90_c38_42d1_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l100_c7_fc28_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_bf06_return_output;
     VAR_c_MUX_uxn_device_h_l81_c2_1948_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_return_output;
     VAR_ch_MUX_uxn_device_h_l81_c2_1948_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_return_output;
     VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_1948_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_return_output;
     VAR_is_new_row_MUX_uxn_device_h_l81_c2_1948_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_return_output;
     VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_1948_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_1948_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_1948_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l81_c2_1948_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_return_output;
     VAR_x_MUX_uxn_device_h_l81_c2_1948_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_return_output;
     VAR_y_MUX_uxn_device_h_l81_c2_1948_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c6_aa1d_return_output;
     VAR_MUX_uxn_device_h_l87_c16_b994_cond := VAR_BIN_OP_EQ_uxn_device_h_l87_c16_6a3e_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_a491_var_dim_0 := resize(VAR_BIN_OP_MINUS_uxn_device_h_l90_c38_42d1_return_output, 4);
     VAR_x_uxn_device_h_l77_c3_cc9a := resize(VAR_BIN_OP_PLUS_uxn_device_h_l77_c7_bdbf_return_output, 16);
     VAR_y_uxn_device_h_l78_c3_d5d6 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l78_c7_af13_return_output, 16);
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_e601_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l89_c38_6f52_return_output, 4);
     VAR_MUX_uxn_device_h_l92_c7_dc52_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l92_c21_ee86_return_output, 16);
     VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_1948_iffalse := VAR_MUX_uxn_device_h_l101_c25_2603_return_output;
     VAR_opaque_uxn_device_h_l76_c3_333a := resize(VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l76_c12_a1ed_return_output, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l71_c6_a52a_left := VAR_uint12_7_4_uxn_device_h_l71_c6_44d5_return_output;
     VAR_opaque_MUX_uxn_device_h_l75_c2_d9da_iftrue := VAR_opaque_uxn_device_h_l76_c3_333a;
     VAR_x_MUX_uxn_device_h_l75_c2_d9da_iftrue := VAR_x_uxn_device_h_l77_c3_cc9a;
     VAR_y_MUX_uxn_device_h_l75_c2_d9da_iftrue := VAR_y_uxn_device_h_l78_c3_d5d6;
     -- sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5[uxn_device_h_l71_c2_ae49] LATENCY=0
     VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5_uxn_device_h_l71_c2_ae49_return_output := CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5(
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60_uxn_device_h_l72_c3_1e36_return_output);

     -- BIN_OP_EQ[uxn_device_h_l71_c6_a52a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l71_c6_a52a_left <= VAR_BIN_OP_EQ_uxn_device_h_l71_c6_a52a_left;
     BIN_OP_EQ_uxn_device_h_l71_c6_a52a_right <= VAR_BIN_OP_EQ_uxn_device_h_l71_c6_a52a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l71_c6_a52a_return_output := BIN_OP_EQ_uxn_device_h_l71_c6_a52a_return_output;

     -- MUX[uxn_device_h_l87_c16_b994] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l87_c16_b994_cond <= VAR_MUX_uxn_device_h_l87_c16_b994_cond;
     MUX_uxn_device_h_l87_c16_b994_iftrue <= VAR_MUX_uxn_device_h_l87_c16_b994_iftrue;
     MUX_uxn_device_h_l87_c16_b994_iffalse <= VAR_MUX_uxn_device_h_l87_c16_b994_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l87_c16_b994_return_output := MUX_uxn_device_h_l87_c16_b994_return_output;

     -- result_is_blit_done_MUX[uxn_device_h_l81_c2_1948] LATENCY=0
     -- Inputs
     result_is_blit_done_MUX_uxn_device_h_l81_c2_1948_cond <= VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_1948_cond;
     result_is_blit_done_MUX_uxn_device_h_l81_c2_1948_iftrue <= VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_1948_iftrue;
     result_is_blit_done_MUX_uxn_device_h_l81_c2_1948_iffalse <= VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_1948_iffalse;
     -- Outputs
     VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_1948_return_output := result_is_blit_done_MUX_uxn_device_h_l81_c2_1948_return_output;

     -- opaque_MUX[uxn_device_h_l75_c2_d9da] LATENCY=0
     -- Inputs
     opaque_MUX_uxn_device_h_l75_c2_d9da_cond <= VAR_opaque_MUX_uxn_device_h_l75_c2_d9da_cond;
     opaque_MUX_uxn_device_h_l75_c2_d9da_iftrue <= VAR_opaque_MUX_uxn_device_h_l75_c2_d9da_iftrue;
     opaque_MUX_uxn_device_h_l75_c2_d9da_iffalse <= VAR_opaque_MUX_uxn_device_h_l75_c2_d9da_iffalse;
     -- Outputs
     VAR_opaque_MUX_uxn_device_h_l75_c2_d9da_return_output := opaque_MUX_uxn_device_h_l75_c2_d9da_return_output;

     -- x_MUX[uxn_device_h_l75_c2_d9da] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l75_c2_d9da_cond <= VAR_x_MUX_uxn_device_h_l75_c2_d9da_cond;
     x_MUX_uxn_device_h_l75_c2_d9da_iftrue <= VAR_x_MUX_uxn_device_h_l75_c2_d9da_iftrue;
     x_MUX_uxn_device_h_l75_c2_d9da_iffalse <= VAR_x_MUX_uxn_device_h_l75_c2_d9da_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l75_c2_d9da_return_output := x_MUX_uxn_device_h_l75_c2_d9da_return_output;

     -- y_MUX[uxn_device_h_l75_c2_d9da] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l75_c2_d9da_cond <= VAR_y_MUX_uxn_device_h_l75_c2_d9da_cond;
     y_MUX_uxn_device_h_l75_c2_d9da_iftrue <= VAR_y_MUX_uxn_device_h_l75_c2_d9da_iftrue;
     y_MUX_uxn_device_h_l75_c2_d9da_iffalse <= VAR_y_MUX_uxn_device_h_l75_c2_d9da_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l75_c2_d9da_return_output := y_MUX_uxn_device_h_l75_c2_d9da_return_output;

     -- Submodule level 3
     VAR_sprite_rows_MUX_uxn_device_h_l71_c2_ae49_cond := VAR_BIN_OP_EQ_uxn_device_h_l71_c6_a52a_return_output;
     VAR_MUX_uxn_device_h_l92_c7_dc52_cond := VAR_MUX_uxn_device_h_l87_c16_b994_return_output;
     VAR_c_MUX_uxn_device_h_l88_c3_1bfd_cond := VAR_MUX_uxn_device_h_l87_c16_b994_return_output;
     VAR_is_new_row_MUX_uxn_device_h_l81_c2_1948_iffalse := VAR_MUX_uxn_device_h_l87_c16_b994_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l98_c42_5f69_left := VAR_opaque_MUX_uxn_device_h_l75_c2_d9da_return_output;
     REG_VAR_opaque := VAR_opaque_MUX_uxn_device_h_l75_c2_d9da_return_output;
     VAR_sprite_rows_MUX_uxn_device_h_l71_c2_ae49_iftrue := VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_16_uint8_t_16_5ff5_uxn_device_h_l71_c2_ae49_return_output;
     VAR_MUX_uxn_device_h_l92_c7_dc52_iffalse := VAR_x_MUX_uxn_device_h_l75_c2_d9da_return_output;
     VAR_x_MUX_uxn_device_h_l81_c2_1948_iftrue := VAR_x_MUX_uxn_device_h_l75_c2_d9da_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l100_c41_500a_left := VAR_y_MUX_uxn_device_h_l75_c2_d9da_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l100_c51_bb17_left := VAR_y_MUX_uxn_device_h_l75_c2_d9da_return_output;
     VAR_MUX_uxn_device_h_l100_c7_fc28_iffalse := VAR_y_MUX_uxn_device_h_l75_c2_d9da_return_output;
     VAR_y_MUX_uxn_device_h_l81_c2_1948_iftrue := VAR_y_MUX_uxn_device_h_l75_c2_d9da_return_output;
     -- is_new_row_MUX[uxn_device_h_l81_c2_1948] LATENCY=0
     -- Inputs
     is_new_row_MUX_uxn_device_h_l81_c2_1948_cond <= VAR_is_new_row_MUX_uxn_device_h_l81_c2_1948_cond;
     is_new_row_MUX_uxn_device_h_l81_c2_1948_iftrue <= VAR_is_new_row_MUX_uxn_device_h_l81_c2_1948_iftrue;
     is_new_row_MUX_uxn_device_h_l81_c2_1948_iffalse <= VAR_is_new_row_MUX_uxn_device_h_l81_c2_1948_iffalse;
     -- Outputs
     VAR_is_new_row_MUX_uxn_device_h_l81_c2_1948_return_output := is_new_row_MUX_uxn_device_h_l81_c2_1948_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l100_c41_500a] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l100_c41_500a_left <= VAR_BIN_OP_MINUS_uxn_device_h_l100_c41_500a_left;
     BIN_OP_MINUS_uxn_device_h_l100_c41_500a_right <= VAR_BIN_OP_MINUS_uxn_device_h_l100_c41_500a_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l100_c41_500a_return_output := BIN_OP_MINUS_uxn_device_h_l100_c41_500a_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l100_c51_bb17] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l100_c51_bb17_left <= VAR_BIN_OP_PLUS_uxn_device_h_l100_c51_bb17_left;
     BIN_OP_PLUS_uxn_device_h_l100_c51_bb17_right <= VAR_BIN_OP_PLUS_uxn_device_h_l100_c51_bb17_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l100_c51_bb17_return_output := BIN_OP_PLUS_uxn_device_h_l100_c51_bb17_return_output;

     -- MUX[uxn_device_h_l92_c7_dc52] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l92_c7_dc52_cond <= VAR_MUX_uxn_device_h_l92_c7_dc52_cond;
     MUX_uxn_device_h_l92_c7_dc52_iftrue <= VAR_MUX_uxn_device_h_l92_c7_dc52_iftrue;
     MUX_uxn_device_h_l92_c7_dc52_iffalse <= VAR_MUX_uxn_device_h_l92_c7_dc52_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l92_c7_dc52_return_output := MUX_uxn_device_h_l92_c7_dc52_return_output;

     -- sprite_rows_MUX[uxn_device_h_l71_c2_ae49] LATENCY=0
     -- Inputs
     sprite_rows_MUX_uxn_device_h_l71_c2_ae49_cond <= VAR_sprite_rows_MUX_uxn_device_h_l71_c2_ae49_cond;
     sprite_rows_MUX_uxn_device_h_l71_c2_ae49_iftrue <= VAR_sprite_rows_MUX_uxn_device_h_l71_c2_ae49_iftrue;
     sprite_rows_MUX_uxn_device_h_l71_c2_ae49_iffalse <= VAR_sprite_rows_MUX_uxn_device_h_l71_c2_ae49_iffalse;
     -- Outputs
     VAR_sprite_rows_MUX_uxn_device_h_l71_c2_ae49_return_output := sprite_rows_MUX_uxn_device_h_l71_c2_ae49_return_output;

     -- uint16_7_0[uxn_device_h_l96_c39_ba69] LATENCY=0
     VAR_uint16_7_0_uxn_device_h_l96_c39_ba69_return_output := uint16_7_0(
     VAR_y_MUX_uxn_device_h_l75_c2_d9da_return_output);

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l100_c35_d104_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l100_c41_500a_return_output;
     VAR_MUX_uxn_device_h_l100_c35_d104_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l100_c51_bb17_return_output, 16);
     VAR_BIN_OP_MINUS_uxn_device_h_l102_c24_46d0_left := VAR_MUX_uxn_device_h_l92_c7_dc52_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l102_c14_d42e_left := VAR_MUX_uxn_device_h_l92_c7_dc52_return_output;
     REG_VAR_is_new_row := VAR_is_new_row_MUX_uxn_device_h_l81_c2_1948_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_e601_ref_toks_0 := VAR_sprite_rows_MUX_uxn_device_h_l71_c2_ae49_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_a491_ref_toks_0 := VAR_sprite_rows_MUX_uxn_device_h_l71_c2_ae49_return_output;
     REG_VAR_sprite_rows := VAR_sprite_rows_MUX_uxn_device_h_l71_c2_ae49_return_output;
     -- MUX[uxn_device_h_l100_c35_d104] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l100_c35_d104_cond <= VAR_MUX_uxn_device_h_l100_c35_d104_cond;
     MUX_uxn_device_h_l100_c35_d104_iftrue <= VAR_MUX_uxn_device_h_l100_c35_d104_iftrue;
     MUX_uxn_device_h_l100_c35_d104_iffalse <= VAR_MUX_uxn_device_h_l100_c35_d104_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l100_c35_d104_return_output := MUX_uxn_device_h_l100_c35_d104_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l89_c26_e601] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_e601_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_e601_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_e601_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_e601_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_e601_return_output := VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_e601_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d[uxn_device_h_l90_c26_a491] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_a491_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_a491_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_a491_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_a491_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_a491_return_output := VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_a491_return_output;

     -- uint16_7_0[uxn_device_h_l97_c53_5a77] LATENCY=0
     VAR_uint16_7_0_uxn_device_h_l97_c53_5a77_return_output := uint16_7_0(
     VAR_MUX_uxn_device_h_l92_c7_dc52_return_output);

     -- BIN_OP_PLUS[uxn_device_h_l102_c14_d42e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l102_c14_d42e_left <= VAR_BIN_OP_PLUS_uxn_device_h_l102_c14_d42e_left;
     BIN_OP_PLUS_uxn_device_h_l102_c14_d42e_right <= VAR_BIN_OP_PLUS_uxn_device_h_l102_c14_d42e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l102_c14_d42e_return_output := BIN_OP_PLUS_uxn_device_h_l102_c14_d42e_return_output;

     -- uint16_uint8_8[uxn_device_h_l96_c21_37fa] LATENCY=0
     VAR_uint16_uint8_8_uxn_device_h_l96_c21_37fa_return_output := uint16_uint8_8(
     resize(to_unsigned(0, 1), 16),
     VAR_uint16_7_0_uxn_device_h_l96_c39_ba69_return_output);

     -- BIN_OP_MINUS[uxn_device_h_l102_c24_46d0] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l102_c24_46d0_left <= VAR_BIN_OP_MINUS_uxn_device_h_l102_c24_46d0_left;
     BIN_OP_MINUS_uxn_device_h_l102_c24_46d0_right <= VAR_BIN_OP_MINUS_uxn_device_h_l102_c24_46d0_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l102_c24_46d0_return_output := BIN_OP_MINUS_uxn_device_h_l102_c24_46d0_return_output;

     -- uint16_15_8[uxn_device_h_l93_c19_ed2f] LATENCY=0
     VAR_uint16_15_8_uxn_device_h_l93_c19_ed2f_return_output := uint16_15_8(
     VAR_MUX_uxn_device_h_l92_c7_dc52_return_output);

     -- Submodule level 5
     VAR_MUX_uxn_device_h_l102_c8_ff45_iffalse := VAR_BIN_OP_MINUS_uxn_device_h_l102_c24_46d0_return_output;
     VAR_MUX_uxn_device_h_l102_c8_ff45_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l102_c14_d42e_return_output, 16);
     VAR_MUX_uxn_device_h_l100_c7_fc28_iftrue := VAR_MUX_uxn_device_h_l100_c35_d104_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l93_c19_27f8_left := VAR_uint16_15_8_uxn_device_h_l93_c19_ed2f_return_output;
     -- uint16_uint8_8[uxn_device_h_l89_c8_8ed5] LATENCY=0
     VAR_uint16_uint8_8_uxn_device_h_l89_c8_8ed5_return_output := uint16_uint8_8(
     resize(to_unsigned(0, 1), 16),
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l89_c26_e601_return_output);

     -- uint16_uint8_0[uxn_device_h_l97_c21_93ce] LATENCY=0
     VAR_uint16_uint8_0_uxn_device_h_l97_c21_93ce_return_output := uint16_uint8_0(
     VAR_uint16_uint8_8_uxn_device_h_l96_c21_37fa_return_output,
     VAR_uint16_7_0_uxn_device_h_l97_c53_5a77_return_output);

     -- BIN_OP_EQ[uxn_device_h_l93_c19_27f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l93_c19_27f8_left <= VAR_BIN_OP_EQ_uxn_device_h_l93_c19_27f8_left;
     BIN_OP_EQ_uxn_device_h_l93_c19_27f8_right <= VAR_BIN_OP_EQ_uxn_device_h_l93_c19_27f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l93_c19_27f8_return_output := BIN_OP_EQ_uxn_device_h_l93_c19_27f8_return_output;

     -- MUX[uxn_device_h_l100_c7_fc28] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l100_c7_fc28_cond <= VAR_MUX_uxn_device_h_l100_c7_fc28_cond;
     MUX_uxn_device_h_l100_c7_fc28_iftrue <= VAR_MUX_uxn_device_h_l100_c7_fc28_iftrue;
     MUX_uxn_device_h_l100_c7_fc28_iffalse <= VAR_MUX_uxn_device_h_l100_c7_fc28_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l100_c7_fc28_return_output := MUX_uxn_device_h_l100_c7_fc28_return_output;

     -- MUX[uxn_device_h_l102_c8_ff45] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l102_c8_ff45_cond <= VAR_MUX_uxn_device_h_l102_c8_ff45_cond;
     MUX_uxn_device_h_l102_c8_ff45_iftrue <= VAR_MUX_uxn_device_h_l102_c8_ff45_iftrue;
     MUX_uxn_device_h_l102_c8_ff45_iffalse <= VAR_MUX_uxn_device_h_l102_c8_ff45_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l102_c8_ff45_return_output := MUX_uxn_device_h_l102_c8_ff45_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_device_h_l93_c19_4d2f_cond := VAR_BIN_OP_EQ_uxn_device_h_l93_c19_27f8_return_output;
     VAR_y_MUX_uxn_device_h_l81_c2_1948_iffalse := VAR_MUX_uxn_device_h_l100_c7_fc28_return_output;
     VAR_x_MUX_uxn_device_h_l81_c2_1948_iffalse := VAR_MUX_uxn_device_h_l102_c8_ff45_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_1948_iffalse := VAR_uint16_uint8_0_uxn_device_h_l97_c21_93ce_return_output;
     -- x_MUX[uxn_device_h_l81_c2_1948] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l81_c2_1948_cond <= VAR_x_MUX_uxn_device_h_l81_c2_1948_cond;
     x_MUX_uxn_device_h_l81_c2_1948_iftrue <= VAR_x_MUX_uxn_device_h_l81_c2_1948_iftrue;
     x_MUX_uxn_device_h_l81_c2_1948_iffalse <= VAR_x_MUX_uxn_device_h_l81_c2_1948_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l81_c2_1948_return_output := x_MUX_uxn_device_h_l81_c2_1948_return_output;

     -- uint16_uint8_0[uxn_device_h_l90_c8_66fa] LATENCY=0
     VAR_uint16_uint8_0_uxn_device_h_l90_c8_66fa_return_output := uint16_uint8_0(
     VAR_uint16_uint8_8_uxn_device_h_l89_c8_8ed5_return_output,
     VAR_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_uxn_device_h_l90_c26_a491_return_output);

     -- MUX[uxn_device_h_l93_c19_4d2f] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l93_c19_4d2f_cond <= VAR_MUX_uxn_device_h_l93_c19_4d2f_cond;
     MUX_uxn_device_h_l93_c19_4d2f_iftrue <= VAR_MUX_uxn_device_h_l93_c19_4d2f_iftrue;
     MUX_uxn_device_h_l93_c19_4d2f_iffalse <= VAR_MUX_uxn_device_h_l93_c19_4d2f_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l93_c19_4d2f_return_output := MUX_uxn_device_h_l93_c19_4d2f_return_output;

     -- y_MUX[uxn_device_h_l81_c2_1948] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l81_c2_1948_cond <= VAR_y_MUX_uxn_device_h_l81_c2_1948_cond;
     y_MUX_uxn_device_h_l81_c2_1948_iftrue <= VAR_y_MUX_uxn_device_h_l81_c2_1948_iftrue;
     y_MUX_uxn_device_h_l81_c2_1948_iffalse <= VAR_y_MUX_uxn_device_h_l81_c2_1948_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l81_c2_1948_return_output := y_MUX_uxn_device_h_l81_c2_1948_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l81_c2_1948] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l81_c2_1948_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_1948_cond;
     result_u16_addr_MUX_uxn_device_h_l81_c2_1948_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_1948_iftrue;
     result_u16_addr_MUX_uxn_device_h_l81_c2_1948_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_1948_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_1948_return_output := result_u16_addr_MUX_uxn_device_h_l81_c2_1948_return_output;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_device_h_l98_c26_5966_left := VAR_MUX_uxn_device_h_l93_c19_4d2f_return_output;
     VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_1948_iffalse := VAR_MUX_uxn_device_h_l93_c19_4d2f_return_output;
     VAR_c_MUX_uxn_device_h_l88_c3_1bfd_iftrue := VAR_uint16_uint8_0_uxn_device_h_l90_c8_66fa_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l81_c2_1948_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l81_c2_1948_return_output;
     -- c_MUX[uxn_device_h_l88_c3_1bfd] LATENCY=0
     -- Inputs
     c_MUX_uxn_device_h_l88_c3_1bfd_cond <= VAR_c_MUX_uxn_device_h_l88_c3_1bfd_cond;
     c_MUX_uxn_device_h_l88_c3_1bfd_iftrue <= VAR_c_MUX_uxn_device_h_l88_c3_1bfd_iftrue;
     c_MUX_uxn_device_h_l88_c3_1bfd_iffalse <= VAR_c_MUX_uxn_device_h_l88_c3_1bfd_iffalse;
     -- Outputs
     VAR_c_MUX_uxn_device_h_l88_c3_1bfd_return_output := c_MUX_uxn_device_h_l88_c3_1bfd_return_output;

     -- is_in_bounds_MUX[uxn_device_h_l81_c2_1948] LATENCY=0
     -- Inputs
     is_in_bounds_MUX_uxn_device_h_l81_c2_1948_cond <= VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_1948_cond;
     is_in_bounds_MUX_uxn_device_h_l81_c2_1948_iftrue <= VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_1948_iftrue;
     is_in_bounds_MUX_uxn_device_h_l81_c2_1948_iffalse <= VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_1948_iffalse;
     -- Outputs
     VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_1948_return_output := is_in_bounds_MUX_uxn_device_h_l81_c2_1948_return_output;

     -- Submodule level 8
     VAR_CONST_SR_1_uxn_device_h_l103_c3_f346_x := VAR_c_MUX_uxn_device_h_l88_c3_1bfd_return_output;
     REG_VAR_is_in_bounds := VAR_is_in_bounds_MUX_uxn_device_h_l81_c2_1948_return_output;
     -- uint16_8_8[uxn_device_h_l94_c25_bc68] LATENCY=0
     VAR_uint16_8_8_uxn_device_h_l94_c25_bc68_return_output := uint16_8_8(
     VAR_c_MUX_uxn_device_h_l88_c3_1bfd_return_output);

     -- CONST_SR_1[uxn_device_h_l103_c3_f346] LATENCY=0
     -- Inputs
     CONST_SR_1_uxn_device_h_l103_c3_f346_x <= VAR_CONST_SR_1_uxn_device_h_l103_c3_f346_x;
     -- Outputs
     VAR_CONST_SR_1_uxn_device_h_l103_c3_f346_return_output := CONST_SR_1_uxn_device_h_l103_c3_f346_return_output;

     -- uint16_0_0[uxn_device_h_l95_c26_4b73] LATENCY=0
     VAR_uint16_0_0_uxn_device_h_l95_c26_4b73_return_output := uint16_0_0(
     VAR_c_MUX_uxn_device_h_l88_c3_1bfd_return_output);

     -- Submodule level 9
     VAR_c_MUX_uxn_device_h_l81_c2_1948_iffalse := VAR_CONST_SR_1_uxn_device_h_l103_c3_f346_return_output;
     -- c_MUX[uxn_device_h_l81_c2_1948] LATENCY=0
     -- Inputs
     c_MUX_uxn_device_h_l81_c2_1948_cond <= VAR_c_MUX_uxn_device_h_l81_c2_1948_cond;
     c_MUX_uxn_device_h_l81_c2_1948_iftrue <= VAR_c_MUX_uxn_device_h_l81_c2_1948_iftrue;
     c_MUX_uxn_device_h_l81_c2_1948_iffalse <= VAR_c_MUX_uxn_device_h_l81_c2_1948_iffalse;
     -- Outputs
     VAR_c_MUX_uxn_device_h_l81_c2_1948_return_output := c_MUX_uxn_device_h_l81_c2_1948_return_output;

     -- uint8_uint1_5[uxn_device_h_l94_c8_449a] LATENCY=0
     VAR_uint8_uint1_5_uxn_device_h_l94_c8_449a_return_output := uint8_uint1_5(
     resize(to_unsigned(0, 1), 8),
     VAR_uint16_8_8_uxn_device_h_l94_c25_bc68_return_output);

     -- Submodule level 10
     REG_VAR_c := VAR_c_MUX_uxn_device_h_l81_c2_1948_return_output;
     -- uint8_uint1_4[uxn_device_h_l95_c8_9ba2] LATENCY=0
     VAR_uint8_uint1_4_uxn_device_h_l95_c8_9ba2_return_output := uint8_uint1_4(
     VAR_uint8_uint1_5_uxn_device_h_l94_c8_449a_return_output,
     VAR_uint16_0_0_uxn_device_h_l95_c26_4b73_return_output);

     -- Submodule level 11
     VAR_BIN_OP_EQ_uxn_device_h_l98_c52_ee7a_left := VAR_uint8_uint1_4_uxn_device_h_l95_c8_9ba2_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l99_c30_d62f_right := VAR_uint8_uint1_4_uxn_device_h_l95_c8_9ba2_return_output;
     VAR_ch_MUX_uxn_device_h_l81_c2_1948_iffalse := VAR_uint8_uint1_4_uxn_device_h_l95_c8_9ba2_return_output;
     -- ch_MUX[uxn_device_h_l81_c2_1948] LATENCY=0
     -- Inputs
     ch_MUX_uxn_device_h_l81_c2_1948_cond <= VAR_ch_MUX_uxn_device_h_l81_c2_1948_cond;
     ch_MUX_uxn_device_h_l81_c2_1948_iftrue <= VAR_ch_MUX_uxn_device_h_l81_c2_1948_iftrue;
     ch_MUX_uxn_device_h_l81_c2_1948_iffalse <= VAR_ch_MUX_uxn_device_h_l81_c2_1948_iffalse;
     -- Outputs
     VAR_ch_MUX_uxn_device_h_l81_c2_1948_return_output := ch_MUX_uxn_device_h_l81_c2_1948_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l99_c30_d62f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l99_c30_d62f_left <= VAR_BIN_OP_PLUS_uxn_device_h_l99_c30_d62f_left;
     BIN_OP_PLUS_uxn_device_h_l99_c30_d62f_right <= VAR_BIN_OP_PLUS_uxn_device_h_l99_c30_d62f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l99_c30_d62f_return_output := BIN_OP_PLUS_uxn_device_h_l99_c30_d62f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l98_c52_ee7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l98_c52_ee7a_left <= VAR_BIN_OP_EQ_uxn_device_h_l98_c52_ee7a_left;
     BIN_OP_EQ_uxn_device_h_l98_c52_ee7a_right <= VAR_BIN_OP_EQ_uxn_device_h_l98_c52_ee7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l98_c52_ee7a_return_output := BIN_OP_EQ_uxn_device_h_l98_c52_ee7a_return_output;

     -- Submodule level 12
     VAR_MUX_uxn_device_h_l98_c52_c798_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c52_ee7a_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_56d7_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l99_c30_d62f_return_output, 7);
     REG_VAR_ch := VAR_ch_MUX_uxn_device_h_l81_c2_1948_return_output;
     -- MUX[uxn_device_h_l98_c52_c798] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l98_c52_c798_cond <= VAR_MUX_uxn_device_h_l98_c52_c798_cond;
     MUX_uxn_device_h_l98_c52_c798_iftrue <= VAR_MUX_uxn_device_h_l98_c52_c798_iftrue;
     MUX_uxn_device_h_l98_c52_c798_iffalse <= VAR_MUX_uxn_device_h_l98_c52_c798_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l98_c52_c798_return_output := MUX_uxn_device_h_l98_c52_c798_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d[uxn_device_h_l99_c21_56d7] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_56d7_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_56d7_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_56d7_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_56d7_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_56d7_return_output := VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_56d7_return_output;

     -- Submodule level 13
     VAR_BIN_OP_OR_uxn_device_h_l98_c42_5f69_right := VAR_MUX_uxn_device_h_l98_c52_c798_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l81_c2_1948_iffalse := VAR_VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d_uxn_device_h_l99_c21_56d7_return_output;
     -- BIN_OP_OR[uxn_device_h_l98_c42_5f69] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l98_c42_5f69_left <= VAR_BIN_OP_OR_uxn_device_h_l98_c42_5f69_left;
     BIN_OP_OR_uxn_device_h_l98_c42_5f69_right <= VAR_BIN_OP_OR_uxn_device_h_l98_c42_5f69_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l98_c42_5f69_return_output := BIN_OP_OR_uxn_device_h_l98_c42_5f69_return_output;

     -- result_u8_value_MUX[uxn_device_h_l81_c2_1948] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l81_c2_1948_cond <= VAR_result_u8_value_MUX_uxn_device_h_l81_c2_1948_cond;
     result_u8_value_MUX_uxn_device_h_l81_c2_1948_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l81_c2_1948_iftrue;
     result_u8_value_MUX_uxn_device_h_l81_c2_1948_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l81_c2_1948_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l81_c2_1948_return_output := result_u8_value_MUX_uxn_device_h_l81_c2_1948_return_output;

     -- Submodule level 14
     VAR_BIN_OP_AND_uxn_device_h_l98_c26_5966_right := VAR_BIN_OP_OR_uxn_device_h_l98_c42_5f69_return_output;
     -- BIN_OP_AND[uxn_device_h_l98_c26_5966] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l98_c26_5966_left <= VAR_BIN_OP_AND_uxn_device_h_l98_c26_5966_left;
     BIN_OP_AND_uxn_device_h_l98_c26_5966_right <= VAR_BIN_OP_AND_uxn_device_h_l98_c26_5966_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l98_c26_5966_return_output := BIN_OP_AND_uxn_device_h_l98_c26_5966_return_output;

     -- Submodule level 15
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_1948_iffalse := VAR_BIN_OP_AND_uxn_device_h_l98_c26_5966_return_output;
     -- result_is_vram_write_MUX[uxn_device_h_l81_c2_1948] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l81_c2_1948_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_1948_cond;
     result_is_vram_write_MUX_uxn_device_h_l81_c2_1948_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_1948_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l81_c2_1948_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_1948_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_1948_return_output := result_is_vram_write_MUX_uxn_device_h_l81_c2_1948_return_output;

     -- Submodule level 16
     -- CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_128d_uxn_device_h_l42_l106_DUPLICATE_0dad LATENCY=0
     VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_128d_uxn_device_h_l42_l106_DUPLICATE_0dad_return_output := CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_128d(
     result,
     VAR_result_is_blit_done_MUX_uxn_device_h_l81_c2_1948_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l81_c2_1948_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c2_1948_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l81_c2_1948_return_output);

     -- Submodule level 17
     REG_VAR_result := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_128d_uxn_device_h_l42_l106_DUPLICATE_0dad_return_output;
     VAR_return_output := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_128d_uxn_device_h_l42_l106_DUPLICATE_0dad_return_output;
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
