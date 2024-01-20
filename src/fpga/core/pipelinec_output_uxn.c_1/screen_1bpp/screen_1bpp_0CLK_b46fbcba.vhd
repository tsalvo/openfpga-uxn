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
-- Submodules: 56
entity screen_1bpp_0CLK_b46fbcba is
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
end screen_1bpp_0CLK_b46fbcba;
architecture arch of screen_1bpp_0CLK_b46fbcba is
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
signal xmod : unsigned(7 downto 0) := to_unsigned(0, 8);
signal opaque : unsigned(0 downto 0) := to_unsigned(0, 1);
signal c : unsigned(7 downto 0) := to_unsigned(0, 8);
signal color8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : screen_blit_result_t := screen_blit_result_t_NULL;
signal phase_minus_two : unsigned(7 downto 0) := to_unsigned(0, 8);
signal phase7_downto_3 : unsigned(4 downto 0) := to_unsigned(0, 5);
signal phase2_downto_0 : unsigned(2 downto 0) := to_unsigned(0, 3);
signal sprite_rows : uint8_t_8 := (others => to_unsigned(0, 8));
signal REG_COMB_blending : uint2_t_48;
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);
signal REG_COMB_xmod : unsigned(7 downto 0);
signal REG_COMB_opaque : unsigned(0 downto 0);
signal REG_COMB_c : unsigned(7 downto 0);
signal REG_COMB_color8 : unsigned(7 downto 0);
signal REG_COMB_result : screen_blit_result_t;
signal REG_COMB_phase_minus_two : unsigned(7 downto 0);
signal REG_COMB_phase7_downto_3 : unsigned(4 downto 0);
signal REG_COMB_phase2_downto_0 : unsigned(2 downto 0);
signal REG_COMB_sprite_rows : uint8_t_8;

-- Each function instance gets signals
-- BIN_OP_MINUS[uxn_device_h_l122_c20_f924]
signal BIN_OP_MINUS_uxn_device_h_l122_c20_f924_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l122_c20_f924_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l122_c20_f924_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l124_c6_05b4]
signal BIN_OP_EQ_uxn_device_h_l124_c6_05b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l124_c6_05b4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l124_c6_05b4_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l124_c2_defe]
signal y_MUX_uxn_device_h_l124_c2_defe_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l124_c2_defe_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l124_c2_defe_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l124_c2_defe_return_output : unsigned(15 downto 0);

-- xmod_MUX[uxn_device_h_l124_c2_defe]
signal xmod_MUX_uxn_device_h_l124_c2_defe_cond : unsigned(0 downto 0);
signal xmod_MUX_uxn_device_h_l124_c2_defe_iftrue : unsigned(7 downto 0);
signal xmod_MUX_uxn_device_h_l124_c2_defe_iffalse : unsigned(7 downto 0);
signal xmod_MUX_uxn_device_h_l124_c2_defe_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l124_c2_defe]
signal x_MUX_uxn_device_h_l124_c2_defe_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l124_c2_defe_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l124_c2_defe_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l124_c2_defe_return_output : unsigned(15 downto 0);

-- opaque_MUX[uxn_device_h_l124_c2_defe]
signal opaque_MUX_uxn_device_h_l124_c2_defe_cond : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l124_c2_defe_iftrue : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l124_c2_defe_iffalse : unsigned(0 downto 0);
signal opaque_MUX_uxn_device_h_l124_c2_defe_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l125_c21_8444]
signal BIN_OP_PLUS_uxn_device_h_l125_c21_8444_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l125_c21_8444_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l125_c21_8444_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l125_c12_1f60]
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l125_c12_1f60_ref_toks_0 : uint2_t_48;
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l125_c12_1f60_var_dim_0 : unsigned(5 downto 0);
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l125_c12_1f60_return_output : unsigned(1 downto 0);

-- MUX[uxn_device_h_l126_c10_2d71]
signal MUX_uxn_device_h_l126_c10_2d71_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l126_c10_2d71_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l126_c10_2d71_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l126_c10_2d71_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l127_c7_2315]
signal BIN_OP_PLUS_uxn_device_h_l127_c7_2315_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l127_c7_2315_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l127_c7_2315_return_output : unsigned(8 downto 0);

-- MUX[uxn_device_h_l128_c13_6877]
signal MUX_uxn_device_h_l128_c13_6877_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l128_c13_6877_iftrue : unsigned(2 downto 0);
signal MUX_uxn_device_h_l128_c13_6877_iffalse : unsigned(2 downto 0);
signal MUX_uxn_device_h_l128_c13_6877_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l128_c7_2073]
signal BIN_OP_PLUS_uxn_device_h_l128_c7_2073_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l128_c7_2073_right : unsigned(2 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l128_c7_2073_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_device_h_l131_c6_79be]
signal BIN_OP_EQ_uxn_device_h_l131_c6_79be_left : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l131_c6_79be_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l131_c6_79be_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l131_c2_5d4a]
signal y_MUX_uxn_device_h_l131_c2_5d4a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l131_c2_5d4a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l131_c2_5d4a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l131_c2_5d4a_return_output : unsigned(15 downto 0);

-- c_MUX[uxn_device_h_l131_c2_5d4a]
signal c_MUX_uxn_device_h_l131_c2_5d4a_cond : unsigned(0 downto 0);
signal c_MUX_uxn_device_h_l131_c2_5d4a_iftrue : unsigned(7 downto 0);
signal c_MUX_uxn_device_h_l131_c2_5d4a_iffalse : unsigned(7 downto 0);
signal c_MUX_uxn_device_h_l131_c2_5d4a_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l131_c2_5d4a]
signal x_MUX_uxn_device_h_l131_c2_5d4a_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l131_c2_5d4a_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l131_c2_5d4a_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l131_c2_5d4a_return_output : unsigned(15 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l131_c2_5d4a]
signal result_u16_addr_MUX_uxn_device_h_l131_c2_5d4a_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l131_c2_5d4a_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l131_c2_5d4a_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l131_c2_5d4a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_device_h_l131_c2_5d4a]
signal result_u8_value_MUX_uxn_device_h_l131_c2_5d4a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l131_c2_5d4a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l131_c2_5d4a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l131_c2_5d4a_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l131_c2_5d4a]
signal result_is_vram_write_MUX_uxn_device_h_l131_c2_5d4a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l131_c2_5d4a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l131_c2_5d4a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l131_c2_5d4a_return_output : unsigned(0 downto 0);

-- result_is_blit_done_MUX[uxn_device_h_l131_c2_5d4a]
signal result_is_blit_done_MUX_uxn_device_h_l131_c2_5d4a_cond : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l131_c2_5d4a_iftrue : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l131_c2_5d4a_iffalse : unsigned(0 downto 0);
signal result_is_blit_done_MUX_uxn_device_h_l131_c2_5d4a_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l135_c21_719b]
signal BIN_OP_PLUS_uxn_device_h_l135_c21_719b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l135_c21_719b_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l135_c21_719b_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l137_c7_1436]
signal BIN_OP_EQ_uxn_device_h_l137_c7_1436_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c7_1436_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c7_1436_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l137_c46_18e0]
signal BIN_OP_MINUS_uxn_device_h_l137_c46_18e0_left : unsigned(4 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l137_c46_18e0_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l137_c46_18e0_return_output : unsigned(4 downto 0);

-- VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d[uxn_device_h_l137_c34_9559]
signal VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l137_c34_9559_ref_toks_0 : uint8_t_8;
signal VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l137_c34_9559_var_dim_0 : unsigned(2 downto 0);
signal VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l137_c34_9559_return_output : unsigned(7 downto 0);

-- CONST_SR_1[uxn_device_h_l137_c69_a165]
signal CONST_SR_1_uxn_device_h_l137_c69_a165_x : unsigned(7 downto 0);
signal CONST_SR_1_uxn_device_h_l137_c69_a165_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l137_c7_8f38]
signal MUX_uxn_device_h_l137_c7_8f38_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l137_c7_8f38_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l137_c7_8f38_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l137_c7_8f38_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l138_c7_ab06]
signal BIN_OP_EQ_uxn_device_h_l138_c7_ab06_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l138_c7_ab06_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l138_c7_ab06_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l138_c35_e41f]
signal BIN_OP_PLUS_uxn_device_h_l138_c35_e41f_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l138_c35_e41f_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l138_c35_e41f_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l138_c55_6f41]
signal BIN_OP_PLUS_uxn_device_h_l138_c55_6f41_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l138_c55_6f41_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l138_c55_6f41_return_output : unsigned(16 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l138_c65_5b8d]
signal BIN_OP_MINUS_uxn_device_h_l138_c65_5b8d_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l138_c65_5b8d_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l138_c65_5b8d_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l138_c49_f52b]
signal MUX_uxn_device_h_l138_c49_f52b_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l138_c49_f52b_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l138_c49_f52b_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l138_c49_f52b_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l138_c7_d7f4]
signal MUX_uxn_device_h_l138_c7_d7f4_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l138_c7_d7f4_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l138_c7_d7f4_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l138_c7_d7f4_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_device_h_l139_c22_f8fb]
signal CONST_SL_8_uxn_device_h_l139_c22_f8fb_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_device_h_l139_c22_f8fb_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l139_c22_7bfe]
signal BIN_OP_PLUS_uxn_device_h_l139_c22_7bfe_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l139_c22_7bfe_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l139_c22_7bfe_return_output : unsigned(16 downto 0);

-- BIN_OP_OR[uxn_device_h_l140_c26_a831]
signal BIN_OP_OR_uxn_device_h_l140_c26_a831_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l140_c26_a831_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l140_c26_a831_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l141_c40_43bc]
signal MUX_uxn_device_h_l141_c40_43bc_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l141_c40_43bc_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l141_c40_43bc_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l141_c40_43bc_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l141_c30_702d]
signal BIN_OP_PLUS_uxn_device_h_l141_c30_702d_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l141_c30_702d_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l141_c30_702d_return_output : unsigned(8 downto 0);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l141_c21_5023]
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l141_c21_5023_ref_toks_0 : uint2_t_48;
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l141_c21_5023_var_dim_0 : unsigned(5 downto 0);
signal VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l141_c21_5023_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l142_c7_46e6]
signal BIN_OP_EQ_uxn_device_h_l142_c7_46e6_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l142_c7_46e6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l142_c7_46e6_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l142_c41_0b5f]
signal BIN_OP_MINUS_uxn_device_h_l142_c41_0b5f_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l142_c41_0b5f_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l142_c41_0b5f_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l142_c51_62f1]
signal BIN_OP_PLUS_uxn_device_h_l142_c51_62f1_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l142_c51_62f1_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l142_c51_62f1_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l142_c35_9a8b]
signal MUX_uxn_device_h_l142_c35_9a8b_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l142_c35_9a8b_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l142_c35_9a8b_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l142_c35_9a8b_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l142_c7_668f]
signal MUX_uxn_device_h_l142_c7_668f_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l142_c7_668f_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l142_c7_668f_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l142_c7_668f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l143_c25_4e69]
signal BIN_OP_EQ_uxn_device_h_l143_c25_4e69_left : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c25_4e69_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c25_4e69_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l143_c53_c605]
signal BIN_OP_EQ_uxn_device_h_l143_c53_c605_left : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c53_c605_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c53_c605_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l143_c25_f11f]
signal BIN_OP_AND_uxn_device_h_l143_c25_f11f_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l143_c25_f11f_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l143_c25_f11f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l146_c6_94fc]
signal BIN_OP_EQ_uxn_device_h_l146_c6_94fc_left : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_device_h_l146_c6_94fc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l146_c6_94fc_return_output : unsigned(0 downto 0);

-- sprite_rows_MUX[uxn_device_h_l146_c2_5340]
signal sprite_rows_MUX_uxn_device_h_l146_c2_5340_cond : unsigned(0 downto 0);
signal sprite_rows_MUX_uxn_device_h_l146_c2_5340_iftrue : uint8_t_8;
signal sprite_rows_MUX_uxn_device_h_l146_c2_5340_iffalse : uint8_t_8;
signal sprite_rows_MUX_uxn_device_h_l146_c2_5340_return_output : uint8_t_8;

-- VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8[uxn_device_h_l147_c3_f60c]
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l147_c3_f60c_elem_val : unsigned(7 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l147_c3_f60c_ref_toks_0 : uint8_t_8;
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l147_c3_f60c_var_dim_0 : unsigned(2 downto 0);
signal VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l147_c3_f60c_return_output : uint8_t_array_8_t;

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

function CAST_TO_uint8_t_uint4_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(3 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5( ref_toks_0 : uint8_t_array_8_t) return uint8_t_8 is
 
  variable base : uint8_t_8; 
  variable return_output : uint8_t_8;
begin
      base(0) := ref_toks_0.data(0);
      base(6) := ref_toks_0.data(6);
      base(3) := ref_toks_0.data(3);
      base(2) := ref_toks_0.data(2);
      base(5) := ref_toks_0.data(5);
      base(4) := ref_toks_0.data(4);
      base(1) := ref_toks_0.data(1);
      base(7) := ref_toks_0.data(7);

      return_output := base;
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

function CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_cd45( ref_toks_0 : screen_blit_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return screen_blit_result_t is
 
  variable base : screen_blit_result_t; 
  variable return_output : screen_blit_result_t;
begin
      base := ref_toks_0;
      base.u16_addr := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_blit_done := ref_toks_4;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_MINUS_uxn_device_h_l122_c20_f924
BIN_OP_MINUS_uxn_device_h_l122_c20_f924 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l122_c20_f924_left,
BIN_OP_MINUS_uxn_device_h_l122_c20_f924_right,
BIN_OP_MINUS_uxn_device_h_l122_c20_f924_return_output);

-- BIN_OP_EQ_uxn_device_h_l124_c6_05b4
BIN_OP_EQ_uxn_device_h_l124_c6_05b4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l124_c6_05b4_left,
BIN_OP_EQ_uxn_device_h_l124_c6_05b4_right,
BIN_OP_EQ_uxn_device_h_l124_c6_05b4_return_output);

-- y_MUX_uxn_device_h_l124_c2_defe
y_MUX_uxn_device_h_l124_c2_defe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l124_c2_defe_cond,
y_MUX_uxn_device_h_l124_c2_defe_iftrue,
y_MUX_uxn_device_h_l124_c2_defe_iffalse,
y_MUX_uxn_device_h_l124_c2_defe_return_output);

-- xmod_MUX_uxn_device_h_l124_c2_defe
xmod_MUX_uxn_device_h_l124_c2_defe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
xmod_MUX_uxn_device_h_l124_c2_defe_cond,
xmod_MUX_uxn_device_h_l124_c2_defe_iftrue,
xmod_MUX_uxn_device_h_l124_c2_defe_iffalse,
xmod_MUX_uxn_device_h_l124_c2_defe_return_output);

-- x_MUX_uxn_device_h_l124_c2_defe
x_MUX_uxn_device_h_l124_c2_defe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l124_c2_defe_cond,
x_MUX_uxn_device_h_l124_c2_defe_iftrue,
x_MUX_uxn_device_h_l124_c2_defe_iffalse,
x_MUX_uxn_device_h_l124_c2_defe_return_output);

-- opaque_MUX_uxn_device_h_l124_c2_defe
opaque_MUX_uxn_device_h_l124_c2_defe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
opaque_MUX_uxn_device_h_l124_c2_defe_cond,
opaque_MUX_uxn_device_h_l124_c2_defe_iftrue,
opaque_MUX_uxn_device_h_l124_c2_defe_iffalse,
opaque_MUX_uxn_device_h_l124_c2_defe_return_output);

-- BIN_OP_PLUS_uxn_device_h_l125_c21_8444
BIN_OP_PLUS_uxn_device_h_l125_c21_8444 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l125_c21_8444_left,
BIN_OP_PLUS_uxn_device_h_l125_c21_8444_right,
BIN_OP_PLUS_uxn_device_h_l125_c21_8444_return_output);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l125_c12_1f60
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l125_c12_1f60 : entity work.VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_0CLK_f9daebf3 port map (
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l125_c12_1f60_ref_toks_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l125_c12_1f60_var_dim_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l125_c12_1f60_return_output);

-- MUX_uxn_device_h_l126_c10_2d71
MUX_uxn_device_h_l126_c10_2d71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l126_c10_2d71_cond,
MUX_uxn_device_h_l126_c10_2d71_iftrue,
MUX_uxn_device_h_l126_c10_2d71_iffalse,
MUX_uxn_device_h_l126_c10_2d71_return_output);

-- BIN_OP_PLUS_uxn_device_h_l127_c7_2315
BIN_OP_PLUS_uxn_device_h_l127_c7_2315 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l127_c7_2315_left,
BIN_OP_PLUS_uxn_device_h_l127_c7_2315_right,
BIN_OP_PLUS_uxn_device_h_l127_c7_2315_return_output);

-- MUX_uxn_device_h_l128_c13_6877
MUX_uxn_device_h_l128_c13_6877 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l128_c13_6877_cond,
MUX_uxn_device_h_l128_c13_6877_iftrue,
MUX_uxn_device_h_l128_c13_6877_iffalse,
MUX_uxn_device_h_l128_c13_6877_return_output);

-- BIN_OP_PLUS_uxn_device_h_l128_c7_2073
BIN_OP_PLUS_uxn_device_h_l128_c7_2073 : entity work.BIN_OP_PLUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l128_c7_2073_left,
BIN_OP_PLUS_uxn_device_h_l128_c7_2073_right,
BIN_OP_PLUS_uxn_device_h_l128_c7_2073_return_output);

-- BIN_OP_EQ_uxn_device_h_l131_c6_79be
BIN_OP_EQ_uxn_device_h_l131_c6_79be : entity work.BIN_OP_EQ_uint5_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l131_c6_79be_left,
BIN_OP_EQ_uxn_device_h_l131_c6_79be_right,
BIN_OP_EQ_uxn_device_h_l131_c6_79be_return_output);

-- y_MUX_uxn_device_h_l131_c2_5d4a
y_MUX_uxn_device_h_l131_c2_5d4a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l131_c2_5d4a_cond,
y_MUX_uxn_device_h_l131_c2_5d4a_iftrue,
y_MUX_uxn_device_h_l131_c2_5d4a_iffalse,
y_MUX_uxn_device_h_l131_c2_5d4a_return_output);

-- c_MUX_uxn_device_h_l131_c2_5d4a
c_MUX_uxn_device_h_l131_c2_5d4a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
c_MUX_uxn_device_h_l131_c2_5d4a_cond,
c_MUX_uxn_device_h_l131_c2_5d4a_iftrue,
c_MUX_uxn_device_h_l131_c2_5d4a_iffalse,
c_MUX_uxn_device_h_l131_c2_5d4a_return_output);

-- x_MUX_uxn_device_h_l131_c2_5d4a
x_MUX_uxn_device_h_l131_c2_5d4a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l131_c2_5d4a_cond,
x_MUX_uxn_device_h_l131_c2_5d4a_iftrue,
x_MUX_uxn_device_h_l131_c2_5d4a_iffalse,
x_MUX_uxn_device_h_l131_c2_5d4a_return_output);

-- result_u16_addr_MUX_uxn_device_h_l131_c2_5d4a
result_u16_addr_MUX_uxn_device_h_l131_c2_5d4a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l131_c2_5d4a_cond,
result_u16_addr_MUX_uxn_device_h_l131_c2_5d4a_iftrue,
result_u16_addr_MUX_uxn_device_h_l131_c2_5d4a_iffalse,
result_u16_addr_MUX_uxn_device_h_l131_c2_5d4a_return_output);

-- result_u8_value_MUX_uxn_device_h_l131_c2_5d4a
result_u8_value_MUX_uxn_device_h_l131_c2_5d4a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l131_c2_5d4a_cond,
result_u8_value_MUX_uxn_device_h_l131_c2_5d4a_iftrue,
result_u8_value_MUX_uxn_device_h_l131_c2_5d4a_iffalse,
result_u8_value_MUX_uxn_device_h_l131_c2_5d4a_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l131_c2_5d4a
result_is_vram_write_MUX_uxn_device_h_l131_c2_5d4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l131_c2_5d4a_cond,
result_is_vram_write_MUX_uxn_device_h_l131_c2_5d4a_iftrue,
result_is_vram_write_MUX_uxn_device_h_l131_c2_5d4a_iffalse,
result_is_vram_write_MUX_uxn_device_h_l131_c2_5d4a_return_output);

-- result_is_blit_done_MUX_uxn_device_h_l131_c2_5d4a
result_is_blit_done_MUX_uxn_device_h_l131_c2_5d4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_blit_done_MUX_uxn_device_h_l131_c2_5d4a_cond,
result_is_blit_done_MUX_uxn_device_h_l131_c2_5d4a_iftrue,
result_is_blit_done_MUX_uxn_device_h_l131_c2_5d4a_iffalse,
result_is_blit_done_MUX_uxn_device_h_l131_c2_5d4a_return_output);

-- BIN_OP_PLUS_uxn_device_h_l135_c21_719b
BIN_OP_PLUS_uxn_device_h_l135_c21_719b : entity work.BIN_OP_PLUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l135_c21_719b_left,
BIN_OP_PLUS_uxn_device_h_l135_c21_719b_right,
BIN_OP_PLUS_uxn_device_h_l135_c21_719b_return_output);

-- BIN_OP_EQ_uxn_device_h_l137_c7_1436
BIN_OP_EQ_uxn_device_h_l137_c7_1436 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l137_c7_1436_left,
BIN_OP_EQ_uxn_device_h_l137_c7_1436_right,
BIN_OP_EQ_uxn_device_h_l137_c7_1436_return_output);

-- BIN_OP_MINUS_uxn_device_h_l137_c46_18e0
BIN_OP_MINUS_uxn_device_h_l137_c46_18e0 : entity work.BIN_OP_MINUS_uint5_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l137_c46_18e0_left,
BIN_OP_MINUS_uxn_device_h_l137_c46_18e0_right,
BIN_OP_MINUS_uxn_device_h_l137_c46_18e0_return_output);

-- VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l137_c34_9559
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l137_c34_9559 : entity work.VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_0CLK_814e9c60 port map (
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l137_c34_9559_ref_toks_0,
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l137_c34_9559_var_dim_0,
VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l137_c34_9559_return_output);

-- CONST_SR_1_uxn_device_h_l137_c69_a165
CONST_SR_1_uxn_device_h_l137_c69_a165 : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_uxn_device_h_l137_c69_a165_x,
CONST_SR_1_uxn_device_h_l137_c69_a165_return_output);

-- MUX_uxn_device_h_l137_c7_8f38
MUX_uxn_device_h_l137_c7_8f38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l137_c7_8f38_cond,
MUX_uxn_device_h_l137_c7_8f38_iftrue,
MUX_uxn_device_h_l137_c7_8f38_iffalse,
MUX_uxn_device_h_l137_c7_8f38_return_output);

-- BIN_OP_EQ_uxn_device_h_l138_c7_ab06
BIN_OP_EQ_uxn_device_h_l138_c7_ab06 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l138_c7_ab06_left,
BIN_OP_EQ_uxn_device_h_l138_c7_ab06_right,
BIN_OP_EQ_uxn_device_h_l138_c7_ab06_return_output);

-- BIN_OP_PLUS_uxn_device_h_l138_c35_e41f
BIN_OP_PLUS_uxn_device_h_l138_c35_e41f : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l138_c35_e41f_left,
BIN_OP_PLUS_uxn_device_h_l138_c35_e41f_right,
BIN_OP_PLUS_uxn_device_h_l138_c35_e41f_return_output);

-- BIN_OP_PLUS_uxn_device_h_l138_c55_6f41
BIN_OP_PLUS_uxn_device_h_l138_c55_6f41 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l138_c55_6f41_left,
BIN_OP_PLUS_uxn_device_h_l138_c55_6f41_right,
BIN_OP_PLUS_uxn_device_h_l138_c55_6f41_return_output);

-- BIN_OP_MINUS_uxn_device_h_l138_c65_5b8d
BIN_OP_MINUS_uxn_device_h_l138_c65_5b8d : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l138_c65_5b8d_left,
BIN_OP_MINUS_uxn_device_h_l138_c65_5b8d_right,
BIN_OP_MINUS_uxn_device_h_l138_c65_5b8d_return_output);

-- MUX_uxn_device_h_l138_c49_f52b
MUX_uxn_device_h_l138_c49_f52b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l138_c49_f52b_cond,
MUX_uxn_device_h_l138_c49_f52b_iftrue,
MUX_uxn_device_h_l138_c49_f52b_iffalse,
MUX_uxn_device_h_l138_c49_f52b_return_output);

-- MUX_uxn_device_h_l138_c7_d7f4
MUX_uxn_device_h_l138_c7_d7f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l138_c7_d7f4_cond,
MUX_uxn_device_h_l138_c7_d7f4_iftrue,
MUX_uxn_device_h_l138_c7_d7f4_iffalse,
MUX_uxn_device_h_l138_c7_d7f4_return_output);

-- CONST_SL_8_uxn_device_h_l139_c22_f8fb
CONST_SL_8_uxn_device_h_l139_c22_f8fb : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_device_h_l139_c22_f8fb_x,
CONST_SL_8_uxn_device_h_l139_c22_f8fb_return_output);

-- BIN_OP_PLUS_uxn_device_h_l139_c22_7bfe
BIN_OP_PLUS_uxn_device_h_l139_c22_7bfe : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l139_c22_7bfe_left,
BIN_OP_PLUS_uxn_device_h_l139_c22_7bfe_right,
BIN_OP_PLUS_uxn_device_h_l139_c22_7bfe_return_output);

-- BIN_OP_OR_uxn_device_h_l140_c26_a831
BIN_OP_OR_uxn_device_h_l140_c26_a831 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l140_c26_a831_left,
BIN_OP_OR_uxn_device_h_l140_c26_a831_right,
BIN_OP_OR_uxn_device_h_l140_c26_a831_return_output);

-- MUX_uxn_device_h_l141_c40_43bc
MUX_uxn_device_h_l141_c40_43bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l141_c40_43bc_cond,
MUX_uxn_device_h_l141_c40_43bc_iftrue,
MUX_uxn_device_h_l141_c40_43bc_iffalse,
MUX_uxn_device_h_l141_c40_43bc_return_output);

-- BIN_OP_PLUS_uxn_device_h_l141_c30_702d
BIN_OP_PLUS_uxn_device_h_l141_c30_702d : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l141_c30_702d_left,
BIN_OP_PLUS_uxn_device_h_l141_c30_702d_right,
BIN_OP_PLUS_uxn_device_h_l141_c30_702d_return_output);

-- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l141_c21_5023
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l141_c21_5023 : entity work.VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_0CLK_f9daebf3 port map (
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l141_c21_5023_ref_toks_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l141_c21_5023_var_dim_0,
VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l141_c21_5023_return_output);

-- BIN_OP_EQ_uxn_device_h_l142_c7_46e6
BIN_OP_EQ_uxn_device_h_l142_c7_46e6 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l142_c7_46e6_left,
BIN_OP_EQ_uxn_device_h_l142_c7_46e6_right,
BIN_OP_EQ_uxn_device_h_l142_c7_46e6_return_output);

-- BIN_OP_MINUS_uxn_device_h_l142_c41_0b5f
BIN_OP_MINUS_uxn_device_h_l142_c41_0b5f : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l142_c41_0b5f_left,
BIN_OP_MINUS_uxn_device_h_l142_c41_0b5f_right,
BIN_OP_MINUS_uxn_device_h_l142_c41_0b5f_return_output);

-- BIN_OP_PLUS_uxn_device_h_l142_c51_62f1
BIN_OP_PLUS_uxn_device_h_l142_c51_62f1 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l142_c51_62f1_left,
BIN_OP_PLUS_uxn_device_h_l142_c51_62f1_right,
BIN_OP_PLUS_uxn_device_h_l142_c51_62f1_return_output);

-- MUX_uxn_device_h_l142_c35_9a8b
MUX_uxn_device_h_l142_c35_9a8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l142_c35_9a8b_cond,
MUX_uxn_device_h_l142_c35_9a8b_iftrue,
MUX_uxn_device_h_l142_c35_9a8b_iffalse,
MUX_uxn_device_h_l142_c35_9a8b_return_output);

-- MUX_uxn_device_h_l142_c7_668f
MUX_uxn_device_h_l142_c7_668f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l142_c7_668f_cond,
MUX_uxn_device_h_l142_c7_668f_iftrue,
MUX_uxn_device_h_l142_c7_668f_iffalse,
MUX_uxn_device_h_l142_c7_668f_return_output);

-- BIN_OP_EQ_uxn_device_h_l143_c25_4e69
BIN_OP_EQ_uxn_device_h_l143_c25_4e69 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l143_c25_4e69_left,
BIN_OP_EQ_uxn_device_h_l143_c25_4e69_right,
BIN_OP_EQ_uxn_device_h_l143_c25_4e69_return_output);

-- BIN_OP_EQ_uxn_device_h_l143_c53_c605
BIN_OP_EQ_uxn_device_h_l143_c53_c605 : entity work.BIN_OP_EQ_uint5_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l143_c53_c605_left,
BIN_OP_EQ_uxn_device_h_l143_c53_c605_right,
BIN_OP_EQ_uxn_device_h_l143_c53_c605_return_output);

-- BIN_OP_AND_uxn_device_h_l143_c25_f11f
BIN_OP_AND_uxn_device_h_l143_c25_f11f : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l143_c25_f11f_left,
BIN_OP_AND_uxn_device_h_l143_c25_f11f_right,
BIN_OP_AND_uxn_device_h_l143_c25_f11f_return_output);

-- BIN_OP_EQ_uxn_device_h_l146_c6_94fc
BIN_OP_EQ_uxn_device_h_l146_c6_94fc : entity work.BIN_OP_EQ_uint5_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l146_c6_94fc_left,
BIN_OP_EQ_uxn_device_h_l146_c6_94fc_right,
BIN_OP_EQ_uxn_device_h_l146_c6_94fc_return_output);

-- sprite_rows_MUX_uxn_device_h_l146_c2_5340
sprite_rows_MUX_uxn_device_h_l146_c2_5340 : entity work.MUX_uint1_t_uint8_t_8_uint8_t_8_0CLK_de264c78 port map (
sprite_rows_MUX_uxn_device_h_l146_c2_5340_cond,
sprite_rows_MUX_uxn_device_h_l146_c2_5340_iftrue,
sprite_rows_MUX_uxn_device_h_l146_c2_5340_iffalse,
sprite_rows_MUX_uxn_device_h_l146_c2_5340_return_output);

-- VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l147_c3_f60c
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l147_c3_f60c : entity work.VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_0CLK_83e31706 port map (
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l147_c3_f60c_elem_val,
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l147_c3_f60c_ref_toks_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l147_c3_f60c_var_dim_0,
VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l147_c3_f60c_return_output);



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
 color8,
 result,
 phase_minus_two,
 phase7_downto_3,
 phase2_downto_0,
 sprite_rows,
 -- All submodule outputs
 BIN_OP_MINUS_uxn_device_h_l122_c20_f924_return_output,
 BIN_OP_EQ_uxn_device_h_l124_c6_05b4_return_output,
 y_MUX_uxn_device_h_l124_c2_defe_return_output,
 xmod_MUX_uxn_device_h_l124_c2_defe_return_output,
 x_MUX_uxn_device_h_l124_c2_defe_return_output,
 opaque_MUX_uxn_device_h_l124_c2_defe_return_output,
 BIN_OP_PLUS_uxn_device_h_l125_c21_8444_return_output,
 VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l125_c12_1f60_return_output,
 MUX_uxn_device_h_l126_c10_2d71_return_output,
 BIN_OP_PLUS_uxn_device_h_l127_c7_2315_return_output,
 MUX_uxn_device_h_l128_c13_6877_return_output,
 BIN_OP_PLUS_uxn_device_h_l128_c7_2073_return_output,
 BIN_OP_EQ_uxn_device_h_l131_c6_79be_return_output,
 y_MUX_uxn_device_h_l131_c2_5d4a_return_output,
 c_MUX_uxn_device_h_l131_c2_5d4a_return_output,
 x_MUX_uxn_device_h_l131_c2_5d4a_return_output,
 result_u16_addr_MUX_uxn_device_h_l131_c2_5d4a_return_output,
 result_u8_value_MUX_uxn_device_h_l131_c2_5d4a_return_output,
 result_is_vram_write_MUX_uxn_device_h_l131_c2_5d4a_return_output,
 result_is_blit_done_MUX_uxn_device_h_l131_c2_5d4a_return_output,
 BIN_OP_PLUS_uxn_device_h_l135_c21_719b_return_output,
 BIN_OP_EQ_uxn_device_h_l137_c7_1436_return_output,
 BIN_OP_MINUS_uxn_device_h_l137_c46_18e0_return_output,
 VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l137_c34_9559_return_output,
 CONST_SR_1_uxn_device_h_l137_c69_a165_return_output,
 MUX_uxn_device_h_l137_c7_8f38_return_output,
 BIN_OP_EQ_uxn_device_h_l138_c7_ab06_return_output,
 BIN_OP_PLUS_uxn_device_h_l138_c35_e41f_return_output,
 BIN_OP_PLUS_uxn_device_h_l138_c55_6f41_return_output,
 BIN_OP_MINUS_uxn_device_h_l138_c65_5b8d_return_output,
 MUX_uxn_device_h_l138_c49_f52b_return_output,
 MUX_uxn_device_h_l138_c7_d7f4_return_output,
 CONST_SL_8_uxn_device_h_l139_c22_f8fb_return_output,
 BIN_OP_PLUS_uxn_device_h_l139_c22_7bfe_return_output,
 BIN_OP_OR_uxn_device_h_l140_c26_a831_return_output,
 MUX_uxn_device_h_l141_c40_43bc_return_output,
 BIN_OP_PLUS_uxn_device_h_l141_c30_702d_return_output,
 VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l141_c21_5023_return_output,
 BIN_OP_EQ_uxn_device_h_l142_c7_46e6_return_output,
 BIN_OP_MINUS_uxn_device_h_l142_c41_0b5f_return_output,
 BIN_OP_PLUS_uxn_device_h_l142_c51_62f1_return_output,
 MUX_uxn_device_h_l142_c35_9a8b_return_output,
 MUX_uxn_device_h_l142_c7_668f_return_output,
 BIN_OP_EQ_uxn_device_h_l143_c25_4e69_return_output,
 BIN_OP_EQ_uxn_device_h_l143_c53_c605_return_output,
 BIN_OP_AND_uxn_device_h_l143_c25_f11f_return_output,
 BIN_OP_EQ_uxn_device_h_l146_c6_94fc_return_output,
 sprite_rows_MUX_uxn_device_h_l146_c2_5340_return_output,
 VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l147_c3_f60c_return_output)
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
 variable VAR_color8_uxn_device_h_l119_c2_842c : unsigned(7 downto 0);
 variable VAR_uint8_7_3_uxn_device_h_l120_c20_12e6_return_output : unsigned(4 downto 0);
 variable VAR_uint8_2_0_uxn_device_h_l121_c20_2457_return_output : unsigned(2 downto 0);
 variable VAR_phase_minus_two_uxn_device_h_l122_c2_8117 : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l122_c20_f924_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l122_c20_f924_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l122_c20_f924_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c6_05b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c6_05b4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c6_05b4_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c2_defe_iftrue : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l128_c3_336f : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c2_defe_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c2_defe_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c2_defe_cond : unsigned(0 downto 0);
 variable VAR_xmod_MUX_uxn_device_h_l124_c2_defe_iftrue : unsigned(7 downto 0);
 variable VAR_xmod_MUX_uxn_device_h_l124_c2_defe_iffalse : unsigned(7 downto 0);
 variable VAR_xmod_MUX_uxn_device_h_l124_c2_defe_return_output : unsigned(7 downto 0);
 variable VAR_xmod_MUX_uxn_device_h_l124_c2_defe_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l124_c2_defe_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l127_c3_1fe1 : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l124_c2_defe_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l124_c2_defe_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l124_c2_defe_cond : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l124_c2_defe_iftrue : unsigned(0 downto 0);
 variable VAR_opaque_uxn_device_h_l125_c3_3a15 : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l124_c2_defe_iffalse : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l124_c2_defe_return_output : unsigned(0 downto 0);
 variable VAR_opaque_MUX_uxn_device_h_l124_c2_defe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l125_c21_8444_left : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l125_c37_849b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l125_c21_8444_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l125_c21_8444_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l125_c12_1f60_var_dim_0 : unsigned(5 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l125_c12_1f60_return_output : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l125_c12_1f60_ref_toks_0 : uint2_t_48;
 variable VAR_MUX_uxn_device_h_l126_c10_2d71_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l126_c10_2d71_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l126_c10_2d71_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l126_c10_2d71_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l127_c7_2315_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l127_c7_2315_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l127_c7_2315_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l128_c7_2073_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l128_c13_6877_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l128_c13_6877_iftrue : unsigned(2 downto 0);
 variable VAR_MUX_uxn_device_h_l128_c13_6877_iffalse : unsigned(2 downto 0);
 variable VAR_MUX_uxn_device_h_l128_c13_6877_return_output : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l128_c7_2073_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l128_c7_2073_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l131_c6_79be_left : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l131_c6_79be_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l131_c6_79be_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l131_c2_5d4a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l131_c2_5d4a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l131_c2_5d4a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l131_c2_5d4a_cond : unsigned(0 downto 0);
 variable VAR_c_MUX_uxn_device_h_l131_c2_5d4a_iftrue : unsigned(7 downto 0);
 variable VAR_c_MUX_uxn_device_h_l131_c2_5d4a_iffalse : unsigned(7 downto 0);
 variable VAR_c_MUX_uxn_device_h_l131_c2_5d4a_return_output : unsigned(7 downto 0);
 variable VAR_c_MUX_uxn_device_h_l131_c2_5d4a_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l131_c2_5d4a_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l131_c2_5d4a_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l131_c2_5d4a_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l131_c2_5d4a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l131_c2_5d4a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l135_c3_c5ef : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l131_c2_5d4a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l139_c3_2024 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l131_c2_5d4a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l131_c2_5d4a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l131_c2_5d4a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l133_c3_7fbb : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l131_c2_5d4a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l141_c3_84d3 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l131_c2_5d4a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l131_c2_5d4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l131_c2_5d4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l131_c2_5d4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l131_c2_5d4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l131_c2_5d4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l131_c2_5d4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l131_c2_5d4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l131_c2_5d4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_blit_done_MUX_uxn_device_h_l131_c2_5d4a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l135_c21_719b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l135_c21_719b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l135_c21_719b_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l137_c7_8f38_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c7_1436_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c7_1436_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c7_1436_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l137_c7_8f38_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l137_c7_8f38_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l137_c46_18e0_left : unsigned(4 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l137_c46_18e0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l137_c46_18e0_return_output : unsigned(4 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l137_c34_9559_var_dim_0 : unsigned(2 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l137_c34_9559_return_output : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l137_c34_9559_ref_toks_0 : uint8_t_8;
 variable VAR_CONST_SR_1_uxn_device_h_l137_c69_a165_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l137_c69_a165_x : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l137_c7_8f38_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l138_c7_d7f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c7_ab06_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c7_ab06_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c7_ab06_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l138_c7_d7f4_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l138_c7_d7f4_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l138_c35_e41f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l138_c35_e41f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l138_c35_e41f_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_device_h_l138_c49_f52b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l138_c49_f52b_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l138_c49_f52b_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l138_c55_6f41_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l138_c55_6f41_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l138_c55_6f41_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l138_c65_5b8d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l138_c65_5b8d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l138_c65_5b8d_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l138_c49_f52b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l138_c7_d7f4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_device_h_l139_c22_f8fb_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l139_c22_7bfe_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_device_h_l139_c22_f8fb_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l139_c22_7bfe_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l139_c22_7bfe_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l140_c26_a831_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l140_c26_a831_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l140_c26_a831_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l141_c30_702d_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l141_c40_43bc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l141_c40_43bc_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l141_c40_43bc_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l141_c40_43bc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l141_c30_702d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l141_c30_702d_return_output : unsigned(8 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l141_c21_5023_var_dim_0 : unsigned(5 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l141_c21_5023_return_output : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l141_c21_5023_ref_toks_0 : uint2_t_48;
 variable VAR_MUX_uxn_device_h_l142_c7_668f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c7_46e6_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c7_46e6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c7_46e6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l142_c7_668f_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l142_c7_668f_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l142_c35_9a8b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l142_c35_9a8b_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l142_c35_9a8b_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l142_c41_0b5f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l142_c41_0b5f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l142_c41_0b5f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l142_c51_62f1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l142_c51_62f1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l142_c51_62f1_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l142_c35_9a8b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l142_c7_668f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c25_4e69_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c25_4e69_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c25_4e69_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l143_c25_f11f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c53_c605_left : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c53_c605_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c53_c605_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l143_c25_f11f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l143_c25_f11f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l146_c6_94fc_left : unsigned(4 downto 0);
 variable VAR_uint8_7_3_uxn_device_h_l146_c6_0583_return_output : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l146_c6_94fc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l146_c6_94fc_return_output : unsigned(0 downto 0);
 variable VAR_sprite_rows_MUX_uxn_device_h_l146_c2_5340_iftrue : uint8_t_8;
 variable VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5_uxn_device_h_l146_c2_5340_return_output : uint8_t_8;
 variable VAR_sprite_rows_MUX_uxn_device_h_l146_c2_5340_iffalse : uint8_t_8;
 variable VAR_sprite_rows_MUX_uxn_device_h_l146_c2_5340_return_output : uint8_t_8;
 variable VAR_sprite_rows_MUX_uxn_device_h_l146_c2_5340_cond : unsigned(0 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l147_c3_f60c_return_output : uint8_t_array_8_t;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l147_c3_f60c_elem_val : unsigned(7 downto 0);
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l147_c3_f60c_ref_toks_0 : uint8_t_8;
 variable VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l147_c3_f60c_var_dim_0 : unsigned(2 downto 0);
 variable VAR_uint8_0_0_uxn_device_h_l141_l140_DUPLICATE_e622_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_cd45_uxn_device_h_l150_l101_DUPLICATE_eb4e_return_output : screen_blit_result_t;
 -- State registers comb logic variables
variable REG_VAR_blending : uint2_t_48;
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
variable REG_VAR_xmod : unsigned(7 downto 0);
variable REG_VAR_opaque : unsigned(0 downto 0);
variable REG_VAR_c : unsigned(7 downto 0);
variable REG_VAR_color8 : unsigned(7 downto 0);
variable REG_VAR_result : screen_blit_result_t;
variable REG_VAR_phase_minus_two : unsigned(7 downto 0);
variable REG_VAR_phase7_downto_3 : unsigned(4 downto 0);
variable REG_VAR_phase2_downto_0 : unsigned(2 downto 0);
variable REG_VAR_sprite_rows : uint8_t_8;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_blending := blending;
  REG_VAR_x := x;
  REG_VAR_y := y;
  REG_VAR_xmod := xmod;
  REG_VAR_opaque := opaque;
  REG_VAR_c := c;
  REG_VAR_color8 := color8;
  REG_VAR_result := result;
  REG_VAR_phase_minus_two := phase_minus_two;
  REG_VAR_phase7_downto_3 := phase7_downto_3;
  REG_VAR_phase2_downto_0 := phase2_downto_0;
  REG_VAR_sprite_rows := sprite_rows;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_device_h_l126_c10_2d71_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l138_c55_6f41_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l141_c40_43bc_iffalse := to_unsigned(0, 8);
     VAR_MUX_uxn_device_h_l126_c10_2d71_iffalse := resize(to_unsigned(7, 3), 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l125_c21_8444_left := to_unsigned(32, 8);
     VAR_MUX_uxn_device_h_l128_c13_6877_iffalse := resize(to_unsigned(0, 1), 3);
     VAR_BIN_OP_MINUS_uxn_device_h_l142_c41_0b5f_right := to_unsigned(1, 1);
     VAR_result_u8_value_uxn_device_h_l133_c3_7fbb := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l131_c2_5d4a_iftrue := VAR_result_u8_value_uxn_device_h_l133_c3_7fbb;
     VAR_BIN_OP_MINUS_uxn_device_h_l138_c65_5b8d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l142_c7_46e6_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l124_c6_05b4_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l142_c51_62f1_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l137_c46_18e0_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l122_c20_f924_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l146_c6_94fc_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l143_c53_c605_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l137_c7_1436_right := to_unsigned(0, 3);
     VAR_result_is_blit_done_MUX_uxn_device_h_l131_c2_5d4a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l143_c25_4e69_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l138_c7_ab06_right := to_unsigned(0, 3);
     VAR_MUX_uxn_device_h_l128_c13_6877_iftrue := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l131_c6_79be_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l141_c40_43bc_iftrue := to_unsigned(16, 8);
     VAR_result_is_vram_write_MUX_uxn_device_h_l131_c2_5d4a_iftrue := to_unsigned(0, 1);

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
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l125_c12_1f60_ref_toks_0 := blending;
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l141_c21_5023_ref_toks_0 := blending;
     REG_VAR_blending := blending;
     VAR_CONST_SR_1_uxn_device_h_l137_c69_a165_x := c;
     VAR_c_MUX_uxn_device_h_l131_c2_5d4a_iftrue := c;
     VAR_color8_uxn_device_h_l119_c2_842c := resize(VAR_color, 8);
     VAR_MUX_uxn_device_h_l126_c10_2d71_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l138_c49_f52b_cond := VAR_fx;
     VAR_MUX_uxn_device_h_l128_c13_6877_cond := VAR_fy;
     VAR_MUX_uxn_device_h_l142_c35_9a8b_cond := VAR_fy;
     VAR_opaque_MUX_uxn_device_h_l124_c2_defe_iffalse := opaque;
     VAR_BIN_OP_EQ_uxn_device_h_l124_c6_05b4_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l122_c20_f924_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_device_h_l135_c21_719b_right := VAR_phase;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l147_c3_f60c_elem_val := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_device_h_l135_c21_719b_left := VAR_ram_addr;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l147_c3_f60c_ref_toks_0 := sprite_rows;
     VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l137_c34_9559_ref_toks_0 := sprite_rows;
     VAR_sprite_rows_MUX_uxn_device_h_l146_c2_5340_iffalse := sprite_rows;
     VAR_x_MUX_uxn_device_h_l124_c2_defe_iffalse := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l127_c7_2315_left := VAR_x1;
     VAR_BIN_OP_PLUS_uxn_device_h_l138_c35_e41f_left := VAR_x1;
     VAR_xmod_MUX_uxn_device_h_l124_c2_defe_iffalse := xmod;
     VAR_y_MUX_uxn_device_h_l124_c2_defe_iffalse := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l128_c7_2073_left := VAR_y1;
     VAR_BIN_OP_PLUS_uxn_device_h_l141_c30_702d_left := VAR_color8_uxn_device_h_l119_c2_842c;
     REG_VAR_color8 := VAR_color8_uxn_device_h_l119_c2_842c;
     -- CONST_SR_1[uxn_device_h_l137_c69_a165] LATENCY=0
     -- Inputs
     CONST_SR_1_uxn_device_h_l137_c69_a165_x <= VAR_CONST_SR_1_uxn_device_h_l137_c69_a165_x;
     -- Outputs
     VAR_CONST_SR_1_uxn_device_h_l137_c69_a165_return_output := CONST_SR_1_uxn_device_h_l137_c69_a165_return_output;

     -- uint8_7_3[uxn_device_h_l120_c20_12e6] LATENCY=0
     VAR_uint8_7_3_uxn_device_h_l120_c20_12e6_return_output := uint8_7_3(
     VAR_phase);

     -- CAST_TO_uint8_t[uxn_device_h_l125_c37_849b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l125_c37_849b_return_output := CAST_TO_uint8_t_uint4_t(
     VAR_color);

     -- uint8_2_0[uxn_device_h_l121_c20_2457] LATENCY=0
     VAR_uint8_2_0_uxn_device_h_l121_c20_2457_return_output := uint8_2_0(
     VAR_phase);

     -- BIN_OP_MINUS[uxn_device_h_l122_c20_f924] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l122_c20_f924_left <= VAR_BIN_OP_MINUS_uxn_device_h_l122_c20_f924_left;
     BIN_OP_MINUS_uxn_device_h_l122_c20_f924_right <= VAR_BIN_OP_MINUS_uxn_device_h_l122_c20_f924_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l122_c20_f924_return_output := BIN_OP_MINUS_uxn_device_h_l122_c20_f924_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l135_c21_719b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l135_c21_719b_left <= VAR_BIN_OP_PLUS_uxn_device_h_l135_c21_719b_left;
     BIN_OP_PLUS_uxn_device_h_l135_c21_719b_right <= VAR_BIN_OP_PLUS_uxn_device_h_l135_c21_719b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l135_c21_719b_return_output := BIN_OP_PLUS_uxn_device_h_l135_c21_719b_return_output;

     -- MUX[uxn_device_h_l126_c10_2d71] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l126_c10_2d71_cond <= VAR_MUX_uxn_device_h_l126_c10_2d71_cond;
     MUX_uxn_device_h_l126_c10_2d71_iftrue <= VAR_MUX_uxn_device_h_l126_c10_2d71_iftrue;
     MUX_uxn_device_h_l126_c10_2d71_iffalse <= VAR_MUX_uxn_device_h_l126_c10_2d71_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l126_c10_2d71_return_output := MUX_uxn_device_h_l126_c10_2d71_return_output;

     -- BIN_OP_EQ[uxn_device_h_l124_c6_05b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l124_c6_05b4_left <= VAR_BIN_OP_EQ_uxn_device_h_l124_c6_05b4_left;
     BIN_OP_EQ_uxn_device_h_l124_c6_05b4_right <= VAR_BIN_OP_EQ_uxn_device_h_l124_c6_05b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l124_c6_05b4_return_output := BIN_OP_EQ_uxn_device_h_l124_c6_05b4_return_output;

     -- MUX[uxn_device_h_l128_c13_6877] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l128_c13_6877_cond <= VAR_MUX_uxn_device_h_l128_c13_6877_cond;
     MUX_uxn_device_h_l128_c13_6877_iftrue <= VAR_MUX_uxn_device_h_l128_c13_6877_iftrue;
     MUX_uxn_device_h_l128_c13_6877_iffalse <= VAR_MUX_uxn_device_h_l128_c13_6877_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l128_c13_6877_return_output := MUX_uxn_device_h_l128_c13_6877_return_output;

     -- Submodule level 1
     VAR_opaque_MUX_uxn_device_h_l124_c2_defe_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c6_05b4_return_output;
     VAR_x_MUX_uxn_device_h_l124_c2_defe_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c6_05b4_return_output;
     VAR_xmod_MUX_uxn_device_h_l124_c2_defe_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c6_05b4_return_output;
     VAR_y_MUX_uxn_device_h_l124_c2_defe_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c6_05b4_return_output;
     VAR_phase_minus_two_uxn_device_h_l122_c2_8117 := VAR_BIN_OP_MINUS_uxn_device_h_l122_c20_f924_return_output;
     VAR_result_u16_addr_uxn_device_h_l135_c3_c5ef := resize(VAR_BIN_OP_PLUS_uxn_device_h_l135_c21_719b_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l125_c21_8444_right := VAR_CAST_TO_uint8_t_uxn_device_h_l125_c37_849b_return_output;
     VAR_MUX_uxn_device_h_l137_c7_8f38_iffalse := VAR_CONST_SR_1_uxn_device_h_l137_c69_a165_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l127_c7_2315_right := VAR_MUX_uxn_device_h_l126_c10_2d71_return_output;
     VAR_xmod_MUX_uxn_device_h_l124_c2_defe_iftrue := VAR_MUX_uxn_device_h_l126_c10_2d71_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l128_c7_2073_right := VAR_MUX_uxn_device_h_l128_c13_6877_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l137_c7_1436_left := VAR_uint8_2_0_uxn_device_h_l121_c20_2457_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l138_c7_ab06_left := VAR_uint8_2_0_uxn_device_h_l121_c20_2457_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l142_c7_46e6_left := VAR_uint8_2_0_uxn_device_h_l121_c20_2457_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l143_c25_4e69_left := VAR_uint8_2_0_uxn_device_h_l121_c20_2457_return_output;
     REG_VAR_phase2_downto_0 := VAR_uint8_2_0_uxn_device_h_l121_c20_2457_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l131_c6_79be_left := VAR_uint8_7_3_uxn_device_h_l120_c20_12e6_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l143_c53_c605_left := VAR_uint8_7_3_uxn_device_h_l120_c20_12e6_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l137_c46_18e0_left := VAR_uint8_7_3_uxn_device_h_l120_c20_12e6_return_output;
     REG_VAR_phase7_downto_3 := VAR_uint8_7_3_uxn_device_h_l120_c20_12e6_return_output;
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l147_c3_f60c_var_dim_0 := resize(VAR_phase_minus_two_uxn_device_h_l122_c2_8117, 3);
     REG_VAR_phase_minus_two := VAR_phase_minus_two_uxn_device_h_l122_c2_8117;
     VAR_result_u16_addr_MUX_uxn_device_h_l131_c2_5d4a_iftrue := VAR_result_u16_addr_uxn_device_h_l135_c3_c5ef;
     -- BIN_OP_MINUS[uxn_device_h_l137_c46_18e0] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l137_c46_18e0_left <= VAR_BIN_OP_MINUS_uxn_device_h_l137_c46_18e0_left;
     BIN_OP_MINUS_uxn_device_h_l137_c46_18e0_right <= VAR_BIN_OP_MINUS_uxn_device_h_l137_c46_18e0_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l137_c46_18e0_return_output := BIN_OP_MINUS_uxn_device_h_l137_c46_18e0_return_output;

     -- BIN_OP_EQ[uxn_device_h_l137_c7_1436] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l137_c7_1436_left <= VAR_BIN_OP_EQ_uxn_device_h_l137_c7_1436_left;
     BIN_OP_EQ_uxn_device_h_l137_c7_1436_right <= VAR_BIN_OP_EQ_uxn_device_h_l137_c7_1436_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l137_c7_1436_return_output := BIN_OP_EQ_uxn_device_h_l137_c7_1436_return_output;

     -- BIN_OP_EQ[uxn_device_h_l143_c53_c605] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l143_c53_c605_left <= VAR_BIN_OP_EQ_uxn_device_h_l143_c53_c605_left;
     BIN_OP_EQ_uxn_device_h_l143_c53_c605_right <= VAR_BIN_OP_EQ_uxn_device_h_l143_c53_c605_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l143_c53_c605_return_output := BIN_OP_EQ_uxn_device_h_l143_c53_c605_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l127_c7_2315] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l127_c7_2315_left <= VAR_BIN_OP_PLUS_uxn_device_h_l127_c7_2315_left;
     BIN_OP_PLUS_uxn_device_h_l127_c7_2315_right <= VAR_BIN_OP_PLUS_uxn_device_h_l127_c7_2315_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l127_c7_2315_return_output := BIN_OP_PLUS_uxn_device_h_l127_c7_2315_return_output;

     -- BIN_OP_EQ[uxn_device_h_l131_c6_79be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l131_c6_79be_left <= VAR_BIN_OP_EQ_uxn_device_h_l131_c6_79be_left;
     BIN_OP_EQ_uxn_device_h_l131_c6_79be_right <= VAR_BIN_OP_EQ_uxn_device_h_l131_c6_79be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l131_c6_79be_return_output := BIN_OP_EQ_uxn_device_h_l131_c6_79be_return_output;

     -- uint8_7_3[uxn_device_h_l146_c6_0583] LATENCY=0
     VAR_uint8_7_3_uxn_device_h_l146_c6_0583_return_output := uint8_7_3(
     VAR_phase_minus_two_uxn_device_h_l122_c2_8117);

     -- VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8[uxn_device_h_l147_c3_f60c] LATENCY=0
     -- Inputs
     VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l147_c3_f60c_elem_val <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l147_c3_f60c_elem_val;
     VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l147_c3_f60c_ref_toks_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l147_c3_f60c_ref_toks_0;
     VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l147_c3_f60c_var_dim_0 <= VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l147_c3_f60c_var_dim_0;
     -- Outputs
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l147_c3_f60c_return_output := VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l147_c3_f60c_return_output;

     -- xmod_MUX[uxn_device_h_l124_c2_defe] LATENCY=0
     -- Inputs
     xmod_MUX_uxn_device_h_l124_c2_defe_cond <= VAR_xmod_MUX_uxn_device_h_l124_c2_defe_cond;
     xmod_MUX_uxn_device_h_l124_c2_defe_iftrue <= VAR_xmod_MUX_uxn_device_h_l124_c2_defe_iftrue;
     xmod_MUX_uxn_device_h_l124_c2_defe_iffalse <= VAR_xmod_MUX_uxn_device_h_l124_c2_defe_iffalse;
     -- Outputs
     VAR_xmod_MUX_uxn_device_h_l124_c2_defe_return_output := xmod_MUX_uxn_device_h_l124_c2_defe_return_output;

     -- BIN_OP_EQ[uxn_device_h_l138_c7_ab06] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l138_c7_ab06_left <= VAR_BIN_OP_EQ_uxn_device_h_l138_c7_ab06_left;
     BIN_OP_EQ_uxn_device_h_l138_c7_ab06_right <= VAR_BIN_OP_EQ_uxn_device_h_l138_c7_ab06_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l138_c7_ab06_return_output := BIN_OP_EQ_uxn_device_h_l138_c7_ab06_return_output;

     -- BIN_OP_EQ[uxn_device_h_l143_c25_4e69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l143_c25_4e69_left <= VAR_BIN_OP_EQ_uxn_device_h_l143_c25_4e69_left;
     BIN_OP_EQ_uxn_device_h_l143_c25_4e69_right <= VAR_BIN_OP_EQ_uxn_device_h_l143_c25_4e69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l143_c25_4e69_return_output := BIN_OP_EQ_uxn_device_h_l143_c25_4e69_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l125_c21_8444] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l125_c21_8444_left <= VAR_BIN_OP_PLUS_uxn_device_h_l125_c21_8444_left;
     BIN_OP_PLUS_uxn_device_h_l125_c21_8444_right <= VAR_BIN_OP_PLUS_uxn_device_h_l125_c21_8444_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l125_c21_8444_return_output := BIN_OP_PLUS_uxn_device_h_l125_c21_8444_return_output;

     -- BIN_OP_EQ[uxn_device_h_l142_c7_46e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l142_c7_46e6_left <= VAR_BIN_OP_EQ_uxn_device_h_l142_c7_46e6_left;
     BIN_OP_EQ_uxn_device_h_l142_c7_46e6_right <= VAR_BIN_OP_EQ_uxn_device_h_l142_c7_46e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l142_c7_46e6_return_output := BIN_OP_EQ_uxn_device_h_l142_c7_46e6_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l128_c7_2073] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l128_c7_2073_left <= VAR_BIN_OP_PLUS_uxn_device_h_l128_c7_2073_left;
     BIN_OP_PLUS_uxn_device_h_l128_c7_2073_right <= VAR_BIN_OP_PLUS_uxn_device_h_l128_c7_2073_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l128_c7_2073_return_output := BIN_OP_PLUS_uxn_device_h_l128_c7_2073_return_output;

     -- Submodule level 2
     VAR_c_MUX_uxn_device_h_l131_c2_5d4a_cond := VAR_BIN_OP_EQ_uxn_device_h_l131_c6_79be_return_output;
     VAR_result_is_blit_done_MUX_uxn_device_h_l131_c2_5d4a_cond := VAR_BIN_OP_EQ_uxn_device_h_l131_c6_79be_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l131_c2_5d4a_cond := VAR_BIN_OP_EQ_uxn_device_h_l131_c6_79be_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l131_c2_5d4a_cond := VAR_BIN_OP_EQ_uxn_device_h_l131_c6_79be_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l131_c2_5d4a_cond := VAR_BIN_OP_EQ_uxn_device_h_l131_c6_79be_return_output;
     VAR_x_MUX_uxn_device_h_l131_c2_5d4a_cond := VAR_BIN_OP_EQ_uxn_device_h_l131_c6_79be_return_output;
     VAR_y_MUX_uxn_device_h_l131_c2_5d4a_cond := VAR_BIN_OP_EQ_uxn_device_h_l131_c6_79be_return_output;
     VAR_MUX_uxn_device_h_l137_c7_8f38_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c7_1436_return_output;
     VAR_MUX_uxn_device_h_l138_c7_d7f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c7_ab06_return_output;
     VAR_MUX_uxn_device_h_l142_c7_668f_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c7_46e6_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l143_c25_f11f_left := VAR_BIN_OP_EQ_uxn_device_h_l143_c25_4e69_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l143_c25_f11f_right := VAR_BIN_OP_EQ_uxn_device_h_l143_c53_c605_return_output;
     VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l137_c34_9559_var_dim_0 := resize(VAR_BIN_OP_MINUS_uxn_device_h_l137_c46_18e0_return_output, 3);
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l125_c12_1f60_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l125_c21_8444_return_output, 6);
     VAR_x_uxn_device_h_l127_c3_1fe1 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l127_c7_2315_return_output, 16);
     VAR_y_uxn_device_h_l128_c3_336f := resize(VAR_BIN_OP_PLUS_uxn_device_h_l128_c7_2073_return_output, 16);
     VAR_BIN_OP_EQ_uxn_device_h_l146_c6_94fc_left := VAR_uint8_7_3_uxn_device_h_l146_c6_0583_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l138_c35_e41f_right := VAR_xmod_MUX_uxn_device_h_l124_c2_defe_return_output;
     REG_VAR_xmod := VAR_xmod_MUX_uxn_device_h_l124_c2_defe_return_output;
     VAR_x_MUX_uxn_device_h_l124_c2_defe_iftrue := VAR_x_uxn_device_h_l127_c3_1fe1;
     VAR_y_MUX_uxn_device_h_l124_c2_defe_iftrue := VAR_y_uxn_device_h_l128_c3_336f;
     -- y_MUX[uxn_device_h_l124_c2_defe] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l124_c2_defe_cond <= VAR_y_MUX_uxn_device_h_l124_c2_defe_cond;
     y_MUX_uxn_device_h_l124_c2_defe_iftrue <= VAR_y_MUX_uxn_device_h_l124_c2_defe_iftrue;
     y_MUX_uxn_device_h_l124_c2_defe_iffalse <= VAR_y_MUX_uxn_device_h_l124_c2_defe_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l124_c2_defe_return_output := y_MUX_uxn_device_h_l124_c2_defe_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l138_c35_e41f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l138_c35_e41f_left <= VAR_BIN_OP_PLUS_uxn_device_h_l138_c35_e41f_left;
     BIN_OP_PLUS_uxn_device_h_l138_c35_e41f_right <= VAR_BIN_OP_PLUS_uxn_device_h_l138_c35_e41f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l138_c35_e41f_return_output := BIN_OP_PLUS_uxn_device_h_l138_c35_e41f_return_output;

     -- VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d[uxn_device_h_l137_c34_9559] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l137_c34_9559_ref_toks_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l137_c34_9559_ref_toks_0;
     VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l137_c34_9559_var_dim_0 <= VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l137_c34_9559_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l137_c34_9559_return_output := VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l137_c34_9559_return_output;

     -- x_MUX[uxn_device_h_l124_c2_defe] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l124_c2_defe_cond <= VAR_x_MUX_uxn_device_h_l124_c2_defe_cond;
     x_MUX_uxn_device_h_l124_c2_defe_iftrue <= VAR_x_MUX_uxn_device_h_l124_c2_defe_iftrue;
     x_MUX_uxn_device_h_l124_c2_defe_iffalse <= VAR_x_MUX_uxn_device_h_l124_c2_defe_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l124_c2_defe_return_output := x_MUX_uxn_device_h_l124_c2_defe_return_output;

     -- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l125_c12_1f60] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l125_c12_1f60_ref_toks_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l125_c12_1f60_ref_toks_0;
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l125_c12_1f60_var_dim_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l125_c12_1f60_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l125_c12_1f60_return_output := VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l125_c12_1f60_return_output;

     -- BIN_OP_AND[uxn_device_h_l143_c25_f11f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l143_c25_f11f_left <= VAR_BIN_OP_AND_uxn_device_h_l143_c25_f11f_left;
     BIN_OP_AND_uxn_device_h_l143_c25_f11f_right <= VAR_BIN_OP_AND_uxn_device_h_l143_c25_f11f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l143_c25_f11f_return_output := BIN_OP_AND_uxn_device_h_l143_c25_f11f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l146_c6_94fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l146_c6_94fc_left <= VAR_BIN_OP_EQ_uxn_device_h_l146_c6_94fc_left;
     BIN_OP_EQ_uxn_device_h_l146_c6_94fc_right <= VAR_BIN_OP_EQ_uxn_device_h_l146_c6_94fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l146_c6_94fc_return_output := BIN_OP_EQ_uxn_device_h_l146_c6_94fc_return_output;

     -- sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5[uxn_device_h_l146_c2_5340] LATENCY=0
     VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5_uxn_device_h_l146_c2_5340_return_output := CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5(
     VAR_VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8_uxn_device_h_l147_c3_f60c_return_output);

     -- Submodule level 3
     VAR_result_is_blit_done_MUX_uxn_device_h_l131_c2_5d4a_iffalse := VAR_BIN_OP_AND_uxn_device_h_l143_c25_f11f_return_output;
     VAR_sprite_rows_MUX_uxn_device_h_l146_c2_5340_cond := VAR_BIN_OP_EQ_uxn_device_h_l146_c6_94fc_return_output;
     VAR_MUX_uxn_device_h_l138_c7_d7f4_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l138_c35_e41f_return_output, 16);
     VAR_opaque_uxn_device_h_l125_c3_3a15 := resize(VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l125_c12_1f60_return_output, 1);
     VAR_MUX_uxn_device_h_l137_c7_8f38_iftrue := VAR_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_uxn_device_h_l137_c34_9559_return_output;
     VAR_sprite_rows_MUX_uxn_device_h_l146_c2_5340_iftrue := VAR_sprite_rows_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_5ff5_uxn_device_h_l146_c2_5340_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l138_c65_5b8d_left := VAR_x_MUX_uxn_device_h_l124_c2_defe_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l138_c55_6f41_left := VAR_x_MUX_uxn_device_h_l124_c2_defe_return_output;
     VAR_x_MUX_uxn_device_h_l131_c2_5d4a_iftrue := VAR_x_MUX_uxn_device_h_l124_c2_defe_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l142_c41_0b5f_left := VAR_y_MUX_uxn_device_h_l124_c2_defe_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l142_c51_62f1_left := VAR_y_MUX_uxn_device_h_l124_c2_defe_return_output;
     VAR_CONST_SL_8_uxn_device_h_l139_c22_f8fb_x := VAR_y_MUX_uxn_device_h_l124_c2_defe_return_output;
     VAR_MUX_uxn_device_h_l142_c7_668f_iffalse := VAR_y_MUX_uxn_device_h_l124_c2_defe_return_output;
     VAR_y_MUX_uxn_device_h_l131_c2_5d4a_iftrue := VAR_y_MUX_uxn_device_h_l124_c2_defe_return_output;
     VAR_opaque_MUX_uxn_device_h_l124_c2_defe_iftrue := VAR_opaque_uxn_device_h_l125_c3_3a15;
     -- sprite_rows_MUX[uxn_device_h_l146_c2_5340] LATENCY=0
     -- Inputs
     sprite_rows_MUX_uxn_device_h_l146_c2_5340_cond <= VAR_sprite_rows_MUX_uxn_device_h_l146_c2_5340_cond;
     sprite_rows_MUX_uxn_device_h_l146_c2_5340_iftrue <= VAR_sprite_rows_MUX_uxn_device_h_l146_c2_5340_iftrue;
     sprite_rows_MUX_uxn_device_h_l146_c2_5340_iffalse <= VAR_sprite_rows_MUX_uxn_device_h_l146_c2_5340_iffalse;
     -- Outputs
     VAR_sprite_rows_MUX_uxn_device_h_l146_c2_5340_return_output := sprite_rows_MUX_uxn_device_h_l146_c2_5340_return_output;

     -- CONST_SL_8[uxn_device_h_l139_c22_f8fb] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_device_h_l139_c22_f8fb_x <= VAR_CONST_SL_8_uxn_device_h_l139_c22_f8fb_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_device_h_l139_c22_f8fb_return_output := CONST_SL_8_uxn_device_h_l139_c22_f8fb_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l142_c41_0b5f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l142_c41_0b5f_left <= VAR_BIN_OP_MINUS_uxn_device_h_l142_c41_0b5f_left;
     BIN_OP_MINUS_uxn_device_h_l142_c41_0b5f_right <= VAR_BIN_OP_MINUS_uxn_device_h_l142_c41_0b5f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l142_c41_0b5f_return_output := BIN_OP_MINUS_uxn_device_h_l142_c41_0b5f_return_output;

     -- opaque_MUX[uxn_device_h_l124_c2_defe] LATENCY=0
     -- Inputs
     opaque_MUX_uxn_device_h_l124_c2_defe_cond <= VAR_opaque_MUX_uxn_device_h_l124_c2_defe_cond;
     opaque_MUX_uxn_device_h_l124_c2_defe_iftrue <= VAR_opaque_MUX_uxn_device_h_l124_c2_defe_iftrue;
     opaque_MUX_uxn_device_h_l124_c2_defe_iffalse <= VAR_opaque_MUX_uxn_device_h_l124_c2_defe_iffalse;
     -- Outputs
     VAR_opaque_MUX_uxn_device_h_l124_c2_defe_return_output := opaque_MUX_uxn_device_h_l124_c2_defe_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l138_c55_6f41] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l138_c55_6f41_left <= VAR_BIN_OP_PLUS_uxn_device_h_l138_c55_6f41_left;
     BIN_OP_PLUS_uxn_device_h_l138_c55_6f41_right <= VAR_BIN_OP_PLUS_uxn_device_h_l138_c55_6f41_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l138_c55_6f41_return_output := BIN_OP_PLUS_uxn_device_h_l138_c55_6f41_return_output;

     -- result_is_blit_done_MUX[uxn_device_h_l131_c2_5d4a] LATENCY=0
     -- Inputs
     result_is_blit_done_MUX_uxn_device_h_l131_c2_5d4a_cond <= VAR_result_is_blit_done_MUX_uxn_device_h_l131_c2_5d4a_cond;
     result_is_blit_done_MUX_uxn_device_h_l131_c2_5d4a_iftrue <= VAR_result_is_blit_done_MUX_uxn_device_h_l131_c2_5d4a_iftrue;
     result_is_blit_done_MUX_uxn_device_h_l131_c2_5d4a_iffalse <= VAR_result_is_blit_done_MUX_uxn_device_h_l131_c2_5d4a_iffalse;
     -- Outputs
     VAR_result_is_blit_done_MUX_uxn_device_h_l131_c2_5d4a_return_output := result_is_blit_done_MUX_uxn_device_h_l131_c2_5d4a_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l138_c65_5b8d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l138_c65_5b8d_left <= VAR_BIN_OP_MINUS_uxn_device_h_l138_c65_5b8d_left;
     BIN_OP_MINUS_uxn_device_h_l138_c65_5b8d_right <= VAR_BIN_OP_MINUS_uxn_device_h_l138_c65_5b8d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l138_c65_5b8d_return_output := BIN_OP_MINUS_uxn_device_h_l138_c65_5b8d_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l142_c51_62f1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l142_c51_62f1_left <= VAR_BIN_OP_PLUS_uxn_device_h_l142_c51_62f1_left;
     BIN_OP_PLUS_uxn_device_h_l142_c51_62f1_right <= VAR_BIN_OP_PLUS_uxn_device_h_l142_c51_62f1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l142_c51_62f1_return_output := BIN_OP_PLUS_uxn_device_h_l142_c51_62f1_return_output;

     -- MUX[uxn_device_h_l137_c7_8f38] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l137_c7_8f38_cond <= VAR_MUX_uxn_device_h_l137_c7_8f38_cond;
     MUX_uxn_device_h_l137_c7_8f38_iftrue <= VAR_MUX_uxn_device_h_l137_c7_8f38_iftrue;
     MUX_uxn_device_h_l137_c7_8f38_iffalse <= VAR_MUX_uxn_device_h_l137_c7_8f38_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l137_c7_8f38_return_output := MUX_uxn_device_h_l137_c7_8f38_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l138_c49_f52b_iffalse := VAR_BIN_OP_MINUS_uxn_device_h_l138_c65_5b8d_return_output;
     VAR_MUX_uxn_device_h_l142_c35_9a8b_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l142_c41_0b5f_return_output;
     VAR_MUX_uxn_device_h_l138_c49_f52b_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l138_c55_6f41_return_output, 16);
     VAR_MUX_uxn_device_h_l142_c35_9a8b_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l142_c51_62f1_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_device_h_l139_c22_7bfe_left := VAR_CONST_SL_8_uxn_device_h_l139_c22_f8fb_return_output;
     VAR_c_MUX_uxn_device_h_l131_c2_5d4a_iffalse := VAR_MUX_uxn_device_h_l137_c7_8f38_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l140_c26_a831_left := VAR_opaque_MUX_uxn_device_h_l124_c2_defe_return_output;
     REG_VAR_opaque := VAR_opaque_MUX_uxn_device_h_l124_c2_defe_return_output;
     REG_VAR_sprite_rows := VAR_sprite_rows_MUX_uxn_device_h_l146_c2_5340_return_output;
     -- uint8_0_0_uxn_device_h_l141_l140_DUPLICATE_e622 LATENCY=0
     VAR_uint8_0_0_uxn_device_h_l141_l140_DUPLICATE_e622_return_output := uint8_0_0(
     VAR_MUX_uxn_device_h_l137_c7_8f38_return_output);

     -- MUX[uxn_device_h_l142_c35_9a8b] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l142_c35_9a8b_cond <= VAR_MUX_uxn_device_h_l142_c35_9a8b_cond;
     MUX_uxn_device_h_l142_c35_9a8b_iftrue <= VAR_MUX_uxn_device_h_l142_c35_9a8b_iftrue;
     MUX_uxn_device_h_l142_c35_9a8b_iffalse <= VAR_MUX_uxn_device_h_l142_c35_9a8b_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l142_c35_9a8b_return_output := MUX_uxn_device_h_l142_c35_9a8b_return_output;

     -- MUX[uxn_device_h_l138_c49_f52b] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l138_c49_f52b_cond <= VAR_MUX_uxn_device_h_l138_c49_f52b_cond;
     MUX_uxn_device_h_l138_c49_f52b_iftrue <= VAR_MUX_uxn_device_h_l138_c49_f52b_iftrue;
     MUX_uxn_device_h_l138_c49_f52b_iffalse <= VAR_MUX_uxn_device_h_l138_c49_f52b_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l138_c49_f52b_return_output := MUX_uxn_device_h_l138_c49_f52b_return_output;

     -- c_MUX[uxn_device_h_l131_c2_5d4a] LATENCY=0
     -- Inputs
     c_MUX_uxn_device_h_l131_c2_5d4a_cond <= VAR_c_MUX_uxn_device_h_l131_c2_5d4a_cond;
     c_MUX_uxn_device_h_l131_c2_5d4a_iftrue <= VAR_c_MUX_uxn_device_h_l131_c2_5d4a_iftrue;
     c_MUX_uxn_device_h_l131_c2_5d4a_iffalse <= VAR_c_MUX_uxn_device_h_l131_c2_5d4a_iffalse;
     -- Outputs
     VAR_c_MUX_uxn_device_h_l131_c2_5d4a_return_output := c_MUX_uxn_device_h_l131_c2_5d4a_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_device_h_l138_c7_d7f4_iffalse := VAR_MUX_uxn_device_h_l138_c49_f52b_return_output;
     VAR_MUX_uxn_device_h_l142_c7_668f_iftrue := VAR_MUX_uxn_device_h_l142_c35_9a8b_return_output;
     REG_VAR_c := VAR_c_MUX_uxn_device_h_l131_c2_5d4a_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l140_c26_a831_right := VAR_uint8_0_0_uxn_device_h_l141_l140_DUPLICATE_e622_return_output;
     VAR_MUX_uxn_device_h_l141_c40_43bc_cond := VAR_uint8_0_0_uxn_device_h_l141_l140_DUPLICATE_e622_return_output;
     -- BIN_OP_OR[uxn_device_h_l140_c26_a831] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l140_c26_a831_left <= VAR_BIN_OP_OR_uxn_device_h_l140_c26_a831_left;
     BIN_OP_OR_uxn_device_h_l140_c26_a831_right <= VAR_BIN_OP_OR_uxn_device_h_l140_c26_a831_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l140_c26_a831_return_output := BIN_OP_OR_uxn_device_h_l140_c26_a831_return_output;

     -- MUX[uxn_device_h_l142_c7_668f] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l142_c7_668f_cond <= VAR_MUX_uxn_device_h_l142_c7_668f_cond;
     MUX_uxn_device_h_l142_c7_668f_iftrue <= VAR_MUX_uxn_device_h_l142_c7_668f_iftrue;
     MUX_uxn_device_h_l142_c7_668f_iffalse <= VAR_MUX_uxn_device_h_l142_c7_668f_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l142_c7_668f_return_output := MUX_uxn_device_h_l142_c7_668f_return_output;

     -- MUX[uxn_device_h_l141_c40_43bc] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l141_c40_43bc_cond <= VAR_MUX_uxn_device_h_l141_c40_43bc_cond;
     MUX_uxn_device_h_l141_c40_43bc_iftrue <= VAR_MUX_uxn_device_h_l141_c40_43bc_iftrue;
     MUX_uxn_device_h_l141_c40_43bc_iffalse <= VAR_MUX_uxn_device_h_l141_c40_43bc_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l141_c40_43bc_return_output := MUX_uxn_device_h_l141_c40_43bc_return_output;

     -- MUX[uxn_device_h_l138_c7_d7f4] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l138_c7_d7f4_cond <= VAR_MUX_uxn_device_h_l138_c7_d7f4_cond;
     MUX_uxn_device_h_l138_c7_d7f4_iftrue <= VAR_MUX_uxn_device_h_l138_c7_d7f4_iftrue;
     MUX_uxn_device_h_l138_c7_d7f4_iffalse <= VAR_MUX_uxn_device_h_l138_c7_d7f4_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l138_c7_d7f4_return_output := MUX_uxn_device_h_l138_c7_d7f4_return_output;

     -- Submodule level 6
     VAR_result_is_vram_write_MUX_uxn_device_h_l131_c2_5d4a_iffalse := VAR_BIN_OP_OR_uxn_device_h_l140_c26_a831_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l139_c22_7bfe_right := VAR_MUX_uxn_device_h_l138_c7_d7f4_return_output;
     VAR_x_MUX_uxn_device_h_l131_c2_5d4a_iffalse := VAR_MUX_uxn_device_h_l138_c7_d7f4_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l141_c30_702d_right := VAR_MUX_uxn_device_h_l141_c40_43bc_return_output;
     VAR_y_MUX_uxn_device_h_l131_c2_5d4a_iffalse := VAR_MUX_uxn_device_h_l142_c7_668f_return_output;
     -- result_is_vram_write_MUX[uxn_device_h_l131_c2_5d4a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l131_c2_5d4a_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l131_c2_5d4a_cond;
     result_is_vram_write_MUX_uxn_device_h_l131_c2_5d4a_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l131_c2_5d4a_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l131_c2_5d4a_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l131_c2_5d4a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l131_c2_5d4a_return_output := result_is_vram_write_MUX_uxn_device_h_l131_c2_5d4a_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l141_c30_702d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l141_c30_702d_left <= VAR_BIN_OP_PLUS_uxn_device_h_l141_c30_702d_left;
     BIN_OP_PLUS_uxn_device_h_l141_c30_702d_right <= VAR_BIN_OP_PLUS_uxn_device_h_l141_c30_702d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l141_c30_702d_return_output := BIN_OP_PLUS_uxn_device_h_l141_c30_702d_return_output;

     -- x_MUX[uxn_device_h_l131_c2_5d4a] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l131_c2_5d4a_cond <= VAR_x_MUX_uxn_device_h_l131_c2_5d4a_cond;
     x_MUX_uxn_device_h_l131_c2_5d4a_iftrue <= VAR_x_MUX_uxn_device_h_l131_c2_5d4a_iftrue;
     x_MUX_uxn_device_h_l131_c2_5d4a_iffalse <= VAR_x_MUX_uxn_device_h_l131_c2_5d4a_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l131_c2_5d4a_return_output := x_MUX_uxn_device_h_l131_c2_5d4a_return_output;

     -- y_MUX[uxn_device_h_l131_c2_5d4a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l131_c2_5d4a_cond <= VAR_y_MUX_uxn_device_h_l131_c2_5d4a_cond;
     y_MUX_uxn_device_h_l131_c2_5d4a_iftrue <= VAR_y_MUX_uxn_device_h_l131_c2_5d4a_iftrue;
     y_MUX_uxn_device_h_l131_c2_5d4a_iffalse <= VAR_y_MUX_uxn_device_h_l131_c2_5d4a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l131_c2_5d4a_return_output := y_MUX_uxn_device_h_l131_c2_5d4a_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l139_c22_7bfe] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l139_c22_7bfe_left <= VAR_BIN_OP_PLUS_uxn_device_h_l139_c22_7bfe_left;
     BIN_OP_PLUS_uxn_device_h_l139_c22_7bfe_right <= VAR_BIN_OP_PLUS_uxn_device_h_l139_c22_7bfe_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l139_c22_7bfe_return_output := BIN_OP_PLUS_uxn_device_h_l139_c22_7bfe_return_output;

     -- Submodule level 7
     VAR_result_u16_addr_uxn_device_h_l139_c3_2024 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l139_c22_7bfe_return_output, 16);
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l141_c21_5023_var_dim_0 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l141_c30_702d_return_output, 6);
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l131_c2_5d4a_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l131_c2_5d4a_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l131_c2_5d4a_iffalse := VAR_result_u16_addr_uxn_device_h_l139_c3_2024;
     -- result_u16_addr_MUX[uxn_device_h_l131_c2_5d4a] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l131_c2_5d4a_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l131_c2_5d4a_cond;
     result_u16_addr_MUX_uxn_device_h_l131_c2_5d4a_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l131_c2_5d4a_iftrue;
     result_u16_addr_MUX_uxn_device_h_l131_c2_5d4a_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l131_c2_5d4a_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l131_c2_5d4a_return_output := result_u16_addr_MUX_uxn_device_h_l131_c2_5d4a_return_output;

     -- VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d[uxn_device_h_l141_c21_5023] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l141_c21_5023_ref_toks_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l141_c21_5023_ref_toks_0;
     VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l141_c21_5023_var_dim_0 <= VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l141_c21_5023_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l141_c21_5023_return_output := VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l141_c21_5023_return_output;

     -- Submodule level 8
     VAR_result_u8_value_uxn_device_h_l141_c3_84d3 := resize(VAR_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_uxn_device_h_l141_c21_5023_return_output, 8);
     VAR_result_u8_value_MUX_uxn_device_h_l131_c2_5d4a_iffalse := VAR_result_u8_value_uxn_device_h_l141_c3_84d3;
     -- result_u8_value_MUX[uxn_device_h_l131_c2_5d4a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l131_c2_5d4a_cond <= VAR_result_u8_value_MUX_uxn_device_h_l131_c2_5d4a_cond;
     result_u8_value_MUX_uxn_device_h_l131_c2_5d4a_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l131_c2_5d4a_iftrue;
     result_u8_value_MUX_uxn_device_h_l131_c2_5d4a_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l131_c2_5d4a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l131_c2_5d4a_return_output := result_u8_value_MUX_uxn_device_h_l131_c2_5d4a_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_cd45_uxn_device_h_l150_l101_DUPLICATE_eb4e LATENCY=0
     VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_cd45_uxn_device_h_l150_l101_DUPLICATE_eb4e_return_output := CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_cd45(
     result,
     VAR_result_u16_addr_MUX_uxn_device_h_l131_c2_5d4a_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l131_c2_5d4a_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l131_c2_5d4a_return_output,
     VAR_result_is_blit_done_MUX_uxn_device_h_l131_c2_5d4a_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_cd45_uxn_device_h_l150_l101_DUPLICATE_eb4e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_cd45_uxn_device_h_l150_l101_DUPLICATE_eb4e_return_output;
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
REG_COMB_color8 <= REG_VAR_color8;
REG_COMB_result <= REG_VAR_result;
REG_COMB_phase_minus_two <= REG_VAR_phase_minus_two;
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
     color8 <= REG_COMB_color8;
     result <= REG_COMB_result;
     phase_minus_two <= REG_COMB_phase_minus_two;
     phase7_downto_3 <= REG_COMB_phase7_downto_3;
     phase2_downto_0 <= REG_COMB_phase2_downto_0;
     sprite_rows <= REG_COMB_sprite_rows;
 end if;
 end if;
end process;

end arch;
