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
-- BIN_OP_MINUS[uxn_device_h_l130_c20_99e5]
signal BIN_OP_MINUS_uxn_device_h_l130_c20_99e5_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l130_c20_99e5_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l130_c20_99e5_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l132_c6_e258]
signal BIN_OP_EQ_uxn_device_h_l132_c6_e258_left : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l132_c6_e258_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l132_c6_e258_return_output : unsigned(0 downto 0);

-- sprite_rows_MUX[uxn_device_h_l132_c2_edb2]
signal sprite_rows_MUX_uxn_device_h_l132_c2_edb2_cond : unsigned(0 downto 0);
signal sprite_rows_MUX_uxn_device_h_l132_c2_edb2_iftrue : uint8_t_8;
signal sprite_rows_MUX_uxn_device_h_l132_c2_edb2_iffalse : uint8_t_8;
signal sprite_rows_MUX_uxn_device_h_l132_c2_edb2_return_output : uint8_t_8;

-- VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8[uxn_device_h_l133_c3_b824]
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_b824_elem_val : unsigned(7 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_b824_ref_toks_0 : uint8_t_8;
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_b824_var_dim_0 : unsigned(2 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_b824_return_output : uint8_t_array_8_t;

-- BIN_OP_EQ[uxn_device_h_l136_c6_a287]
signal BIN_OP_EQ_uxn_device_h_l136_c6_a287_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c6_a287_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l136_c6_a287_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l136_c2_ddb0]
signal y_MUX_uxn_device_h_l136_c2_ddb0_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l136_c2_ddb0_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l136_c2_ddb0_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l136_c2_ddb0_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l136_c2_ddb0]
signal x_MUX_uxn_device_h_l136_c2_ddb0_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l136_c2_ddb0_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l136_c2_ddb0_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l136_c2_ddb0_return_output : unsigned(15 downto 0);

-- opaque_MUX[uxn_device_h_l136_c2_ddb0]
signal opaque_MUX_uxn_device_h_l136_c2_ddb0_cond : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l136_c2_ddb0_iftrue : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l136_c2_ddb0_iffalse : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l136_c2_ddb0_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l137_c21_8a11]
signal BIN_OP_PLUS_uxn_device_h_l137_c21_8a11_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l137_c21_8a11_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l137_c21_8a11_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l137_c12_1d9e]
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_1d9e_ref_toks_0 : uint2_t_48;
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_1d9e_var_dim_0 : unsigned(5 downto 0);
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_1d9e_return_output : unsigned(1 downto 0);

-- MUX[uxn_device_h_l138_c13_3178]
signal MUX_uxn_device_h_l138_c13_3178_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l138_c13_3178_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l138_c13_3178_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l138_c13_3178_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l138_c7_a99e]
signal BIN_OP_PLUS_uxn_device_h_l138_c7_a99e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l138_c7_a99e_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l138_c7_a99e_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l139_c13_f52f]
signal MUX_uxn_device_h_l139_c13_f52f_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l139_c13_f52f_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l139_c13_f52f_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l139_c13_f52f_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l139_c7_2fde]
signal BIN_OP_PLUS_uxn_device_h_l139_c7_2fde_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l139_c7_2fde_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l139_c7_2fde_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l142_c6_19b4]
signal BIN_OP_EQ_uxn_device_h_l142_c6_19b4_left : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l142_c6_19b4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l142_c6_19b4_return_output : unsigned(0 downto 0);

-- is_in_bounds_MUX[uxn_device_h_l142_c2_9c93]
signal is_in_bounds_MUX_uxn_device_h_l142_c2_9c93_cond : unsigned(0 downto 0);
signal is_in_bounds_MUX_uxn_device_h_l142_c2_9c93_iftrue : unsigned(0 downto 0);
signal is_in_bounds_MUX_uxn_device_h_l142_c2_9c93_iffalse : unsigned(0 downto 0);
signal is_in_bounds_MUX_uxn_device_h_l142_c2_9c93_return_output : unsigned(0 downto 0);

-- c_MUX[uxn_device_h_l142_c2_9c93]
signal c_MUX_uxn_device_h_l142_c2_9c93_cond : unsigned(0 downto 0);
signal c_MUX_uxn_device_h_l142_c2_9c93_iftrue : unsigned(7 downto 0);
signal c_MUX_uxn_device_h_l142_c2_9c93_iffalse : unsigned(7 downto 0);
signal c_MUX_uxn_device_h_l142_c2_9c93_return_output : unsigned(7 downto 0);

-- result_is_blit_done_MUX[uxn_device_h_l142_c2_9c93]
signal result_is_blit_done_MUX_uxn_device_h_l142_c2_9c93_cond : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l142_c2_9c93_iftrue : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l142_c2_9c93_iffalse : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l142_c2_9c93_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l142_c2_9c93]
signal result_u8_value_MUX_uxn_device_h_l142_c2_9c93_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l142_c2_9c93_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l142_c2_9c93_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l142_c2_9c93_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l142_c2_9c93]
signal result_is_vram_write_MUX_uxn_device_h_l142_c2_9c93_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l142_c2_9c93_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l142_c2_9c93_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l142_c2_9c93_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l142_c2_9c93]
signal result_u16_addr_MUX_uxn_device_h_l142_c2_9c93_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l142_c2_9c93_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l142_c2_9c93_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l142_c2_9c93_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l142_c2_9c93]
signal y_MUX_uxn_device_h_l142_c2_9c93_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l142_c2_9c93_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l142_c2_9c93_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l142_c2_9c93_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l142_c2_9c93]
signal x_MUX_uxn_device_h_l142_c2_9c93_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l142_c2_9c93_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l142_c2_9c93_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l142_c2_9c93_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l146_c21_a134]
signal BIN_OP_PLUS_uxn_device_h_l146_c21_a134_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l146_c21_a134_right : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l146_c21_a134_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l148_c7_d9ed]
signal BIN_OP_EQ_uxn_device_h_l148_c7_d9ed_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l148_c7_d9ed_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l148_c7_d9ed_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l148_c46_869f]
signal BIN_OP_MINUS_uxn_device_h_l148_c46_869f_left : unsigned(4 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l148_c46_869f_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l148_c46_869f_return_output : unsigned(4 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d[uxn_device_h_l148_c34_5c5c]
signal VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_5c5c_ref_toks_0 : uint8_t_8;
signal VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_5c5c_var_dim_0 : unsigned(2 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_5c5c_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l148_c7_aff9]
signal MUX_uxn_device_h_l148_c7_aff9_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l148_c7_aff9_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l148_c7_aff9_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l148_c7_aff9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l149_c7_a69c]
signal BIN_OP_EQ_uxn_device_h_l149_c7_a69c_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l149_c7_a69c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l149_c7_a69c_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l149_c41_750b]
signal MUX_uxn_device_h_l149_c41_750b_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l149_c41_750b_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l149_c41_750b_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l149_c41_750b_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l149_c35_d1d6]
signal BIN_OP_PLUS_uxn_device_h_l149_c35_d1d6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l149_c35_d1d6_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l149_c35_d1d6_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l149_c7_2001]
signal MUX_uxn_device_h_l149_c7_2001_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l149_c7_2001_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l149_c7_2001_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l149_c7_2001_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l150_c18_a27c]
signal BIN_OP_EQ_uxn_device_h_l150_c18_a27c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l150_c18_a27c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l150_c18_a27c_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l150_c18_c349]
signal MUX_uxn_device_h_l150_c18_c349_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l150_c18_c349_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l150_c18_c349_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l150_c18_c349_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l153_c42_1945]
signal BIN_OP_OR_uxn_device_h_l153_c42_1945_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l153_c42_1945_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l153_c42_1945_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l153_c26_5b05]
signal BIN_OP_AND_uxn_device_h_l153_c26_5b05_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l153_c26_5b05_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l153_c26_5b05_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l154_c40_7ce8]
signal MUX_uxn_device_h_l154_c40_7ce8_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l154_c40_7ce8_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l154_c40_7ce8_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l154_c40_7ce8_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l154_c30_03b5]
signal BIN_OP_PLUS_uxn_device_h_l154_c30_03b5_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l154_c30_03b5_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l154_c30_03b5_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l154_c21_f3d6]
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_f3d6_ref_toks_0 : uint2_t_48;
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_f3d6_var_dim_0 : unsigned(5 downto 0);
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_f3d6_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l155_c7_1bb1]
signal BIN_OP_EQ_uxn_device_h_l155_c7_1bb1_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l155_c7_1bb1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l155_c7_1bb1_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l155_c41_dec2]
signal BIN_OP_MINUS_uxn_device_h_l155_c41_dec2_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l155_c41_dec2_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l155_c41_dec2_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l155_c51_55b5]
signal BIN_OP_PLUS_uxn_device_h_l155_c51_55b5_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l155_c51_55b5_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l155_c51_55b5_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l155_c35_246b]
signal MUX_uxn_device_h_l155_c35_246b_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l155_c35_246b_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l155_c35_246b_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l155_c35_246b_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l155_c7_317d]
signal MUX_uxn_device_h_l155_c7_317d_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l155_c7_317d_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l155_c7_317d_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l155_c7_317d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l156_c25_f21e]
signal BIN_OP_EQ_uxn_device_h_l156_c25_f21e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l156_c25_f21e_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l156_c25_f21e_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l156_c25_368c]
signal MUX_uxn_device_h_l156_c25_368c_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l156_c25_368c_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l156_c25_368c_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l156_c25_368c_return_output : unsigned(0 downto 0);

-- CONST_SR_1[uxn_device_h_l157_c3_24a4]
signal CONST_SR_1_uxn_device_h_l157_c3_24a4_x : unsigned(7 downto 0);
signal CONST_SR_1_uxn_device_h_l157_c3_24a4_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l158_c14_7a49]
signal BIN_OP_PLUS_uxn_device_h_l158_c14_7a49_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l158_c14_7a49_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l158_c14_7a49_return_output : unsigned(16 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l158_c24_fae8]
signal BIN_OP_MINUS_uxn_device_h_l158_c24_fae8_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l158_c24_fae8_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l158_c24_fae8_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l158_c8_7d8a]
signal MUX_uxn_device_h_l158_c8_7d8a_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l158_c8_7d8a_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l158_c8_7d8a_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l158_c8_7d8a_return_output : unsigned(15 downto 0);

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
      base(3) := ref_toks_0.data(3);
      base(2) := ref_toks_0.data(2);
      base(5) := ref_toks_0.data(5);
      base(1) := ref_toks_0.data(1);
      base(4) := ref_toks_0.data(4);
      base(7) := ref_toks_0.data(7);
      base(0) := ref_toks_0.data(0);
      base(6) := ref_toks_0.data(6);

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
-- BIN_OP_MINUS_uxn_device_h_l130_c20_99e5
BIN_OP_MINUS_uxn_device_h_l130_c20_99e5 : entity work.BIN_OP_MINUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l130_c20_99e5_left,
BIN_OP_MINUS_uxn_device_h_l130_c20_99e5_right,
BIN_OP_MINUS_uxn_device_h_l130_c20_99e5_return_output);

-- BIN_OP_EQ_uxn_device_h_l132_c6_e258
BIN_OP_EQ_uxn_device_h_l132_c6_e258 : entity work.BIN_OP_EQ_uint5_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l132_c6_e258_left,
BIN_OP_EQ_uxn_device_h_l132_c6_e258_right,
BIN_OP_EQ_uxn_device_h_l132_c6_e258_return_output);

-- sprite_rows_MUX_uxn_device_h_l132_c2_edb2
sprite_rows_MUX_uxn_device_h_l132_c2_edb2 : entity work.MUX_uint1_t_uint8_t_8_uint8_t_8_0CLK_de264c78 port map (
sprite_rows_MUX_uxn_device_h_l132_c2_edb2_cond,
sprite_rows_MUX_uxn_device_h_l132_c2_edb2_iftrue,
sprite_rows_MUX_uxn_device_h_l132_c2_edb2_iffalse,
sprite_rows_MUX_uxn_device_h_l132_c2_edb2_return_output);

-- VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_b824
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_b824 : entity work.VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_0CLK_83e31706 port map (
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_b824_elem_val,
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_b824_ref_toks_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_b824_var_dim_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_b824_return_output);

-- BIN_OP_EQ_uxn_device_h_l136_c6_a287
BIN_OP_EQ_uxn_device_h_l136_c6_a287 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l136_c6_a287_left,
BIN_OP_EQ_uxn_device_h_l136_c6_a287_right,
BIN_OP_EQ_uxn_device_h_l136_c6_a287_return_output);

-- y_MUX_uxn_device_h_l136_c2_ddb0
y_MUX_uxn_device_h_l136_c2_ddb0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l136_c2_ddb0_cond,
y_MUX_uxn_device_h_l136_c2_ddb0_iftrue,
y_MUX_uxn_device_h_l136_c2_ddb0_iffalse,
y_MUX_uxn_device_h_l136_c2_ddb0_return_output);

-- x_MUX_uxn_device_h_l136_c2_ddb0
x_MUX_uxn_device_h_l136_c2_ddb0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l136_c2_ddb0_cond,
x_MUX_uxn_device_h_l136_c2_ddb0_iftrue,
x_MUX_uxn_device_h_l136_c2_ddb0_iffalse,
x_MUX_uxn_device_h_l136_c2_ddb0_return_output);

-- opaque_MUX_uxn_device_h_l136_c2_ddb0
opaque_MUX_uxn_device_h_l136_c2_ddb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opaque_MUX_uxn_device_h_l136_c2_ddb0_cond,
opaque_MUX_uxn_device_h_l136_c2_ddb0_iftrue,
opaque_MUX_uxn_device_h_l136_c2_ddb0_iffalse,
opaque_MUX_uxn_device_h_l136_c2_ddb0_return_output);

-- BIN_OP_PLUS_uxn_device_h_l137_c21_8a11
BIN_OP_PLUS_uxn_device_h_l137_c21_8a11 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l137_c21_8a11_left,
BIN_OP_PLUS_uxn_device_h_l137_c21_8a11_right,
BIN_OP_PLUS_uxn_device_h_l137_c21_8a11_return_output);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_1d9e
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_1d9e : entity work.VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_0CLK_f9daebf3 port map (
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_1d9e_ref_toks_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_1d9e_var_dim_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_1d9e_return_output);

-- MUX_uxn_device_h_l138_c13_3178
MUX_uxn_device_h_l138_c13_3178 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l138_c13_3178_cond,
MUX_uxn_device_h_l138_c13_3178_iftrue,
MUX_uxn_device_h_l138_c13_3178_iffalse,
MUX_uxn_device_h_l138_c13_3178_return_output);

-- BIN_OP_PLUS_uxn_device_h_l138_c7_a99e
BIN_OP_PLUS_uxn_device_h_l138_c7_a99e : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l138_c7_a99e_left,
BIN_OP_PLUS_uxn_device_h_l138_c7_a99e_right,
BIN_OP_PLUS_uxn_device_h_l138_c7_a99e_return_output);

-- MUX_uxn_device_h_l139_c13_f52f
MUX_uxn_device_h_l139_c13_f52f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l139_c13_f52f_cond,
MUX_uxn_device_h_l139_c13_f52f_iftrue,
MUX_uxn_device_h_l139_c13_f52f_iffalse,
MUX_uxn_device_h_l139_c13_f52f_return_output);

-- BIN_OP_PLUS_uxn_device_h_l139_c7_2fde
BIN_OP_PLUS_uxn_device_h_l139_c7_2fde : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l139_c7_2fde_left,
BIN_OP_PLUS_uxn_device_h_l139_c7_2fde_right,
BIN_OP_PLUS_uxn_device_h_l139_c7_2fde_return_output);

-- BIN_OP_EQ_uxn_device_h_l142_c6_19b4
BIN_OP_EQ_uxn_device_h_l142_c6_19b4 : entity work.BIN_OP_EQ_uint5_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l142_c6_19b4_left,
BIN_OP_EQ_uxn_device_h_l142_c6_19b4_right,
BIN_OP_EQ_uxn_device_h_l142_c6_19b4_return_output);

-- is_in_bounds_MUX_uxn_device_h_l142_c2_9c93
is_in_bounds_MUX_uxn_device_h_l142_c2_9c93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_in_bounds_MUX_uxn_device_h_l142_c2_9c93_cond,
is_in_bounds_MUX_uxn_device_h_l142_c2_9c93_iftrue,
is_in_bounds_MUX_uxn_device_h_l142_c2_9c93_iffalse,
is_in_bounds_MUX_uxn_device_h_l142_c2_9c93_return_output);

-- c_MUX_uxn_device_h_l142_c2_9c93
c_MUX_uxn_device_h_l142_c2_9c93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
c_MUX_uxn_device_h_l142_c2_9c93_cond,
c_MUX_uxn_device_h_l142_c2_9c93_iftrue,
c_MUX_uxn_device_h_l142_c2_9c93_iffalse,
c_MUX_uxn_device_h_l142_c2_9c93_return_output);

-- result_is_blit_done_MUX_uxn_device_h_l142_c2_9c93
result_is_blit_done_MUX_uxn_device_h_l142_c2_9c93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_blit_done_MUX_uxn_device_h_l142_c2_9c93_cond,
result_is_blit_done_MUX_uxn_device_h_l142_c2_9c93_iftrue,
result_is_blit_done_MUX_uxn_device_h_l142_c2_9c93_iffalse,
result_is_blit_done_MUX_uxn_device_h_l142_c2_9c93_return_output);

-- result_u8_value_MUX_uxn_device_h_l142_c2_9c93
result_u8_value_MUX_uxn_device_h_l142_c2_9c93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l142_c2_9c93_cond,
result_u8_value_MUX_uxn_device_h_l142_c2_9c93_iftrue,
result_u8_value_MUX_uxn_device_h_l142_c2_9c93_iffalse,
result_u8_value_MUX_uxn_device_h_l142_c2_9c93_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l142_c2_9c93
result_is_vram_write_MUX_uxn_device_h_l142_c2_9c93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l142_c2_9c93_cond,
result_is_vram_write_MUX_uxn_device_h_l142_c2_9c93_iftrue,
result_is_vram_write_MUX_uxn_device_h_l142_c2_9c93_iffalse,
result_is_vram_write_MUX_uxn_device_h_l142_c2_9c93_return_output);

-- result_u16_addr_MUX_uxn_device_h_l142_c2_9c93
result_u16_addr_MUX_uxn_device_h_l142_c2_9c93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l142_c2_9c93_cond,
result_u16_addr_MUX_uxn_device_h_l142_c2_9c93_iftrue,
result_u16_addr_MUX_uxn_device_h_l142_c2_9c93_iffalse,
result_u16_addr_MUX_uxn_device_h_l142_c2_9c93_return_output);

-- y_MUX_uxn_device_h_l142_c2_9c93
y_MUX_uxn_device_h_l142_c2_9c93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l142_c2_9c93_cond,
y_MUX_uxn_device_h_l142_c2_9c93_iftrue,
y_MUX_uxn_device_h_l142_c2_9c93_iffalse,
y_MUX_uxn_device_h_l142_c2_9c93_return_output);

-- x_MUX_uxn_device_h_l142_c2_9c93
x_MUX_uxn_device_h_l142_c2_9c93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l142_c2_9c93_cond,
x_MUX_uxn_device_h_l142_c2_9c93_iftrue,
x_MUX_uxn_device_h_l142_c2_9c93_iffalse,
x_MUX_uxn_device_h_l142_c2_9c93_return_output);

-- BIN_OP_PLUS_uxn_device_h_l146_c21_a134
BIN_OP_PLUS_uxn_device_h_l146_c21_a134 : entity work.BIN_OP_PLUS_uint16_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l146_c21_a134_left,
BIN_OP_PLUS_uxn_device_h_l146_c21_a134_right,
BIN_OP_PLUS_uxn_device_h_l146_c21_a134_return_output);

-- BIN_OP_EQ_uxn_device_h_l148_c7_d9ed
BIN_OP_EQ_uxn_device_h_l148_c7_d9ed : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l148_c7_d9ed_left,
BIN_OP_EQ_uxn_device_h_l148_c7_d9ed_right,
BIN_OP_EQ_uxn_device_h_l148_c7_d9ed_return_output);

-- BIN_OP_MINUS_uxn_device_h_l148_c46_869f
BIN_OP_MINUS_uxn_device_h_l148_c46_869f : entity work.BIN_OP_MINUS_uint5_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l148_c46_869f_left,
BIN_OP_MINUS_uxn_device_h_l148_c46_869f_right,
BIN_OP_MINUS_uxn_device_h_l148_c46_869f_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_5c5c
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_5c5c : entity work.VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_0CLK_814e9c60 port map (
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_5c5c_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_5c5c_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_5c5c_return_output);

-- MUX_uxn_device_h_l148_c7_aff9
MUX_uxn_device_h_l148_c7_aff9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l148_c7_aff9_cond,
MUX_uxn_device_h_l148_c7_aff9_iftrue,
MUX_uxn_device_h_l148_c7_aff9_iffalse,
MUX_uxn_device_h_l148_c7_aff9_return_output);

-- BIN_OP_EQ_uxn_device_h_l149_c7_a69c
BIN_OP_EQ_uxn_device_h_l149_c7_a69c : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l149_c7_a69c_left,
BIN_OP_EQ_uxn_device_h_l149_c7_a69c_right,
BIN_OP_EQ_uxn_device_h_l149_c7_a69c_return_output);

-- MUX_uxn_device_h_l149_c41_750b
MUX_uxn_device_h_l149_c41_750b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l149_c41_750b_cond,
MUX_uxn_device_h_l149_c41_750b_iftrue,
MUX_uxn_device_h_l149_c41_750b_iffalse,
MUX_uxn_device_h_l149_c41_750b_return_output);

-- BIN_OP_PLUS_uxn_device_h_l149_c35_d1d6
BIN_OP_PLUS_uxn_device_h_l149_c35_d1d6 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l149_c35_d1d6_left,
BIN_OP_PLUS_uxn_device_h_l149_c35_d1d6_right,
BIN_OP_PLUS_uxn_device_h_l149_c35_d1d6_return_output);

-- MUX_uxn_device_h_l149_c7_2001
MUX_uxn_device_h_l149_c7_2001 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l149_c7_2001_cond,
MUX_uxn_device_h_l149_c7_2001_iftrue,
MUX_uxn_device_h_l149_c7_2001_iffalse,
MUX_uxn_device_h_l149_c7_2001_return_output);

-- BIN_OP_EQ_uxn_device_h_l150_c18_a27c
BIN_OP_EQ_uxn_device_h_l150_c18_a27c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l150_c18_a27c_left,
BIN_OP_EQ_uxn_device_h_l150_c18_a27c_right,
BIN_OP_EQ_uxn_device_h_l150_c18_a27c_return_output);

-- MUX_uxn_device_h_l150_c18_c349
MUX_uxn_device_h_l150_c18_c349 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l150_c18_c349_cond,
MUX_uxn_device_h_l150_c18_c349_iftrue,
MUX_uxn_device_h_l150_c18_c349_iffalse,
MUX_uxn_device_h_l150_c18_c349_return_output);

-- BIN_OP_OR_uxn_device_h_l153_c42_1945
BIN_OP_OR_uxn_device_h_l153_c42_1945 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l153_c42_1945_left,
BIN_OP_OR_uxn_device_h_l153_c42_1945_right,
BIN_OP_OR_uxn_device_h_l153_c42_1945_return_output);

-- BIN_OP_AND_uxn_device_h_l153_c26_5b05
BIN_OP_AND_uxn_device_h_l153_c26_5b05 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l153_c26_5b05_left,
BIN_OP_AND_uxn_device_h_l153_c26_5b05_right,
BIN_OP_AND_uxn_device_h_l153_c26_5b05_return_output);

-- MUX_uxn_device_h_l154_c40_7ce8
MUX_uxn_device_h_l154_c40_7ce8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l154_c40_7ce8_cond,
MUX_uxn_device_h_l154_c40_7ce8_iftrue,
MUX_uxn_device_h_l154_c40_7ce8_iffalse,
MUX_uxn_device_h_l154_c40_7ce8_return_output);

-- BIN_OP_PLUS_uxn_device_h_l154_c30_03b5
BIN_OP_PLUS_uxn_device_h_l154_c30_03b5 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l154_c30_03b5_left,
BIN_OP_PLUS_uxn_device_h_l154_c30_03b5_right,
BIN_OP_PLUS_uxn_device_h_l154_c30_03b5_return_output);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_f3d6
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_f3d6 : entity work.VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_0CLK_f9daebf3 port map (
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_f3d6_ref_toks_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_f3d6_var_dim_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_f3d6_return_output);

-- BIN_OP_EQ_uxn_device_h_l155_c7_1bb1
BIN_OP_EQ_uxn_device_h_l155_c7_1bb1 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l155_c7_1bb1_left,
BIN_OP_EQ_uxn_device_h_l155_c7_1bb1_right,
BIN_OP_EQ_uxn_device_h_l155_c7_1bb1_return_output);

-- BIN_OP_MINUS_uxn_device_h_l155_c41_dec2
BIN_OP_MINUS_uxn_device_h_l155_c41_dec2 : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l155_c41_dec2_left,
BIN_OP_MINUS_uxn_device_h_l155_c41_dec2_right,
BIN_OP_MINUS_uxn_device_h_l155_c41_dec2_return_output);

-- BIN_OP_PLUS_uxn_device_h_l155_c51_55b5
BIN_OP_PLUS_uxn_device_h_l155_c51_55b5 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l155_c51_55b5_left,
BIN_OP_PLUS_uxn_device_h_l155_c51_55b5_right,
BIN_OP_PLUS_uxn_device_h_l155_c51_55b5_return_output);

-- MUX_uxn_device_h_l155_c35_246b
MUX_uxn_device_h_l155_c35_246b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l155_c35_246b_cond,
MUX_uxn_device_h_l155_c35_246b_iftrue,
MUX_uxn_device_h_l155_c35_246b_iffalse,
MUX_uxn_device_h_l155_c35_246b_return_output);

-- MUX_uxn_device_h_l155_c7_317d
MUX_uxn_device_h_l155_c7_317d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l155_c7_317d_cond,
MUX_uxn_device_h_l155_c7_317d_iftrue,
MUX_uxn_device_h_l155_c7_317d_iffalse,
MUX_uxn_device_h_l155_c7_317d_return_output);

-- BIN_OP_EQ_uxn_device_h_l156_c25_f21e
BIN_OP_EQ_uxn_device_h_l156_c25_f21e : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l156_c25_f21e_left,
BIN_OP_EQ_uxn_device_h_l156_c25_f21e_right,
BIN_OP_EQ_uxn_device_h_l156_c25_f21e_return_output);

-- MUX_uxn_device_h_l156_c25_368c
MUX_uxn_device_h_l156_c25_368c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l156_c25_368c_cond,
MUX_uxn_device_h_l156_c25_368c_iftrue,
MUX_uxn_device_h_l156_c25_368c_iffalse,
MUX_uxn_device_h_l156_c25_368c_return_output);

-- CONST_SR_1_uxn_device_h_l157_c3_24a4
CONST_SR_1_uxn_device_h_l157_c3_24a4 : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_uxn_device_h_l157_c3_24a4_x,
CONST_SR_1_uxn_device_h_l157_c3_24a4_return_output);

-- BIN_OP_PLUS_uxn_device_h_l158_c14_7a49
BIN_OP_PLUS_uxn_device_h_l158_c14_7a49 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l158_c14_7a49_left,
BIN_OP_PLUS_uxn_device_h_l158_c14_7a49_right,
BIN_OP_PLUS_uxn_device_h_l158_c14_7a49_return_output);

-- BIN_OP_MINUS_uxn_device_h_l158_c24_fae8
BIN_OP_MINUS_uxn_device_h_l158_c24_fae8 : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l158_c24_fae8_left,
BIN_OP_MINUS_uxn_device_h_l158_c24_fae8_right,
BIN_OP_MINUS_uxn_device_h_l158_c24_fae8_return_output);

-- MUX_uxn_device_h_l158_c8_7d8a
MUX_uxn_device_h_l158_c8_7d8a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l158_c8_7d8a_cond,
MUX_uxn_device_h_l158_c8_7d8a_iftrue,
MUX_uxn_device_h_l158_c8_7d8a_iffalse,
MUX_uxn_device_h_l158_c8_7d8a_return_output);



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
 BIN_OP_MINUS_uxn_device_h_l130_c20_99e5_return_output,
 BIN_OP_EQ_uxn_device_h_l132_c6_e258_return_output,
 sprite_rows_MUX_uxn_device_h_l132_c2_edb2_return_output,
 VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_b824_return_output,
 BIN_OP_EQ_uxn_device_h_l136_c6_a287_return_output,
 y_MUX_uxn_device_h_l136_c2_ddb0_return_output,
 x_MUX_uxn_device_h_l136_c2_ddb0_return_output,
 opaque_MUX_uxn_device_h_l136_c2_ddb0_return_output,
 BIN_OP_PLUS_uxn_device_h_l137_c21_8a11_return_output,
 VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_1d9e_return_output,
 MUX_uxn_device_h_l138_c13_3178_return_output,
 BIN_OP_PLUS_uxn_device_h_l138_c7_a99e_return_output,
 MUX_uxn_device_h_l139_c13_f52f_return_output,
 BIN_OP_PLUS_uxn_device_h_l139_c7_2fde_return_output,
 BIN_OP_EQ_uxn_device_h_l142_c6_19b4_return_output,
 is_in_bounds_MUX_uxn_device_h_l142_c2_9c93_return_output,
 c_MUX_uxn_device_h_l142_c2_9c93_return_output,
 result_is_blit_done_MUX_uxn_device_h_l142_c2_9c93_return_output,
 result_u8_value_MUX_uxn_device_h_l142_c2_9c93_return_output,
 result_is_vram_write_MUX_uxn_device_h_l142_c2_9c93_return_output,
 result_u16_addr_MUX_uxn_device_h_l142_c2_9c93_return_output,
 y_MUX_uxn_device_h_l142_c2_9c93_return_output,
 x_MUX_uxn_device_h_l142_c2_9c93_return_output,
 BIN_OP_PLUS_uxn_device_h_l146_c21_a134_return_output,
 BIN_OP_EQ_uxn_device_h_l148_c7_d9ed_return_output,
 BIN_OP_MINUS_uxn_device_h_l148_c46_869f_return_output,
 VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_5c5c_return_output,
 MUX_uxn_device_h_l148_c7_aff9_return_output,
 BIN_OP_EQ_uxn_device_h_l149_c7_a69c_return_output,
 MUX_uxn_device_h_l149_c41_750b_return_output,
 BIN_OP_PLUS_uxn_device_h_l149_c35_d1d6_return_output,
 MUX_uxn_device_h_l149_c7_2001_return_output,
 BIN_OP_EQ_uxn_device_h_l150_c18_a27c_return_output,
 MUX_uxn_device_h_l150_c18_c349_return_output,
 BIN_OP_OR_uxn_device_h_l153_c42_1945_return_output,
 BIN_OP_AND_uxn_device_h_l153_c26_5b05_return_output,
 MUX_uxn_device_h_l154_c40_7ce8_return_output,
 BIN_OP_PLUS_uxn_device_h_l154_c30_03b5_return_output,
 VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_f3d6_return_output,
 BIN_OP_EQ_uxn_device_h_l155_c7_1bb1_return_output,
 BIN_OP_MINUS_uxn_device_h_l155_c41_dec2_return_output,
 BIN_OP_PLUS_uxn_device_h_l155_c51_55b5_return_output,
 MUX_uxn_device_h_l155_c35_246b_return_output,
 MUX_uxn_device_h_l155_c7_317d_return_output,
 BIN_OP_EQ_uxn_device_h_l156_c25_f21e_return_output,
 MUX_uxn_device_h_l156_c25_368c_return_output,
 CONST_SR_1_uxn_device_h_l157_c3_24a4_return_output,
 BIN_OP_PLUS_uxn_device_h_l158_c14_7a49_return_output,
 BIN_OP_MINUS_uxn_device_h_l158_c24_fae8_return_output,
 MUX_uxn_device_h_l158_c8_7d8a_return_output)
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
 variable VAR_color8_uxn_device_h_l127_c2_3927 : unsigned(7 downto 0);
 variable VAR_uint12_7_3_uxn_device_h_l128_c20_40bd_return_output : unsigned(4 downto 0);
 variable VAR_uint12_2_0_uxn_device_h_l129_c20_de31_return_output : unsigned(2 downto 0);
 variable VAR_phase_minus_two_uxn_device_h_l130_c2_3983 : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l130_c20_99e5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l130_c20_99e5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l130_c20_99e5_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l132_c6_e258_left : unsigned(4 downto 0);
 variable VAR_uint12_7_3_uxn_device_h_l132_c6_22fb_return_output : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l132_c6_e258_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l132_c6_e258_return_output : unsigned(0 downto 0);
 variable VAR_sprite_rows_MUX_uxn_device_h_l132_c2_edb2_iftrue : uint8_t_8;
 variable VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5_uxn_device_h_l132_c2_edb2_return_output : uint8_t_8;
 variable VAR_sprite_rows_MUX_uxn_device_h_l132_c2_edb2_iffalse : uint8_t_8;
 variable VAR_sprite_rows_MUX_uxn_device_h_l132_c2_edb2_return_output : uint8_t_8;
 variable VAR_sprite_rows_MUX_uxn_device_h_l132_c2_edb2_cond : unsigned(0 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_b824_return_output : uint8_t_array_8_t;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_b824_elem_val : unsigned(7 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_b824_ref_toks_0 : uint8_t_8;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_b824_var_dim_0 : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c6_a287_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c6_a287_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l136_c6_a287_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c2_ddb0_iftrue : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l139_c3_1ad7 : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c2_ddb0_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c2_ddb0_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l136_c2_ddb0_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c2_ddb0_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l138_c3_b169 : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c2_ddb0_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c2_ddb0_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l136_c2_ddb0_cond : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l136_c2_ddb0_iftrue : unsigned(0 downto 0);
 variable VAR_opaque_uxn_device_h_l137_c3_2747 : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l136_c2_ddb0_iffalse : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l136_c2_ddb0_return_output : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l136_c2_ddb0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l137_c21_8a11_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l137_c21_8a11_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l137_c21_8a11_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_1d9e_var_dim_0 : unsigned(5 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_1d9e_return_output : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_1d9e_ref_toks_0 : uint2_t_48;
 variable VAR_BIN_OP_PLUS_uxn_device_h_l138_c7_a99e_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l138_c13_3178_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l138_c13_3178_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l138_c13_3178_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l138_c13_3178_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l138_c7_a99e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l138_c7_a99e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l139_c7_2fde_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l139_c13_f52f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l139_c13_f52f_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l139_c13_f52f_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l139_c13_f52f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l139_c7_2fde_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l139_c7_2fde_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c6_19b4_left : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c6_19b4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c6_19b4_return_output : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l142_c2_9c93_iftrue : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l142_c2_9c93_iffalse : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l142_c2_9c93_return_output : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l142_c2_9c93_cond : unsigned(0 downto 0);
 variable VAR_c_MUX_uxn_device_h_l142_c2_9c93_iftrue : unsigned(7 downto 0);
 variable VAR_c_MUX_uxn_device_h_l142_c2_9c93_iffalse : unsigned(7 downto 0);
 variable VAR_c_MUX_uxn_device_h_l142_c2_9c93_return_output : unsigned(7 downto 0);
 variable VAR_c_MUX_uxn_device_h_l142_c2_9c93_cond : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l142_c2_9c93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l142_c2_9c93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l142_c2_9c93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l142_c2_9c93_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l142_c2_9c93_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l144_c3_1628 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l142_c2_9c93_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l154_c3_a10d : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l142_c2_9c93_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l142_c2_9c93_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c2_9c93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c2_9c93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c2_9c93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c2_9c93_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l142_c2_9c93_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l146_c3_ec32 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l142_c2_9c93_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l142_c2_9c93_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l142_c2_9c93_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c2_9c93_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c2_9c93_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c2_9c93_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c2_9c93_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l142_c2_9c93_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l142_c2_9c93_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l142_c2_9c93_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l142_c2_9c93_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l146_c21_a134_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l146_c21_a134_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l146_c21_a134_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l148_c7_aff9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l148_c7_d9ed_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l148_c7_d9ed_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l148_c7_d9ed_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l148_c7_aff9_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l148_c7_aff9_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l148_c46_869f_left : unsigned(4 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l148_c46_869f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l148_c46_869f_return_output : unsigned(4 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_5c5c_var_dim_0 : unsigned(2 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_5c5c_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_5c5c_ref_toks_0 : uint8_t_8;
 variable VAR_MUX_uxn_device_h_l148_c7_aff9_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c7_2001_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l149_c7_a69c_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l149_c7_a69c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l149_c7_a69c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c7_2001_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c7_2001_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l149_c35_d1d6_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c41_750b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c41_750b_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c41_750b_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c41_750b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l149_c35_d1d6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l149_c35_d1d6_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c7_2001_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l150_c18_c349_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l150_c18_a27c_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_device_h_l150_c18_3afd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l150_c18_a27c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l150_c18_a27c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l150_c18_c349_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l150_c18_c349_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l150_c18_c349_return_output : unsigned(0 downto 0);
 variable VAR_uint16_7_0_uxn_device_h_l151_c39_b2fe_return_output : unsigned(7 downto 0);
 variable VAR_uint16_uint8_8_uxn_device_h_l151_c21_b42d_return_output : unsigned(15 downto 0);
 variable VAR_uint16_7_0_uxn_device_h_l152_c53_a943_return_output : unsigned(7 downto 0);
 variable VAR_uint16_uint8_0_uxn_device_h_l152_c21_f080_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l153_c26_5b05_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l153_c42_1945_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l153_c42_1945_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l153_c42_1945_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l153_c26_5b05_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l153_c26_5b05_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l154_c30_03b5_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l154_c40_7ce8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l154_c40_7ce8_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l154_c40_7ce8_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l154_c40_7ce8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l154_c30_03b5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l154_c30_03b5_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_f3d6_var_dim_0 : unsigned(5 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_f3d6_return_output : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_f3d6_ref_toks_0 : uint2_t_48;
 variable VAR_MUX_uxn_device_h_l155_c7_317d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l155_c7_1bb1_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l155_c7_1bb1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l155_c7_1bb1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l155_c7_317d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l155_c7_317d_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l155_c35_246b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l155_c35_246b_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l155_c35_246b_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l155_c41_dec2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l155_c41_dec2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l155_c41_dec2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l155_c51_55b5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l155_c51_55b5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l155_c51_55b5_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l155_c35_246b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l155_c7_317d_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l156_c25_368c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l156_c25_f21e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l156_c25_f21e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l156_c25_f21e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l156_c25_368c_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l156_c25_368c_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l156_c25_368c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l157_c3_24a4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l157_c3_24a4_x : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l158_c8_7d8a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l158_c8_7d8a_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l158_c8_7d8a_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l158_c14_7a49_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l158_c14_7a49_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l158_c14_7a49_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l158_c24_fae8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l158_c24_fae8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l158_c24_fae8_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l158_c8_7d8a_return_output : unsigned(15 downto 0);
 variable VAR_uint8_0_0_uxn_device_h_l153_l154_DUPLICATE_245d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_128d_uxn_device_h_l161_l109_DUPLICATE_c106_return_output : screen_blit_result_t;
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
     VAR_BIN_OP_MINUS_uxn_device_h_l158_c24_fae8_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l150_c18_a27c_right := to_unsigned(0, 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l158_c14_7a49_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l155_c51_55b5_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l149_c41_750b_iftrue := to_unsigned(0, 16);
     VAR_BIN_OP_MINUS_uxn_device_h_l130_c20_99e5_right := to_unsigned(2, 2);
     VAR_MUX_uxn_device_h_l139_c13_f52f_iftrue := to_unsigned(7, 16);
     VAR_BIN_OP_EQ_uxn_device_h_l148_c7_d9ed_right := to_unsigned(0, 3);
     VAR_MUX_uxn_device_h_l154_c40_7ce8_iftrue := to_unsigned(16, 8);
     VAR_MUX_uxn_device_h_l138_c13_3178_iftrue := to_unsigned(0, 16);
     VAR_BIN_OP_MINUS_uxn_device_h_l148_c46_869f_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l142_c6_19b4_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l137_c21_8a11_left := to_unsigned(32, 8);
     VAR_result_u8_value_uxn_device_h_l144_c3_1628 := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l142_c2_9c93_iftrue := VAR_result_u8_value_uxn_device_h_l144_c3_1628;
     VAR_BIN_OP_EQ_uxn_device_h_l156_c25_f21e_right := to_unsigned(71, 12);
     VAR_MUX_uxn_device_h_l150_c18_c349_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l132_c6_e258_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l156_c25_368c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l155_c7_1bb1_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l149_c7_a69c_right := to_unsigned(0, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l136_c6_a287_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l139_c13_f52f_iffalse := to_unsigned(0, 16);
     VAR_MUX_uxn_device_h_l150_c18_c349_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c2_9c93_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l155_c41_dec2_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l138_c13_3178_iffalse := to_unsigned(7, 16);
     VAR_MUX_uxn_device_h_l154_c40_7ce8_iffalse := to_unsigned(0, 8);
     VAR_result_is_blit_done_MUX_uxn_device_h_l142_c2_9c93_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l156_c25_368c_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l149_c41_750b_iffalse := to_unsigned(7, 16);

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
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_1d9e_ref_toks_0 := blending;
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_f3d6_ref_toks_0 := blending;
     REG_VAR_blending := blending;
     VAR_MUX_uxn_device_h_l148_c7_aff9_iffalse := c;
     VAR_c_MUX_uxn_device_h_l142_c2_9c93_iftrue := c;
     VAR_color8_uxn_device_h_l127_c2_3927 := resize(VAR_color, 8);
     VAR_MUX_uxn_device_h_l138_c13_3178_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l149_c41_750b_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l158_c8_7d8a_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l139_c13_f52f_cond := VAR_fy;
     VAR_MUX_uxn_device_h_l155_c35_246b_cond := VAR_fy;
     VAR_is_in_bounds_MUX_uxn_device_h_l142_c2_9c93_iftrue := is_in_bounds;
     VAR_opaque_MUX_uxn_device_h_l136_c2_ddb0_iffalse := opaque;
     VAR_BIN_OP_EQ_uxn_device_h_l136_c6_a287_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l156_c25_f21e_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l130_c20_99e5_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_device_h_l146_c21_a134_right := VAR_phase;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_b824_elem_val := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_device_h_l146_c21_a134_left := VAR_ram_addr;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_b824_ref_toks_0 := sprite_rows;
     VAR_sprite_rows_MUX_uxn_device_h_l132_c2_edb2_iffalse := sprite_rows;
     VAR_x_MUX_uxn_device_h_l136_c2_ddb0_iffalse := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l138_c7_a99e_left := VAR_x1;
     VAR_BIN_OP_PLUS_uxn_device_h_l149_c35_d1d6_left := VAR_x1;
     VAR_y_MUX_uxn_device_h_l136_c2_ddb0_iffalse := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l139_c7_2fde_left := VAR_y1;
     VAR_BIN_OP_PLUS_uxn_device_h_l137_c21_8a11_right := VAR_color8_uxn_device_h_l127_c2_3927;
     VAR_BIN_OP_PLUS_uxn_device_h_l154_c30_03b5_left := VAR_color8_uxn_device_h_l127_c2_3927;
     REG_VAR_color8 := VAR_color8_uxn_device_h_l127_c2_3927;
     -- uint12_7_3[uxn_device_h_l128_c20_40bd] LATENCY=0
     VAR_uint12_7_3_uxn_device_h_l128_c20_40bd_return_output := uint12_7_3(
     VAR_phase);

     -- MUX[uxn_device_h_l149_c41_750b] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l149_c41_750b_cond <= VAR_MUX_uxn_device_h_l149_c41_750b_cond;
     MUX_uxn_device_h_l149_c41_750b_iftrue <= VAR_MUX_uxn_device_h_l149_c41_750b_iftrue;
     MUX_uxn_device_h_l149_c41_750b_iffalse <= VAR_MUX_uxn_device_h_l149_c41_750b_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l149_c41_750b_return_output := MUX_uxn_device_h_l149_c41_750b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l136_c6_a287] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l136_c6_a287_left <= VAR_BIN_OP_EQ_uxn_device_h_l136_c6_a287_left;
     BIN_OP_EQ_uxn_device_h_l136_c6_a287_right <= VAR_BIN_OP_EQ_uxn_device_h_l136_c6_a287_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l136_c6_a287_return_output := BIN_OP_EQ_uxn_device_h_l136_c6_a287_return_output;

     -- MUX[uxn_device_h_l138_c13_3178] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l138_c13_3178_cond <= VAR_MUX_uxn_device_h_l138_c13_3178_cond;
     MUX_uxn_device_h_l138_c13_3178_iftrue <= VAR_MUX_uxn_device_h_l138_c13_3178_iftrue;
     MUX_uxn_device_h_l138_c13_3178_iffalse <= VAR_MUX_uxn_device_h_l138_c13_3178_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l138_c13_3178_return_output := MUX_uxn_device_h_l138_c13_3178_return_output;

     -- MUX[uxn_device_h_l139_c13_f52f] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l139_c13_f52f_cond <= VAR_MUX_uxn_device_h_l139_c13_f52f_cond;
     MUX_uxn_device_h_l139_c13_f52f_iftrue <= VAR_MUX_uxn_device_h_l139_c13_f52f_iftrue;
     MUX_uxn_device_h_l139_c13_f52f_iffalse <= VAR_MUX_uxn_device_h_l139_c13_f52f_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l139_c13_f52f_return_output := MUX_uxn_device_h_l139_c13_f52f_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l137_c21_8a11] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l137_c21_8a11_left <= VAR_BIN_OP_PLUS_uxn_device_h_l137_c21_8a11_left;
     BIN_OP_PLUS_uxn_device_h_l137_c21_8a11_right <= VAR_BIN_OP_PLUS_uxn_device_h_l137_c21_8a11_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l137_c21_8a11_return_output := BIN_OP_PLUS_uxn_device_h_l137_c21_8a11_return_output;

     -- BIN_OP_EQ[uxn_device_h_l156_c25_f21e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l156_c25_f21e_left <= VAR_BIN_OP_EQ_uxn_device_h_l156_c25_f21e_left;
     BIN_OP_EQ_uxn_device_h_l156_c25_f21e_right <= VAR_BIN_OP_EQ_uxn_device_h_l156_c25_f21e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l156_c25_f21e_return_output := BIN_OP_EQ_uxn_device_h_l156_c25_f21e_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l146_c21_a134] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l146_c21_a134_left <= VAR_BIN_OP_PLUS_uxn_device_h_l146_c21_a134_left;
     BIN_OP_PLUS_uxn_device_h_l146_c21_a134_right <= VAR_BIN_OP_PLUS_uxn_device_h_l146_c21_a134_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l146_c21_a134_return_output := BIN_OP_PLUS_uxn_device_h_l146_c21_a134_return_output;

     -- uint12_2_0[uxn_device_h_l129_c20_de31] LATENCY=0
     VAR_uint12_2_0_uxn_device_h_l129_c20_de31_return_output := uint12_2_0(
     VAR_phase);

     -- BIN_OP_MINUS[uxn_device_h_l130_c20_99e5] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l130_c20_99e5_left <= VAR_BIN_OP_MINUS_uxn_device_h_l130_c20_99e5_left;
     BIN_OP_MINUS_uxn_device_h_l130_c20_99e5_right <= VAR_BIN_OP_MINUS_uxn_device_h_l130_c20_99e5_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l130_c20_99e5_return_output := BIN_OP_MINUS_uxn_device_h_l130_c20_99e5_return_output;

     -- Submodule level 1
     VAR_opaque_MUX_uxn_device_h_l136_c2_ddb0_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c6_a287_return_output;
     VAR_x_MUX_uxn_device_h_l136_c2_ddb0_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c6_a287_return_output;
     VAR_y_MUX_uxn_device_h_l136_c2_ddb0_cond := VAR_BIN_OP_EQ_uxn_device_h_l136_c6_a287_return_output;
     VAR_MUX_uxn_device_h_l156_c25_368c_cond := VAR_BIN_OP_EQ_uxn_device_h_l156_c25_f21e_return_output;
     VAR_phase_minus_two_uxn_device_h_l130_c2_3983 := VAR_BIN_OP_MINUS_uxn_device_h_l130_c20_99e5_return_output;
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_1d9e_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l137_c21_8a11_return_output, 6);
     VAR_result_u16_addr_uxn_device_h_l146_c3_ec32 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l146_c21_a134_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l138_c7_a99e_right := VAR_MUX_uxn_device_h_l138_c13_3178_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l139_c7_2fde_right := VAR_MUX_uxn_device_h_l139_c13_f52f_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l149_c35_d1d6_right := VAR_MUX_uxn_device_h_l149_c41_750b_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l148_c7_d9ed_left := VAR_uint12_2_0_uxn_device_h_l129_c20_de31_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l149_c7_a69c_left := VAR_uint12_2_0_uxn_device_h_l129_c20_de31_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l155_c7_1bb1_left := VAR_uint12_2_0_uxn_device_h_l129_c20_de31_return_output;
     REG_VAR_phase2_downto_0 := VAR_uint12_2_0_uxn_device_h_l129_c20_de31_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l142_c6_19b4_left := VAR_uint12_7_3_uxn_device_h_l128_c20_40bd_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l148_c46_869f_left := VAR_uint12_7_3_uxn_device_h_l128_c20_40bd_return_output;
     REG_VAR_phase7_downto_3 := VAR_uint12_7_3_uxn_device_h_l128_c20_40bd_return_output;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_b824_var_dim_0 := resize(VAR_phase_minus_two_uxn_device_h_l130_c2_3983, 3);
     REG_VAR_phase_minus_two := VAR_phase_minus_two_uxn_device_h_l130_c2_3983;
     VAR_result_u16_addr_MUX_uxn_device_h_l142_c2_9c93_iftrue := VAR_result_u16_addr_uxn_device_h_l146_c3_ec32;
     -- BIN_OP_EQ[uxn_device_h_l155_c7_1bb1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l155_c7_1bb1_left <= VAR_BIN_OP_EQ_uxn_device_h_l155_c7_1bb1_left;
     BIN_OP_EQ_uxn_device_h_l155_c7_1bb1_right <= VAR_BIN_OP_EQ_uxn_device_h_l155_c7_1bb1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l155_c7_1bb1_return_output := BIN_OP_EQ_uxn_device_h_l155_c7_1bb1_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l138_c7_a99e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l138_c7_a99e_left <= VAR_BIN_OP_PLUS_uxn_device_h_l138_c7_a99e_left;
     BIN_OP_PLUS_uxn_device_h_l138_c7_a99e_right <= VAR_BIN_OP_PLUS_uxn_device_h_l138_c7_a99e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l138_c7_a99e_return_output := BIN_OP_PLUS_uxn_device_h_l138_c7_a99e_return_output;

     -- uint12_7_3[uxn_device_h_l132_c6_22fb] LATENCY=0
     VAR_uint12_7_3_uxn_device_h_l132_c6_22fb_return_output := uint12_7_3(
     VAR_phase_minus_two_uxn_device_h_l130_c2_3983);

     -- MUX[uxn_device_h_l156_c25_368c] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l156_c25_368c_cond <= VAR_MUX_uxn_device_h_l156_c25_368c_cond;
     MUX_uxn_device_h_l156_c25_368c_iftrue <= VAR_MUX_uxn_device_h_l156_c25_368c_iftrue;
     MUX_uxn_device_h_l156_c25_368c_iffalse <= VAR_MUX_uxn_device_h_l156_c25_368c_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l156_c25_368c_return_output := MUX_uxn_device_h_l156_c25_368c_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l148_c46_869f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l148_c46_869f_left <= VAR_BIN_OP_MINUS_uxn_device_h_l148_c46_869f_left;
     BIN_OP_MINUS_uxn_device_h_l148_c46_869f_right <= VAR_BIN_OP_MINUS_uxn_device_h_l148_c46_869f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l148_c46_869f_return_output := BIN_OP_MINUS_uxn_device_h_l148_c46_869f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l142_c6_19b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l142_c6_19b4_left <= VAR_BIN_OP_EQ_uxn_device_h_l142_c6_19b4_left;
     BIN_OP_EQ_uxn_device_h_l142_c6_19b4_right <= VAR_BIN_OP_EQ_uxn_device_h_l142_c6_19b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l142_c6_19b4_return_output := BIN_OP_EQ_uxn_device_h_l142_c6_19b4_return_output;

     -- BIN_OP_EQ[uxn_device_h_l148_c7_d9ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l148_c7_d9ed_left <= VAR_BIN_OP_EQ_uxn_device_h_l148_c7_d9ed_left;
     BIN_OP_EQ_uxn_device_h_l148_c7_d9ed_right <= VAR_BIN_OP_EQ_uxn_device_h_l148_c7_d9ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l148_c7_d9ed_return_output := BIN_OP_EQ_uxn_device_h_l148_c7_d9ed_return_output;

     -- BIN_OP_EQ[uxn_device_h_l149_c7_a69c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l149_c7_a69c_left <= VAR_BIN_OP_EQ_uxn_device_h_l149_c7_a69c_left;
     BIN_OP_EQ_uxn_device_h_l149_c7_a69c_right <= VAR_BIN_OP_EQ_uxn_device_h_l149_c7_a69c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l149_c7_a69c_return_output := BIN_OP_EQ_uxn_device_h_l149_c7_a69c_return_output;

     -- VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8[uxn_device_h_l133_c3_b824] LATENCY=0
     -- Inputs
     VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_b824_elem_val <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_b824_elem_val;
     VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_b824_ref_toks_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_b824_ref_toks_0;
     VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_b824_var_dim_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_b824_var_dim_0;
     -- Outputs
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_b824_return_output := VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_b824_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l149_c35_d1d6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l149_c35_d1d6_left <= VAR_BIN_OP_PLUS_uxn_device_h_l149_c35_d1d6_left;
     BIN_OP_PLUS_uxn_device_h_l149_c35_d1d6_right <= VAR_BIN_OP_PLUS_uxn_device_h_l149_c35_d1d6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l149_c35_d1d6_return_output := BIN_OP_PLUS_uxn_device_h_l149_c35_d1d6_return_output;

     -- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l137_c12_1d9e] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_1d9e_ref_toks_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_1d9e_ref_toks_0;
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_1d9e_var_dim_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_1d9e_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_1d9e_return_output := VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_1d9e_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l139_c7_2fde] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l139_c7_2fde_left <= VAR_BIN_OP_PLUS_uxn_device_h_l139_c7_2fde_left;
     BIN_OP_PLUS_uxn_device_h_l139_c7_2fde_right <= VAR_BIN_OP_PLUS_uxn_device_h_l139_c7_2fde_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l139_c7_2fde_return_output := BIN_OP_PLUS_uxn_device_h_l139_c7_2fde_return_output;

     -- Submodule level 2
     VAR_c_MUX_uxn_device_h_l142_c2_9c93_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c6_19b4_return_output;
     VAR_is_in_bounds_MUX_uxn_device_h_l142_c2_9c93_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c6_19b4_return_output;
     VAR_result_is_blit_done_MUX_uxn_device_h_l142_c2_9c93_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c6_19b4_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c2_9c93_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c6_19b4_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l142_c2_9c93_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c6_19b4_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l142_c2_9c93_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c6_19b4_return_output;
     VAR_x_MUX_uxn_device_h_l142_c2_9c93_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c6_19b4_return_output;
     VAR_y_MUX_uxn_device_h_l142_c2_9c93_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c6_19b4_return_output;
     VAR_MUX_uxn_device_h_l148_c7_aff9_cond := VAR_BIN_OP_EQ_uxn_device_h_l148_c7_d9ed_return_output;
     VAR_MUX_uxn_device_h_l149_c7_2001_cond := VAR_BIN_OP_EQ_uxn_device_h_l149_c7_a69c_return_output;
     VAR_MUX_uxn_device_h_l155_c7_317d_cond := VAR_BIN_OP_EQ_uxn_device_h_l155_c7_1bb1_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_5c5c_var_dim_0 := resize(VAR_BIN_OP_MINUS_uxn_device_h_l148_c46_869f_return_output, 3);
     VAR_x_uxn_device_h_l138_c3_b169 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l138_c7_a99e_return_output, 16);
     VAR_y_uxn_device_h_l139_c3_1ad7 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l139_c7_2fde_return_output, 16);
     VAR_MUX_uxn_device_h_l149_c7_2001_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l149_c35_d1d6_return_output, 16);
     VAR_result_is_blit_done_MUX_uxn_device_h_l142_c2_9c93_iffalse := VAR_MUX_uxn_device_h_l156_c25_368c_return_output;
     VAR_opaque_uxn_device_h_l137_c3_2747 := resize(VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l137_c12_1d9e_return_output, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l132_c6_e258_left := VAR_uint12_7_3_uxn_device_h_l132_c6_22fb_return_output;
     VAR_opaque_MUX_uxn_device_h_l136_c2_ddb0_iftrue := VAR_opaque_uxn_device_h_l137_c3_2747;
     VAR_x_MUX_uxn_device_h_l136_c2_ddb0_iftrue := VAR_x_uxn_device_h_l138_c3_b169;
     VAR_y_MUX_uxn_device_h_l136_c2_ddb0_iftrue := VAR_y_uxn_device_h_l139_c3_1ad7;
     -- BIN_OP_EQ[uxn_device_h_l132_c6_e258] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l132_c6_e258_left <= VAR_BIN_OP_EQ_uxn_device_h_l132_c6_e258_left;
     BIN_OP_EQ_uxn_device_h_l132_c6_e258_right <= VAR_BIN_OP_EQ_uxn_device_h_l132_c6_e258_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l132_c6_e258_return_output := BIN_OP_EQ_uxn_device_h_l132_c6_e258_return_output;

     -- opaque_MUX[uxn_device_h_l136_c2_ddb0] LATENCY=0
     -- Inputs
     opaque_MUX_uxn_device_h_l136_c2_ddb0_cond <= VAR_opaque_MUX_uxn_device_h_l136_c2_ddb0_cond;
     opaque_MUX_uxn_device_h_l136_c2_ddb0_iftrue <= VAR_opaque_MUX_uxn_device_h_l136_c2_ddb0_iftrue;
     opaque_MUX_uxn_device_h_l136_c2_ddb0_iffalse <= VAR_opaque_MUX_uxn_device_h_l136_c2_ddb0_iffalse;
     -- Outputs
     VAR_opaque_MUX_uxn_device_h_l136_c2_ddb0_return_output := opaque_MUX_uxn_device_h_l136_c2_ddb0_return_output;

     -- y_MUX[uxn_device_h_l136_c2_ddb0] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l136_c2_ddb0_cond <= VAR_y_MUX_uxn_device_h_l136_c2_ddb0_cond;
     y_MUX_uxn_device_h_l136_c2_ddb0_iftrue <= VAR_y_MUX_uxn_device_h_l136_c2_ddb0_iftrue;
     y_MUX_uxn_device_h_l136_c2_ddb0_iffalse <= VAR_y_MUX_uxn_device_h_l136_c2_ddb0_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l136_c2_ddb0_return_output := y_MUX_uxn_device_h_l136_c2_ddb0_return_output;

     -- result_is_blit_done_MUX[uxn_device_h_l142_c2_9c93] LATENCY=0
     -- Inputs
     result_is_blit_done_MUX_uxn_device_h_l142_c2_9c93_cond <= VAR_result_is_blit_done_MUX_uxn_device_h_l142_c2_9c93_cond;
     result_is_blit_done_MUX_uxn_device_h_l142_c2_9c93_iftrue <= VAR_result_is_blit_done_MUX_uxn_device_h_l142_c2_9c93_iftrue;
     result_is_blit_done_MUX_uxn_device_h_l142_c2_9c93_iffalse <= VAR_result_is_blit_done_MUX_uxn_device_h_l142_c2_9c93_iffalse;
     -- Outputs
     VAR_result_is_blit_done_MUX_uxn_device_h_l142_c2_9c93_return_output := result_is_blit_done_MUX_uxn_device_h_l142_c2_9c93_return_output;

     -- sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5[uxn_device_h_l132_c2_edb2] LATENCY=0
     VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5_uxn_device_h_l132_c2_edb2_return_output := CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5(
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l133_c3_b824_return_output);

     -- x_MUX[uxn_device_h_l136_c2_ddb0] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l136_c2_ddb0_cond <= VAR_x_MUX_uxn_device_h_l136_c2_ddb0_cond;
     x_MUX_uxn_device_h_l136_c2_ddb0_iftrue <= VAR_x_MUX_uxn_device_h_l136_c2_ddb0_iftrue;
     x_MUX_uxn_device_h_l136_c2_ddb0_iffalse <= VAR_x_MUX_uxn_device_h_l136_c2_ddb0_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l136_c2_ddb0_return_output := x_MUX_uxn_device_h_l136_c2_ddb0_return_output;

     -- Submodule level 3
     VAR_sprite_rows_MUX_uxn_device_h_l132_c2_edb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c6_e258_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l153_c42_1945_left := VAR_opaque_MUX_uxn_device_h_l136_c2_ddb0_return_output;
     REG_VAR_opaque := VAR_opaque_MUX_uxn_device_h_l136_c2_ddb0_return_output;
     VAR_sprite_rows_MUX_uxn_device_h_l132_c2_edb2_iftrue := VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5_uxn_device_h_l132_c2_edb2_return_output;
     VAR_MUX_uxn_device_h_l149_c7_2001_iffalse := VAR_x_MUX_uxn_device_h_l136_c2_ddb0_return_output;
     VAR_x_MUX_uxn_device_h_l142_c2_9c93_iftrue := VAR_x_MUX_uxn_device_h_l136_c2_ddb0_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l155_c41_dec2_left := VAR_y_MUX_uxn_device_h_l136_c2_ddb0_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l155_c51_55b5_left := VAR_y_MUX_uxn_device_h_l136_c2_ddb0_return_output;
     VAR_MUX_uxn_device_h_l155_c7_317d_iffalse := VAR_y_MUX_uxn_device_h_l136_c2_ddb0_return_output;
     VAR_y_MUX_uxn_device_h_l142_c2_9c93_iftrue := VAR_y_MUX_uxn_device_h_l136_c2_ddb0_return_output;
     -- MUX[uxn_device_h_l149_c7_2001] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l149_c7_2001_cond <= VAR_MUX_uxn_device_h_l149_c7_2001_cond;
     MUX_uxn_device_h_l149_c7_2001_iftrue <= VAR_MUX_uxn_device_h_l149_c7_2001_iftrue;
     MUX_uxn_device_h_l149_c7_2001_iffalse <= VAR_MUX_uxn_device_h_l149_c7_2001_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l149_c7_2001_return_output := MUX_uxn_device_h_l149_c7_2001_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l155_c51_55b5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l155_c51_55b5_left <= VAR_BIN_OP_PLUS_uxn_device_h_l155_c51_55b5_left;
     BIN_OP_PLUS_uxn_device_h_l155_c51_55b5_right <= VAR_BIN_OP_PLUS_uxn_device_h_l155_c51_55b5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l155_c51_55b5_return_output := BIN_OP_PLUS_uxn_device_h_l155_c51_55b5_return_output;

     -- sprite_rows_MUX[uxn_device_h_l132_c2_edb2] LATENCY=0
     -- Inputs
     sprite_rows_MUX_uxn_device_h_l132_c2_edb2_cond <= VAR_sprite_rows_MUX_uxn_device_h_l132_c2_edb2_cond;
     sprite_rows_MUX_uxn_device_h_l132_c2_edb2_iftrue <= VAR_sprite_rows_MUX_uxn_device_h_l132_c2_edb2_iftrue;
     sprite_rows_MUX_uxn_device_h_l132_c2_edb2_iffalse <= VAR_sprite_rows_MUX_uxn_device_h_l132_c2_edb2_iffalse;
     -- Outputs
     VAR_sprite_rows_MUX_uxn_device_h_l132_c2_edb2_return_output := sprite_rows_MUX_uxn_device_h_l132_c2_edb2_return_output;

     -- uint16_7_0[uxn_device_h_l151_c39_b2fe] LATENCY=0
     VAR_uint16_7_0_uxn_device_h_l151_c39_b2fe_return_output := uint16_7_0(
     VAR_y_MUX_uxn_device_h_l136_c2_ddb0_return_output);

     -- BIN_OP_MINUS[uxn_device_h_l155_c41_dec2] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l155_c41_dec2_left <= VAR_BIN_OP_MINUS_uxn_device_h_l155_c41_dec2_left;
     BIN_OP_MINUS_uxn_device_h_l155_c41_dec2_right <= VAR_BIN_OP_MINUS_uxn_device_h_l155_c41_dec2_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l155_c41_dec2_return_output := BIN_OP_MINUS_uxn_device_h_l155_c41_dec2_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l155_c35_246b_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l155_c41_dec2_return_output;
     VAR_MUX_uxn_device_h_l155_c35_246b_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l155_c51_55b5_return_output, 16);
     VAR_BIN_OP_MINUS_uxn_device_h_l158_c24_fae8_left := VAR_MUX_uxn_device_h_l149_c7_2001_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l158_c14_7a49_left := VAR_MUX_uxn_device_h_l149_c7_2001_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_5c5c_ref_toks_0 := VAR_sprite_rows_MUX_uxn_device_h_l132_c2_edb2_return_output;
     REG_VAR_sprite_rows := VAR_sprite_rows_MUX_uxn_device_h_l132_c2_edb2_return_output;
     -- MUX[uxn_device_h_l155_c35_246b] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l155_c35_246b_cond <= VAR_MUX_uxn_device_h_l155_c35_246b_cond;
     MUX_uxn_device_h_l155_c35_246b_iftrue <= VAR_MUX_uxn_device_h_l155_c35_246b_iftrue;
     MUX_uxn_device_h_l155_c35_246b_iffalse <= VAR_MUX_uxn_device_h_l155_c35_246b_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l155_c35_246b_return_output := MUX_uxn_device_h_l155_c35_246b_return_output;

     -- uint16_15_8[uxn_device_h_l150_c18_3afd] LATENCY=0
     VAR_uint16_15_8_uxn_device_h_l150_c18_3afd_return_output := uint16_15_8(
     VAR_MUX_uxn_device_h_l149_c7_2001_return_output);

     -- uint16_uint8_8[uxn_device_h_l151_c21_b42d] LATENCY=0
     VAR_uint16_uint8_8_uxn_device_h_l151_c21_b42d_return_output := uint16_uint8_8(
     resize(to_unsigned(0, 1), 16),
     VAR_uint16_7_0_uxn_device_h_l151_c39_b2fe_return_output);

     -- BIN_OP_MINUS[uxn_device_h_l158_c24_fae8] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l158_c24_fae8_left <= VAR_BIN_OP_MINUS_uxn_device_h_l158_c24_fae8_left;
     BIN_OP_MINUS_uxn_device_h_l158_c24_fae8_right <= VAR_BIN_OP_MINUS_uxn_device_h_l158_c24_fae8_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l158_c24_fae8_return_output := BIN_OP_MINUS_uxn_device_h_l158_c24_fae8_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d[uxn_device_h_l148_c34_5c5c] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_5c5c_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_5c5c_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_5c5c_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_5c5c_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_5c5c_return_output := VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_5c5c_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l158_c14_7a49] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l158_c14_7a49_left <= VAR_BIN_OP_PLUS_uxn_device_h_l158_c14_7a49_left;
     BIN_OP_PLUS_uxn_device_h_l158_c14_7a49_right <= VAR_BIN_OP_PLUS_uxn_device_h_l158_c14_7a49_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l158_c14_7a49_return_output := BIN_OP_PLUS_uxn_device_h_l158_c14_7a49_return_output;

     -- uint16_7_0[uxn_device_h_l152_c53_a943] LATENCY=0
     VAR_uint16_7_0_uxn_device_h_l152_c53_a943_return_output := uint16_7_0(
     VAR_MUX_uxn_device_h_l149_c7_2001_return_output);

     -- Submodule level 5
     VAR_MUX_uxn_device_h_l158_c8_7d8a_iffalse := VAR_BIN_OP_MINUS_uxn_device_h_l158_c24_fae8_return_output;
     VAR_MUX_uxn_device_h_l158_c8_7d8a_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l158_c14_7a49_return_output, 16);
     VAR_MUX_uxn_device_h_l155_c7_317d_iftrue := VAR_MUX_uxn_device_h_l155_c35_246b_return_output;
     VAR_MUX_uxn_device_h_l148_c7_aff9_iftrue := VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l148_c34_5c5c_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l150_c18_a27c_left := VAR_uint16_15_8_uxn_device_h_l150_c18_3afd_return_output;
     -- BIN_OP_EQ[uxn_device_h_l150_c18_a27c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l150_c18_a27c_left <= VAR_BIN_OP_EQ_uxn_device_h_l150_c18_a27c_left;
     BIN_OP_EQ_uxn_device_h_l150_c18_a27c_right <= VAR_BIN_OP_EQ_uxn_device_h_l150_c18_a27c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l150_c18_a27c_return_output := BIN_OP_EQ_uxn_device_h_l150_c18_a27c_return_output;

     -- MUX[uxn_device_h_l148_c7_aff9] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l148_c7_aff9_cond <= VAR_MUX_uxn_device_h_l148_c7_aff9_cond;
     MUX_uxn_device_h_l148_c7_aff9_iftrue <= VAR_MUX_uxn_device_h_l148_c7_aff9_iftrue;
     MUX_uxn_device_h_l148_c7_aff9_iffalse <= VAR_MUX_uxn_device_h_l148_c7_aff9_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l148_c7_aff9_return_output := MUX_uxn_device_h_l148_c7_aff9_return_output;

     -- uint16_uint8_0[uxn_device_h_l152_c21_f080] LATENCY=0
     VAR_uint16_uint8_0_uxn_device_h_l152_c21_f080_return_output := uint16_uint8_0(
     VAR_uint16_uint8_8_uxn_device_h_l151_c21_b42d_return_output,
     VAR_uint16_7_0_uxn_device_h_l152_c53_a943_return_output);

     -- MUX[uxn_device_h_l155_c7_317d] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l155_c7_317d_cond <= VAR_MUX_uxn_device_h_l155_c7_317d_cond;
     MUX_uxn_device_h_l155_c7_317d_iftrue <= VAR_MUX_uxn_device_h_l155_c7_317d_iftrue;
     MUX_uxn_device_h_l155_c7_317d_iffalse <= VAR_MUX_uxn_device_h_l155_c7_317d_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l155_c7_317d_return_output := MUX_uxn_device_h_l155_c7_317d_return_output;

     -- MUX[uxn_device_h_l158_c8_7d8a] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l158_c8_7d8a_cond <= VAR_MUX_uxn_device_h_l158_c8_7d8a_cond;
     MUX_uxn_device_h_l158_c8_7d8a_iftrue <= VAR_MUX_uxn_device_h_l158_c8_7d8a_iftrue;
     MUX_uxn_device_h_l158_c8_7d8a_iffalse <= VAR_MUX_uxn_device_h_l158_c8_7d8a_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l158_c8_7d8a_return_output := MUX_uxn_device_h_l158_c8_7d8a_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_device_h_l150_c18_c349_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c18_a27c_return_output;
     VAR_CONST_SR_1_uxn_device_h_l157_c3_24a4_x := VAR_MUX_uxn_device_h_l148_c7_aff9_return_output;
     VAR_y_MUX_uxn_device_h_l142_c2_9c93_iffalse := VAR_MUX_uxn_device_h_l155_c7_317d_return_output;
     VAR_x_MUX_uxn_device_h_l142_c2_9c93_iffalse := VAR_MUX_uxn_device_h_l158_c8_7d8a_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l142_c2_9c93_iffalse := VAR_uint16_uint8_0_uxn_device_h_l152_c21_f080_return_output;
     -- CONST_SR_1[uxn_device_h_l157_c3_24a4] LATENCY=0
     -- Inputs
     CONST_SR_1_uxn_device_h_l157_c3_24a4_x <= VAR_CONST_SR_1_uxn_device_h_l157_c3_24a4_x;
     -- Outputs
     VAR_CONST_SR_1_uxn_device_h_l157_c3_24a4_return_output := CONST_SR_1_uxn_device_h_l157_c3_24a4_return_output;

     -- uint8_0_0_uxn_device_h_l153_l154_DUPLICATE_245d LATENCY=0
     VAR_uint8_0_0_uxn_device_h_l153_l154_DUPLICATE_245d_return_output := uint8_0_0(
     VAR_MUX_uxn_device_h_l148_c7_aff9_return_output);

     -- MUX[uxn_device_h_l150_c18_c349] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l150_c18_c349_cond <= VAR_MUX_uxn_device_h_l150_c18_c349_cond;
     MUX_uxn_device_h_l150_c18_c349_iftrue <= VAR_MUX_uxn_device_h_l150_c18_c349_iftrue;
     MUX_uxn_device_h_l150_c18_c349_iffalse <= VAR_MUX_uxn_device_h_l150_c18_c349_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l150_c18_c349_return_output := MUX_uxn_device_h_l150_c18_c349_return_output;

     -- x_MUX[uxn_device_h_l142_c2_9c93] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l142_c2_9c93_cond <= VAR_x_MUX_uxn_device_h_l142_c2_9c93_cond;
     x_MUX_uxn_device_h_l142_c2_9c93_iftrue <= VAR_x_MUX_uxn_device_h_l142_c2_9c93_iftrue;
     x_MUX_uxn_device_h_l142_c2_9c93_iffalse <= VAR_x_MUX_uxn_device_h_l142_c2_9c93_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l142_c2_9c93_return_output := x_MUX_uxn_device_h_l142_c2_9c93_return_output;

     -- y_MUX[uxn_device_h_l142_c2_9c93] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l142_c2_9c93_cond <= VAR_y_MUX_uxn_device_h_l142_c2_9c93_cond;
     y_MUX_uxn_device_h_l142_c2_9c93_iftrue <= VAR_y_MUX_uxn_device_h_l142_c2_9c93_iftrue;
     y_MUX_uxn_device_h_l142_c2_9c93_iffalse <= VAR_y_MUX_uxn_device_h_l142_c2_9c93_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l142_c2_9c93_return_output := y_MUX_uxn_device_h_l142_c2_9c93_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l142_c2_9c93] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l142_c2_9c93_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l142_c2_9c93_cond;
     result_u16_addr_MUX_uxn_device_h_l142_c2_9c93_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l142_c2_9c93_iftrue;
     result_u16_addr_MUX_uxn_device_h_l142_c2_9c93_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l142_c2_9c93_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l142_c2_9c93_return_output := result_u16_addr_MUX_uxn_device_h_l142_c2_9c93_return_output;

     -- Submodule level 7
     VAR_c_MUX_uxn_device_h_l142_c2_9c93_iffalse := VAR_CONST_SR_1_uxn_device_h_l157_c3_24a4_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l153_c26_5b05_left := VAR_MUX_uxn_device_h_l150_c18_c349_return_output;
     VAR_is_in_bounds_MUX_uxn_device_h_l142_c2_9c93_iffalse := VAR_MUX_uxn_device_h_l150_c18_c349_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l153_c42_1945_right := VAR_uint8_0_0_uxn_device_h_l153_l154_DUPLICATE_245d_return_output;
     VAR_MUX_uxn_device_h_l154_c40_7ce8_cond := VAR_uint8_0_0_uxn_device_h_l153_l154_DUPLICATE_245d_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l142_c2_9c93_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l142_c2_9c93_return_output;
     -- MUX[uxn_device_h_l154_c40_7ce8] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l154_c40_7ce8_cond <= VAR_MUX_uxn_device_h_l154_c40_7ce8_cond;
     MUX_uxn_device_h_l154_c40_7ce8_iftrue <= VAR_MUX_uxn_device_h_l154_c40_7ce8_iftrue;
     MUX_uxn_device_h_l154_c40_7ce8_iffalse <= VAR_MUX_uxn_device_h_l154_c40_7ce8_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l154_c40_7ce8_return_output := MUX_uxn_device_h_l154_c40_7ce8_return_output;

     -- is_in_bounds_MUX[uxn_device_h_l142_c2_9c93] LATENCY=0
     -- Inputs
     is_in_bounds_MUX_uxn_device_h_l142_c2_9c93_cond <= VAR_is_in_bounds_MUX_uxn_device_h_l142_c2_9c93_cond;
     is_in_bounds_MUX_uxn_device_h_l142_c2_9c93_iftrue <= VAR_is_in_bounds_MUX_uxn_device_h_l142_c2_9c93_iftrue;
     is_in_bounds_MUX_uxn_device_h_l142_c2_9c93_iffalse <= VAR_is_in_bounds_MUX_uxn_device_h_l142_c2_9c93_iffalse;
     -- Outputs
     VAR_is_in_bounds_MUX_uxn_device_h_l142_c2_9c93_return_output := is_in_bounds_MUX_uxn_device_h_l142_c2_9c93_return_output;

     -- BIN_OP_OR[uxn_device_h_l153_c42_1945] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l153_c42_1945_left <= VAR_BIN_OP_OR_uxn_device_h_l153_c42_1945_left;
     BIN_OP_OR_uxn_device_h_l153_c42_1945_right <= VAR_BIN_OP_OR_uxn_device_h_l153_c42_1945_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l153_c42_1945_return_output := BIN_OP_OR_uxn_device_h_l153_c42_1945_return_output;

     -- c_MUX[uxn_device_h_l142_c2_9c93] LATENCY=0
     -- Inputs
     c_MUX_uxn_device_h_l142_c2_9c93_cond <= VAR_c_MUX_uxn_device_h_l142_c2_9c93_cond;
     c_MUX_uxn_device_h_l142_c2_9c93_iftrue <= VAR_c_MUX_uxn_device_h_l142_c2_9c93_iftrue;
     c_MUX_uxn_device_h_l142_c2_9c93_iffalse <= VAR_c_MUX_uxn_device_h_l142_c2_9c93_iffalse;
     -- Outputs
     VAR_c_MUX_uxn_device_h_l142_c2_9c93_return_output := c_MUX_uxn_device_h_l142_c2_9c93_return_output;

     -- Submodule level 8
     VAR_BIN_OP_AND_uxn_device_h_l153_c26_5b05_right := VAR_BIN_OP_OR_uxn_device_h_l153_c42_1945_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l154_c30_03b5_right := VAR_MUX_uxn_device_h_l154_c40_7ce8_return_output;
     REG_VAR_c := VAR_c_MUX_uxn_device_h_l142_c2_9c93_return_output;
     REG_VAR_is_in_bounds := VAR_is_in_bounds_MUX_uxn_device_h_l142_c2_9c93_return_output;
     -- BIN_OP_PLUS[uxn_device_h_l154_c30_03b5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l154_c30_03b5_left <= VAR_BIN_OP_PLUS_uxn_device_h_l154_c30_03b5_left;
     BIN_OP_PLUS_uxn_device_h_l154_c30_03b5_right <= VAR_BIN_OP_PLUS_uxn_device_h_l154_c30_03b5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l154_c30_03b5_return_output := BIN_OP_PLUS_uxn_device_h_l154_c30_03b5_return_output;

     -- BIN_OP_AND[uxn_device_h_l153_c26_5b05] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l153_c26_5b05_left <= VAR_BIN_OP_AND_uxn_device_h_l153_c26_5b05_left;
     BIN_OP_AND_uxn_device_h_l153_c26_5b05_right <= VAR_BIN_OP_AND_uxn_device_h_l153_c26_5b05_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l153_c26_5b05_return_output := BIN_OP_AND_uxn_device_h_l153_c26_5b05_return_output;

     -- Submodule level 9
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c2_9c93_iffalse := VAR_BIN_OP_AND_uxn_device_h_l153_c26_5b05_return_output;
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_f3d6_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l154_c30_03b5_return_output, 6);
     -- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l154_c21_f3d6] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_f3d6_ref_toks_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_f3d6_ref_toks_0;
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_f3d6_var_dim_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_f3d6_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_f3d6_return_output := VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_f3d6_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l142_c2_9c93] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l142_c2_9c93_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l142_c2_9c93_cond;
     result_is_vram_write_MUX_uxn_device_h_l142_c2_9c93_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l142_c2_9c93_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l142_c2_9c93_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l142_c2_9c93_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c2_9c93_return_output := result_is_vram_write_MUX_uxn_device_h_l142_c2_9c93_return_output;

     -- Submodule level 10
     VAR_result_u8_value_uxn_device_h_l154_c3_a10d := resize(VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l154_c21_f3d6_return_output, 8);
     VAR_result_u8_value_MUX_uxn_device_h_l142_c2_9c93_iffalse := VAR_result_u8_value_uxn_device_h_l154_c3_a10d;
     -- result_u8_value_MUX[uxn_device_h_l142_c2_9c93] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l142_c2_9c93_cond <= VAR_result_u8_value_MUX_uxn_device_h_l142_c2_9c93_cond;
     result_u8_value_MUX_uxn_device_h_l142_c2_9c93_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l142_c2_9c93_iftrue;
     result_u8_value_MUX_uxn_device_h_l142_c2_9c93_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l142_c2_9c93_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l142_c2_9c93_return_output := result_u8_value_MUX_uxn_device_h_l142_c2_9c93_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_128d_uxn_device_h_l161_l109_DUPLICATE_c106 LATENCY=0
     VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_128d_uxn_device_h_l161_l109_DUPLICATE_c106_return_output := CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_128d(
     result,
     VAR_result_is_blit_done_MUX_uxn_device_h_l142_c2_9c93_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l142_c2_9c93_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c2_9c93_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l142_c2_9c93_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_128d_uxn_device_h_l161_l109_DUPLICATE_c106_return_output;
     VAR_return_output := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_128d_uxn_device_h_l161_l109_DUPLICATE_c106_return_output;
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
