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
-- Submodules: 61
entity screen_1bpp_0CLK_13e364a0 is
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
end screen_1bpp_0CLK_13e364a0;
architecture arch of screen_1bpp_0CLK_13e364a0 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal blending : uint2_t_48 := (
0 => to_unsigned(0, 2),
1 => to_unsigned(0, 2),
2 => to_unsigned(0, 2),
3 => to_unsigned(0, 2),
4 => to_unsigned(1, 2),
5 => to_unsigned(0, 2),
6 => to_unsigned(1, 2),
7 => to_unsigned(1, 2),
8 => to_unsigned(2, 2),
9 => to_unsigned(2, 2),
10 => to_unsigned(0, 2),
11 => to_unsigned(2, 2),
12 => to_unsigned(3, 2),
13 => to_unsigned(3, 2),
14 => to_unsigned(3, 2),
15 => to_unsigned(0, 2),
16 => to_unsigned(0, 2),
17 => to_unsigned(1, 2),
18 => to_unsigned(2, 2),
19 => to_unsigned(3, 2),
20 => to_unsigned(0, 2),
21 => to_unsigned(1, 2),
22 => to_unsigned(2, 2),
23 => to_unsigned(3, 2),
24 => to_unsigned(0, 2),
25 => to_unsigned(1, 2),
26 => to_unsigned(2, 2),
27 => to_unsigned(3, 2),
28 => to_unsigned(0, 2),
29 => to_unsigned(1, 2),
30 => to_unsigned(2, 2),
31 => to_unsigned(3, 2),
32 => to_unsigned(0, 2),
33 => to_unsigned(1, 2),
34 => to_unsigned(1, 2),
35 => to_unsigned(1, 2),
36 => to_unsigned(1, 2),
37 => to_unsigned(0, 2),
38 => to_unsigned(1, 2),
39 => to_unsigned(1, 2),
40 => to_unsigned(1, 2),
41 => to_unsigned(1, 2),
42 => to_unsigned(0, 2),
43 => to_unsigned(1, 2),
44 => to_unsigned(1, 2),
45 => to_unsigned(1, 2),
46 => to_unsigned(1, 2),
47 => to_unsigned(0, 2),
others => to_unsigned(0, 2))
;
signal x : unsigned(15 downto 0) := to_unsigned(0, 16);
signal y : unsigned(15 downto 0) := to_unsigned(0, 16);
signal opaque : unsigned(0 downto 0) := to_unsigned(0, 1);
signal c : unsigned(7 downto 0) := to_unsigned(0, 8);
signal color8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : screen_blit_result_t := screen_blit_result_t_NULL;
signal phase_minus_two : unsigned(11 downto 0) := to_unsigned(0, 12);
signal phase7_downto_3 : unsigned(4 downto 0) := to_unsigned(0, 5);
signal phase2_downto_0 : unsigned(2 downto 0) := to_unsigned(0, 3);
signal sprite_rows : uint8_t_8 := (others => to_unsigned(0, 8));
signal is_in_bounds : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_blending : uint2_t_48;
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);
signal REG_COMB_opaque : unsigned(0 downto 0);
signal REG_COMB_c : unsigned(7 downto 0);
signal REG_COMB_color8 : unsigned(7 downto 0);
signal REG_COMB_result : screen_blit_result_t;
signal REG_COMB_phase_minus_two : unsigned(11 downto 0);
signal REG_COMB_phase7_downto_3 : unsigned(4 downto 0);
signal REG_COMB_phase2_downto_0 : unsigned(2 downto 0);
signal REG_COMB_sprite_rows : uint8_t_8;
signal REG_COMB_is_in_bounds : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_MINUS[uxn_device_h_l130_c20_6e7a]
signal BIN_OP_MINUS_uxn_device_h_l130_c20_6e7a_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l130_c20_6e7a_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l130_c20_6e7a_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l132_c6_75e3]
signal BIN_OP_EQ_uxn_device_h_l132_c6_75e3_left : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l132_c6_75e3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l132_c6_75e3_return_output : unsigned(0 downto 0);

-- sprite_rows_MUX[uxn_device_h_l132_c2_c733]
signal sprite_rows_MUX_uxn_device_h_l132_c2_c733_cond : unsigned(0 downto 0);
signal sprite_rows_MUX_uxn_device_h_l132_c2_c733_iftrue : uint8_t_8;
signal sprite_rows_MUX_uxn_device_h_l132_c2_c733_iffalse : uint8_t_8;
signal sprite_rows_MUX_uxn_device_h_l132_c2_c733_return_output : uint8_t_8;

-- VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8[uxn_device_h_l133_c3_3394]
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_3394_elem_val : unsigned(7 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_3394_ref_toks_0 : uint8_t_8;
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_3394_var_dim_0 : unsigned(2 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_3394_return_output : uint8_t_array_8_t;

-- BIN_OP_EQ[uxn_device_h_l136_c6_7623]
signal BIN_OP_EQ_uxn_device_h_l136_c6_7623_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c6_7623_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c6_7623_return_output : unsigned(0 downto 0);

-- opaque_MUX[uxn_device_h_l136_c2_1751]
signal opaque_MUX_uxn_device_h_l136_c2_1751_cond : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l136_c2_1751_iftrue : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l136_c2_1751_iffalse : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l136_c2_1751_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l136_c2_1751]
signal x_MUX_uxn_device_h_l136_c2_1751_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l136_c2_1751_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l136_c2_1751_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l136_c2_1751_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l136_c2_1751]
signal y_MUX_uxn_device_h_l136_c2_1751_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l136_c2_1751_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l136_c2_1751_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l136_c2_1751_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l137_c21_752e]
signal BIN_OP_PLUS_uxn_device_h_l137_c21_752e_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l137_c21_752e_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l137_c21_752e_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l137_c12_234f]
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_234f_ref_toks_0 : uint2_t_48;
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_234f_var_dim_0 : unsigned(5 downto 0);
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_234f_return_output : unsigned(1 downto 0);

-- MUX[uxn_device_h_l138_c13_e816]
signal MUX_uxn_device_h_l138_c13_e816_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l138_c13_e816_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l138_c13_e816_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l138_c13_e816_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l138_c7_c88d]
signal BIN_OP_PLUS_uxn_device_h_l138_c7_c88d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l138_c7_c88d_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l138_c7_c88d_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l139_c13_1c17]
signal MUX_uxn_device_h_l139_c13_1c17_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l139_c13_1c17_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l139_c13_1c17_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l139_c13_1c17_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l139_c7_c761]
signal BIN_OP_PLUS_uxn_device_h_l139_c7_c761_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l139_c7_c761_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l139_c7_c761_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l142_c6_9245]
signal BIN_OP_EQ_uxn_device_h_l142_c6_9245_left : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l142_c6_9245_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l142_c6_9245_return_output : unsigned(0 downto 0);

-- is_in_bounds_MUX[uxn_device_h_l142_c2_c4c0]
signal is_in_bounds_MUX_uxn_device_h_l142_c2_c4c0_cond : unsigned(0 downto 0);
signal is_in_bounds_MUX_uxn_device_h_l142_c2_c4c0_iftrue : unsigned(0 downto 0);
signal is_in_bounds_MUX_uxn_device_h_l142_c2_c4c0_iffalse : unsigned(0 downto 0);
signal is_in_bounds_MUX_uxn_device_h_l142_c2_c4c0_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l142_c2_c4c0]
signal x_MUX_uxn_device_h_l142_c2_c4c0_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l142_c2_c4c0_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l142_c2_c4c0_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l142_c2_c4c0_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l142_c2_c4c0]
signal result_is_vram_write_MUX_uxn_device_h_l142_c2_c4c0_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l142_c2_c4c0_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l142_c2_c4c0_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l142_c2_c4c0_return_output : unsigned(0 downto 0);

-- result_is_blit_done_MUX[uxn_device_h_l142_c2_c4c0]
signal result_is_blit_done_MUX_uxn_device_h_l142_c2_c4c0_cond : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l142_c2_c4c0_iftrue : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l142_c2_c4c0_iffalse : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l142_c2_c4c0_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l142_c2_c4c0]
signal result_u16_addr_MUX_uxn_device_h_l142_c2_c4c0_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l142_c2_c4c0_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l142_c2_c4c0_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l142_c2_c4c0_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_device_h_l142_c2_c4c0]
signal result_u8_value_MUX_uxn_device_h_l142_c2_c4c0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l142_c2_c4c0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l142_c2_c4c0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l142_c2_c4c0_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l142_c2_c4c0]
signal y_MUX_uxn_device_h_l142_c2_c4c0_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l142_c2_c4c0_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l142_c2_c4c0_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l142_c2_c4c0_return_output : unsigned(15 downto 0);

-- c_MUX[uxn_device_h_l142_c2_c4c0]
signal c_MUX_uxn_device_h_l142_c2_c4c0_cond : unsigned(0 downto 0);
signal c_MUX_uxn_device_h_l142_c2_c4c0_iftrue : unsigned(7 downto 0);
signal c_MUX_uxn_device_h_l142_c2_c4c0_iffalse : unsigned(7 downto 0);
signal c_MUX_uxn_device_h_l142_c2_c4c0_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l146_c21_b1a2]
signal BIN_OP_PLUS_uxn_device_h_l146_c21_b1a2_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l146_c21_b1a2_right : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l146_c21_b1a2_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l148_c7_ad87]
signal BIN_OP_EQ_uxn_device_h_l148_c7_ad87_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l148_c7_ad87_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l148_c7_ad87_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l148_c46_212e]
signal BIN_OP_MINUS_uxn_device_h_l148_c46_212e_left : unsigned(4 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l148_c46_212e_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l148_c46_212e_return_output : unsigned(4 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d[uxn_device_h_l148_c34_3785]
signal VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_3785_ref_toks_0 : uint8_t_8;
signal VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_3785_var_dim_0 : unsigned(2 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_3785_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l148_c7_df62]
signal MUX_uxn_device_h_l148_c7_df62_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l148_c7_df62_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l148_c7_df62_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l148_c7_df62_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l149_c7_5b56]
signal BIN_OP_EQ_uxn_device_h_l149_c7_5b56_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l149_c7_5b56_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l149_c7_5b56_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l149_c41_f92f]
signal MUX_uxn_device_h_l149_c41_f92f_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l149_c41_f92f_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l149_c41_f92f_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l149_c41_f92f_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l149_c35_73e2]
signal BIN_OP_PLUS_uxn_device_h_l149_c35_73e2_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l149_c35_73e2_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l149_c35_73e2_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l149_c7_6f2a]
signal MUX_uxn_device_h_l149_c7_6f2a_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l149_c7_6f2a_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l149_c7_6f2a_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l149_c7_6f2a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l150_c18_1822]
signal BIN_OP_EQ_uxn_device_h_l150_c18_1822_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l150_c18_1822_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l150_c18_1822_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l150_c18_d8aa]
signal MUX_uxn_device_h_l150_c18_d8aa_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l150_c18_d8aa_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l150_c18_d8aa_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l150_c18_d8aa_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l153_c42_3818]
signal BIN_OP_OR_uxn_device_h_l153_c42_3818_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l153_c42_3818_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l153_c42_3818_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l153_c26_bd33]
signal BIN_OP_AND_uxn_device_h_l153_c26_bd33_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l153_c26_bd33_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l153_c26_bd33_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l154_c40_a373]
signal MUX_uxn_device_h_l154_c40_a373_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l154_c40_a373_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l154_c40_a373_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l154_c40_a373_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l154_c30_5537]
signal BIN_OP_PLUS_uxn_device_h_l154_c30_5537_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l154_c30_5537_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l154_c30_5537_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l154_c21_b09c]
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_b09c_ref_toks_0 : uint2_t_48;
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_b09c_var_dim_0 : unsigned(5 downto 0);
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_b09c_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l155_c7_c317]
signal BIN_OP_EQ_uxn_device_h_l155_c7_c317_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l155_c7_c317_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l155_c7_c317_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l155_c41_51ef]
signal BIN_OP_MINUS_uxn_device_h_l155_c41_51ef_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l155_c41_51ef_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l155_c41_51ef_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l155_c51_01c2]
signal BIN_OP_PLUS_uxn_device_h_l155_c51_01c2_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l155_c51_01c2_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l155_c51_01c2_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l155_c35_bd10]
signal MUX_uxn_device_h_l155_c35_bd10_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l155_c35_bd10_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l155_c35_bd10_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l155_c35_bd10_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l155_c7_8f1d]
signal MUX_uxn_device_h_l155_c7_8f1d_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l155_c7_8f1d_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l155_c7_8f1d_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l155_c7_8f1d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l156_c25_0c1a]
signal BIN_OP_EQ_uxn_device_h_l156_c25_0c1a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l156_c25_0c1a_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l156_c25_0c1a_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l156_c25_df62]
signal MUX_uxn_device_h_l156_c25_df62_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l156_c25_df62_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l156_c25_df62_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l156_c25_df62_return_output : unsigned(0 downto 0);

-- CONST_SR_1[uxn_device_h_l157_c3_b885]
signal CONST_SR_1_uxn_device_h_l157_c3_b885_x : unsigned(7 downto 0);
signal CONST_SR_1_uxn_device_h_l157_c3_b885_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l158_c14_19ee]
signal BIN_OP_PLUS_uxn_device_h_l158_c14_19ee_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l158_c14_19ee_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l158_c14_19ee_return_output : unsigned(16 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l158_c24_ffb7]
signal BIN_OP_MINUS_uxn_device_h_l158_c24_ffb7_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l158_c24_ffb7_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l158_c24_ffb7_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l158_c8_7a50]
signal MUX_uxn_device_h_l158_c8_7a50_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l158_c8_7a50_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l158_c8_7a50_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l158_c8_7a50_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5( ref_toks_0 : uint8_t_array_8_t) return uint8_t_8 is
 
  variable base : uint8_t_8; 
  variable return_output : uint8_t_8;
begin
      base(4) := ref_toks_0.data(4);
      base(1) := ref_toks_0.data(1);
      base(7) := ref_toks_0.data(7);
      base(0) := ref_toks_0.data(0);
      base(6) := ref_toks_0.data(6);
      base(3) := ref_toks_0.data(3);
      base(2) := ref_toks_0.data(2);
      base(5) := ref_toks_0.data(5);

      return_output := base;
      return return_output; 
end function;

function uint16_15_8( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);
begin
return_output := unsigned(std_logic_vector(x(15 downto 8)));
return return_output;
end function;

function uint16_7_0( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);
begin
return_output := unsigned(std_logic_vector(x(7 downto 0)));
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

function uint8_0_0( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(0- i);
      end loop;
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
-- BIN_OP_MINUS_uxn_device_h_l130_c20_6e7a
BIN_OP_MINUS_uxn_device_h_l130_c20_6e7a : entity work.BIN_OP_MINUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l130_c20_6e7a_left,
BIN_OP_MINUS_uxn_device_h_l130_c20_6e7a_right,
BIN_OP_MINUS_uxn_device_h_l130_c20_6e7a_return_output);

-- BIN_OP_EQ_uxn_device_h_l132_c6_75e3
BIN_OP_EQ_uxn_device_h_l132_c6_75e3 : entity work.BIN_OP_EQ_uint5_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l132_c6_75e3_left,
BIN_OP_EQ_uxn_device_h_l132_c6_75e3_right,
BIN_OP_EQ_uxn_device_h_l132_c6_75e3_return_output);

-- sprite_rows_MUX_uxn_device_h_l132_c2_c733
sprite_rows_MUX_uxn_device_h_l132_c2_c733 : entity work.MUX_uint1_t_uint8_t_8_uint8_t_8_0CLK_de264c78 port map (
sprite_rows_MUX_uxn_device_h_l132_c2_c733_cond,
sprite_rows_MUX_uxn_device_h_l132_c2_c733_iftrue,
sprite_rows_MUX_uxn_device_h_l132_c2_c733_iffalse,
sprite_rows_MUX_uxn_device_h_l132_c2_c733_return_output);

-- VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_3394
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_3394 : entity work.VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_0CLK_83e31706 port map (
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_3394_elem_val,
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_3394_ref_toks_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_3394_var_dim_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_3394_return_output);

-- BIN_OP_EQ_uxn_device_h_l136_c6_7623
BIN_OP_EQ_uxn_device_h_l136_c6_7623 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l136_c6_7623_left,
BIN_OP_EQ_uxn_device_h_l136_c6_7623_right,
BIN_OP_EQ_uxn_device_h_l136_c6_7623_return_output);

-- opaque_MUX_uxn_device_h_l136_c2_1751
opaque_MUX_uxn_device_h_l136_c2_1751 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opaque_MUX_uxn_device_h_l136_c2_1751_cond,
opaque_MUX_uxn_device_h_l136_c2_1751_iftrue,
opaque_MUX_uxn_device_h_l136_c2_1751_iffalse,
opaque_MUX_uxn_device_h_l136_c2_1751_return_output);

-- x_MUX_uxn_device_h_l136_c2_1751
x_MUX_uxn_device_h_l136_c2_1751 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l136_c2_1751_cond,
x_MUX_uxn_device_h_l136_c2_1751_iftrue,
x_MUX_uxn_device_h_l136_c2_1751_iffalse,
x_MUX_uxn_device_h_l136_c2_1751_return_output);

-- y_MUX_uxn_device_h_l136_c2_1751
y_MUX_uxn_device_h_l136_c2_1751 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l136_c2_1751_cond,
y_MUX_uxn_device_h_l136_c2_1751_iftrue,
y_MUX_uxn_device_h_l136_c2_1751_iffalse,
y_MUX_uxn_device_h_l136_c2_1751_return_output);

-- BIN_OP_PLUS_uxn_device_h_l137_c21_752e
BIN_OP_PLUS_uxn_device_h_l137_c21_752e : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l137_c21_752e_left,
BIN_OP_PLUS_uxn_device_h_l137_c21_752e_right,
BIN_OP_PLUS_uxn_device_h_l137_c21_752e_return_output);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_234f
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_234f : entity work.VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_0CLK_f9daebf3 port map (
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_234f_ref_toks_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_234f_var_dim_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_234f_return_output);

-- MUX_uxn_device_h_l138_c13_e816
MUX_uxn_device_h_l138_c13_e816 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l138_c13_e816_cond,
MUX_uxn_device_h_l138_c13_e816_iftrue,
MUX_uxn_device_h_l138_c13_e816_iffalse,
MUX_uxn_device_h_l138_c13_e816_return_output);

-- BIN_OP_PLUS_uxn_device_h_l138_c7_c88d
BIN_OP_PLUS_uxn_device_h_l138_c7_c88d : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l138_c7_c88d_left,
BIN_OP_PLUS_uxn_device_h_l138_c7_c88d_right,
BIN_OP_PLUS_uxn_device_h_l138_c7_c88d_return_output);

-- MUX_uxn_device_h_l139_c13_1c17
MUX_uxn_device_h_l139_c13_1c17 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l139_c13_1c17_cond,
MUX_uxn_device_h_l139_c13_1c17_iftrue,
MUX_uxn_device_h_l139_c13_1c17_iffalse,
MUX_uxn_device_h_l139_c13_1c17_return_output);

-- BIN_OP_PLUS_uxn_device_h_l139_c7_c761
BIN_OP_PLUS_uxn_device_h_l139_c7_c761 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l139_c7_c761_left,
BIN_OP_PLUS_uxn_device_h_l139_c7_c761_right,
BIN_OP_PLUS_uxn_device_h_l139_c7_c761_return_output);

-- BIN_OP_EQ_uxn_device_h_l142_c6_9245
BIN_OP_EQ_uxn_device_h_l142_c6_9245 : entity work.BIN_OP_EQ_uint5_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l142_c6_9245_left,
BIN_OP_EQ_uxn_device_h_l142_c6_9245_right,
BIN_OP_EQ_uxn_device_h_l142_c6_9245_return_output);

-- is_in_bounds_MUX_uxn_device_h_l142_c2_c4c0
is_in_bounds_MUX_uxn_device_h_l142_c2_c4c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_in_bounds_MUX_uxn_device_h_l142_c2_c4c0_cond,
is_in_bounds_MUX_uxn_device_h_l142_c2_c4c0_iftrue,
is_in_bounds_MUX_uxn_device_h_l142_c2_c4c0_iffalse,
is_in_bounds_MUX_uxn_device_h_l142_c2_c4c0_return_output);

-- x_MUX_uxn_device_h_l142_c2_c4c0
x_MUX_uxn_device_h_l142_c2_c4c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l142_c2_c4c0_cond,
x_MUX_uxn_device_h_l142_c2_c4c0_iftrue,
x_MUX_uxn_device_h_l142_c2_c4c0_iffalse,
x_MUX_uxn_device_h_l142_c2_c4c0_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l142_c2_c4c0
result_is_vram_write_MUX_uxn_device_h_l142_c2_c4c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l142_c2_c4c0_cond,
result_is_vram_write_MUX_uxn_device_h_l142_c2_c4c0_iftrue,
result_is_vram_write_MUX_uxn_device_h_l142_c2_c4c0_iffalse,
result_is_vram_write_MUX_uxn_device_h_l142_c2_c4c0_return_output);

-- result_is_blit_done_MUX_uxn_device_h_l142_c2_c4c0
result_is_blit_done_MUX_uxn_device_h_l142_c2_c4c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_blit_done_MUX_uxn_device_h_l142_c2_c4c0_cond,
result_is_blit_done_MUX_uxn_device_h_l142_c2_c4c0_iftrue,
result_is_blit_done_MUX_uxn_device_h_l142_c2_c4c0_iffalse,
result_is_blit_done_MUX_uxn_device_h_l142_c2_c4c0_return_output);

-- result_u16_addr_MUX_uxn_device_h_l142_c2_c4c0
result_u16_addr_MUX_uxn_device_h_l142_c2_c4c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l142_c2_c4c0_cond,
result_u16_addr_MUX_uxn_device_h_l142_c2_c4c0_iftrue,
result_u16_addr_MUX_uxn_device_h_l142_c2_c4c0_iffalse,
result_u16_addr_MUX_uxn_device_h_l142_c2_c4c0_return_output);

-- result_u8_value_MUX_uxn_device_h_l142_c2_c4c0
result_u8_value_MUX_uxn_device_h_l142_c2_c4c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l142_c2_c4c0_cond,
result_u8_value_MUX_uxn_device_h_l142_c2_c4c0_iftrue,
result_u8_value_MUX_uxn_device_h_l142_c2_c4c0_iffalse,
result_u8_value_MUX_uxn_device_h_l142_c2_c4c0_return_output);

-- y_MUX_uxn_device_h_l142_c2_c4c0
y_MUX_uxn_device_h_l142_c2_c4c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l142_c2_c4c0_cond,
y_MUX_uxn_device_h_l142_c2_c4c0_iftrue,
y_MUX_uxn_device_h_l142_c2_c4c0_iffalse,
y_MUX_uxn_device_h_l142_c2_c4c0_return_output);

-- c_MUX_uxn_device_h_l142_c2_c4c0
c_MUX_uxn_device_h_l142_c2_c4c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
c_MUX_uxn_device_h_l142_c2_c4c0_cond,
c_MUX_uxn_device_h_l142_c2_c4c0_iftrue,
c_MUX_uxn_device_h_l142_c2_c4c0_iffalse,
c_MUX_uxn_device_h_l142_c2_c4c0_return_output);

-- BIN_OP_PLUS_uxn_device_h_l146_c21_b1a2
BIN_OP_PLUS_uxn_device_h_l146_c21_b1a2 : entity work.BIN_OP_PLUS_uint16_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l146_c21_b1a2_left,
BIN_OP_PLUS_uxn_device_h_l146_c21_b1a2_right,
BIN_OP_PLUS_uxn_device_h_l146_c21_b1a2_return_output);

-- BIN_OP_EQ_uxn_device_h_l148_c7_ad87
BIN_OP_EQ_uxn_device_h_l148_c7_ad87 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l148_c7_ad87_left,
BIN_OP_EQ_uxn_device_h_l148_c7_ad87_right,
BIN_OP_EQ_uxn_device_h_l148_c7_ad87_return_output);

-- BIN_OP_MINUS_uxn_device_h_l148_c46_212e
BIN_OP_MINUS_uxn_device_h_l148_c46_212e : entity work.BIN_OP_MINUS_uint5_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l148_c46_212e_left,
BIN_OP_MINUS_uxn_device_h_l148_c46_212e_right,
BIN_OP_MINUS_uxn_device_h_l148_c46_212e_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_3785
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_3785 : entity work.VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_0CLK_814e9c60 port map (
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_3785_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_3785_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_3785_return_output);

-- MUX_uxn_device_h_l148_c7_df62
MUX_uxn_device_h_l148_c7_df62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l148_c7_df62_cond,
MUX_uxn_device_h_l148_c7_df62_iftrue,
MUX_uxn_device_h_l148_c7_df62_iffalse,
MUX_uxn_device_h_l148_c7_df62_return_output);

-- BIN_OP_EQ_uxn_device_h_l149_c7_5b56
BIN_OP_EQ_uxn_device_h_l149_c7_5b56 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l149_c7_5b56_left,
BIN_OP_EQ_uxn_device_h_l149_c7_5b56_right,
BIN_OP_EQ_uxn_device_h_l149_c7_5b56_return_output);

-- MUX_uxn_device_h_l149_c41_f92f
MUX_uxn_device_h_l149_c41_f92f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l149_c41_f92f_cond,
MUX_uxn_device_h_l149_c41_f92f_iftrue,
MUX_uxn_device_h_l149_c41_f92f_iffalse,
MUX_uxn_device_h_l149_c41_f92f_return_output);

-- BIN_OP_PLUS_uxn_device_h_l149_c35_73e2
BIN_OP_PLUS_uxn_device_h_l149_c35_73e2 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l149_c35_73e2_left,
BIN_OP_PLUS_uxn_device_h_l149_c35_73e2_right,
BIN_OP_PLUS_uxn_device_h_l149_c35_73e2_return_output);

-- MUX_uxn_device_h_l149_c7_6f2a
MUX_uxn_device_h_l149_c7_6f2a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l149_c7_6f2a_cond,
MUX_uxn_device_h_l149_c7_6f2a_iftrue,
MUX_uxn_device_h_l149_c7_6f2a_iffalse,
MUX_uxn_device_h_l149_c7_6f2a_return_output);

-- BIN_OP_EQ_uxn_device_h_l150_c18_1822
BIN_OP_EQ_uxn_device_h_l150_c18_1822 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l150_c18_1822_left,
BIN_OP_EQ_uxn_device_h_l150_c18_1822_right,
BIN_OP_EQ_uxn_device_h_l150_c18_1822_return_output);

-- MUX_uxn_device_h_l150_c18_d8aa
MUX_uxn_device_h_l150_c18_d8aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l150_c18_d8aa_cond,
MUX_uxn_device_h_l150_c18_d8aa_iftrue,
MUX_uxn_device_h_l150_c18_d8aa_iffalse,
MUX_uxn_device_h_l150_c18_d8aa_return_output);

-- BIN_OP_OR_uxn_device_h_l153_c42_3818
BIN_OP_OR_uxn_device_h_l153_c42_3818 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l153_c42_3818_left,
BIN_OP_OR_uxn_device_h_l153_c42_3818_right,
BIN_OP_OR_uxn_device_h_l153_c42_3818_return_output);

-- BIN_OP_AND_uxn_device_h_l153_c26_bd33
BIN_OP_AND_uxn_device_h_l153_c26_bd33 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l153_c26_bd33_left,
BIN_OP_AND_uxn_device_h_l153_c26_bd33_right,
BIN_OP_AND_uxn_device_h_l153_c26_bd33_return_output);

-- MUX_uxn_device_h_l154_c40_a373
MUX_uxn_device_h_l154_c40_a373 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l154_c40_a373_cond,
MUX_uxn_device_h_l154_c40_a373_iftrue,
MUX_uxn_device_h_l154_c40_a373_iffalse,
MUX_uxn_device_h_l154_c40_a373_return_output);

-- BIN_OP_PLUS_uxn_device_h_l154_c30_5537
BIN_OP_PLUS_uxn_device_h_l154_c30_5537 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l154_c30_5537_left,
BIN_OP_PLUS_uxn_device_h_l154_c30_5537_right,
BIN_OP_PLUS_uxn_device_h_l154_c30_5537_return_output);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_b09c
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_b09c : entity work.VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_0CLK_f9daebf3 port map (
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_b09c_ref_toks_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_b09c_var_dim_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_b09c_return_output);

-- BIN_OP_EQ_uxn_device_h_l155_c7_c317
BIN_OP_EQ_uxn_device_h_l155_c7_c317 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l155_c7_c317_left,
BIN_OP_EQ_uxn_device_h_l155_c7_c317_right,
BIN_OP_EQ_uxn_device_h_l155_c7_c317_return_output);

-- BIN_OP_MINUS_uxn_device_h_l155_c41_51ef
BIN_OP_MINUS_uxn_device_h_l155_c41_51ef : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l155_c41_51ef_left,
BIN_OP_MINUS_uxn_device_h_l155_c41_51ef_right,
BIN_OP_MINUS_uxn_device_h_l155_c41_51ef_return_output);

-- BIN_OP_PLUS_uxn_device_h_l155_c51_01c2
BIN_OP_PLUS_uxn_device_h_l155_c51_01c2 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l155_c51_01c2_left,
BIN_OP_PLUS_uxn_device_h_l155_c51_01c2_right,
BIN_OP_PLUS_uxn_device_h_l155_c51_01c2_return_output);

-- MUX_uxn_device_h_l155_c35_bd10
MUX_uxn_device_h_l155_c35_bd10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l155_c35_bd10_cond,
MUX_uxn_device_h_l155_c35_bd10_iftrue,
MUX_uxn_device_h_l155_c35_bd10_iffalse,
MUX_uxn_device_h_l155_c35_bd10_return_output);

-- MUX_uxn_device_h_l155_c7_8f1d
MUX_uxn_device_h_l155_c7_8f1d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l155_c7_8f1d_cond,
MUX_uxn_device_h_l155_c7_8f1d_iftrue,
MUX_uxn_device_h_l155_c7_8f1d_iffalse,
MUX_uxn_device_h_l155_c7_8f1d_return_output);

-- BIN_OP_EQ_uxn_device_h_l156_c25_0c1a
BIN_OP_EQ_uxn_device_h_l156_c25_0c1a : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l156_c25_0c1a_left,
BIN_OP_EQ_uxn_device_h_l156_c25_0c1a_right,
BIN_OP_EQ_uxn_device_h_l156_c25_0c1a_return_output);

-- MUX_uxn_device_h_l156_c25_df62
MUX_uxn_device_h_l156_c25_df62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l156_c25_df62_cond,
MUX_uxn_device_h_l156_c25_df62_iftrue,
MUX_uxn_device_h_l156_c25_df62_iffalse,
MUX_uxn_device_h_l156_c25_df62_return_output);

-- CONST_SR_1_uxn_device_h_l157_c3_b885
CONST_SR_1_uxn_device_h_l157_c3_b885 : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_uxn_device_h_l157_c3_b885_x,
CONST_SR_1_uxn_device_h_l157_c3_b885_return_output);

-- BIN_OP_PLUS_uxn_device_h_l158_c14_19ee
BIN_OP_PLUS_uxn_device_h_l158_c14_19ee : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l158_c14_19ee_left,
BIN_OP_PLUS_uxn_device_h_l158_c14_19ee_right,
BIN_OP_PLUS_uxn_device_h_l158_c14_19ee_return_output);

-- BIN_OP_MINUS_uxn_device_h_l158_c24_ffb7
BIN_OP_MINUS_uxn_device_h_l158_c24_ffb7 : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l158_c24_ffb7_left,
BIN_OP_MINUS_uxn_device_h_l158_c24_ffb7_right,
BIN_OP_MINUS_uxn_device_h_l158_c24_ffb7_return_output);

-- MUX_uxn_device_h_l158_c8_7a50
MUX_uxn_device_h_l158_c8_7a50 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l158_c8_7a50_cond,
MUX_uxn_device_h_l158_c8_7a50_iftrue,
MUX_uxn_device_h_l158_c8_7a50_iffalse,
MUX_uxn_device_h_l158_c8_7a50_return_output);



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
 color8,
 result,
 phase_minus_two,
 phase7_downto_3,
 phase2_downto_0,
 sprite_rows,
 is_in_bounds,
 -- All submodule outputs
 BIN_OP_MINUS_uxn_device_h_l130_c20_6e7a_return_output,
 BIN_OP_EQ_uxn_device_h_l132_c6_75e3_return_output,
 sprite_rows_MUX_uxn_device_h_l132_c2_c733_return_output,
 VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_3394_return_output,
 BIN_OP_EQ_uxn_device_h_l136_c6_7623_return_output,
 opaque_MUX_uxn_device_h_l136_c2_1751_return_output,
 x_MUX_uxn_device_h_l136_c2_1751_return_output,
 y_MUX_uxn_device_h_l136_c2_1751_return_output,
 BIN_OP_PLUS_uxn_device_h_l137_c21_752e_return_output,
 VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_234f_return_output,
 MUX_uxn_device_h_l138_c13_e816_return_output,
 BIN_OP_PLUS_uxn_device_h_l138_c7_c88d_return_output,
 MUX_uxn_device_h_l139_c13_1c17_return_output,
 BIN_OP_PLUS_uxn_device_h_l139_c7_c761_return_output,
 BIN_OP_EQ_uxn_device_h_l142_c6_9245_return_output,
 is_in_bounds_MUX_uxn_device_h_l142_c2_c4c0_return_output,
 x_MUX_uxn_device_h_l142_c2_c4c0_return_output,
 result_is_vram_write_MUX_uxn_device_h_l142_c2_c4c0_return_output,
 result_is_blit_done_MUX_uxn_device_h_l142_c2_c4c0_return_output,
 result_u16_addr_MUX_uxn_device_h_l142_c2_c4c0_return_output,
 result_u8_value_MUX_uxn_device_h_l142_c2_c4c0_return_output,
 y_MUX_uxn_device_h_l142_c2_c4c0_return_output,
 c_MUX_uxn_device_h_l142_c2_c4c0_return_output,
 BIN_OP_PLUS_uxn_device_h_l146_c21_b1a2_return_output,
 BIN_OP_EQ_uxn_device_h_l148_c7_ad87_return_output,
 BIN_OP_MINUS_uxn_device_h_l148_c46_212e_return_output,
 VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_3785_return_output,
 MUX_uxn_device_h_l148_c7_df62_return_output,
 BIN_OP_EQ_uxn_device_h_l149_c7_5b56_return_output,
 MUX_uxn_device_h_l149_c41_f92f_return_output,
 BIN_OP_PLUS_uxn_device_h_l149_c35_73e2_return_output,
 MUX_uxn_device_h_l149_c7_6f2a_return_output,
 BIN_OP_EQ_uxn_device_h_l150_c18_1822_return_output,
 MUX_uxn_device_h_l150_c18_d8aa_return_output,
 BIN_OP_OR_uxn_device_h_l153_c42_3818_return_output,
 BIN_OP_AND_uxn_device_h_l153_c26_bd33_return_output,
 MUX_uxn_device_h_l154_c40_a373_return_output,
 BIN_OP_PLUS_uxn_device_h_l154_c30_5537_return_output,
 VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_b09c_return_output,
 BIN_OP_EQ_uxn_device_h_l155_c7_c317_return_output,
 BIN_OP_MINUS_uxn_device_h_l155_c41_51ef_return_output,
 BIN_OP_PLUS_uxn_device_h_l155_c51_01c2_return_output,
 MUX_uxn_device_h_l155_c35_bd10_return_output,
 MUX_uxn_device_h_l155_c7_8f1d_return_output,
 BIN_OP_EQ_uxn_device_h_l156_c25_0c1a_return_output,
 MUX_uxn_device_h_l156_c25_df62_return_output,
 CONST_SR_1_uxn_device_h_l157_c3_b885_return_output,
 BIN_OP_PLUS_uxn_device_h_l158_c14_19ee_return_output,
 BIN_OP_MINUS_uxn_device_h_l158_c24_ffb7_return_output,
 MUX_uxn_device_h_l158_c8_7a50_return_output)
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
 variable VAR_color8_uxn_device_h_l127_c2_a273 : unsigned(7 downto 0);
 variable VAR_uint12_7_3_uxn_device_h_l128_c20_62cc_return_output : unsigned(4 downto 0);
 variable VAR_uint12_2_0_uxn_device_h_l129_c20_f46a_return_output : unsigned(2 downto 0);
 variable VAR_phase_minus_two_uxn_device_h_l130_c2_091e : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l130_c20_6e7a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l130_c20_6e7a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l130_c20_6e7a_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l132_c6_75e3_left : unsigned(4 downto 0);
 variable VAR_uint12_7_3_uxn_device_h_l132_c6_236d_return_output : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l132_c6_75e3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l132_c6_75e3_return_output : unsigned(0 downto 0);
 variable VAR_sprite_rows_MUX_uxn_device_h_l132_c2_c733_iftrue : uint8_t_8;
 variable VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5_uxn_device_h_l132_c2_c733_return_output : uint8_t_8;
 variable VAR_sprite_rows_MUX_uxn_device_h_l132_c2_c733_iffalse : uint8_t_8;
 variable VAR_sprite_rows_MUX_uxn_device_h_l132_c2_c733_return_output : uint8_t_8;
 variable VAR_sprite_rows_MUX_uxn_device_h_l132_c2_c733_cond : unsigned(0 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_3394_return_output : uint8_t_array_8_t;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_3394_elem_val : unsigned(7 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_3394_ref_toks_0 : uint8_t_8;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_3394_var_dim_0 : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c6_7623_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c6_7623_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c6_7623_return_output : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l136_c2_1751_iftrue : unsigned(0 downto 0);
 variable VAR_opaque_uxn_device_h_l137_c3_2406 : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l136_c2_1751_iffalse : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l136_c2_1751_return_output : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l136_c2_1751_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c2_1751_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l138_c3_a865 : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c2_1751_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c2_1751_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c2_1751_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c2_1751_iftrue : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l139_c3_66f7 : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c2_1751_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c2_1751_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c2_1751_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l137_c21_752e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l137_c21_752e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l137_c21_752e_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_234f_var_dim_0 : unsigned(5 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_234f_return_output : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_234f_ref_toks_0 : uint2_t_48;
 variable VAR_BIN_OP_PLUS_uxn_device_h_l138_c7_c88d_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l138_c13_e816_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l138_c13_e816_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l138_c13_e816_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l138_c13_e816_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l138_c7_c88d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l138_c7_c88d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l139_c7_c761_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l139_c13_1c17_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l139_c13_1c17_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l139_c13_1c17_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l139_c13_1c17_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l139_c7_c761_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l139_c7_c761_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c6_9245_left : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c6_9245_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c6_9245_return_output : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l142_c2_c4c0_iftrue : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l142_c2_c4c0_iffalse : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l142_c2_c4c0_return_output : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l142_c2_c4c0_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l142_c2_c4c0_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l142_c2_c4c0_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l142_c2_c4c0_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l142_c2_c4c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c2_c4c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c2_c4c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c2_c4c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c2_c4c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l142_c2_c4c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l142_c2_c4c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l142_c2_c4c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l142_c2_c4c0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l142_c2_c4c0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l146_c3_6501 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l142_c2_c4c0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l142_c2_c4c0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l142_c2_c4c0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l142_c2_c4c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l144_c3_a6b4 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l142_c2_c4c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l154_c3_f68b : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l142_c2_c4c0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l142_c2_c4c0_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c2_c4c0_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c2_c4c0_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c2_c4c0_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c2_c4c0_cond : unsigned(0 downto 0);
 variable VAR_c_MUX_uxn_device_h_l142_c2_c4c0_iftrue : unsigned(7 downto 0);
 variable VAR_c_MUX_uxn_device_h_l142_c2_c4c0_iffalse : unsigned(7 downto 0);
 variable VAR_c_MUX_uxn_device_h_l142_c2_c4c0_return_output : unsigned(7 downto 0);
 variable VAR_c_MUX_uxn_device_h_l142_c2_c4c0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l146_c21_b1a2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l146_c21_b1a2_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l146_c21_b1a2_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l148_c7_df62_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l148_c7_ad87_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l148_c7_ad87_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l148_c7_ad87_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l148_c7_df62_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l148_c7_df62_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l148_c46_212e_left : unsigned(4 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l148_c46_212e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l148_c46_212e_return_output : unsigned(4 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_3785_var_dim_0 : unsigned(2 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_3785_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_3785_ref_toks_0 : uint8_t_8;
 variable VAR_MUX_uxn_device_h_l148_c7_df62_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c7_6f2a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l149_c7_5b56_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l149_c7_5b56_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l149_c7_5b56_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c7_6f2a_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c7_6f2a_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l149_c35_73e2_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c41_f92f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c41_f92f_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c41_f92f_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c41_f92f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l149_c35_73e2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l149_c35_73e2_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c7_6f2a_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l150_c18_d8aa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l150_c18_1822_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_device_h_l150_c18_ed74_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l150_c18_1822_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l150_c18_1822_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l150_c18_d8aa_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l150_c18_d8aa_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l150_c18_d8aa_return_output : unsigned(0 downto 0);
 variable VAR_uint16_7_0_uxn_device_h_l151_c39_86d7_return_output : unsigned(7 downto 0);
 variable VAR_uint16_uint8_8_uxn_device_h_l151_c21_3a51_return_output : unsigned(15 downto 0);
 variable VAR_uint16_7_0_uxn_device_h_l152_c53_6983_return_output : unsigned(7 downto 0);
 variable VAR_uint16_uint8_0_uxn_device_h_l152_c21_1899_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l153_c26_bd33_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l153_c42_3818_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l153_c42_3818_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l153_c42_3818_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l153_c26_bd33_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l153_c26_bd33_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l154_c30_5537_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l154_c40_a373_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l154_c40_a373_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l154_c40_a373_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l154_c40_a373_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l154_c30_5537_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l154_c30_5537_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_b09c_var_dim_0 : unsigned(5 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_b09c_return_output : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_b09c_ref_toks_0 : uint2_t_48;
 variable VAR_MUX_uxn_device_h_l155_c7_8f1d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l155_c7_c317_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l155_c7_c317_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l155_c7_c317_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l155_c7_8f1d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l155_c7_8f1d_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l155_c35_bd10_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l155_c35_bd10_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l155_c35_bd10_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l155_c41_51ef_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l155_c41_51ef_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l155_c41_51ef_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l155_c51_01c2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l155_c51_01c2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l155_c51_01c2_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l155_c35_bd10_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l155_c7_8f1d_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l156_c25_df62_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l156_c25_0c1a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l156_c25_0c1a_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l156_c25_0c1a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l156_c25_df62_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l156_c25_df62_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l156_c25_df62_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l157_c3_b885_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l157_c3_b885_x : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l158_c8_7a50_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l158_c8_7a50_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l158_c8_7a50_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l158_c14_19ee_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l158_c14_19ee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l158_c14_19ee_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l158_c24_ffb7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l158_c24_ffb7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l158_c24_ffb7_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l158_c8_7a50_return_output : unsigned(15 downto 0);
 variable VAR_uint8_0_0_uxn_device_h_l154_l153_DUPLICATE_0b88_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_d326_uxn_device_h_l161_l109_DUPLICATE_681d_return_output : screen_blit_result_t;
 -- State registers comb logic variables
variable REG_VAR_blending : uint2_t_48;
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
variable REG_VAR_opaque : unsigned(0 downto 0);
variable REG_VAR_c : unsigned(7 downto 0);
variable REG_VAR_color8 : unsigned(7 downto 0);
variable REG_VAR_result : screen_blit_result_t;
variable REG_VAR_phase_minus_two : unsigned(11 downto 0);
variable REG_VAR_phase7_downto_3 : unsigned(4 downto 0);
variable REG_VAR_phase2_downto_0 : unsigned(2 downto 0);
variable REG_VAR_sprite_rows : uint8_t_8;
variable REG_VAR_is_in_bounds : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_blending := blending;
  REG_VAR_x := x;
  REG_VAR_y := y;
  REG_VAR_opaque := opaque;
  REG_VAR_c := c;
  REG_VAR_color8 := color8;
  REG_VAR_result := result;
  REG_VAR_phase_minus_two := phase_minus_two;
  REG_VAR_phase7_downto_3 := phase7_downto_3;
  REG_VAR_phase2_downto_0 := phase2_downto_0;
  REG_VAR_sprite_rows := sprite_rows;
  REG_VAR_is_in_bounds := is_in_bounds;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_device_h_l150_c18_d8aa_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l149_c41_f92f_iffalse := to_unsigned(7, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l137_c21_752e_left := to_unsigned(32, 8);
     VAR_BIN_OP_MINUS_uxn_device_h_l155_c41_51ef_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l130_c20_6e7a_right := to_unsigned(2, 2);
     VAR_result_is_blit_done_MUX_uxn_device_h_l142_c2_c4c0_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c2_c4c0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l148_c46_212e_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l156_c25_df62_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l149_c41_f92f_iftrue := to_unsigned(0, 16);
     VAR_BIN_OP_EQ_uxn_device_h_l155_c7_c317_right := to_unsigned(7, 3);
     VAR_MUX_uxn_device_h_l154_c40_a373_iffalse := to_unsigned(0, 8);
     VAR_BIN_OP_MINUS_uxn_device_h_l158_c24_ffb7_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l156_c25_0c1a_right := to_unsigned(71, 12);
     VAR_BIN_OP_EQ_uxn_device_h_l142_c6_9245_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l150_c18_1822_right := to_unsigned(0, 8);
     VAR_MUX_uxn_device_h_l139_c13_1c17_iftrue := to_unsigned(7, 16);
     VAR_BIN_OP_EQ_uxn_device_h_l149_c7_5b56_right := to_unsigned(0, 3);
     VAR_MUX_uxn_device_h_l150_c18_d8aa_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l138_c13_e816_iftrue := to_unsigned(0, 16);
     VAR_MUX_uxn_device_h_l138_c13_e816_iffalse := to_unsigned(7, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l158_c14_19ee_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l132_c6_75e3_right := to_unsigned(0, 1);
     VAR_result_u8_value_uxn_device_h_l144_c3_a6b4 := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l142_c2_c4c0_iftrue := VAR_result_u8_value_uxn_device_h_l144_c3_a6b4;
     VAR_MUX_uxn_device_h_l139_c13_1c17_iffalse := to_unsigned(0, 16);
     VAR_MUX_uxn_device_h_l154_c40_a373_iftrue := to_unsigned(16, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l148_c7_ad87_right := to_unsigned(0, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l136_c6_7623_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l155_c51_01c2_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l156_c25_df62_iffalse := to_unsigned(0, 1);

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
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_234f_ref_toks_0 := blending;
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_b09c_ref_toks_0 := blending;
     REG_VAR_blending := blending;
     VAR_MUX_uxn_device_h_l148_c7_df62_iffalse := c;
     VAR_c_MUX_uxn_device_h_l142_c2_c4c0_iftrue := c;
     VAR_color8_uxn_device_h_l127_c2_a273 := resize(VAR_color, 8);
     VAR_MUX_uxn_device_h_l138_c13_e816_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l149_c41_f92f_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l158_c8_7a50_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l139_c13_1c17_cond := VAR_fy;
     VAR_MUX_uxn_device_h_l155_c35_bd10_cond := VAR_fy;
     VAR_is_in_bounds_MUX_uxn_device_h_l142_c2_c4c0_iftrue := is_in_bounds;
     VAR_opaque_MUX_uxn_device_h_l136_c2_1751_iffalse := opaque;
     VAR_BIN_OP_EQ_uxn_device_h_l136_c6_7623_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l156_c25_0c1a_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l130_c20_6e7a_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_device_h_l146_c21_b1a2_right := VAR_phase;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_3394_elem_val := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_device_h_l146_c21_b1a2_left := VAR_ram_addr;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_3394_ref_toks_0 := sprite_rows;
     VAR_sprite_rows_MUX_uxn_device_h_l132_c2_c733_iffalse := sprite_rows;
     VAR_x_MUX_uxn_device_h_l136_c2_1751_iffalse := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l138_c7_c88d_left := VAR_x1;
     VAR_BIN_OP_PLUS_uxn_device_h_l149_c35_73e2_left := VAR_x1;
     VAR_y_MUX_uxn_device_h_l136_c2_1751_iffalse := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l139_c7_c761_left := VAR_y1;
     VAR_BIN_OP_PLUS_uxn_device_h_l137_c21_752e_right := VAR_color8_uxn_device_h_l127_c2_a273;
     VAR_BIN_OP_PLUS_uxn_device_h_l154_c30_5537_left := VAR_color8_uxn_device_h_l127_c2_a273;
     REG_VAR_color8 := VAR_color8_uxn_device_h_l127_c2_a273;
     -- MUX[uxn_device_h_l138_c13_e816] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l138_c13_e816_cond <= VAR_MUX_uxn_device_h_l138_c13_e816_cond;
     MUX_uxn_device_h_l138_c13_e816_iftrue <= VAR_MUX_uxn_device_h_l138_c13_e816_iftrue;
     MUX_uxn_device_h_l138_c13_e816_iffalse <= VAR_MUX_uxn_device_h_l138_c13_e816_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l138_c13_e816_return_output := MUX_uxn_device_h_l138_c13_e816_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l146_c21_b1a2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l146_c21_b1a2_left <= VAR_BIN_OP_PLUS_uxn_device_h_l146_c21_b1a2_left;
     BIN_OP_PLUS_uxn_device_h_l146_c21_b1a2_right <= VAR_BIN_OP_PLUS_uxn_device_h_l146_c21_b1a2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l146_c21_b1a2_return_output := BIN_OP_PLUS_uxn_device_h_l146_c21_b1a2_return_output;

     -- uint12_2_0[uxn_device_h_l129_c20_f46a] LATENCY=0
     VAR_uint12_2_0_uxn_device_h_l129_c20_f46a_return_output := uint12_2_0(
     VAR_phase);

     -- BIN_OP_PLUS[uxn_device_h_l137_c21_752e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l137_c21_752e_left <= VAR_BIN_OP_PLUS_uxn_device_h_l137_c21_752e_left;
     BIN_OP_PLUS_uxn_device_h_l137_c21_752e_right <= VAR_BIN_OP_PLUS_uxn_device_h_l137_c21_752e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l137_c21_752e_return_output := BIN_OP_PLUS_uxn_device_h_l137_c21_752e_return_output;

     -- uint12_7_3[uxn_device_h_l128_c20_62cc] LATENCY=0
     VAR_uint12_7_3_uxn_device_h_l128_c20_62cc_return_output := uint12_7_3(
     VAR_phase);

     -- BIN_OP_EQ[uxn_device_h_l156_c25_0c1a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l156_c25_0c1a_left <= VAR_BIN_OP_EQ_uxn_device_h_l156_c25_0c1a_left;
     BIN_OP_EQ_uxn_device_h_l156_c25_0c1a_right <= VAR_BIN_OP_EQ_uxn_device_h_l156_c25_0c1a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l156_c25_0c1a_return_output := BIN_OP_EQ_uxn_device_h_l156_c25_0c1a_return_output;

     -- MUX[uxn_device_h_l149_c41_f92f] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l149_c41_f92f_cond <= VAR_MUX_uxn_device_h_l149_c41_f92f_cond;
     MUX_uxn_device_h_l149_c41_f92f_iftrue <= VAR_MUX_uxn_device_h_l149_c41_f92f_iftrue;
     MUX_uxn_device_h_l149_c41_f92f_iffalse <= VAR_MUX_uxn_device_h_l149_c41_f92f_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l149_c41_f92f_return_output := MUX_uxn_device_h_l149_c41_f92f_return_output;

     -- MUX[uxn_device_h_l139_c13_1c17] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l139_c13_1c17_cond <= VAR_MUX_uxn_device_h_l139_c13_1c17_cond;
     MUX_uxn_device_h_l139_c13_1c17_iftrue <= VAR_MUX_uxn_device_h_l139_c13_1c17_iftrue;
     MUX_uxn_device_h_l139_c13_1c17_iffalse <= VAR_MUX_uxn_device_h_l139_c13_1c17_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l139_c13_1c17_return_output := MUX_uxn_device_h_l139_c13_1c17_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l130_c20_6e7a] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l130_c20_6e7a_left <= VAR_BIN_OP_MINUS_uxn_device_h_l130_c20_6e7a_left;
     BIN_OP_MINUS_uxn_device_h_l130_c20_6e7a_right <= VAR_BIN_OP_MINUS_uxn_device_h_l130_c20_6e7a_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l130_c20_6e7a_return_output := BIN_OP_MINUS_uxn_device_h_l130_c20_6e7a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l136_c6_7623] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l136_c6_7623_left <= VAR_BIN_OP_EQ_uxn_device_h_l136_c6_7623_left;
     BIN_OP_EQ_uxn_device_h_l136_c6_7623_right <= VAR_BIN_OP_EQ_uxn_device_h_l136_c6_7623_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l136_c6_7623_return_output := BIN_OP_EQ_uxn_device_h_l136_c6_7623_return_output;

     -- Submodule level 1
     VAR_opaque_MUX_uxn_device_h_l136_c2_1751_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c6_7623_return_output;
     VAR_x_MUX_uxn_device_h_l136_c2_1751_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c6_7623_return_output;
     VAR_y_MUX_uxn_device_h_l136_c2_1751_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c6_7623_return_output;
     VAR_MUX_uxn_device_h_l156_c25_df62_cond := VAR_BIN_OP_EQ_uxn_device_h_l156_c25_0c1a_return_output;
     VAR_phase_minus_two_uxn_device_h_l130_c2_091e := VAR_BIN_OP_MINUS_uxn_device_h_l130_c20_6e7a_return_output;
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_234f_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l137_c21_752e_return_output, 6);
     VAR_result_u16_addr_uxn_device_h_l146_c3_6501 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l146_c21_b1a2_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l138_c7_c88d_right := VAR_MUX_uxn_device_h_l138_c13_e816_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l139_c7_c761_right := VAR_MUX_uxn_device_h_l139_c13_1c17_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l149_c35_73e2_right := VAR_MUX_uxn_device_h_l149_c41_f92f_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l148_c7_ad87_left := VAR_uint12_2_0_uxn_device_h_l129_c20_f46a_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l149_c7_5b56_left := VAR_uint12_2_0_uxn_device_h_l129_c20_f46a_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l155_c7_c317_left := VAR_uint12_2_0_uxn_device_h_l129_c20_f46a_return_output;
     REG_VAR_phase2_downto_0 := VAR_uint12_2_0_uxn_device_h_l129_c20_f46a_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l142_c6_9245_left := VAR_uint12_7_3_uxn_device_h_l128_c20_62cc_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l148_c46_212e_left := VAR_uint12_7_3_uxn_device_h_l128_c20_62cc_return_output;
     REG_VAR_phase7_downto_3 := VAR_uint12_7_3_uxn_device_h_l128_c20_62cc_return_output;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_3394_var_dim_0 := resize(VAR_phase_minus_two_uxn_device_h_l130_c2_091e, 3);
     REG_VAR_phase_minus_two := VAR_phase_minus_two_uxn_device_h_l130_c2_091e;
     VAR_result_u16_addr_MUX_uxn_device_h_l142_c2_c4c0_iftrue := VAR_result_u16_addr_uxn_device_h_l146_c3_6501;
     -- BIN_OP_PLUS[uxn_device_h_l138_c7_c88d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l138_c7_c88d_left <= VAR_BIN_OP_PLUS_uxn_device_h_l138_c7_c88d_left;
     BIN_OP_PLUS_uxn_device_h_l138_c7_c88d_right <= VAR_BIN_OP_PLUS_uxn_device_h_l138_c7_c88d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l138_c7_c88d_return_output := BIN_OP_PLUS_uxn_device_h_l138_c7_c88d_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l139_c7_c761] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l139_c7_c761_left <= VAR_BIN_OP_PLUS_uxn_device_h_l139_c7_c761_left;
     BIN_OP_PLUS_uxn_device_h_l139_c7_c761_right <= VAR_BIN_OP_PLUS_uxn_device_h_l139_c7_c761_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l139_c7_c761_return_output := BIN_OP_PLUS_uxn_device_h_l139_c7_c761_return_output;

     -- uint12_7_3[uxn_device_h_l132_c6_236d] LATENCY=0
     VAR_uint12_7_3_uxn_device_h_l132_c6_236d_return_output := uint12_7_3(
     VAR_phase_minus_two_uxn_device_h_l130_c2_091e);

     -- BIN_OP_EQ[uxn_device_h_l142_c6_9245] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l142_c6_9245_left <= VAR_BIN_OP_EQ_uxn_device_h_l142_c6_9245_left;
     BIN_OP_EQ_uxn_device_h_l142_c6_9245_right <= VAR_BIN_OP_EQ_uxn_device_h_l142_c6_9245_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l142_c6_9245_return_output := BIN_OP_EQ_uxn_device_h_l142_c6_9245_return_output;

     -- BIN_OP_EQ[uxn_device_h_l148_c7_ad87] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l148_c7_ad87_left <= VAR_BIN_OP_EQ_uxn_device_h_l148_c7_ad87_left;
     BIN_OP_EQ_uxn_device_h_l148_c7_ad87_right <= VAR_BIN_OP_EQ_uxn_device_h_l148_c7_ad87_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l148_c7_ad87_return_output := BIN_OP_EQ_uxn_device_h_l148_c7_ad87_return_output;

     -- BIN_OP_EQ[uxn_device_h_l155_c7_c317] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l155_c7_c317_left <= VAR_BIN_OP_EQ_uxn_device_h_l155_c7_c317_left;
     BIN_OP_EQ_uxn_device_h_l155_c7_c317_right <= VAR_BIN_OP_EQ_uxn_device_h_l155_c7_c317_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l155_c7_c317_return_output := BIN_OP_EQ_uxn_device_h_l155_c7_c317_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l148_c46_212e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l148_c46_212e_left <= VAR_BIN_OP_MINUS_uxn_device_h_l148_c46_212e_left;
     BIN_OP_MINUS_uxn_device_h_l148_c46_212e_right <= VAR_BIN_OP_MINUS_uxn_device_h_l148_c46_212e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l148_c46_212e_return_output := BIN_OP_MINUS_uxn_device_h_l148_c46_212e_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l149_c35_73e2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l149_c35_73e2_left <= VAR_BIN_OP_PLUS_uxn_device_h_l149_c35_73e2_left;
     BIN_OP_PLUS_uxn_device_h_l149_c35_73e2_right <= VAR_BIN_OP_PLUS_uxn_device_h_l149_c35_73e2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l149_c35_73e2_return_output := BIN_OP_PLUS_uxn_device_h_l149_c35_73e2_return_output;

     -- VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8[uxn_device_h_l133_c3_3394] LATENCY=0
     -- Inputs
     VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_3394_elem_val <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_3394_elem_val;
     VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_3394_ref_toks_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_3394_ref_toks_0;
     VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_3394_var_dim_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_3394_var_dim_0;
     -- Outputs
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_3394_return_output := VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_3394_return_output;

     -- MUX[uxn_device_h_l156_c25_df62] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l156_c25_df62_cond <= VAR_MUX_uxn_device_h_l156_c25_df62_cond;
     MUX_uxn_device_h_l156_c25_df62_iftrue <= VAR_MUX_uxn_device_h_l156_c25_df62_iftrue;
     MUX_uxn_device_h_l156_c25_df62_iffalse <= VAR_MUX_uxn_device_h_l156_c25_df62_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l156_c25_df62_return_output := MUX_uxn_device_h_l156_c25_df62_return_output;

     -- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l137_c12_234f] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_234f_ref_toks_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_234f_ref_toks_0;
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_234f_var_dim_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_234f_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_234f_return_output := VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_234f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l149_c7_5b56] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l149_c7_5b56_left <= VAR_BIN_OP_EQ_uxn_device_h_l149_c7_5b56_left;
     BIN_OP_EQ_uxn_device_h_l149_c7_5b56_right <= VAR_BIN_OP_EQ_uxn_device_h_l149_c7_5b56_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l149_c7_5b56_return_output := BIN_OP_EQ_uxn_device_h_l149_c7_5b56_return_output;

     -- Submodule level 2
     VAR_c_MUX_uxn_device_h_l142_c2_c4c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c6_9245_return_output;
     VAR_is_in_bounds_MUX_uxn_device_h_l142_c2_c4c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c6_9245_return_output;
     VAR_result_is_blit_done_MUX_uxn_device_h_l142_c2_c4c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c6_9245_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c2_c4c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c6_9245_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l142_c2_c4c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c6_9245_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l142_c2_c4c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c6_9245_return_output;
     VAR_x_MUX_uxn_device_h_l142_c2_c4c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c6_9245_return_output;
     VAR_y_MUX_uxn_device_h_l142_c2_c4c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c6_9245_return_output;
     VAR_MUX_uxn_device_h_l148_c7_df62_cond := VAR_BIN_OP_EQ_uxn_device_h_l148_c7_ad87_return_output;
     VAR_MUX_uxn_device_h_l149_c7_6f2a_cond := VAR_BIN_OP_EQ_uxn_device_h_l149_c7_5b56_return_output;
     VAR_MUX_uxn_device_h_l155_c7_8f1d_cond := VAR_BIN_OP_EQ_uxn_device_h_l155_c7_c317_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_3785_var_dim_0 := resize(VAR_BIN_OP_MINUS_uxn_device_h_l148_c46_212e_return_output, 3);
     VAR_x_uxn_device_h_l138_c3_a865 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l138_c7_c88d_return_output, 16);
     VAR_y_uxn_device_h_l139_c3_66f7 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l139_c7_c761_return_output, 16);
     VAR_MUX_uxn_device_h_l149_c7_6f2a_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l149_c35_73e2_return_output, 16);
     VAR_result_is_blit_done_MUX_uxn_device_h_l142_c2_c4c0_iffalse := VAR_MUX_uxn_device_h_l156_c25_df62_return_output;
     VAR_opaque_uxn_device_h_l137_c3_2406 := resize(VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_234f_return_output, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l132_c6_75e3_left := VAR_uint12_7_3_uxn_device_h_l132_c6_236d_return_output;
     VAR_opaque_MUX_uxn_device_h_l136_c2_1751_iftrue := VAR_opaque_uxn_device_h_l137_c3_2406;
     VAR_x_MUX_uxn_device_h_l136_c2_1751_iftrue := VAR_x_uxn_device_h_l138_c3_a865;
     VAR_y_MUX_uxn_device_h_l136_c2_1751_iftrue := VAR_y_uxn_device_h_l139_c3_66f7;
     -- sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5[uxn_device_h_l132_c2_c733] LATENCY=0
     VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5_uxn_device_h_l132_c2_c733_return_output := CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5(
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_3394_return_output);

     -- BIN_OP_EQ[uxn_device_h_l132_c6_75e3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l132_c6_75e3_left <= VAR_BIN_OP_EQ_uxn_device_h_l132_c6_75e3_left;
     BIN_OP_EQ_uxn_device_h_l132_c6_75e3_right <= VAR_BIN_OP_EQ_uxn_device_h_l132_c6_75e3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l132_c6_75e3_return_output := BIN_OP_EQ_uxn_device_h_l132_c6_75e3_return_output;

     -- result_is_blit_done_MUX[uxn_device_h_l142_c2_c4c0] LATENCY=0
     -- Inputs
     result_is_blit_done_MUX_uxn_device_h_l142_c2_c4c0_cond <= VAR_result_is_blit_done_MUX_uxn_device_h_l142_c2_c4c0_cond;
     result_is_blit_done_MUX_uxn_device_h_l142_c2_c4c0_iftrue <= VAR_result_is_blit_done_MUX_uxn_device_h_l142_c2_c4c0_iftrue;
     result_is_blit_done_MUX_uxn_device_h_l142_c2_c4c0_iffalse <= VAR_result_is_blit_done_MUX_uxn_device_h_l142_c2_c4c0_iffalse;
     -- Outputs
     VAR_result_is_blit_done_MUX_uxn_device_h_l142_c2_c4c0_return_output := result_is_blit_done_MUX_uxn_device_h_l142_c2_c4c0_return_output;

     -- y_MUX[uxn_device_h_l136_c2_1751] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l136_c2_1751_cond <= VAR_y_MUX_uxn_device_h_l136_c2_1751_cond;
     y_MUX_uxn_device_h_l136_c2_1751_iftrue <= VAR_y_MUX_uxn_device_h_l136_c2_1751_iftrue;
     y_MUX_uxn_device_h_l136_c2_1751_iffalse <= VAR_y_MUX_uxn_device_h_l136_c2_1751_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l136_c2_1751_return_output := y_MUX_uxn_device_h_l136_c2_1751_return_output;

     -- opaque_MUX[uxn_device_h_l136_c2_1751] LATENCY=0
     -- Inputs
     opaque_MUX_uxn_device_h_l136_c2_1751_cond <= VAR_opaque_MUX_uxn_device_h_l136_c2_1751_cond;
     opaque_MUX_uxn_device_h_l136_c2_1751_iftrue <= VAR_opaque_MUX_uxn_device_h_l136_c2_1751_iftrue;
     opaque_MUX_uxn_device_h_l136_c2_1751_iffalse <= VAR_opaque_MUX_uxn_device_h_l136_c2_1751_iffalse;
     -- Outputs
     VAR_opaque_MUX_uxn_device_h_l136_c2_1751_return_output := opaque_MUX_uxn_device_h_l136_c2_1751_return_output;

     -- x_MUX[uxn_device_h_l136_c2_1751] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l136_c2_1751_cond <= VAR_x_MUX_uxn_device_h_l136_c2_1751_cond;
     x_MUX_uxn_device_h_l136_c2_1751_iftrue <= VAR_x_MUX_uxn_device_h_l136_c2_1751_iftrue;
     x_MUX_uxn_device_h_l136_c2_1751_iffalse <= VAR_x_MUX_uxn_device_h_l136_c2_1751_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l136_c2_1751_return_output := x_MUX_uxn_device_h_l136_c2_1751_return_output;

     -- Submodule level 3
     VAR_sprite_rows_MUX_uxn_device_h_l132_c2_c733_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c6_75e3_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l153_c42_3818_left := VAR_opaque_MUX_uxn_device_h_l136_c2_1751_return_output;
     REG_VAR_opaque := VAR_opaque_MUX_uxn_device_h_l136_c2_1751_return_output;
     VAR_sprite_rows_MUX_uxn_device_h_l132_c2_c733_iftrue := VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5_uxn_device_h_l132_c2_c733_return_output;
     VAR_MUX_uxn_device_h_l149_c7_6f2a_iffalse := VAR_x_MUX_uxn_device_h_l136_c2_1751_return_output;
     VAR_x_MUX_uxn_device_h_l142_c2_c4c0_iftrue := VAR_x_MUX_uxn_device_h_l136_c2_1751_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l155_c41_51ef_left := VAR_y_MUX_uxn_device_h_l136_c2_1751_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l155_c51_01c2_left := VAR_y_MUX_uxn_device_h_l136_c2_1751_return_output;
     VAR_MUX_uxn_device_h_l155_c7_8f1d_iffalse := VAR_y_MUX_uxn_device_h_l136_c2_1751_return_output;
     VAR_y_MUX_uxn_device_h_l142_c2_c4c0_iftrue := VAR_y_MUX_uxn_device_h_l136_c2_1751_return_output;
     -- sprite_rows_MUX[uxn_device_h_l132_c2_c733] LATENCY=0
     -- Inputs
     sprite_rows_MUX_uxn_device_h_l132_c2_c733_cond <= VAR_sprite_rows_MUX_uxn_device_h_l132_c2_c733_cond;
     sprite_rows_MUX_uxn_device_h_l132_c2_c733_iftrue <= VAR_sprite_rows_MUX_uxn_device_h_l132_c2_c733_iftrue;
     sprite_rows_MUX_uxn_device_h_l132_c2_c733_iffalse <= VAR_sprite_rows_MUX_uxn_device_h_l132_c2_c733_iffalse;
     -- Outputs
     VAR_sprite_rows_MUX_uxn_device_h_l132_c2_c733_return_output := sprite_rows_MUX_uxn_device_h_l132_c2_c733_return_output;

     -- uint16_7_0[uxn_device_h_l151_c39_86d7] LATENCY=0
     VAR_uint16_7_0_uxn_device_h_l151_c39_86d7_return_output := uint16_7_0(
     VAR_y_MUX_uxn_device_h_l136_c2_1751_return_output);

     -- BIN_OP_MINUS[uxn_device_h_l155_c41_51ef] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l155_c41_51ef_left <= VAR_BIN_OP_MINUS_uxn_device_h_l155_c41_51ef_left;
     BIN_OP_MINUS_uxn_device_h_l155_c41_51ef_right <= VAR_BIN_OP_MINUS_uxn_device_h_l155_c41_51ef_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l155_c41_51ef_return_output := BIN_OP_MINUS_uxn_device_h_l155_c41_51ef_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l155_c51_01c2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l155_c51_01c2_left <= VAR_BIN_OP_PLUS_uxn_device_h_l155_c51_01c2_left;
     BIN_OP_PLUS_uxn_device_h_l155_c51_01c2_right <= VAR_BIN_OP_PLUS_uxn_device_h_l155_c51_01c2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l155_c51_01c2_return_output := BIN_OP_PLUS_uxn_device_h_l155_c51_01c2_return_output;

     -- MUX[uxn_device_h_l149_c7_6f2a] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l149_c7_6f2a_cond <= VAR_MUX_uxn_device_h_l149_c7_6f2a_cond;
     MUX_uxn_device_h_l149_c7_6f2a_iftrue <= VAR_MUX_uxn_device_h_l149_c7_6f2a_iftrue;
     MUX_uxn_device_h_l149_c7_6f2a_iffalse <= VAR_MUX_uxn_device_h_l149_c7_6f2a_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l149_c7_6f2a_return_output := MUX_uxn_device_h_l149_c7_6f2a_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l155_c35_bd10_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l155_c41_51ef_return_output;
     VAR_MUX_uxn_device_h_l155_c35_bd10_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l155_c51_01c2_return_output, 16);
     VAR_BIN_OP_MINUS_uxn_device_h_l158_c24_ffb7_left := VAR_MUX_uxn_device_h_l149_c7_6f2a_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l158_c14_19ee_left := VAR_MUX_uxn_device_h_l149_c7_6f2a_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_3785_ref_toks_0 := VAR_sprite_rows_MUX_uxn_device_h_l132_c2_c733_return_output;
     REG_VAR_sprite_rows := VAR_sprite_rows_MUX_uxn_device_h_l132_c2_c733_return_output;
     -- uint16_15_8[uxn_device_h_l150_c18_ed74] LATENCY=0
     VAR_uint16_15_8_uxn_device_h_l150_c18_ed74_return_output := uint16_15_8(
     VAR_MUX_uxn_device_h_l149_c7_6f2a_return_output);

     -- BIN_OP_MINUS[uxn_device_h_l158_c24_ffb7] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l158_c24_ffb7_left <= VAR_BIN_OP_MINUS_uxn_device_h_l158_c24_ffb7_left;
     BIN_OP_MINUS_uxn_device_h_l158_c24_ffb7_right <= VAR_BIN_OP_MINUS_uxn_device_h_l158_c24_ffb7_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l158_c24_ffb7_return_output := BIN_OP_MINUS_uxn_device_h_l158_c24_ffb7_return_output;

     -- uint16_uint8_8[uxn_device_h_l151_c21_3a51] LATENCY=0
     VAR_uint16_uint8_8_uxn_device_h_l151_c21_3a51_return_output := uint16_uint8_8(
     resize(to_unsigned(0, 1), 16),
     VAR_uint16_7_0_uxn_device_h_l151_c39_86d7_return_output);

     -- BIN_OP_PLUS[uxn_device_h_l158_c14_19ee] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l158_c14_19ee_left <= VAR_BIN_OP_PLUS_uxn_device_h_l158_c14_19ee_left;
     BIN_OP_PLUS_uxn_device_h_l158_c14_19ee_right <= VAR_BIN_OP_PLUS_uxn_device_h_l158_c14_19ee_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l158_c14_19ee_return_output := BIN_OP_PLUS_uxn_device_h_l158_c14_19ee_return_output;

     -- MUX[uxn_device_h_l155_c35_bd10] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l155_c35_bd10_cond <= VAR_MUX_uxn_device_h_l155_c35_bd10_cond;
     MUX_uxn_device_h_l155_c35_bd10_iftrue <= VAR_MUX_uxn_device_h_l155_c35_bd10_iftrue;
     MUX_uxn_device_h_l155_c35_bd10_iffalse <= VAR_MUX_uxn_device_h_l155_c35_bd10_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l155_c35_bd10_return_output := MUX_uxn_device_h_l155_c35_bd10_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d[uxn_device_h_l148_c34_3785] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_3785_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_3785_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_3785_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_3785_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_3785_return_output := VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_3785_return_output;

     -- uint16_7_0[uxn_device_h_l152_c53_6983] LATENCY=0
     VAR_uint16_7_0_uxn_device_h_l152_c53_6983_return_output := uint16_7_0(
     VAR_MUX_uxn_device_h_l149_c7_6f2a_return_output);

     -- Submodule level 5
     VAR_MUX_uxn_device_h_l158_c8_7a50_iffalse := VAR_BIN_OP_MINUS_uxn_device_h_l158_c24_ffb7_return_output;
     VAR_MUX_uxn_device_h_l158_c8_7a50_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l158_c14_19ee_return_output, 16);
     VAR_MUX_uxn_device_h_l155_c7_8f1d_iftrue := VAR_MUX_uxn_device_h_l155_c35_bd10_return_output;
     VAR_MUX_uxn_device_h_l148_c7_df62_iftrue := VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_3785_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l150_c18_1822_left := VAR_uint16_15_8_uxn_device_h_l150_c18_ed74_return_output;
     -- MUX[uxn_device_h_l158_c8_7a50] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l158_c8_7a50_cond <= VAR_MUX_uxn_device_h_l158_c8_7a50_cond;
     MUX_uxn_device_h_l158_c8_7a50_iftrue <= VAR_MUX_uxn_device_h_l158_c8_7a50_iftrue;
     MUX_uxn_device_h_l158_c8_7a50_iffalse <= VAR_MUX_uxn_device_h_l158_c8_7a50_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l158_c8_7a50_return_output := MUX_uxn_device_h_l158_c8_7a50_return_output;

     -- MUX[uxn_device_h_l148_c7_df62] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l148_c7_df62_cond <= VAR_MUX_uxn_device_h_l148_c7_df62_cond;
     MUX_uxn_device_h_l148_c7_df62_iftrue <= VAR_MUX_uxn_device_h_l148_c7_df62_iftrue;
     MUX_uxn_device_h_l148_c7_df62_iffalse <= VAR_MUX_uxn_device_h_l148_c7_df62_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l148_c7_df62_return_output := MUX_uxn_device_h_l148_c7_df62_return_output;

     -- BIN_OP_EQ[uxn_device_h_l150_c18_1822] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l150_c18_1822_left <= VAR_BIN_OP_EQ_uxn_device_h_l150_c18_1822_left;
     BIN_OP_EQ_uxn_device_h_l150_c18_1822_right <= VAR_BIN_OP_EQ_uxn_device_h_l150_c18_1822_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l150_c18_1822_return_output := BIN_OP_EQ_uxn_device_h_l150_c18_1822_return_output;

     -- uint16_uint8_0[uxn_device_h_l152_c21_1899] LATENCY=0
     VAR_uint16_uint8_0_uxn_device_h_l152_c21_1899_return_output := uint16_uint8_0(
     VAR_uint16_uint8_8_uxn_device_h_l151_c21_3a51_return_output,
     VAR_uint16_7_0_uxn_device_h_l152_c53_6983_return_output);

     -- MUX[uxn_device_h_l155_c7_8f1d] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l155_c7_8f1d_cond <= VAR_MUX_uxn_device_h_l155_c7_8f1d_cond;
     MUX_uxn_device_h_l155_c7_8f1d_iftrue <= VAR_MUX_uxn_device_h_l155_c7_8f1d_iftrue;
     MUX_uxn_device_h_l155_c7_8f1d_iffalse <= VAR_MUX_uxn_device_h_l155_c7_8f1d_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l155_c7_8f1d_return_output := MUX_uxn_device_h_l155_c7_8f1d_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_device_h_l150_c18_d8aa_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c18_1822_return_output;
     VAR_CONST_SR_1_uxn_device_h_l157_c3_b885_x := VAR_MUX_uxn_device_h_l148_c7_df62_return_output;
     VAR_y_MUX_uxn_device_h_l142_c2_c4c0_iffalse := VAR_MUX_uxn_device_h_l155_c7_8f1d_return_output;
     VAR_x_MUX_uxn_device_h_l142_c2_c4c0_iffalse := VAR_MUX_uxn_device_h_l158_c8_7a50_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l142_c2_c4c0_iffalse := VAR_uint16_uint8_0_uxn_device_h_l152_c21_1899_return_output;
     -- x_MUX[uxn_device_h_l142_c2_c4c0] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l142_c2_c4c0_cond <= VAR_x_MUX_uxn_device_h_l142_c2_c4c0_cond;
     x_MUX_uxn_device_h_l142_c2_c4c0_iftrue <= VAR_x_MUX_uxn_device_h_l142_c2_c4c0_iftrue;
     x_MUX_uxn_device_h_l142_c2_c4c0_iffalse <= VAR_x_MUX_uxn_device_h_l142_c2_c4c0_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l142_c2_c4c0_return_output := x_MUX_uxn_device_h_l142_c2_c4c0_return_output;

     -- MUX[uxn_device_h_l150_c18_d8aa] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l150_c18_d8aa_cond <= VAR_MUX_uxn_device_h_l150_c18_d8aa_cond;
     MUX_uxn_device_h_l150_c18_d8aa_iftrue <= VAR_MUX_uxn_device_h_l150_c18_d8aa_iftrue;
     MUX_uxn_device_h_l150_c18_d8aa_iffalse <= VAR_MUX_uxn_device_h_l150_c18_d8aa_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l150_c18_d8aa_return_output := MUX_uxn_device_h_l150_c18_d8aa_return_output;

     -- CONST_SR_1[uxn_device_h_l157_c3_b885] LATENCY=0
     -- Inputs
     CONST_SR_1_uxn_device_h_l157_c3_b885_x <= VAR_CONST_SR_1_uxn_device_h_l157_c3_b885_x;
     -- Outputs
     VAR_CONST_SR_1_uxn_device_h_l157_c3_b885_return_output := CONST_SR_1_uxn_device_h_l157_c3_b885_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l142_c2_c4c0] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l142_c2_c4c0_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l142_c2_c4c0_cond;
     result_u16_addr_MUX_uxn_device_h_l142_c2_c4c0_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l142_c2_c4c0_iftrue;
     result_u16_addr_MUX_uxn_device_h_l142_c2_c4c0_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l142_c2_c4c0_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l142_c2_c4c0_return_output := result_u16_addr_MUX_uxn_device_h_l142_c2_c4c0_return_output;

     -- uint8_0_0_uxn_device_h_l154_l153_DUPLICATE_0b88 LATENCY=0
     VAR_uint8_0_0_uxn_device_h_l154_l153_DUPLICATE_0b88_return_output := uint8_0_0(
     VAR_MUX_uxn_device_h_l148_c7_df62_return_output);

     -- y_MUX[uxn_device_h_l142_c2_c4c0] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l142_c2_c4c0_cond <= VAR_y_MUX_uxn_device_h_l142_c2_c4c0_cond;
     y_MUX_uxn_device_h_l142_c2_c4c0_iftrue <= VAR_y_MUX_uxn_device_h_l142_c2_c4c0_iftrue;
     y_MUX_uxn_device_h_l142_c2_c4c0_iffalse <= VAR_y_MUX_uxn_device_h_l142_c2_c4c0_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l142_c2_c4c0_return_output := y_MUX_uxn_device_h_l142_c2_c4c0_return_output;

     -- Submodule level 7
     VAR_c_MUX_uxn_device_h_l142_c2_c4c0_iffalse := VAR_CONST_SR_1_uxn_device_h_l157_c3_b885_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l153_c26_bd33_left := VAR_MUX_uxn_device_h_l150_c18_d8aa_return_output;
     VAR_is_in_bounds_MUX_uxn_device_h_l142_c2_c4c0_iffalse := VAR_MUX_uxn_device_h_l150_c18_d8aa_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l153_c42_3818_right := VAR_uint8_0_0_uxn_device_h_l154_l153_DUPLICATE_0b88_return_output;
     VAR_MUX_uxn_device_h_l154_c40_a373_cond := VAR_uint8_0_0_uxn_device_h_l154_l153_DUPLICATE_0b88_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l142_c2_c4c0_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l142_c2_c4c0_return_output;
     -- is_in_bounds_MUX[uxn_device_h_l142_c2_c4c0] LATENCY=0
     -- Inputs
     is_in_bounds_MUX_uxn_device_h_l142_c2_c4c0_cond <= VAR_is_in_bounds_MUX_uxn_device_h_l142_c2_c4c0_cond;
     is_in_bounds_MUX_uxn_device_h_l142_c2_c4c0_iftrue <= VAR_is_in_bounds_MUX_uxn_device_h_l142_c2_c4c0_iftrue;
     is_in_bounds_MUX_uxn_device_h_l142_c2_c4c0_iffalse <= VAR_is_in_bounds_MUX_uxn_device_h_l142_c2_c4c0_iffalse;
     -- Outputs
     VAR_is_in_bounds_MUX_uxn_device_h_l142_c2_c4c0_return_output := is_in_bounds_MUX_uxn_device_h_l142_c2_c4c0_return_output;

     -- MUX[uxn_device_h_l154_c40_a373] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l154_c40_a373_cond <= VAR_MUX_uxn_device_h_l154_c40_a373_cond;
     MUX_uxn_device_h_l154_c40_a373_iftrue <= VAR_MUX_uxn_device_h_l154_c40_a373_iftrue;
     MUX_uxn_device_h_l154_c40_a373_iffalse <= VAR_MUX_uxn_device_h_l154_c40_a373_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l154_c40_a373_return_output := MUX_uxn_device_h_l154_c40_a373_return_output;

     -- c_MUX[uxn_device_h_l142_c2_c4c0] LATENCY=0
     -- Inputs
     c_MUX_uxn_device_h_l142_c2_c4c0_cond <= VAR_c_MUX_uxn_device_h_l142_c2_c4c0_cond;
     c_MUX_uxn_device_h_l142_c2_c4c0_iftrue <= VAR_c_MUX_uxn_device_h_l142_c2_c4c0_iftrue;
     c_MUX_uxn_device_h_l142_c2_c4c0_iffalse <= VAR_c_MUX_uxn_device_h_l142_c2_c4c0_iffalse;
     -- Outputs
     VAR_c_MUX_uxn_device_h_l142_c2_c4c0_return_output := c_MUX_uxn_device_h_l142_c2_c4c0_return_output;

     -- BIN_OP_OR[uxn_device_h_l153_c42_3818] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l153_c42_3818_left <= VAR_BIN_OP_OR_uxn_device_h_l153_c42_3818_left;
     BIN_OP_OR_uxn_device_h_l153_c42_3818_right <= VAR_BIN_OP_OR_uxn_device_h_l153_c42_3818_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l153_c42_3818_return_output := BIN_OP_OR_uxn_device_h_l153_c42_3818_return_output;

     -- Submodule level 8
     VAR_BIN_OP_AND_uxn_device_h_l153_c26_bd33_right := VAR_BIN_OP_OR_uxn_device_h_l153_c42_3818_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l154_c30_5537_right := VAR_MUX_uxn_device_h_l154_c40_a373_return_output;
     REG_VAR_c := VAR_c_MUX_uxn_device_h_l142_c2_c4c0_return_output;
     REG_VAR_is_in_bounds := VAR_is_in_bounds_MUX_uxn_device_h_l142_c2_c4c0_return_output;
     -- BIN_OP_PLUS[uxn_device_h_l154_c30_5537] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l154_c30_5537_left <= VAR_BIN_OP_PLUS_uxn_device_h_l154_c30_5537_left;
     BIN_OP_PLUS_uxn_device_h_l154_c30_5537_right <= VAR_BIN_OP_PLUS_uxn_device_h_l154_c30_5537_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l154_c30_5537_return_output := BIN_OP_PLUS_uxn_device_h_l154_c30_5537_return_output;

     -- BIN_OP_AND[uxn_device_h_l153_c26_bd33] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l153_c26_bd33_left <= VAR_BIN_OP_AND_uxn_device_h_l153_c26_bd33_left;
     BIN_OP_AND_uxn_device_h_l153_c26_bd33_right <= VAR_BIN_OP_AND_uxn_device_h_l153_c26_bd33_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l153_c26_bd33_return_output := BIN_OP_AND_uxn_device_h_l153_c26_bd33_return_output;

     -- Submodule level 9
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c2_c4c0_iffalse := VAR_BIN_OP_AND_uxn_device_h_l153_c26_bd33_return_output;
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_b09c_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l154_c30_5537_return_output, 6);
     -- result_is_vram_write_MUX[uxn_device_h_l142_c2_c4c0] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l142_c2_c4c0_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l142_c2_c4c0_cond;
     result_is_vram_write_MUX_uxn_device_h_l142_c2_c4c0_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l142_c2_c4c0_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l142_c2_c4c0_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l142_c2_c4c0_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c2_c4c0_return_output := result_is_vram_write_MUX_uxn_device_h_l142_c2_c4c0_return_output;

     -- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l154_c21_b09c] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_b09c_ref_toks_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_b09c_ref_toks_0;
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_b09c_var_dim_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_b09c_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_b09c_return_output := VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_b09c_return_output;

     -- Submodule level 10
     VAR_result_u8_value_uxn_device_h_l154_c3_f68b := resize(VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_b09c_return_output, 8);
     VAR_result_u8_value_MUX_uxn_device_h_l142_c2_c4c0_iffalse := VAR_result_u8_value_uxn_device_h_l154_c3_f68b;
     -- result_u8_value_MUX[uxn_device_h_l142_c2_c4c0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l142_c2_c4c0_cond <= VAR_result_u8_value_MUX_uxn_device_h_l142_c2_c4c0_cond;
     result_u8_value_MUX_uxn_device_h_l142_c2_c4c0_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l142_c2_c4c0_iftrue;
     result_u8_value_MUX_uxn_device_h_l142_c2_c4c0_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l142_c2_c4c0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l142_c2_c4c0_return_output := result_u8_value_MUX_uxn_device_h_l142_c2_c4c0_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_d326_uxn_device_h_l161_l109_DUPLICATE_681d LATENCY=0
     VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_d326_uxn_device_h_l161_l109_DUPLICATE_681d_return_output := CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_d326(
     result,
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c2_c4c0_return_output,
     VAR_result_is_blit_done_MUX_uxn_device_h_l142_c2_c4c0_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l142_c2_c4c0_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l142_c2_c4c0_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_d326_uxn_device_h_l161_l109_DUPLICATE_681d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_d326_uxn_device_h_l161_l109_DUPLICATE_681d_return_output;
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
REG_COMB_color8 <= REG_VAR_color8;
REG_COMB_result <= REG_VAR_result;
REG_COMB_phase_minus_two <= REG_VAR_phase_minus_two;
REG_COMB_phase7_downto_3 <= REG_VAR_phase7_downto_3;
REG_COMB_phase2_downto_0 <= REG_VAR_phase2_downto_0;
REG_COMB_sprite_rows <= REG_VAR_sprite_rows;
REG_COMB_is_in_bounds <= REG_VAR_is_in_bounds;
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
     color8 <= REG_COMB_color8;
     result <= REG_COMB_result;
     phase_minus_two <= REG_COMB_phase_minus_two;
     phase7_downto_3 <= REG_COMB_phase7_downto_3;
     phase2_downto_0 <= REG_COMB_phase2_downto_0;
     sprite_rows <= REG_COMB_sprite_rows;
     is_in_bounds <= REG_COMB_is_in_bounds;
 end if;
 end if;
end process;

end arch;
