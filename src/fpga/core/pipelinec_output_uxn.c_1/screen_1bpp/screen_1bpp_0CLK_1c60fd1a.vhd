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
-- Submodules: 60
entity screen_1bpp_0CLK_1c60fd1a is
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
end screen_1bpp_0CLK_1c60fd1a;
architecture arch of screen_1bpp_0CLK_1c60fd1a is
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
-- BIN_OP_MINUS[uxn_device_h_l131_c20_e653]
signal BIN_OP_MINUS_uxn_device_h_l131_c20_e653_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l131_c20_e653_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l131_c20_e653_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l133_c6_0faa]
signal BIN_OP_EQ_uxn_device_h_l133_c6_0faa_left : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l133_c6_0faa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l133_c6_0faa_return_output : unsigned(0 downto 0);

-- sprite_rows_MUX[uxn_device_h_l133_c2_ee02]
signal sprite_rows_MUX_uxn_device_h_l133_c2_ee02_cond : unsigned(0 downto 0);
signal sprite_rows_MUX_uxn_device_h_l133_c2_ee02_iftrue : uint8_t_8;
signal sprite_rows_MUX_uxn_device_h_l133_c2_ee02_iffalse : uint8_t_8;
signal sprite_rows_MUX_uxn_device_h_l133_c2_ee02_return_output : uint8_t_8;

-- VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8[uxn_device_h_l134_c3_d595]
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l134_c3_d595_elem_val : unsigned(7 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l134_c3_d595_ref_toks_0 : uint8_t_8;
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l134_c3_d595_var_dim_0 : unsigned(2 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l134_c3_d595_return_output : uint8_t_array_8_t;

-- BIN_OP_EQ[uxn_device_h_l137_c6_1bb4]
signal BIN_OP_EQ_uxn_device_h_l137_c6_1bb4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c6_1bb4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c6_1bb4_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l137_c2_c1e2]
signal x_MUX_uxn_device_h_l137_c2_c1e2_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l137_c2_c1e2_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l137_c2_c1e2_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l137_c2_c1e2_return_output : unsigned(15 downto 0);

-- opaque_MUX[uxn_device_h_l137_c2_c1e2]
signal opaque_MUX_uxn_device_h_l137_c2_c1e2_cond : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l137_c2_c1e2_iftrue : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l137_c2_c1e2_iffalse : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l137_c2_c1e2_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l137_c2_c1e2]
signal y_MUX_uxn_device_h_l137_c2_c1e2_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l137_c2_c1e2_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l137_c2_c1e2_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l137_c2_c1e2_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l138_c21_6ff9]
signal BIN_OP_PLUS_uxn_device_h_l138_c21_6ff9_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l138_c21_6ff9_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l138_c21_6ff9_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l138_c12_7011]
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l138_c12_7011_ref_toks_0 : uint2_t_48;
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l138_c12_7011_var_dim_0 : unsigned(5 downto 0);
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l138_c12_7011_return_output : unsigned(1 downto 0);

-- MUX[uxn_device_h_l139_c13_55a6]
signal MUX_uxn_device_h_l139_c13_55a6_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l139_c13_55a6_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l139_c13_55a6_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l139_c13_55a6_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l139_c7_d45a]
signal BIN_OP_PLUS_uxn_device_h_l139_c7_d45a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l139_c7_d45a_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l139_c7_d45a_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l140_c13_004d]
signal MUX_uxn_device_h_l140_c13_004d_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l140_c13_004d_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l140_c13_004d_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l140_c13_004d_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l140_c7_1eb3]
signal BIN_OP_PLUS_uxn_device_h_l140_c7_1eb3_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l140_c7_1eb3_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l140_c7_1eb3_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l143_c6_3b29]
signal BIN_OP_EQ_uxn_device_h_l143_c6_3b29_left : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c6_3b29_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c6_3b29_return_output : unsigned(0 downto 0);

-- c_MUX[uxn_device_h_l143_c2_fe73]
signal c_MUX_uxn_device_h_l143_c2_fe73_cond : unsigned(0 downto 0);
signal c_MUX_uxn_device_h_l143_c2_fe73_iftrue : unsigned(7 downto 0);
signal c_MUX_uxn_device_h_l143_c2_fe73_iffalse : unsigned(7 downto 0);
signal c_MUX_uxn_device_h_l143_c2_fe73_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l143_c2_fe73]
signal result_is_vram_write_MUX_uxn_device_h_l143_c2_fe73_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l143_c2_fe73_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l143_c2_fe73_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l143_c2_fe73_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l143_c2_fe73]
signal result_u16_addr_MUX_uxn_device_h_l143_c2_fe73_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l143_c2_fe73_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l143_c2_fe73_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l143_c2_fe73_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_device_h_l143_c2_fe73]
signal result_u8_value_MUX_uxn_device_h_l143_c2_fe73_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l143_c2_fe73_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l143_c2_fe73_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l143_c2_fe73_return_output : unsigned(7 downto 0);

-- result_is_blit_done_MUX[uxn_device_h_l143_c2_fe73]
signal result_is_blit_done_MUX_uxn_device_h_l143_c2_fe73_cond : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l143_c2_fe73_iftrue : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l143_c2_fe73_iffalse : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l143_c2_fe73_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l143_c2_fe73]
signal x_MUX_uxn_device_h_l143_c2_fe73_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l143_c2_fe73_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l143_c2_fe73_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l143_c2_fe73_return_output : unsigned(15 downto 0);

-- is_in_bounds_MUX[uxn_device_h_l143_c2_fe73]
signal is_in_bounds_MUX_uxn_device_h_l143_c2_fe73_cond : unsigned(0 downto 0);
signal is_in_bounds_MUX_uxn_device_h_l143_c2_fe73_iftrue : unsigned(0 downto 0);
signal is_in_bounds_MUX_uxn_device_h_l143_c2_fe73_iffalse : unsigned(0 downto 0);
signal is_in_bounds_MUX_uxn_device_h_l143_c2_fe73_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l143_c2_fe73]
signal y_MUX_uxn_device_h_l143_c2_fe73_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l143_c2_fe73_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l143_c2_fe73_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l143_c2_fe73_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l147_c21_379d]
signal BIN_OP_PLUS_uxn_device_h_l147_c21_379d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l147_c21_379d_right : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l147_c21_379d_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l149_c7_51c4]
signal BIN_OP_EQ_uxn_device_h_l149_c7_51c4_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l149_c7_51c4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l149_c7_51c4_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l149_c46_69cb]
signal BIN_OP_MINUS_uxn_device_h_l149_c46_69cb_left : unsigned(4 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l149_c46_69cb_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l149_c46_69cb_return_output : unsigned(4 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d[uxn_device_h_l149_c34_f0ac]
signal VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l149_c34_f0ac_ref_toks_0 : uint8_t_8;
signal VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l149_c34_f0ac_var_dim_0 : unsigned(2 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l149_c34_f0ac_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l149_c7_5adb]
signal MUX_uxn_device_h_l149_c7_5adb_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l149_c7_5adb_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l149_c7_5adb_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l149_c7_5adb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l150_c7_8f36]
signal BIN_OP_EQ_uxn_device_h_l150_c7_8f36_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l150_c7_8f36_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l150_c7_8f36_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l150_c41_a3ff]
signal MUX_uxn_device_h_l150_c41_a3ff_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l150_c41_a3ff_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l150_c41_a3ff_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l150_c41_a3ff_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l150_c35_6ac8]
signal BIN_OP_PLUS_uxn_device_h_l150_c35_6ac8_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l150_c35_6ac8_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l150_c35_6ac8_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l150_c7_d3c6]
signal MUX_uxn_device_h_l150_c7_d3c6_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l150_c7_d3c6_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l150_c7_d3c6_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l150_c7_d3c6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l151_c18_bdeb]
signal BIN_OP_EQ_uxn_device_h_l151_c18_bdeb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l151_c18_bdeb_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l151_c18_bdeb_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l151_c18_ad01]
signal MUX_uxn_device_h_l151_c18_ad01_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l151_c18_ad01_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l151_c18_ad01_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l151_c18_ad01_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_device_h_l152_c22_cb09]
signal CONST_SL_8_uxn_device_h_l152_c22_cb09_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_device_h_l152_c22_cb09_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l152_c22_a31a]
signal BIN_OP_PLUS_uxn_device_h_l152_c22_a31a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l152_c22_a31a_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l152_c22_a31a_return_output : unsigned(16 downto 0);

-- BIN_OP_OR[uxn_device_h_l153_c42_7d58]
signal BIN_OP_OR_uxn_device_h_l153_c42_7d58_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l153_c42_7d58_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l153_c42_7d58_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l153_c26_d8b6]
signal BIN_OP_AND_uxn_device_h_l153_c26_d8b6_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l153_c26_d8b6_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l153_c26_d8b6_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l154_c40_49fd]
signal MUX_uxn_device_h_l154_c40_49fd_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l154_c40_49fd_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l154_c40_49fd_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l154_c40_49fd_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l154_c30_70d5]
signal BIN_OP_PLUS_uxn_device_h_l154_c30_70d5_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l154_c30_70d5_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l154_c30_70d5_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l154_c21_d723]
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_d723_ref_toks_0 : uint2_t_48;
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_d723_var_dim_0 : unsigned(5 downto 0);
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_d723_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l155_c7_97c5]
signal BIN_OP_EQ_uxn_device_h_l155_c7_97c5_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l155_c7_97c5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l155_c7_97c5_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l155_c41_865b]
signal BIN_OP_MINUS_uxn_device_h_l155_c41_865b_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l155_c41_865b_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l155_c41_865b_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l155_c51_0c9e]
signal BIN_OP_PLUS_uxn_device_h_l155_c51_0c9e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l155_c51_0c9e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l155_c51_0c9e_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l155_c35_dc3e]
signal MUX_uxn_device_h_l155_c35_dc3e_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l155_c35_dc3e_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l155_c35_dc3e_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l155_c35_dc3e_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l155_c7_56b5]
signal MUX_uxn_device_h_l155_c7_56b5_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l155_c7_56b5_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l155_c7_56b5_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l155_c7_56b5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l156_c25_c7e5]
signal BIN_OP_EQ_uxn_device_h_l156_c25_c7e5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l156_c25_c7e5_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l156_c25_c7e5_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l156_c25_f88a]
signal MUX_uxn_device_h_l156_c25_f88a_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l156_c25_f88a_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l156_c25_f88a_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l156_c25_f88a_return_output : unsigned(0 downto 0);

-- CONST_SR_1[uxn_device_h_l157_c3_d4ba]
signal CONST_SR_1_uxn_device_h_l157_c3_d4ba_x : unsigned(7 downto 0);
signal CONST_SR_1_uxn_device_h_l157_c3_d4ba_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l158_c14_d88e]
signal BIN_OP_PLUS_uxn_device_h_l158_c14_d88e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l158_c14_d88e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l158_c14_d88e_return_output : unsigned(16 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l158_c24_1145]
signal BIN_OP_MINUS_uxn_device_h_l158_c24_1145_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l158_c24_1145_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l158_c24_1145_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l158_c8_2472]
signal MUX_uxn_device_h_l158_c8_2472_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l158_c8_2472_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l158_c8_2472_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l158_c8_2472_return_output : unsigned(15 downto 0);

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
      base(0) := ref_toks_0.data(0);
      base(3) := ref_toks_0.data(3);
      base(6) := ref_toks_0.data(6);
      base(2) := ref_toks_0.data(2);
      base(5) := ref_toks_0.data(5);
      base(4) := ref_toks_0.data(4);
      base(1) := ref_toks_0.data(1);
      base(7) := ref_toks_0.data(7);

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

function uint8_0_0( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
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
-- BIN_OP_MINUS_uxn_device_h_l131_c20_e653
BIN_OP_MINUS_uxn_device_h_l131_c20_e653 : entity work.BIN_OP_MINUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l131_c20_e653_left,
BIN_OP_MINUS_uxn_device_h_l131_c20_e653_right,
BIN_OP_MINUS_uxn_device_h_l131_c20_e653_return_output);

-- BIN_OP_EQ_uxn_device_h_l133_c6_0faa
BIN_OP_EQ_uxn_device_h_l133_c6_0faa : entity work.BIN_OP_EQ_uint5_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l133_c6_0faa_left,
BIN_OP_EQ_uxn_device_h_l133_c6_0faa_right,
BIN_OP_EQ_uxn_device_h_l133_c6_0faa_return_output);

-- sprite_rows_MUX_uxn_device_h_l133_c2_ee02
sprite_rows_MUX_uxn_device_h_l133_c2_ee02 : entity work.MUX_uint1_t_uint8_t_8_uint8_t_8_0CLK_de264c78 port map (
sprite_rows_MUX_uxn_device_h_l133_c2_ee02_cond,
sprite_rows_MUX_uxn_device_h_l133_c2_ee02_iftrue,
sprite_rows_MUX_uxn_device_h_l133_c2_ee02_iffalse,
sprite_rows_MUX_uxn_device_h_l133_c2_ee02_return_output);

-- VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l134_c3_d595
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l134_c3_d595 : entity work.VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_0CLK_83e31706 port map (
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l134_c3_d595_elem_val,
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l134_c3_d595_ref_toks_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l134_c3_d595_var_dim_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l134_c3_d595_return_output);

-- BIN_OP_EQ_uxn_device_h_l137_c6_1bb4
BIN_OP_EQ_uxn_device_h_l137_c6_1bb4 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l137_c6_1bb4_left,
BIN_OP_EQ_uxn_device_h_l137_c6_1bb4_right,
BIN_OP_EQ_uxn_device_h_l137_c6_1bb4_return_output);

-- x_MUX_uxn_device_h_l137_c2_c1e2
x_MUX_uxn_device_h_l137_c2_c1e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l137_c2_c1e2_cond,
x_MUX_uxn_device_h_l137_c2_c1e2_iftrue,
x_MUX_uxn_device_h_l137_c2_c1e2_iffalse,
x_MUX_uxn_device_h_l137_c2_c1e2_return_output);

-- opaque_MUX_uxn_device_h_l137_c2_c1e2
opaque_MUX_uxn_device_h_l137_c2_c1e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opaque_MUX_uxn_device_h_l137_c2_c1e2_cond,
opaque_MUX_uxn_device_h_l137_c2_c1e2_iftrue,
opaque_MUX_uxn_device_h_l137_c2_c1e2_iffalse,
opaque_MUX_uxn_device_h_l137_c2_c1e2_return_output);

-- y_MUX_uxn_device_h_l137_c2_c1e2
y_MUX_uxn_device_h_l137_c2_c1e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l137_c2_c1e2_cond,
y_MUX_uxn_device_h_l137_c2_c1e2_iftrue,
y_MUX_uxn_device_h_l137_c2_c1e2_iffalse,
y_MUX_uxn_device_h_l137_c2_c1e2_return_output);

-- BIN_OP_PLUS_uxn_device_h_l138_c21_6ff9
BIN_OP_PLUS_uxn_device_h_l138_c21_6ff9 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l138_c21_6ff9_left,
BIN_OP_PLUS_uxn_device_h_l138_c21_6ff9_right,
BIN_OP_PLUS_uxn_device_h_l138_c21_6ff9_return_output);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l138_c12_7011
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l138_c12_7011 : entity work.VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_0CLK_f9daebf3 port map (
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l138_c12_7011_ref_toks_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l138_c12_7011_var_dim_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l138_c12_7011_return_output);

-- MUX_uxn_device_h_l139_c13_55a6
MUX_uxn_device_h_l139_c13_55a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l139_c13_55a6_cond,
MUX_uxn_device_h_l139_c13_55a6_iftrue,
MUX_uxn_device_h_l139_c13_55a6_iffalse,
MUX_uxn_device_h_l139_c13_55a6_return_output);

-- BIN_OP_PLUS_uxn_device_h_l139_c7_d45a
BIN_OP_PLUS_uxn_device_h_l139_c7_d45a : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l139_c7_d45a_left,
BIN_OP_PLUS_uxn_device_h_l139_c7_d45a_right,
BIN_OP_PLUS_uxn_device_h_l139_c7_d45a_return_output);

-- MUX_uxn_device_h_l140_c13_004d
MUX_uxn_device_h_l140_c13_004d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l140_c13_004d_cond,
MUX_uxn_device_h_l140_c13_004d_iftrue,
MUX_uxn_device_h_l140_c13_004d_iffalse,
MUX_uxn_device_h_l140_c13_004d_return_output);

-- BIN_OP_PLUS_uxn_device_h_l140_c7_1eb3
BIN_OP_PLUS_uxn_device_h_l140_c7_1eb3 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l140_c7_1eb3_left,
BIN_OP_PLUS_uxn_device_h_l140_c7_1eb3_right,
BIN_OP_PLUS_uxn_device_h_l140_c7_1eb3_return_output);

-- BIN_OP_EQ_uxn_device_h_l143_c6_3b29
BIN_OP_EQ_uxn_device_h_l143_c6_3b29 : entity work.BIN_OP_EQ_uint5_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l143_c6_3b29_left,
BIN_OP_EQ_uxn_device_h_l143_c6_3b29_right,
BIN_OP_EQ_uxn_device_h_l143_c6_3b29_return_output);

-- c_MUX_uxn_device_h_l143_c2_fe73
c_MUX_uxn_device_h_l143_c2_fe73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
c_MUX_uxn_device_h_l143_c2_fe73_cond,
c_MUX_uxn_device_h_l143_c2_fe73_iftrue,
c_MUX_uxn_device_h_l143_c2_fe73_iffalse,
c_MUX_uxn_device_h_l143_c2_fe73_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l143_c2_fe73
result_is_vram_write_MUX_uxn_device_h_l143_c2_fe73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l143_c2_fe73_cond,
result_is_vram_write_MUX_uxn_device_h_l143_c2_fe73_iftrue,
result_is_vram_write_MUX_uxn_device_h_l143_c2_fe73_iffalse,
result_is_vram_write_MUX_uxn_device_h_l143_c2_fe73_return_output);

-- result_u16_addr_MUX_uxn_device_h_l143_c2_fe73
result_u16_addr_MUX_uxn_device_h_l143_c2_fe73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l143_c2_fe73_cond,
result_u16_addr_MUX_uxn_device_h_l143_c2_fe73_iftrue,
result_u16_addr_MUX_uxn_device_h_l143_c2_fe73_iffalse,
result_u16_addr_MUX_uxn_device_h_l143_c2_fe73_return_output);

-- result_u8_value_MUX_uxn_device_h_l143_c2_fe73
result_u8_value_MUX_uxn_device_h_l143_c2_fe73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l143_c2_fe73_cond,
result_u8_value_MUX_uxn_device_h_l143_c2_fe73_iftrue,
result_u8_value_MUX_uxn_device_h_l143_c2_fe73_iffalse,
result_u8_value_MUX_uxn_device_h_l143_c2_fe73_return_output);

-- result_is_blit_done_MUX_uxn_device_h_l143_c2_fe73
result_is_blit_done_MUX_uxn_device_h_l143_c2_fe73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_blit_done_MUX_uxn_device_h_l143_c2_fe73_cond,
result_is_blit_done_MUX_uxn_device_h_l143_c2_fe73_iftrue,
result_is_blit_done_MUX_uxn_device_h_l143_c2_fe73_iffalse,
result_is_blit_done_MUX_uxn_device_h_l143_c2_fe73_return_output);

-- x_MUX_uxn_device_h_l143_c2_fe73
x_MUX_uxn_device_h_l143_c2_fe73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l143_c2_fe73_cond,
x_MUX_uxn_device_h_l143_c2_fe73_iftrue,
x_MUX_uxn_device_h_l143_c2_fe73_iffalse,
x_MUX_uxn_device_h_l143_c2_fe73_return_output);

-- is_in_bounds_MUX_uxn_device_h_l143_c2_fe73
is_in_bounds_MUX_uxn_device_h_l143_c2_fe73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_in_bounds_MUX_uxn_device_h_l143_c2_fe73_cond,
is_in_bounds_MUX_uxn_device_h_l143_c2_fe73_iftrue,
is_in_bounds_MUX_uxn_device_h_l143_c2_fe73_iffalse,
is_in_bounds_MUX_uxn_device_h_l143_c2_fe73_return_output);

-- y_MUX_uxn_device_h_l143_c2_fe73
y_MUX_uxn_device_h_l143_c2_fe73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l143_c2_fe73_cond,
y_MUX_uxn_device_h_l143_c2_fe73_iftrue,
y_MUX_uxn_device_h_l143_c2_fe73_iffalse,
y_MUX_uxn_device_h_l143_c2_fe73_return_output);

-- BIN_OP_PLUS_uxn_device_h_l147_c21_379d
BIN_OP_PLUS_uxn_device_h_l147_c21_379d : entity work.BIN_OP_PLUS_uint16_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l147_c21_379d_left,
BIN_OP_PLUS_uxn_device_h_l147_c21_379d_right,
BIN_OP_PLUS_uxn_device_h_l147_c21_379d_return_output);

-- BIN_OP_EQ_uxn_device_h_l149_c7_51c4
BIN_OP_EQ_uxn_device_h_l149_c7_51c4 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l149_c7_51c4_left,
BIN_OP_EQ_uxn_device_h_l149_c7_51c4_right,
BIN_OP_EQ_uxn_device_h_l149_c7_51c4_return_output);

-- BIN_OP_MINUS_uxn_device_h_l149_c46_69cb
BIN_OP_MINUS_uxn_device_h_l149_c46_69cb : entity work.BIN_OP_MINUS_uint5_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l149_c46_69cb_left,
BIN_OP_MINUS_uxn_device_h_l149_c46_69cb_right,
BIN_OP_MINUS_uxn_device_h_l149_c46_69cb_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l149_c34_f0ac
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l149_c34_f0ac : entity work.VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_0CLK_814e9c60 port map (
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l149_c34_f0ac_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l149_c34_f0ac_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l149_c34_f0ac_return_output);

-- MUX_uxn_device_h_l149_c7_5adb
MUX_uxn_device_h_l149_c7_5adb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l149_c7_5adb_cond,
MUX_uxn_device_h_l149_c7_5adb_iftrue,
MUX_uxn_device_h_l149_c7_5adb_iffalse,
MUX_uxn_device_h_l149_c7_5adb_return_output);

-- BIN_OP_EQ_uxn_device_h_l150_c7_8f36
BIN_OP_EQ_uxn_device_h_l150_c7_8f36 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l150_c7_8f36_left,
BIN_OP_EQ_uxn_device_h_l150_c7_8f36_right,
BIN_OP_EQ_uxn_device_h_l150_c7_8f36_return_output);

-- MUX_uxn_device_h_l150_c41_a3ff
MUX_uxn_device_h_l150_c41_a3ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l150_c41_a3ff_cond,
MUX_uxn_device_h_l150_c41_a3ff_iftrue,
MUX_uxn_device_h_l150_c41_a3ff_iffalse,
MUX_uxn_device_h_l150_c41_a3ff_return_output);

-- BIN_OP_PLUS_uxn_device_h_l150_c35_6ac8
BIN_OP_PLUS_uxn_device_h_l150_c35_6ac8 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l150_c35_6ac8_left,
BIN_OP_PLUS_uxn_device_h_l150_c35_6ac8_right,
BIN_OP_PLUS_uxn_device_h_l150_c35_6ac8_return_output);

-- MUX_uxn_device_h_l150_c7_d3c6
MUX_uxn_device_h_l150_c7_d3c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l150_c7_d3c6_cond,
MUX_uxn_device_h_l150_c7_d3c6_iftrue,
MUX_uxn_device_h_l150_c7_d3c6_iffalse,
MUX_uxn_device_h_l150_c7_d3c6_return_output);

-- BIN_OP_EQ_uxn_device_h_l151_c18_bdeb
BIN_OP_EQ_uxn_device_h_l151_c18_bdeb : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l151_c18_bdeb_left,
BIN_OP_EQ_uxn_device_h_l151_c18_bdeb_right,
BIN_OP_EQ_uxn_device_h_l151_c18_bdeb_return_output);

-- MUX_uxn_device_h_l151_c18_ad01
MUX_uxn_device_h_l151_c18_ad01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l151_c18_ad01_cond,
MUX_uxn_device_h_l151_c18_ad01_iftrue,
MUX_uxn_device_h_l151_c18_ad01_iffalse,
MUX_uxn_device_h_l151_c18_ad01_return_output);

-- CONST_SL_8_uxn_device_h_l152_c22_cb09
CONST_SL_8_uxn_device_h_l152_c22_cb09 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_device_h_l152_c22_cb09_x,
CONST_SL_8_uxn_device_h_l152_c22_cb09_return_output);

-- BIN_OP_PLUS_uxn_device_h_l152_c22_a31a
BIN_OP_PLUS_uxn_device_h_l152_c22_a31a : entity work.BIN_OP_PLUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l152_c22_a31a_left,
BIN_OP_PLUS_uxn_device_h_l152_c22_a31a_right,
BIN_OP_PLUS_uxn_device_h_l152_c22_a31a_return_output);

-- BIN_OP_OR_uxn_device_h_l153_c42_7d58
BIN_OP_OR_uxn_device_h_l153_c42_7d58 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l153_c42_7d58_left,
BIN_OP_OR_uxn_device_h_l153_c42_7d58_right,
BIN_OP_OR_uxn_device_h_l153_c42_7d58_return_output);

-- BIN_OP_AND_uxn_device_h_l153_c26_d8b6
BIN_OP_AND_uxn_device_h_l153_c26_d8b6 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l153_c26_d8b6_left,
BIN_OP_AND_uxn_device_h_l153_c26_d8b6_right,
BIN_OP_AND_uxn_device_h_l153_c26_d8b6_return_output);

-- MUX_uxn_device_h_l154_c40_49fd
MUX_uxn_device_h_l154_c40_49fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l154_c40_49fd_cond,
MUX_uxn_device_h_l154_c40_49fd_iftrue,
MUX_uxn_device_h_l154_c40_49fd_iffalse,
MUX_uxn_device_h_l154_c40_49fd_return_output);

-- BIN_OP_PLUS_uxn_device_h_l154_c30_70d5
BIN_OP_PLUS_uxn_device_h_l154_c30_70d5 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l154_c30_70d5_left,
BIN_OP_PLUS_uxn_device_h_l154_c30_70d5_right,
BIN_OP_PLUS_uxn_device_h_l154_c30_70d5_return_output);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_d723
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_d723 : entity work.VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_0CLK_f9daebf3 port map (
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_d723_ref_toks_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_d723_var_dim_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_d723_return_output);

-- BIN_OP_EQ_uxn_device_h_l155_c7_97c5
BIN_OP_EQ_uxn_device_h_l155_c7_97c5 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l155_c7_97c5_left,
BIN_OP_EQ_uxn_device_h_l155_c7_97c5_right,
BIN_OP_EQ_uxn_device_h_l155_c7_97c5_return_output);

-- BIN_OP_MINUS_uxn_device_h_l155_c41_865b
BIN_OP_MINUS_uxn_device_h_l155_c41_865b : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l155_c41_865b_left,
BIN_OP_MINUS_uxn_device_h_l155_c41_865b_right,
BIN_OP_MINUS_uxn_device_h_l155_c41_865b_return_output);

-- BIN_OP_PLUS_uxn_device_h_l155_c51_0c9e
BIN_OP_PLUS_uxn_device_h_l155_c51_0c9e : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l155_c51_0c9e_left,
BIN_OP_PLUS_uxn_device_h_l155_c51_0c9e_right,
BIN_OP_PLUS_uxn_device_h_l155_c51_0c9e_return_output);

-- MUX_uxn_device_h_l155_c35_dc3e
MUX_uxn_device_h_l155_c35_dc3e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l155_c35_dc3e_cond,
MUX_uxn_device_h_l155_c35_dc3e_iftrue,
MUX_uxn_device_h_l155_c35_dc3e_iffalse,
MUX_uxn_device_h_l155_c35_dc3e_return_output);

-- MUX_uxn_device_h_l155_c7_56b5
MUX_uxn_device_h_l155_c7_56b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l155_c7_56b5_cond,
MUX_uxn_device_h_l155_c7_56b5_iftrue,
MUX_uxn_device_h_l155_c7_56b5_iffalse,
MUX_uxn_device_h_l155_c7_56b5_return_output);

-- BIN_OP_EQ_uxn_device_h_l156_c25_c7e5
BIN_OP_EQ_uxn_device_h_l156_c25_c7e5 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l156_c25_c7e5_left,
BIN_OP_EQ_uxn_device_h_l156_c25_c7e5_right,
BIN_OP_EQ_uxn_device_h_l156_c25_c7e5_return_output);

-- MUX_uxn_device_h_l156_c25_f88a
MUX_uxn_device_h_l156_c25_f88a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l156_c25_f88a_cond,
MUX_uxn_device_h_l156_c25_f88a_iftrue,
MUX_uxn_device_h_l156_c25_f88a_iffalse,
MUX_uxn_device_h_l156_c25_f88a_return_output);

-- CONST_SR_1_uxn_device_h_l157_c3_d4ba
CONST_SR_1_uxn_device_h_l157_c3_d4ba : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_uxn_device_h_l157_c3_d4ba_x,
CONST_SR_1_uxn_device_h_l157_c3_d4ba_return_output);

-- BIN_OP_PLUS_uxn_device_h_l158_c14_d88e
BIN_OP_PLUS_uxn_device_h_l158_c14_d88e : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l158_c14_d88e_left,
BIN_OP_PLUS_uxn_device_h_l158_c14_d88e_right,
BIN_OP_PLUS_uxn_device_h_l158_c14_d88e_return_output);

-- BIN_OP_MINUS_uxn_device_h_l158_c24_1145
BIN_OP_MINUS_uxn_device_h_l158_c24_1145 : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l158_c24_1145_left,
BIN_OP_MINUS_uxn_device_h_l158_c24_1145_right,
BIN_OP_MINUS_uxn_device_h_l158_c24_1145_return_output);

-- MUX_uxn_device_h_l158_c8_2472
MUX_uxn_device_h_l158_c8_2472 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l158_c8_2472_cond,
MUX_uxn_device_h_l158_c8_2472_iftrue,
MUX_uxn_device_h_l158_c8_2472_iffalse,
MUX_uxn_device_h_l158_c8_2472_return_output);



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
 BIN_OP_MINUS_uxn_device_h_l131_c20_e653_return_output,
 BIN_OP_EQ_uxn_device_h_l133_c6_0faa_return_output,
 sprite_rows_MUX_uxn_device_h_l133_c2_ee02_return_output,
 VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l134_c3_d595_return_output,
 BIN_OP_EQ_uxn_device_h_l137_c6_1bb4_return_output,
 x_MUX_uxn_device_h_l137_c2_c1e2_return_output,
 opaque_MUX_uxn_device_h_l137_c2_c1e2_return_output,
 y_MUX_uxn_device_h_l137_c2_c1e2_return_output,
 BIN_OP_PLUS_uxn_device_h_l138_c21_6ff9_return_output,
 VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l138_c12_7011_return_output,
 MUX_uxn_device_h_l139_c13_55a6_return_output,
 BIN_OP_PLUS_uxn_device_h_l139_c7_d45a_return_output,
 MUX_uxn_device_h_l140_c13_004d_return_output,
 BIN_OP_PLUS_uxn_device_h_l140_c7_1eb3_return_output,
 BIN_OP_EQ_uxn_device_h_l143_c6_3b29_return_output,
 c_MUX_uxn_device_h_l143_c2_fe73_return_output,
 result_is_vram_write_MUX_uxn_device_h_l143_c2_fe73_return_output,
 result_u16_addr_MUX_uxn_device_h_l143_c2_fe73_return_output,
 result_u8_value_MUX_uxn_device_h_l143_c2_fe73_return_output,
 result_is_blit_done_MUX_uxn_device_h_l143_c2_fe73_return_output,
 x_MUX_uxn_device_h_l143_c2_fe73_return_output,
 is_in_bounds_MUX_uxn_device_h_l143_c2_fe73_return_output,
 y_MUX_uxn_device_h_l143_c2_fe73_return_output,
 BIN_OP_PLUS_uxn_device_h_l147_c21_379d_return_output,
 BIN_OP_EQ_uxn_device_h_l149_c7_51c4_return_output,
 BIN_OP_MINUS_uxn_device_h_l149_c46_69cb_return_output,
 VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l149_c34_f0ac_return_output,
 MUX_uxn_device_h_l149_c7_5adb_return_output,
 BIN_OP_EQ_uxn_device_h_l150_c7_8f36_return_output,
 MUX_uxn_device_h_l150_c41_a3ff_return_output,
 BIN_OP_PLUS_uxn_device_h_l150_c35_6ac8_return_output,
 MUX_uxn_device_h_l150_c7_d3c6_return_output,
 BIN_OP_EQ_uxn_device_h_l151_c18_bdeb_return_output,
 MUX_uxn_device_h_l151_c18_ad01_return_output,
 CONST_SL_8_uxn_device_h_l152_c22_cb09_return_output,
 BIN_OP_PLUS_uxn_device_h_l152_c22_a31a_return_output,
 BIN_OP_OR_uxn_device_h_l153_c42_7d58_return_output,
 BIN_OP_AND_uxn_device_h_l153_c26_d8b6_return_output,
 MUX_uxn_device_h_l154_c40_49fd_return_output,
 BIN_OP_PLUS_uxn_device_h_l154_c30_70d5_return_output,
 VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_d723_return_output,
 BIN_OP_EQ_uxn_device_h_l155_c7_97c5_return_output,
 BIN_OP_MINUS_uxn_device_h_l155_c41_865b_return_output,
 BIN_OP_PLUS_uxn_device_h_l155_c51_0c9e_return_output,
 MUX_uxn_device_h_l155_c35_dc3e_return_output,
 MUX_uxn_device_h_l155_c7_56b5_return_output,
 BIN_OP_EQ_uxn_device_h_l156_c25_c7e5_return_output,
 MUX_uxn_device_h_l156_c25_f88a_return_output,
 CONST_SR_1_uxn_device_h_l157_c3_d4ba_return_output,
 BIN_OP_PLUS_uxn_device_h_l158_c14_d88e_return_output,
 BIN_OP_MINUS_uxn_device_h_l158_c24_1145_return_output,
 MUX_uxn_device_h_l158_c8_2472_return_output)
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
 variable VAR_color8_uxn_device_h_l128_c2_0c89 : unsigned(7 downto 0);
 variable VAR_uint12_7_3_uxn_device_h_l129_c20_9f22_return_output : unsigned(4 downto 0);
 variable VAR_uint12_2_0_uxn_device_h_l130_c20_89a2_return_output : unsigned(2 downto 0);
 variable VAR_phase_minus_two_uxn_device_h_l131_c2_f2c0 : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l131_c20_e653_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l131_c20_e653_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l131_c20_e653_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c6_0faa_left : unsigned(4 downto 0);
 variable VAR_uint12_7_3_uxn_device_h_l133_c6_6c3e_return_output : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c6_0faa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c6_0faa_return_output : unsigned(0 downto 0);
 variable VAR_sprite_rows_MUX_uxn_device_h_l133_c2_ee02_iftrue : uint8_t_8;
 variable VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5_uxn_device_h_l133_c2_ee02_return_output : uint8_t_8;
 variable VAR_sprite_rows_MUX_uxn_device_h_l133_c2_ee02_iffalse : uint8_t_8;
 variable VAR_sprite_rows_MUX_uxn_device_h_l133_c2_ee02_return_output : uint8_t_8;
 variable VAR_sprite_rows_MUX_uxn_device_h_l133_c2_ee02_cond : unsigned(0 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l134_c3_d595_return_output : uint8_t_array_8_t;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l134_c3_d595_elem_val : unsigned(7 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l134_c3_d595_ref_toks_0 : uint8_t_8;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l134_c3_d595_var_dim_0 : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c6_1bb4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c6_1bb4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c6_1bb4_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l137_c2_c1e2_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l139_c3_792f : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l137_c2_c1e2_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l137_c2_c1e2_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l137_c2_c1e2_cond : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l137_c2_c1e2_iftrue : unsigned(0 downto 0);
 variable VAR_opaque_uxn_device_h_l138_c3_e3ad : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l137_c2_c1e2_iffalse : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l137_c2_c1e2_return_output : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l137_c2_c1e2_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c2_c1e2_iftrue : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l140_c3_6f54 : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c2_c1e2_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c2_c1e2_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c2_c1e2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l138_c21_6ff9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l138_c21_6ff9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l138_c21_6ff9_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l138_c12_7011_var_dim_0 : unsigned(5 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l138_c12_7011_return_output : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l138_c12_7011_ref_toks_0 : uint2_t_48;
 variable VAR_BIN_OP_PLUS_uxn_device_h_l139_c7_d45a_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l139_c13_55a6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l139_c13_55a6_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l139_c13_55a6_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l139_c13_55a6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l139_c7_d45a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l139_c7_d45a_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l140_c7_1eb3_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l140_c13_004d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l140_c13_004d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l140_c13_004d_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l140_c13_004d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l140_c7_1eb3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l140_c7_1eb3_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c6_3b29_left : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c6_3b29_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c6_3b29_return_output : unsigned(0 downto 0);
 variable VAR_c_MUX_uxn_device_h_l143_c2_fe73_iftrue : unsigned(7 downto 0);
 variable VAR_c_MUX_uxn_device_h_l143_c2_fe73_iffalse : unsigned(7 downto 0);
 variable VAR_c_MUX_uxn_device_h_l143_c2_fe73_return_output : unsigned(7 downto 0);
 variable VAR_c_MUX_uxn_device_h_l143_c2_fe73_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l143_c2_fe73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l143_c2_fe73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l143_c2_fe73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l143_c2_fe73_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l143_c2_fe73_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l147_c3_8348 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l143_c2_fe73_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l152_c3_9654 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l143_c2_fe73_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l143_c2_fe73_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l143_c2_fe73_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l145_c3_ae61 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l143_c2_fe73_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l154_c3_1832 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l143_c2_fe73_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l143_c2_fe73_cond : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l143_c2_fe73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l143_c2_fe73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l143_c2_fe73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l143_c2_fe73_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l143_c2_fe73_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l143_c2_fe73_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l143_c2_fe73_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l143_c2_fe73_cond : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l143_c2_fe73_iftrue : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l143_c2_fe73_iffalse : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l143_c2_fe73_return_output : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l143_c2_fe73_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c2_fe73_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c2_fe73_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c2_fe73_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c2_fe73_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l147_c21_379d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l147_c21_379d_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l147_c21_379d_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c7_5adb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l149_c7_51c4_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l149_c7_51c4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l149_c7_51c4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c7_5adb_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c7_5adb_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l149_c46_69cb_left : unsigned(4 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l149_c46_69cb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l149_c46_69cb_return_output : unsigned(4 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l149_c34_f0ac_var_dim_0 : unsigned(2 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l149_c34_f0ac_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l149_c34_f0ac_ref_toks_0 : uint8_t_8;
 variable VAR_MUX_uxn_device_h_l149_c7_5adb_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l150_c7_d3c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l150_c7_8f36_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l150_c7_8f36_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l150_c7_8f36_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l150_c7_d3c6_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l150_c7_d3c6_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l150_c35_6ac8_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l150_c41_a3ff_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l150_c41_a3ff_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l150_c41_a3ff_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l150_c41_a3ff_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l150_c35_6ac8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l150_c35_6ac8_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l150_c7_d3c6_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l151_c18_ad01_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c18_bdeb_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_device_h_l151_c18_f132_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c18_bdeb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c18_bdeb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l151_c18_ad01_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l151_c18_ad01_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l151_c18_ad01_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_device_h_l152_c22_cb09_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l152_c22_a31a_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_device_h_l152_c22_cb09_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l152_c22_a31a_right : unsigned(7 downto 0);
 variable VAR_uint16_7_0_uxn_device_h_l152_c32_759b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l152_c22_a31a_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l153_c26_d8b6_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l153_c42_7d58_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l153_c42_7d58_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l153_c42_7d58_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l153_c26_d8b6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l153_c26_d8b6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l154_c30_70d5_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l154_c40_49fd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l154_c40_49fd_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l154_c40_49fd_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l154_c40_49fd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l154_c30_70d5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l154_c30_70d5_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_d723_var_dim_0 : unsigned(5 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_d723_return_output : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_d723_ref_toks_0 : uint2_t_48;
 variable VAR_MUX_uxn_device_h_l155_c7_56b5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l155_c7_97c5_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l155_c7_97c5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l155_c7_97c5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l155_c7_56b5_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l155_c7_56b5_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l155_c35_dc3e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l155_c35_dc3e_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l155_c35_dc3e_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l155_c41_865b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l155_c41_865b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l155_c41_865b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l155_c51_0c9e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l155_c51_0c9e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l155_c51_0c9e_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l155_c35_dc3e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l155_c7_56b5_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l156_c25_f88a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l156_c25_c7e5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l156_c25_c7e5_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l156_c25_c7e5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l156_c25_f88a_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l156_c25_f88a_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l156_c25_f88a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l157_c3_d4ba_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l157_c3_d4ba_x : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l158_c8_2472_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l158_c8_2472_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l158_c8_2472_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l158_c14_d88e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l158_c14_d88e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l158_c14_d88e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l158_c24_1145_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l158_c24_1145_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l158_c24_1145_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l158_c8_2472_return_output : unsigned(15 downto 0);
 variable VAR_uint8_0_0_uxn_device_h_l153_l154_DUPLICATE_d94f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_0cf6_uxn_device_h_l161_l110_DUPLICATE_4c96_return_output : screen_blit_result_t;
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
     VAR_BIN_OP_PLUS_uxn_device_h_l155_c51_0c9e_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l154_c40_49fd_iffalse := to_unsigned(0, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l150_c7_8f36_right := to_unsigned(0, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l156_c25_c7e5_right := to_unsigned(71, 12);
     VAR_MUX_uxn_device_h_l151_c18_ad01_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l139_c13_55a6_iftrue := to_unsigned(0, 16);
     VAR_result_u8_value_uxn_device_h_l145_c3_ae61 := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l143_c2_fe73_iftrue := VAR_result_u8_value_uxn_device_h_l145_c3_ae61;
     VAR_MUX_uxn_device_h_l150_c41_a3ff_iftrue := to_unsigned(0, 16);
     VAR_MUX_uxn_device_h_l140_c13_004d_iffalse := to_unsigned(0, 16);
     VAR_BIN_OP_EQ_uxn_device_h_l149_c7_51c4_right := to_unsigned(0, 3);
     VAR_BIN_OP_PLUS_uxn_device_h_l138_c21_6ff9_left := to_unsigned(32, 8);
     VAR_MUX_uxn_device_h_l139_c13_55a6_iffalse := to_unsigned(7, 16);
     VAR_result_is_vram_write_MUX_uxn_device_h_l143_c2_fe73_iftrue := to_unsigned(0, 1);
     VAR_result_is_blit_done_MUX_uxn_device_h_l143_c2_fe73_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l156_c25_f88a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l158_c24_1145_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l150_c41_a3ff_iffalse := to_unsigned(7, 16);
     VAR_MUX_uxn_device_h_l154_c40_49fd_iftrue := to_unsigned(16, 8);
     VAR_BIN_OP_MINUS_uxn_device_h_l131_c20_e653_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l155_c7_97c5_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l133_c6_0faa_right := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l149_c46_69cb_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l156_c25_f88a_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l140_c13_004d_iftrue := to_unsigned(7, 16);
     VAR_MUX_uxn_device_h_l151_c18_ad01_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l143_c6_3b29_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l151_c18_bdeb_right := to_unsigned(0, 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l158_c14_d88e_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l137_c6_1bb4_right := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l155_c41_865b_right := to_unsigned(1, 1);

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
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l138_c12_7011_ref_toks_0 := blending;
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_d723_ref_toks_0 := blending;
     REG_VAR_blending := blending;
     VAR_MUX_uxn_device_h_l149_c7_5adb_iffalse := c;
     VAR_c_MUX_uxn_device_h_l143_c2_fe73_iftrue := c;
     VAR_color8_uxn_device_h_l128_c2_0c89 := resize(VAR_color, 8);
     VAR_MUX_uxn_device_h_l139_c13_55a6_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l150_c41_a3ff_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l158_c8_2472_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l140_c13_004d_cond := VAR_fy;
     VAR_MUX_uxn_device_h_l155_c35_dc3e_cond := VAR_fy;
     VAR_is_in_bounds_MUX_uxn_device_h_l143_c2_fe73_iftrue := is_in_bounds;
     VAR_opaque_MUX_uxn_device_h_l137_c2_c1e2_iffalse := opaque;
     VAR_BIN_OP_EQ_uxn_device_h_l137_c6_1bb4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l156_c25_c7e5_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l131_c20_e653_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_device_h_l147_c21_379d_right := VAR_phase;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l134_c3_d595_elem_val := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_device_h_l147_c21_379d_left := VAR_ram_addr;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l134_c3_d595_ref_toks_0 := sprite_rows;
     VAR_sprite_rows_MUX_uxn_device_h_l133_c2_ee02_iffalse := sprite_rows;
     VAR_x_MUX_uxn_device_h_l137_c2_c1e2_iffalse := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l139_c7_d45a_left := VAR_x1;
     VAR_BIN_OP_PLUS_uxn_device_h_l150_c35_6ac8_left := VAR_x1;
     VAR_y_MUX_uxn_device_h_l137_c2_c1e2_iffalse := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l140_c7_1eb3_left := VAR_y1;
     VAR_BIN_OP_PLUS_uxn_device_h_l138_c21_6ff9_right := VAR_color8_uxn_device_h_l128_c2_0c89;
     VAR_BIN_OP_PLUS_uxn_device_h_l154_c30_70d5_left := VAR_color8_uxn_device_h_l128_c2_0c89;
     REG_VAR_color8 := VAR_color8_uxn_device_h_l128_c2_0c89;
     -- MUX[uxn_device_h_l150_c41_a3ff] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l150_c41_a3ff_cond <= VAR_MUX_uxn_device_h_l150_c41_a3ff_cond;
     MUX_uxn_device_h_l150_c41_a3ff_iftrue <= VAR_MUX_uxn_device_h_l150_c41_a3ff_iftrue;
     MUX_uxn_device_h_l150_c41_a3ff_iffalse <= VAR_MUX_uxn_device_h_l150_c41_a3ff_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l150_c41_a3ff_return_output := MUX_uxn_device_h_l150_c41_a3ff_return_output;

     -- MUX[uxn_device_h_l139_c13_55a6] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l139_c13_55a6_cond <= VAR_MUX_uxn_device_h_l139_c13_55a6_cond;
     MUX_uxn_device_h_l139_c13_55a6_iftrue <= VAR_MUX_uxn_device_h_l139_c13_55a6_iftrue;
     MUX_uxn_device_h_l139_c13_55a6_iffalse <= VAR_MUX_uxn_device_h_l139_c13_55a6_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l139_c13_55a6_return_output := MUX_uxn_device_h_l139_c13_55a6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l156_c25_c7e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l156_c25_c7e5_left <= VAR_BIN_OP_EQ_uxn_device_h_l156_c25_c7e5_left;
     BIN_OP_EQ_uxn_device_h_l156_c25_c7e5_right <= VAR_BIN_OP_EQ_uxn_device_h_l156_c25_c7e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l156_c25_c7e5_return_output := BIN_OP_EQ_uxn_device_h_l156_c25_c7e5_return_output;

     -- uint12_7_3[uxn_device_h_l129_c20_9f22] LATENCY=0
     VAR_uint12_7_3_uxn_device_h_l129_c20_9f22_return_output := uint12_7_3(
     VAR_phase);

     -- BIN_OP_EQ[uxn_device_h_l137_c6_1bb4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l137_c6_1bb4_left <= VAR_BIN_OP_EQ_uxn_device_h_l137_c6_1bb4_left;
     BIN_OP_EQ_uxn_device_h_l137_c6_1bb4_right <= VAR_BIN_OP_EQ_uxn_device_h_l137_c6_1bb4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l137_c6_1bb4_return_output := BIN_OP_EQ_uxn_device_h_l137_c6_1bb4_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l131_c20_e653] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l131_c20_e653_left <= VAR_BIN_OP_MINUS_uxn_device_h_l131_c20_e653_left;
     BIN_OP_MINUS_uxn_device_h_l131_c20_e653_right <= VAR_BIN_OP_MINUS_uxn_device_h_l131_c20_e653_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l131_c20_e653_return_output := BIN_OP_MINUS_uxn_device_h_l131_c20_e653_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l138_c21_6ff9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l138_c21_6ff9_left <= VAR_BIN_OP_PLUS_uxn_device_h_l138_c21_6ff9_left;
     BIN_OP_PLUS_uxn_device_h_l138_c21_6ff9_right <= VAR_BIN_OP_PLUS_uxn_device_h_l138_c21_6ff9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l138_c21_6ff9_return_output := BIN_OP_PLUS_uxn_device_h_l138_c21_6ff9_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l147_c21_379d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l147_c21_379d_left <= VAR_BIN_OP_PLUS_uxn_device_h_l147_c21_379d_left;
     BIN_OP_PLUS_uxn_device_h_l147_c21_379d_right <= VAR_BIN_OP_PLUS_uxn_device_h_l147_c21_379d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l147_c21_379d_return_output := BIN_OP_PLUS_uxn_device_h_l147_c21_379d_return_output;

     -- MUX[uxn_device_h_l140_c13_004d] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l140_c13_004d_cond <= VAR_MUX_uxn_device_h_l140_c13_004d_cond;
     MUX_uxn_device_h_l140_c13_004d_iftrue <= VAR_MUX_uxn_device_h_l140_c13_004d_iftrue;
     MUX_uxn_device_h_l140_c13_004d_iffalse <= VAR_MUX_uxn_device_h_l140_c13_004d_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l140_c13_004d_return_output := MUX_uxn_device_h_l140_c13_004d_return_output;

     -- uint12_2_0[uxn_device_h_l130_c20_89a2] LATENCY=0
     VAR_uint12_2_0_uxn_device_h_l130_c20_89a2_return_output := uint12_2_0(
     VAR_phase);

     -- Submodule level 1
     VAR_opaque_MUX_uxn_device_h_l137_c2_c1e2_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c6_1bb4_return_output;
     VAR_x_MUX_uxn_device_h_l137_c2_c1e2_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c6_1bb4_return_output;
     VAR_y_MUX_uxn_device_h_l137_c2_c1e2_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c6_1bb4_return_output;
     VAR_MUX_uxn_device_h_l156_c25_f88a_cond := VAR_BIN_OP_EQ_uxn_device_h_l156_c25_c7e5_return_output;
     VAR_phase_minus_two_uxn_device_h_l131_c2_f2c0 := VAR_BIN_OP_MINUS_uxn_device_h_l131_c20_e653_return_output;
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l138_c12_7011_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l138_c21_6ff9_return_output, 6);
     VAR_result_u16_addr_uxn_device_h_l147_c3_8348 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l147_c21_379d_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l139_c7_d45a_right := VAR_MUX_uxn_device_h_l139_c13_55a6_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l140_c7_1eb3_right := VAR_MUX_uxn_device_h_l140_c13_004d_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l150_c35_6ac8_right := VAR_MUX_uxn_device_h_l150_c41_a3ff_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l149_c7_51c4_left := VAR_uint12_2_0_uxn_device_h_l130_c20_89a2_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l150_c7_8f36_left := VAR_uint12_2_0_uxn_device_h_l130_c20_89a2_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l155_c7_97c5_left := VAR_uint12_2_0_uxn_device_h_l130_c20_89a2_return_output;
     REG_VAR_phase2_downto_0 := VAR_uint12_2_0_uxn_device_h_l130_c20_89a2_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l143_c6_3b29_left := VAR_uint12_7_3_uxn_device_h_l129_c20_9f22_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l149_c46_69cb_left := VAR_uint12_7_3_uxn_device_h_l129_c20_9f22_return_output;
     REG_VAR_phase7_downto_3 := VAR_uint12_7_3_uxn_device_h_l129_c20_9f22_return_output;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l134_c3_d595_var_dim_0 := resize(VAR_phase_minus_two_uxn_device_h_l131_c2_f2c0, 3);
     REG_VAR_phase_minus_two := VAR_phase_minus_two_uxn_device_h_l131_c2_f2c0;
     VAR_result_u16_addr_MUX_uxn_device_h_l143_c2_fe73_iftrue := VAR_result_u16_addr_uxn_device_h_l147_c3_8348;
     -- BIN_OP_PLUS[uxn_device_h_l150_c35_6ac8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l150_c35_6ac8_left <= VAR_BIN_OP_PLUS_uxn_device_h_l150_c35_6ac8_left;
     BIN_OP_PLUS_uxn_device_h_l150_c35_6ac8_right <= VAR_BIN_OP_PLUS_uxn_device_h_l150_c35_6ac8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l150_c35_6ac8_return_output := BIN_OP_PLUS_uxn_device_h_l150_c35_6ac8_return_output;

     -- BIN_OP_EQ[uxn_device_h_l155_c7_97c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l155_c7_97c5_left <= VAR_BIN_OP_EQ_uxn_device_h_l155_c7_97c5_left;
     BIN_OP_EQ_uxn_device_h_l155_c7_97c5_right <= VAR_BIN_OP_EQ_uxn_device_h_l155_c7_97c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l155_c7_97c5_return_output := BIN_OP_EQ_uxn_device_h_l155_c7_97c5_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l149_c46_69cb] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l149_c46_69cb_left <= VAR_BIN_OP_MINUS_uxn_device_h_l149_c46_69cb_left;
     BIN_OP_MINUS_uxn_device_h_l149_c46_69cb_right <= VAR_BIN_OP_MINUS_uxn_device_h_l149_c46_69cb_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l149_c46_69cb_return_output := BIN_OP_MINUS_uxn_device_h_l149_c46_69cb_return_output;

     -- VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8[uxn_device_h_l134_c3_d595] LATENCY=0
     -- Inputs
     VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l134_c3_d595_elem_val <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l134_c3_d595_elem_val;
     VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l134_c3_d595_ref_toks_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l134_c3_d595_ref_toks_0;
     VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l134_c3_d595_var_dim_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l134_c3_d595_var_dim_0;
     -- Outputs
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l134_c3_d595_return_output := VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l134_c3_d595_return_output;

     -- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l138_c12_7011] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l138_c12_7011_ref_toks_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l138_c12_7011_ref_toks_0;
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l138_c12_7011_var_dim_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l138_c12_7011_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l138_c12_7011_return_output := VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l138_c12_7011_return_output;

     -- BIN_OP_EQ[uxn_device_h_l150_c7_8f36] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l150_c7_8f36_left <= VAR_BIN_OP_EQ_uxn_device_h_l150_c7_8f36_left;
     BIN_OP_EQ_uxn_device_h_l150_c7_8f36_right <= VAR_BIN_OP_EQ_uxn_device_h_l150_c7_8f36_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l150_c7_8f36_return_output := BIN_OP_EQ_uxn_device_h_l150_c7_8f36_return_output;

     -- BIN_OP_EQ[uxn_device_h_l143_c6_3b29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l143_c6_3b29_left <= VAR_BIN_OP_EQ_uxn_device_h_l143_c6_3b29_left;
     BIN_OP_EQ_uxn_device_h_l143_c6_3b29_right <= VAR_BIN_OP_EQ_uxn_device_h_l143_c6_3b29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l143_c6_3b29_return_output := BIN_OP_EQ_uxn_device_h_l143_c6_3b29_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l140_c7_1eb3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l140_c7_1eb3_left <= VAR_BIN_OP_PLUS_uxn_device_h_l140_c7_1eb3_left;
     BIN_OP_PLUS_uxn_device_h_l140_c7_1eb3_right <= VAR_BIN_OP_PLUS_uxn_device_h_l140_c7_1eb3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l140_c7_1eb3_return_output := BIN_OP_PLUS_uxn_device_h_l140_c7_1eb3_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l139_c7_d45a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l139_c7_d45a_left <= VAR_BIN_OP_PLUS_uxn_device_h_l139_c7_d45a_left;
     BIN_OP_PLUS_uxn_device_h_l139_c7_d45a_right <= VAR_BIN_OP_PLUS_uxn_device_h_l139_c7_d45a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l139_c7_d45a_return_output := BIN_OP_PLUS_uxn_device_h_l139_c7_d45a_return_output;

     -- MUX[uxn_device_h_l156_c25_f88a] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l156_c25_f88a_cond <= VAR_MUX_uxn_device_h_l156_c25_f88a_cond;
     MUX_uxn_device_h_l156_c25_f88a_iftrue <= VAR_MUX_uxn_device_h_l156_c25_f88a_iftrue;
     MUX_uxn_device_h_l156_c25_f88a_iffalse <= VAR_MUX_uxn_device_h_l156_c25_f88a_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l156_c25_f88a_return_output := MUX_uxn_device_h_l156_c25_f88a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l149_c7_51c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l149_c7_51c4_left <= VAR_BIN_OP_EQ_uxn_device_h_l149_c7_51c4_left;
     BIN_OP_EQ_uxn_device_h_l149_c7_51c4_right <= VAR_BIN_OP_EQ_uxn_device_h_l149_c7_51c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l149_c7_51c4_return_output := BIN_OP_EQ_uxn_device_h_l149_c7_51c4_return_output;

     -- uint12_7_3[uxn_device_h_l133_c6_6c3e] LATENCY=0
     VAR_uint12_7_3_uxn_device_h_l133_c6_6c3e_return_output := uint12_7_3(
     VAR_phase_minus_two_uxn_device_h_l131_c2_f2c0);

     -- Submodule level 2
     VAR_c_MUX_uxn_device_h_l143_c2_fe73_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c6_3b29_return_output;
     VAR_is_in_bounds_MUX_uxn_device_h_l143_c2_fe73_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c6_3b29_return_output;
     VAR_result_is_blit_done_MUX_uxn_device_h_l143_c2_fe73_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c6_3b29_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l143_c2_fe73_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c6_3b29_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l143_c2_fe73_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c6_3b29_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l143_c2_fe73_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c6_3b29_return_output;
     VAR_x_MUX_uxn_device_h_l143_c2_fe73_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c6_3b29_return_output;
     VAR_y_MUX_uxn_device_h_l143_c2_fe73_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c6_3b29_return_output;
     VAR_MUX_uxn_device_h_l149_c7_5adb_cond := VAR_BIN_OP_EQ_uxn_device_h_l149_c7_51c4_return_output;
     VAR_MUX_uxn_device_h_l150_c7_d3c6_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c7_8f36_return_output;
     VAR_MUX_uxn_device_h_l155_c7_56b5_cond := VAR_BIN_OP_EQ_uxn_device_h_l155_c7_97c5_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l149_c34_f0ac_var_dim_0 := resize(VAR_BIN_OP_MINUS_uxn_device_h_l149_c46_69cb_return_output, 3);
     VAR_x_uxn_device_h_l139_c3_792f := resize(VAR_BIN_OP_PLUS_uxn_device_h_l139_c7_d45a_return_output, 16);
     VAR_y_uxn_device_h_l140_c3_6f54 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l140_c7_1eb3_return_output, 16);
     VAR_MUX_uxn_device_h_l150_c7_d3c6_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l150_c35_6ac8_return_output, 16);
     VAR_result_is_blit_done_MUX_uxn_device_h_l143_c2_fe73_iffalse := VAR_MUX_uxn_device_h_l156_c25_f88a_return_output;
     VAR_opaque_uxn_device_h_l138_c3_e3ad := resize(VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l138_c12_7011_return_output, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l133_c6_0faa_left := VAR_uint12_7_3_uxn_device_h_l133_c6_6c3e_return_output;
     VAR_opaque_MUX_uxn_device_h_l137_c2_c1e2_iftrue := VAR_opaque_uxn_device_h_l138_c3_e3ad;
     VAR_x_MUX_uxn_device_h_l137_c2_c1e2_iftrue := VAR_x_uxn_device_h_l139_c3_792f;
     VAR_y_MUX_uxn_device_h_l137_c2_c1e2_iftrue := VAR_y_uxn_device_h_l140_c3_6f54;
     -- opaque_MUX[uxn_device_h_l137_c2_c1e2] LATENCY=0
     -- Inputs
     opaque_MUX_uxn_device_h_l137_c2_c1e2_cond <= VAR_opaque_MUX_uxn_device_h_l137_c2_c1e2_cond;
     opaque_MUX_uxn_device_h_l137_c2_c1e2_iftrue <= VAR_opaque_MUX_uxn_device_h_l137_c2_c1e2_iftrue;
     opaque_MUX_uxn_device_h_l137_c2_c1e2_iffalse <= VAR_opaque_MUX_uxn_device_h_l137_c2_c1e2_iffalse;
     -- Outputs
     VAR_opaque_MUX_uxn_device_h_l137_c2_c1e2_return_output := opaque_MUX_uxn_device_h_l137_c2_c1e2_return_output;

     -- sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5[uxn_device_h_l133_c2_ee02] LATENCY=0
     VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5_uxn_device_h_l133_c2_ee02_return_output := CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5(
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l134_c3_d595_return_output);

     -- x_MUX[uxn_device_h_l137_c2_c1e2] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l137_c2_c1e2_cond <= VAR_x_MUX_uxn_device_h_l137_c2_c1e2_cond;
     x_MUX_uxn_device_h_l137_c2_c1e2_iftrue <= VAR_x_MUX_uxn_device_h_l137_c2_c1e2_iftrue;
     x_MUX_uxn_device_h_l137_c2_c1e2_iffalse <= VAR_x_MUX_uxn_device_h_l137_c2_c1e2_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l137_c2_c1e2_return_output := x_MUX_uxn_device_h_l137_c2_c1e2_return_output;

     -- y_MUX[uxn_device_h_l137_c2_c1e2] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l137_c2_c1e2_cond <= VAR_y_MUX_uxn_device_h_l137_c2_c1e2_cond;
     y_MUX_uxn_device_h_l137_c2_c1e2_iftrue <= VAR_y_MUX_uxn_device_h_l137_c2_c1e2_iftrue;
     y_MUX_uxn_device_h_l137_c2_c1e2_iffalse <= VAR_y_MUX_uxn_device_h_l137_c2_c1e2_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l137_c2_c1e2_return_output := y_MUX_uxn_device_h_l137_c2_c1e2_return_output;

     -- BIN_OP_EQ[uxn_device_h_l133_c6_0faa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l133_c6_0faa_left <= VAR_BIN_OP_EQ_uxn_device_h_l133_c6_0faa_left;
     BIN_OP_EQ_uxn_device_h_l133_c6_0faa_right <= VAR_BIN_OP_EQ_uxn_device_h_l133_c6_0faa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l133_c6_0faa_return_output := BIN_OP_EQ_uxn_device_h_l133_c6_0faa_return_output;

     -- result_is_blit_done_MUX[uxn_device_h_l143_c2_fe73] LATENCY=0
     -- Inputs
     result_is_blit_done_MUX_uxn_device_h_l143_c2_fe73_cond <= VAR_result_is_blit_done_MUX_uxn_device_h_l143_c2_fe73_cond;
     result_is_blit_done_MUX_uxn_device_h_l143_c2_fe73_iftrue <= VAR_result_is_blit_done_MUX_uxn_device_h_l143_c2_fe73_iftrue;
     result_is_blit_done_MUX_uxn_device_h_l143_c2_fe73_iffalse <= VAR_result_is_blit_done_MUX_uxn_device_h_l143_c2_fe73_iffalse;
     -- Outputs
     VAR_result_is_blit_done_MUX_uxn_device_h_l143_c2_fe73_return_output := result_is_blit_done_MUX_uxn_device_h_l143_c2_fe73_return_output;

     -- Submodule level 3
     VAR_sprite_rows_MUX_uxn_device_h_l133_c2_ee02_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c6_0faa_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l153_c42_7d58_left := VAR_opaque_MUX_uxn_device_h_l137_c2_c1e2_return_output;
     REG_VAR_opaque := VAR_opaque_MUX_uxn_device_h_l137_c2_c1e2_return_output;
     VAR_sprite_rows_MUX_uxn_device_h_l133_c2_ee02_iftrue := VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5_uxn_device_h_l133_c2_ee02_return_output;
     VAR_MUX_uxn_device_h_l150_c7_d3c6_iffalse := VAR_x_MUX_uxn_device_h_l137_c2_c1e2_return_output;
     VAR_x_MUX_uxn_device_h_l143_c2_fe73_iftrue := VAR_x_MUX_uxn_device_h_l137_c2_c1e2_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l155_c41_865b_left := VAR_y_MUX_uxn_device_h_l137_c2_c1e2_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l155_c51_0c9e_left := VAR_y_MUX_uxn_device_h_l137_c2_c1e2_return_output;
     VAR_CONST_SL_8_uxn_device_h_l152_c22_cb09_x := VAR_y_MUX_uxn_device_h_l137_c2_c1e2_return_output;
     VAR_MUX_uxn_device_h_l155_c7_56b5_iffalse := VAR_y_MUX_uxn_device_h_l137_c2_c1e2_return_output;
     VAR_y_MUX_uxn_device_h_l143_c2_fe73_iftrue := VAR_y_MUX_uxn_device_h_l137_c2_c1e2_return_output;
     -- BIN_OP_MINUS[uxn_device_h_l155_c41_865b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l155_c41_865b_left <= VAR_BIN_OP_MINUS_uxn_device_h_l155_c41_865b_left;
     BIN_OP_MINUS_uxn_device_h_l155_c41_865b_right <= VAR_BIN_OP_MINUS_uxn_device_h_l155_c41_865b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l155_c41_865b_return_output := BIN_OP_MINUS_uxn_device_h_l155_c41_865b_return_output;

     -- CONST_SL_8[uxn_device_h_l152_c22_cb09] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_device_h_l152_c22_cb09_x <= VAR_CONST_SL_8_uxn_device_h_l152_c22_cb09_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_device_h_l152_c22_cb09_return_output := CONST_SL_8_uxn_device_h_l152_c22_cb09_return_output;

     -- sprite_rows_MUX[uxn_device_h_l133_c2_ee02] LATENCY=0
     -- Inputs
     sprite_rows_MUX_uxn_device_h_l133_c2_ee02_cond <= VAR_sprite_rows_MUX_uxn_device_h_l133_c2_ee02_cond;
     sprite_rows_MUX_uxn_device_h_l133_c2_ee02_iftrue <= VAR_sprite_rows_MUX_uxn_device_h_l133_c2_ee02_iftrue;
     sprite_rows_MUX_uxn_device_h_l133_c2_ee02_iffalse <= VAR_sprite_rows_MUX_uxn_device_h_l133_c2_ee02_iffalse;
     -- Outputs
     VAR_sprite_rows_MUX_uxn_device_h_l133_c2_ee02_return_output := sprite_rows_MUX_uxn_device_h_l133_c2_ee02_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l155_c51_0c9e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l155_c51_0c9e_left <= VAR_BIN_OP_PLUS_uxn_device_h_l155_c51_0c9e_left;
     BIN_OP_PLUS_uxn_device_h_l155_c51_0c9e_right <= VAR_BIN_OP_PLUS_uxn_device_h_l155_c51_0c9e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l155_c51_0c9e_return_output := BIN_OP_PLUS_uxn_device_h_l155_c51_0c9e_return_output;

     -- MUX[uxn_device_h_l150_c7_d3c6] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l150_c7_d3c6_cond <= VAR_MUX_uxn_device_h_l150_c7_d3c6_cond;
     MUX_uxn_device_h_l150_c7_d3c6_iftrue <= VAR_MUX_uxn_device_h_l150_c7_d3c6_iftrue;
     MUX_uxn_device_h_l150_c7_d3c6_iffalse <= VAR_MUX_uxn_device_h_l150_c7_d3c6_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l150_c7_d3c6_return_output := MUX_uxn_device_h_l150_c7_d3c6_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l155_c35_dc3e_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l155_c41_865b_return_output;
     VAR_MUX_uxn_device_h_l155_c35_dc3e_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l155_c51_0c9e_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l152_c22_a31a_left := VAR_CONST_SL_8_uxn_device_h_l152_c22_cb09_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l158_c24_1145_left := VAR_MUX_uxn_device_h_l150_c7_d3c6_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l158_c14_d88e_left := VAR_MUX_uxn_device_h_l150_c7_d3c6_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l149_c34_f0ac_ref_toks_0 := VAR_sprite_rows_MUX_uxn_device_h_l133_c2_ee02_return_output;
     REG_VAR_sprite_rows := VAR_sprite_rows_MUX_uxn_device_h_l133_c2_ee02_return_output;
     -- BIN_OP_PLUS[uxn_device_h_l158_c14_d88e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l158_c14_d88e_left <= VAR_BIN_OP_PLUS_uxn_device_h_l158_c14_d88e_left;
     BIN_OP_PLUS_uxn_device_h_l158_c14_d88e_right <= VAR_BIN_OP_PLUS_uxn_device_h_l158_c14_d88e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l158_c14_d88e_return_output := BIN_OP_PLUS_uxn_device_h_l158_c14_d88e_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l158_c24_1145] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l158_c24_1145_left <= VAR_BIN_OP_MINUS_uxn_device_h_l158_c24_1145_left;
     BIN_OP_MINUS_uxn_device_h_l158_c24_1145_right <= VAR_BIN_OP_MINUS_uxn_device_h_l158_c24_1145_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l158_c24_1145_return_output := BIN_OP_MINUS_uxn_device_h_l158_c24_1145_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d[uxn_device_h_l149_c34_f0ac] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l149_c34_f0ac_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l149_c34_f0ac_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l149_c34_f0ac_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l149_c34_f0ac_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l149_c34_f0ac_return_output := VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l149_c34_f0ac_return_output;

     -- uint16_15_8[uxn_device_h_l151_c18_f132] LATENCY=0
     VAR_uint16_15_8_uxn_device_h_l151_c18_f132_return_output := uint16_15_8(
     VAR_MUX_uxn_device_h_l150_c7_d3c6_return_output);

     -- MUX[uxn_device_h_l155_c35_dc3e] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l155_c35_dc3e_cond <= VAR_MUX_uxn_device_h_l155_c35_dc3e_cond;
     MUX_uxn_device_h_l155_c35_dc3e_iftrue <= VAR_MUX_uxn_device_h_l155_c35_dc3e_iftrue;
     MUX_uxn_device_h_l155_c35_dc3e_iffalse <= VAR_MUX_uxn_device_h_l155_c35_dc3e_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l155_c35_dc3e_return_output := MUX_uxn_device_h_l155_c35_dc3e_return_output;

     -- uint16_7_0[uxn_device_h_l152_c32_759b] LATENCY=0
     VAR_uint16_7_0_uxn_device_h_l152_c32_759b_return_output := uint16_7_0(
     VAR_MUX_uxn_device_h_l150_c7_d3c6_return_output);

     -- Submodule level 5
     VAR_MUX_uxn_device_h_l158_c8_2472_iffalse := VAR_BIN_OP_MINUS_uxn_device_h_l158_c24_1145_return_output;
     VAR_MUX_uxn_device_h_l158_c8_2472_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l158_c14_d88e_return_output, 16);
     VAR_MUX_uxn_device_h_l155_c7_56b5_iftrue := VAR_MUX_uxn_device_h_l155_c35_dc3e_return_output;
     VAR_MUX_uxn_device_h_l149_c7_5adb_iftrue := VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l149_c34_f0ac_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l151_c18_bdeb_left := VAR_uint16_15_8_uxn_device_h_l151_c18_f132_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l152_c22_a31a_right := VAR_uint16_7_0_uxn_device_h_l152_c32_759b_return_output;
     -- BIN_OP_PLUS[uxn_device_h_l152_c22_a31a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l152_c22_a31a_left <= VAR_BIN_OP_PLUS_uxn_device_h_l152_c22_a31a_left;
     BIN_OP_PLUS_uxn_device_h_l152_c22_a31a_right <= VAR_BIN_OP_PLUS_uxn_device_h_l152_c22_a31a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l152_c22_a31a_return_output := BIN_OP_PLUS_uxn_device_h_l152_c22_a31a_return_output;

     -- MUX[uxn_device_h_l149_c7_5adb] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l149_c7_5adb_cond <= VAR_MUX_uxn_device_h_l149_c7_5adb_cond;
     MUX_uxn_device_h_l149_c7_5adb_iftrue <= VAR_MUX_uxn_device_h_l149_c7_5adb_iftrue;
     MUX_uxn_device_h_l149_c7_5adb_iffalse <= VAR_MUX_uxn_device_h_l149_c7_5adb_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l149_c7_5adb_return_output := MUX_uxn_device_h_l149_c7_5adb_return_output;

     -- MUX[uxn_device_h_l155_c7_56b5] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l155_c7_56b5_cond <= VAR_MUX_uxn_device_h_l155_c7_56b5_cond;
     MUX_uxn_device_h_l155_c7_56b5_iftrue <= VAR_MUX_uxn_device_h_l155_c7_56b5_iftrue;
     MUX_uxn_device_h_l155_c7_56b5_iffalse <= VAR_MUX_uxn_device_h_l155_c7_56b5_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l155_c7_56b5_return_output := MUX_uxn_device_h_l155_c7_56b5_return_output;

     -- MUX[uxn_device_h_l158_c8_2472] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l158_c8_2472_cond <= VAR_MUX_uxn_device_h_l158_c8_2472_cond;
     MUX_uxn_device_h_l158_c8_2472_iftrue <= VAR_MUX_uxn_device_h_l158_c8_2472_iftrue;
     MUX_uxn_device_h_l158_c8_2472_iffalse <= VAR_MUX_uxn_device_h_l158_c8_2472_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l158_c8_2472_return_output := MUX_uxn_device_h_l158_c8_2472_return_output;

     -- BIN_OP_EQ[uxn_device_h_l151_c18_bdeb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l151_c18_bdeb_left <= VAR_BIN_OP_EQ_uxn_device_h_l151_c18_bdeb_left;
     BIN_OP_EQ_uxn_device_h_l151_c18_bdeb_right <= VAR_BIN_OP_EQ_uxn_device_h_l151_c18_bdeb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l151_c18_bdeb_return_output := BIN_OP_EQ_uxn_device_h_l151_c18_bdeb_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_device_h_l151_c18_ad01_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c18_bdeb_return_output;
     VAR_result_u16_addr_uxn_device_h_l152_c3_9654 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l152_c22_a31a_return_output, 16);
     VAR_CONST_SR_1_uxn_device_h_l157_c3_d4ba_x := VAR_MUX_uxn_device_h_l149_c7_5adb_return_output;
     VAR_y_MUX_uxn_device_h_l143_c2_fe73_iffalse := VAR_MUX_uxn_device_h_l155_c7_56b5_return_output;
     VAR_x_MUX_uxn_device_h_l143_c2_fe73_iffalse := VAR_MUX_uxn_device_h_l158_c8_2472_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l143_c2_fe73_iffalse := VAR_result_u16_addr_uxn_device_h_l152_c3_9654;
     -- CONST_SR_1[uxn_device_h_l157_c3_d4ba] LATENCY=0
     -- Inputs
     CONST_SR_1_uxn_device_h_l157_c3_d4ba_x <= VAR_CONST_SR_1_uxn_device_h_l157_c3_d4ba_x;
     -- Outputs
     VAR_CONST_SR_1_uxn_device_h_l157_c3_d4ba_return_output := CONST_SR_1_uxn_device_h_l157_c3_d4ba_return_output;

     -- y_MUX[uxn_device_h_l143_c2_fe73] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l143_c2_fe73_cond <= VAR_y_MUX_uxn_device_h_l143_c2_fe73_cond;
     y_MUX_uxn_device_h_l143_c2_fe73_iftrue <= VAR_y_MUX_uxn_device_h_l143_c2_fe73_iftrue;
     y_MUX_uxn_device_h_l143_c2_fe73_iffalse <= VAR_y_MUX_uxn_device_h_l143_c2_fe73_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l143_c2_fe73_return_output := y_MUX_uxn_device_h_l143_c2_fe73_return_output;

     -- uint8_0_0_uxn_device_h_l153_l154_DUPLICATE_d94f LATENCY=0
     VAR_uint8_0_0_uxn_device_h_l153_l154_DUPLICATE_d94f_return_output := uint8_0_0(
     VAR_MUX_uxn_device_h_l149_c7_5adb_return_output);

     -- x_MUX[uxn_device_h_l143_c2_fe73] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l143_c2_fe73_cond <= VAR_x_MUX_uxn_device_h_l143_c2_fe73_cond;
     x_MUX_uxn_device_h_l143_c2_fe73_iftrue <= VAR_x_MUX_uxn_device_h_l143_c2_fe73_iftrue;
     x_MUX_uxn_device_h_l143_c2_fe73_iffalse <= VAR_x_MUX_uxn_device_h_l143_c2_fe73_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l143_c2_fe73_return_output := x_MUX_uxn_device_h_l143_c2_fe73_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l143_c2_fe73] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l143_c2_fe73_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l143_c2_fe73_cond;
     result_u16_addr_MUX_uxn_device_h_l143_c2_fe73_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l143_c2_fe73_iftrue;
     result_u16_addr_MUX_uxn_device_h_l143_c2_fe73_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l143_c2_fe73_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l143_c2_fe73_return_output := result_u16_addr_MUX_uxn_device_h_l143_c2_fe73_return_output;

     -- MUX[uxn_device_h_l151_c18_ad01] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l151_c18_ad01_cond <= VAR_MUX_uxn_device_h_l151_c18_ad01_cond;
     MUX_uxn_device_h_l151_c18_ad01_iftrue <= VAR_MUX_uxn_device_h_l151_c18_ad01_iftrue;
     MUX_uxn_device_h_l151_c18_ad01_iffalse <= VAR_MUX_uxn_device_h_l151_c18_ad01_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l151_c18_ad01_return_output := MUX_uxn_device_h_l151_c18_ad01_return_output;

     -- Submodule level 7
     VAR_c_MUX_uxn_device_h_l143_c2_fe73_iffalse := VAR_CONST_SR_1_uxn_device_h_l157_c3_d4ba_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l153_c26_d8b6_left := VAR_MUX_uxn_device_h_l151_c18_ad01_return_output;
     VAR_is_in_bounds_MUX_uxn_device_h_l143_c2_fe73_iffalse := VAR_MUX_uxn_device_h_l151_c18_ad01_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l153_c42_7d58_right := VAR_uint8_0_0_uxn_device_h_l153_l154_DUPLICATE_d94f_return_output;
     VAR_MUX_uxn_device_h_l154_c40_49fd_cond := VAR_uint8_0_0_uxn_device_h_l153_l154_DUPLICATE_d94f_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l143_c2_fe73_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l143_c2_fe73_return_output;
     -- MUX[uxn_device_h_l154_c40_49fd] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l154_c40_49fd_cond <= VAR_MUX_uxn_device_h_l154_c40_49fd_cond;
     MUX_uxn_device_h_l154_c40_49fd_iftrue <= VAR_MUX_uxn_device_h_l154_c40_49fd_iftrue;
     MUX_uxn_device_h_l154_c40_49fd_iffalse <= VAR_MUX_uxn_device_h_l154_c40_49fd_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l154_c40_49fd_return_output := MUX_uxn_device_h_l154_c40_49fd_return_output;

     -- BIN_OP_OR[uxn_device_h_l153_c42_7d58] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l153_c42_7d58_left <= VAR_BIN_OP_OR_uxn_device_h_l153_c42_7d58_left;
     BIN_OP_OR_uxn_device_h_l153_c42_7d58_right <= VAR_BIN_OP_OR_uxn_device_h_l153_c42_7d58_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l153_c42_7d58_return_output := BIN_OP_OR_uxn_device_h_l153_c42_7d58_return_output;

     -- c_MUX[uxn_device_h_l143_c2_fe73] LATENCY=0
     -- Inputs
     c_MUX_uxn_device_h_l143_c2_fe73_cond <= VAR_c_MUX_uxn_device_h_l143_c2_fe73_cond;
     c_MUX_uxn_device_h_l143_c2_fe73_iftrue <= VAR_c_MUX_uxn_device_h_l143_c2_fe73_iftrue;
     c_MUX_uxn_device_h_l143_c2_fe73_iffalse <= VAR_c_MUX_uxn_device_h_l143_c2_fe73_iffalse;
     -- Outputs
     VAR_c_MUX_uxn_device_h_l143_c2_fe73_return_output := c_MUX_uxn_device_h_l143_c2_fe73_return_output;

     -- is_in_bounds_MUX[uxn_device_h_l143_c2_fe73] LATENCY=0
     -- Inputs
     is_in_bounds_MUX_uxn_device_h_l143_c2_fe73_cond <= VAR_is_in_bounds_MUX_uxn_device_h_l143_c2_fe73_cond;
     is_in_bounds_MUX_uxn_device_h_l143_c2_fe73_iftrue <= VAR_is_in_bounds_MUX_uxn_device_h_l143_c2_fe73_iftrue;
     is_in_bounds_MUX_uxn_device_h_l143_c2_fe73_iffalse <= VAR_is_in_bounds_MUX_uxn_device_h_l143_c2_fe73_iffalse;
     -- Outputs
     VAR_is_in_bounds_MUX_uxn_device_h_l143_c2_fe73_return_output := is_in_bounds_MUX_uxn_device_h_l143_c2_fe73_return_output;

     -- Submodule level 8
     VAR_BIN_OP_AND_uxn_device_h_l153_c26_d8b6_right := VAR_BIN_OP_OR_uxn_device_h_l153_c42_7d58_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l154_c30_70d5_right := VAR_MUX_uxn_device_h_l154_c40_49fd_return_output;
     REG_VAR_c := VAR_c_MUX_uxn_device_h_l143_c2_fe73_return_output;
     REG_VAR_is_in_bounds := VAR_is_in_bounds_MUX_uxn_device_h_l143_c2_fe73_return_output;
     -- BIN_OP_AND[uxn_device_h_l153_c26_d8b6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l153_c26_d8b6_left <= VAR_BIN_OP_AND_uxn_device_h_l153_c26_d8b6_left;
     BIN_OP_AND_uxn_device_h_l153_c26_d8b6_right <= VAR_BIN_OP_AND_uxn_device_h_l153_c26_d8b6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l153_c26_d8b6_return_output := BIN_OP_AND_uxn_device_h_l153_c26_d8b6_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l154_c30_70d5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l154_c30_70d5_left <= VAR_BIN_OP_PLUS_uxn_device_h_l154_c30_70d5_left;
     BIN_OP_PLUS_uxn_device_h_l154_c30_70d5_right <= VAR_BIN_OP_PLUS_uxn_device_h_l154_c30_70d5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l154_c30_70d5_return_output := BIN_OP_PLUS_uxn_device_h_l154_c30_70d5_return_output;

     -- Submodule level 9
     VAR_result_is_vram_write_MUX_uxn_device_h_l143_c2_fe73_iffalse := VAR_BIN_OP_AND_uxn_device_h_l153_c26_d8b6_return_output;
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_d723_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l154_c30_70d5_return_output, 6);
     -- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l154_c21_d723] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_d723_ref_toks_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_d723_ref_toks_0;
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_d723_var_dim_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_d723_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_d723_return_output := VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_d723_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l143_c2_fe73] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l143_c2_fe73_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l143_c2_fe73_cond;
     result_is_vram_write_MUX_uxn_device_h_l143_c2_fe73_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l143_c2_fe73_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l143_c2_fe73_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l143_c2_fe73_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l143_c2_fe73_return_output := result_is_vram_write_MUX_uxn_device_h_l143_c2_fe73_return_output;

     -- Submodule level 10
     VAR_result_u8_value_uxn_device_h_l154_c3_1832 := resize(VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_d723_return_output, 8);
     VAR_result_u8_value_MUX_uxn_device_h_l143_c2_fe73_iffalse := VAR_result_u8_value_uxn_device_h_l154_c3_1832;
     -- result_u8_value_MUX[uxn_device_h_l143_c2_fe73] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l143_c2_fe73_cond <= VAR_result_u8_value_MUX_uxn_device_h_l143_c2_fe73_cond;
     result_u8_value_MUX_uxn_device_h_l143_c2_fe73_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l143_c2_fe73_iftrue;
     result_u8_value_MUX_uxn_device_h_l143_c2_fe73_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l143_c2_fe73_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l143_c2_fe73_return_output := result_u8_value_MUX_uxn_device_h_l143_c2_fe73_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_0cf6_uxn_device_h_l161_l110_DUPLICATE_4c96 LATENCY=0
     VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_0cf6_uxn_device_h_l161_l110_DUPLICATE_4c96_return_output := CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_0cf6(
     result,
     VAR_result_is_vram_write_MUX_uxn_device_h_l143_c2_fe73_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l143_c2_fe73_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l143_c2_fe73_return_output,
     VAR_result_is_blit_done_MUX_uxn_device_h_l143_c2_fe73_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_0cf6_uxn_device_h_l161_l110_DUPLICATE_4c96_return_output;
     VAR_return_output := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_0cf6_uxn_device_h_l161_l110_DUPLICATE_4c96_return_output;
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
